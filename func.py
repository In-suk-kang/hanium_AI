import subprocess
import os
import re
import pickle
import numpy as np
from collections import defaultdict
from tensorflow import keras
from tensorflow.keras.preprocessing.sequence import pad_sequences
import gensim
from gensim.models import Word2Vec
from tensorflow.keras.preprocessing.text import Tokenizer
import os
import subprocess

def c2llvm(file):
    if file.filename.endswith('.c'):
        # LLVM IR 결과를 저장할 파일 이름 정의
        input_file = os.path.join('./files', file.filename)
        result_file = os.path.join('./files', file.filename.replace('.c', '.ll'))
        
        # clang 명령어를 구성
        clang_command = ['clang', '-g', '-I ./files', '-S', '-emit-llvm', input_file, '-o', result_file]
        
        # clang 명령어 실행
        subprocess.run(clang_command, check=True)
        
        # 결과 파일 경로 반환
        return result_file
    else:
        raise FileNotFoundError("파일이 C 소스 코드 파일이 아닙니다.")

def default_preprocessing(filepath):
    search_keywords = ['CWE', 'good', 'bad']
    with open(filepath, 'r') as file:
        lines = file.readlines()

    identifier_counter = {}
    count = 1
    new_lines = []
    within_code_section = False

    for line in lines:
        # Skip lines before 'target triple'
        if "target triple" in line:
            within_code_section = True
            continue
        
        if within_code_section:
            # Skip lines after 'attributes'
            if "attributes" in line:
                break
            
            # Skip metadata lines
            if line.startswith(";"):
                continue
            
            # Search for identifiers containing keywords
            for keyword in search_keywords:
                if keyword in line:
                    identifiers = re.findall(r'\b\w+\b', line)
                    for identifier in identifiers:
                        if keyword in identifier:
                            if identifier not in identifier_counter:
                                identifier_counter[identifier] = count
                                count += 1
                            new_identifier = f"a_{identifier_counter[identifier]}"
                            line = re.sub(rf'\b{identifier}\b', new_identifier, line)
            
            new_lines.append(line)
    
    with open(filepath, 'w') as file:
        file.writelines(new_lines)
    return file

def preprocessing(filepath):
    code = ""
    if os.path.isfile(filepath):
        with open(filepath,'r') as file:
            code += file.read()
    else:
        code = filepath
    
    def default_code_clean(text):
        pattern = r'call void @llvm.dbg.declare.*?\n'
        text = re.sub(pattern, '', text)
        pattern = r'declare void @.*?\n'
        text = re.sub(pattern, '', text)
        pattern = r'call void @llvm.dbg.label.*?\n'
        text = re.sub(pattern, '', text)
        return text
    
    def preprocess_llvm_code(llvm_code):
        var_counter = 1
        label_counter = 1
        local_function_keyword = "LOC_FUNC"
        var_dict = defaultdict(lambda: f"VAR{var_counter}")
        label_dict = defaultdict(lambda: f"LBL{label_counter}")

        def _next_var(match):
            nonlocal var_counter
            var_name = match.group(1)
            if var_name not in var_dict:
                var_dict[var_name] = f"VAR{var_counter}"
                var_counter += 1
            return var_dict[var_name]

        def _next_label(match):
            nonlocal label_counter
            label_name = match.group(1)
            if label_name not in label_dict:
                label_dict[label_name] = f"LBL{label_counter}"
                label_counter += 1
            return label_dict[label_name]

        def _tokenize_number(match):
            number = match.group(0)
            return ''.join(list(number))

        def _process_line(line):
            # Standardize labels (e.g., 'label %1' becomes 'LBL1')
            line = re.sub(r'(?<=label )%(\d+)', _next_label, line)

            # Standardize global variables (e.g., '@var' becomes '@VAR1')
            line = re.sub(r'@([\w]+)', _next_var, line)

            # Standardize local variables (e.g., '%var' becomes '%VAR1')
            line = re.sub(r'%([\w]+)', _next_var, line)


            # Split numbers into individual digits
            line = re.sub(r'\b\d+\b', _tokenize_number, line)


            return line

        lines = llvm_code.strip().splitlines()
        processed_lines = [_process_line(line) for line in lines]
        return ' '.join(processed_lines)
    
    def func_preprocessing(text):
        pattern = r'\[\s*(.*?)\s*\]'
        text = re.sub(pattern, lambda m: '[' + ''.join(m.group(1).split()) + ']', text) # [] 괄호안에 있는 공백 제거

        pattern = r'![0-9]+'
        text = re.sub(pattern, '', text)

        pattern = r'#[0-9]+'
        text = re.sub(pattern, '', text)

        pattern = r'!dbg'
        text = re.sub(pattern,'', text)

        pattern = r'\n'
        text = re.sub(pattern,'', text)

        return text

    def isphor(s, liter):
        m = re.search(liter,s)
        if m is not None:
            return True
        else:
            return False

    def create_tokens(sentence):
        phla='[^$#!@.%_a-zA-Z0-9*]'
        space=' '
        spa=''
        tokens=[]
        j=0
        i=0

        while(i<len(sentence)):
            if isphor(sentence[i],space):
                if i>j:
                    tokens.append(sentence[j:i])
                    j=i+1
                else:
                    j=i+1

            elif isphor(sentence[i],phla) or (sentence[i] == ":" and sentence[i-1] != ":") or (sentence[i] == "&" and sentence[i-1] != "&"):
                if (sentence[i] == ":" and sentence[i-1] != ":") or (sentence[i] == "&" and sentence[i-1] != "&"):
                    tokens.append(sentence[j:i])
                    tokens.append(sentence[i:i+2])
                    j=i+2
                    i=i+2
                elif sentence[i:i+3] == "...":
                    tokens.append(sentence[j:i])
                    tokens.append(sentence[i:i+3])
                    j=i+3
                    i=i+2
                elif i+1<len(sentence) and isphor(sentence[i+1],phla):
                    tokens.append(sentence[j:i])
                    tokens.append(sentence[i])
                    tokens.append(sentence[i+1])
                    j=i+2
                    i=i+1
                else:
                    tokens.append(sentence[j:i])
                    tokens.append(sentence[i])
                    j=i+1

            i=i+1
        tokens.append(sentence[j:i])

        count=0
        count1=0
        sub0='\r'

        if sub0 in tokens:
            tokens.remove('\r')

        for sub1 in tokens:
            if sub1==' ':
                count1=count1+1

        for j in range(count1):
            tokens.remove(' ')

        for sub in tokens:
            if sub==spa:
                count=count+1

        for i in range(count):
            tokens.remove('')

        return tokens
    

    code = default_code_clean(code)
    code = preprocess_llvm_code(code)
    code = func_preprocessing(code)
    code = create_tokens(code)
    tok = Tokenizer()
    tok.fit_on_texts([code])
    encd_rev = tok.texts_to_sequences([code])
    pad_rev = pad_sequences(encd_rev, maxlen=4466, padding='pre')
    
    #--------------------------------------------------------------------------
    
    #--------------------------------------------------------------------------
    return pad_rev,tok
#--------------------------------------------------------
# def sentences_ai_process(filepath):
#     result = []
#     code = ""
#     with open(filepath,'r') as file:
#         code += file.read()
#     codes = code.split('\n')
#     for code in codes:
#         if code == '':
#             continue
#         print(code)
#         pad_rev,_ = preprocessing(code)
#         with open('saved_model.pkl','rb') as file:
#             model = pickle.load(file)
#             pred = model.predict(pad_rev)
#         print(pred)
#     return result


def create_sliding_windows(data, window_size, step_size, tok):
    data = data.flatten()  # (1, N) -> (N,)
    num_windows = (len(data) - window_size) // step_size + 1
    maxi = float('-inf')
    print(f"Number of windows to be created: {num_windows}")
    text = ""
    
    with open('saved_model.pkl', 'rb') as file:
        model = pickle.load(file)
    
    for i in range(num_windows):
        start_index = i * step_size
        end_index = start_index + window_size
        window = data[start_index:end_index]
        print(f"Processing window from index {start_index} to {end_index}")
        window = window.reshape(1, -1)
        pad_rev = pad_sequences(window, maxlen=4466, padding='pre')
        pred = model.predict(pad_rev)
        pred_value = pred[0]
        if pred_value > maxi:
            maxi = pred_value
            text = tok.sequences_to_texts(pad_rev)
    return text
#--------------------------------------------------------
# def find_line(filepath,text):

#--------------------------------------------------------
def ai_process(seq_data,value = 0.5):
    with open('saved_model.pkl','rb') as file:
        model = pickle.load(file)
    pred = model.predict(seq_data)
    predict_result = (pred > value).astype(int).flatten().tolist()[0]
    return predict_result


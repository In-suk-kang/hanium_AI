import re
import pickle
from tensorflow import keras
from tensorflow.keras.preprocessing.sequence import pad_sequences
import gensim
from gensim.models import Word2Vec
from tensorflow.keras.preprocessing.text import Tokenizer
from data_preprocessing import *
import os

def preprocessing(filepath):
    code = ""
    if os.path.isfile(filepath):
        with open(filepath,'r') as file:
            code += file.read()
    else:
        code = filepath


    code = default_code_clean(code)
    code = preprocess_llvm_code(code)
    code = func_preprocessing(code)
    code = create_tokens(code)
    tok = Tokenizer()
    tok.fit_on_texts([code])
    encd_rev = tok.texts_to_sequences([code])
    pad_rev = pad_sequences(encd_rev, maxlen=4549, padding='pre')
    return pad_rev,tok


def create_sliding_windows(data, window_size, step_size, tok):
    old_code = ' '.join(tok.sequences_to_texts(data))
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
        pad_rev = pad_sequences(window, maxlen=4549, padding='pre')
        pred = model.predict(pad_rev)
        pred_value = pred[0]
        if pred_value > maxi:
            maxi = pred_value
            text = ' '.join(tok.sequences_to_texts(pad_rev))
    text = find_line(old_code,text)
    return text
#--------------------------------------------------------
def find_line(old_code, text):
    pattern = re.escape(text)
    match = re.search(pattern, old_code)
    if match:
        start = old_code.rfind(',', 0, match.start()) + 1
        end = old_code.find(',', match.end())
        if end == -1:
            end = len(old_code)
        
        line = old_code[start:end]
        return line
    return None
#--------------------------------------------------------
def ai_process(seq_data,value = 0.5):
    with open('saved_model.pkl','rb') as file:
        model = pickle.load(file)
    pred = model.predict(seq_data)
    predict_result = (pred > value).astype(int).flatten().tolist()[0]
    return predict_result

#--------------------------------------------------------
def vul_c(text, dbg_dict):
    # 딕셔너리의 키와 값에서 공백 제거
    dbg_dict = {key.strip(): value.strip() for key, value in dbg_dict.items()}
    pattern = r'![0-9]+'
    
    # 텍스트에서 모든 패턴 찾기
    matches = re.findall(pattern, text)
    
    # 중복 제거 및 순서 유지
    seen = set()
    unique_matches = []
    for match in matches:
        if match not in seen:
            seen.add(match)
            unique_matches.append(match)
    
    # 고유한 매치에 대해 dbg_dict에서 값 가져오기
    result = []
    for match in unique_matches:
        if match in dbg_dict:
            result.append(dbg_dict[match])
        else:
            result.append(None)  # 없을 경우 적절한 기본값
    return result
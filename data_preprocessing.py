import re
def default_code_clean(text):
  pattern = r'call void @llvm.dbg.declare.*?\n'
  text = re.sub(pattern, '', text)

  pattern = r'declare void @.*?\n'
  text = re.sub(pattern, '', text)

  pattern = r'call void @llvm.dbg.label.*?\n'
  text = re.sub(pattern, '', text)

  pattern = r'!llvm.loop.*?\n'
  text = re.sub(pattern, '', text)
  return text

from collections import defaultdict

def preprocess_llvm_code(llvm_code):
    var_counter = 1
    label_counter = 1
    local_function_keyword = "LOC_FUNC"
    var_dict = defaultdict(lambda: f"VAR{var_counter}")

    def _next_var(match):
        nonlocal var_counter
        var_name = match.group(1)
        if var_name not in var_dict:
            var_dict[var_name] = f"VAR{var_counter}"
            var_counter += 1
        return var_dict[var_name]


    def _tokenize_number(match):
        number = match.group(0)
        return ''.join(list(number))

    def _process_line(line):
        line = re.sub(r'%([\w]+)', _next_var, line)
        line = re.sub(r'\b\d+\b', _tokenize_number, line)
        return line

    lines = llvm_code.strip().splitlines()
    processed_lines = [_process_line(line) for line in lines]

    return ' '.join(processed_lines)

def func_preprocessing(text):
    pattern = r'![0-9]+'
    text = re.sub(pattern, '', text)

    pattern = r'#[0-9]+'
    text = re.sub(pattern, '', text)

    pattern = r'!dbg'
    text = re.sub(pattern,'', text)

    pattern = r'\n'
    text = re.sub(pattern,' ', text)

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
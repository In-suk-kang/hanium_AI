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
    return pad_rev

def ai_process(seq_data,value = 0.5):
    with open('model.pkl','rb') as file:
        model = pickle.load(file)
    pred = model.predict(seq_data)
    predict_result = (pred > value).astype(int).flatten().tolist()[0]
    return predict_result


from flask import Flask,render_template,request,jsonify
from werkzeug.utils import secure_filename
from func import preprocessing,ai_process,create_sliding_windows,vul_c
from file_preprocessing import default_preprocessing
from c2llvm import c2llvm
import os
app = Flask(__name__)

@app.route('/predict',methods = ['POST'])
def predict():
    c_code = request.files['file']
    directory = './files/'
    if not os.path.exists(directory):
        os.makedirs(directory)
    c_code.save(directory + secure_filename(c_code.filename))    
    #1. c -> llmv ir
    llvm_code= c2llvm(c_code)
    #2. llvm ir 전처리
    llvm_code,dbg_dict = default_preprocessing(llvm_code)
    sequence_data,tok= preprocessing(llvm_code.name)
    #3. 모델 결과 분석
    result = ai_process(sequence_data)
    if result == 1:
        vul_text = create_sliding_windows(sequence_data,100,100,tok) 
        a = vul_c(vul_text,dbg_dict)
        return jsonify({"vul" : 1, "lines" : a})
    else:
        return jsonify({"vul": 0})    
    
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)

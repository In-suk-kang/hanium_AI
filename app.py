from flask import Flask,render_template,request,jsonify
from werkzeug.utils import secure_filename
from func import c2llvm,preprocessing,ai_process,default_preprocessing
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
    llvm_code = c2llvm(c_code)
    #2. llvm ir 전처리
    llvm_code = default_preprocessing(llvm_code)
    sequence_data= preprocessing(llvm_code.name)
    #3. 모델 결과 분석
    result = ai_process(sequence_data)
    print(sequence_data)
    os.remove(directory + c_code.filename)
    # 취약여부, 취약종류, 취약라인 = ai_process(llvm_code)
    return jsonify(result)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)

import subprocess
import os
def c2llvm(file):
    if file.filename.endswith('.c'):
        # 파일 경로 정의
        input_file = os.path.join('./files', file.filename)
        llvm_file = os.path.join('./files', file.filename.replace('.c', '.ll'))

        try:
            # C 파일을 LLVM IR로 컴파일
            subprocess.run(
                ['clang', '-g', '-O0', '-S', '-emit-llvm', input_file, '-o', llvm_file],
                check=True,
                text=True
            )
        except subprocess.CalledProcessError as e:
            print(f"Error during compilation: {e.stderr}")
            raise
        
        # LLVM IR 파일 생성 확인
        if os.path.exists(llvm_file):
            return llvm_file
        else:
            raise RuntimeError("LLVM IR 파일이 생성되지 않았습니다.")
    else:
        raise FileNotFoundError("파일이 C 소스 코드 파일이 아닙니다.")

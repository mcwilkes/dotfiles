import sys
import os
# import shlex

if len(sys.argv) > 1:
    what = sys.argv[1]
    # print(what)
    match what:
        case "py":
            print("py:")
            os.system("python --version")
            print("py3:")
            os.system("python3 --version")
        case "rust":
            os.system("rustc --version")
        case "java":
            os.system("javac --version")
        case "go":
            os.system("go version")
        case "lua":
            os.system("lua -v")
        case "ruby":
            os.system("ruby --version")
        case "node":
            os.system("node --version")
        case "npm":
            os.system("npm --version")
        case "vim":
            os.system("vim --V")
        case "ed":
            print("------------------")
            os.system("nvim --version")
            print("------------------")
            os.system("vim --V")
        case "js":
            print("------------------")
            print("node:")
            os.system("node --version")
            print("------------------")
            print("npm:")
            os.system("npm --version")
            print("------------------")
        case "lang":
            print("------------------")
            print("py:")
            os.system("python --version")
            print("py3:")
            os.system("python3 --version")
            print("------------------")
            os.system("rustc --version")
            print("------------------")
            os.system("javac --version")
            print("------------------")
            os.system("go version")
            print("------------------")
            os.system("lua -v")
            print("------------------")
            os.system("ruby --version")
            print("------------------")
            print("node:")
            os.system("node --version")
            print("------------------")
            print("npm:")
            os.system("npm --version")
            print("------------------")
        case _:
            print(
                "You passed something else. Try 'py', 'rust', (etc) or 'ed', 'js' or 'lang'."
            )
else:
    print("Nothing passed.")

import sys
import os
# import shlex

what = sys.argv[1]
# print(what)


match what:
    case "py":
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
    case "nvim":
        os.system("nvim --version")
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
    case "lang":
        print("------------------")
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
    case _:
        print("You passed something else")

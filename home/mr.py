import argparse
import os

parser = argparse.ArgumentParser(description="Process some file.")
parser.add_argument("file", type=str, help="The file name with extension")
args = parser.parse_args()

file_name = args.file
name = file_name.split(".")[0]
ext = file_name.split(".")[-1]

match ext:
    case "py":
        os.system("python3 {0}".format(file_name))
    case "go":
        os.system("go run {0}".format(file_name))
    case "rb":
        os.system("ruby {0}".format(file_name))
    case "rs":
        os.system("rustc {0}".format(file_name))
        os.system("./{0}".format(name))
    case "java":
        os.system("javac {0}".format(file_name))
        os.system("java {0}".format(name))
    case _:
        print("File was not .py, .go, .rs or .java!")

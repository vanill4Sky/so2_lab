import argparse, os

# argument parser setup

def dir_path(path):
    if os.path.isdir(path):
        return path
    else:
        raise argparse.ArgumentTypeError(
            f"directory:{path} is not a valid path")

arg_parser = argparse.ArgumentParser()
arg_parser.add_argument(
    "dir_a", 
    help="target directory path.", 
    type=dir_path)
arg_parser.add_argument(
    "dir_b", 
    help="target directory path.", 
    type=dir_path)

args = arg_parser.parse_args()

# rest
def filter_only_files(parent_path, file_list):
    filtered = []
    for file in file_list:
        full_path = parent_path + "/" + file
        if os.path.isfile(full_path):
            filtered.append(file)

    return filtered

dir_a_content = os.listdir(args.dir_a)
dir_a_files = filter_only_files(args.dir_a, dir_a_content)
dir_b_content = os.listdir(args.dir_b)
dir_b_files = filter_only_files(args.dir_b, dir_b_content)

for file_a in dir_a_files:
    full_path = args.dir_a + "/" + file_a
    if file_a in dir_b_files:
        print(full_path)
        os.remove(full_path)
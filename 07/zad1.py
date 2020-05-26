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
    "directory", 
    help="target directory path.", 
    type=dir_path)

args = arg_parser.parse_args()

# rest
inner_files = os.listdir(args.directory)

for inner_file in inner_files:
    inner_file_path = args.directory + "/" + inner_file
    
    if os.path.isfile(inner_file_path) and os.access(inner_file_path, os.W_OK):
        if inner_file_path[len(inner_file_path)-4:] == ".old":
            os.remove(inner_file_path)
        else:
            os.rename(inner_file_path, inner_file_path+".old")
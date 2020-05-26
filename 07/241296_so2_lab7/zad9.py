import argparse, os

# argument parser setup

def dir_path(path):
    if os.path.isdir(path):
        return path
    else:
        raise argparse.ArgumentTypeError(
            f"directory:{path} is not a valid path")

def file_path(path):
    if os.path.isfile(path):
        return path
    else:
        raise argparse.ArgumentTypeError(
            f"deleted_list:{path} is not a valid path")

arg_parser = argparse.ArgumentParser()
arg_parser.add_argument(
    "directory", 
    help="target directory path.", 
    type=dir_path)
arg_parser.add_argument(
    "deleted_list", 
    help="path to file in which list of deleted files will be stored.", 
    type=file_path)

args = arg_parser.parse_args()

# rest
os.remove(args.deleted_list)
inner_files = os.listdir(args.directory)

with open(args.deleted_list, "w") as deleted_list:
    for inner_file in inner_files:
        inner_file_path = args.directory + "/" + inner_file
        if (os.path.isfile(inner_file_path) and not os.path.islink(inner_file_path) and os.stat(inner_file_path).st_size == 0):
            deleted_list.write(f"{inner_file_path}\n")
            os.remove(inner_file_path)
import os
import sys
import shutil

# Local files
from content_factory import ContentFactory

# Terminal arguments
PROJECT_NAME = sys.argv[1]
MODULE_NAME = sys.argv[2]

OUTPUT_FOLDER_NAME = "output_processed_files"
TEMPLATE_FOLDER_NAME = "template_files"
CONFIGURATION_FOLDER_NAME = "configuration_files"
DEFAULT_FOLDER_NAME = "default_files"

def main():
    folder_path = make_dir()
    print("📁 Created output-folder path: {} \n".format(folder_path))

    files_identifiers_list = get_files_identifiers_from_templates_folder()
    print("File identifiers (Created from file_templates folder): {}".format(files_identifiers_list))

    files_identifiers_list = [x for x in files_identifiers_list if x != "Header"]
    print("File identifiers (Without header): {} \n".format(files_identifiers_list))

    for file_identifier_str in files_identifiers_list:

        file_name = create_file_name(file_identifier_str)
        path = "{}/{}".format(folder_path, file_name)

        file = create_file(path)
        create_configuration_file_if_needed(file_identifier_str)

        write_file(file_name, file_identifier_str, file)
        file.close()

def get_files_identifiers_from_templates_folder() -> [str]:
    path = os.path.join(os.getcwd(), TEMPLATE_FOLDER_NAME)

    file_names_list = [remove_suffix(x, '.txt') for x in os.listdir(path) if x.endswith(('.txt'))]
    clean_file_names_list = [remove_template_identifier(x) for x in file_names_list]
    clean_file_names_list = [capitalize_first_letter_only_if_needed(x) for x in clean_file_names_list]

    return clean_file_names_list

def capitalize_first_letter_only_if_needed(name: str) -> str:
    if len(name) <= 0: 
        return ""
    if not name[0].isupper(): 
        new_name = name[0].upper() + name[1:]
        return new_name
    return name

def remove_suffix(text: str, suffix: str):
    if text.endswith(suffix):
        return text[:-len(suffix)]
    else:
        return text

def remove_template_identifier(file_name: str) -> str:
    i = 0
    while i < len(file_name):
        if file_name[i] == "_":
            return file_name[i+1:]
        i += 1
    return file_name

def create_configuration_file_if_needed(file_identifier: str):
    file_name = "configuration_{}.py".format(file_identifier.lower())
    file_with_folder_name = os.path.join(CONFIGURATION_FOLDER_NAME, file_name)
    path = os.path.join(os.getcwd(), file_with_folder_name)

    if os.path.isfile(path): return
    f = open(path, "x")

    default_configuration_file_with_folder_name = os.path.join(DEFAULT_FOLDER_NAME, "default_configuration_file.py")
    default_configuration_path = os.path.join(os.getcwd(), default_configuration_file_with_folder_name)
    default_configuration_file = open(default_configuration_path, 'r')
    default_configuration_str = default_configuration_file.read()
    default_configuration_file.close()

    f.write(default_configuration_str)
    
    f.close()
    print("📄 Created new default configuration file: {}".format(path))

def make_dir() -> str:
	current_path = os.getcwd()
	path = os.path.join(current_path, OUTPUT_FOLDER_NAME)
	delete_folder_if_needed(path)

	os.mkdir(path)
	return path

def delete_folder_if_needed(path: str):
	if os.path.exists(path):
		shutil.rmtree(path)

def create_file_name(file_type: str) -> str:
	return "{}{}.swift".format(MODULE_NAME, file_type)

def create_file(name: str):
	f = open(name, "x")
	print("📄 New file: {}".format(name))
	return f

def write_file(file_name: str, file_type: str, file):
    content = ""

    template_path = get_template_path_for_file(file_type)

    # Add content (header & body) by file_type
    factory = ContentFactory(PROJECT_NAME)
    content += factory.make_content(file_type, template_path, MODULE_NAME)

    file.writelines(content)

    print("Finished writing from template path: {} \n".format(template_path))

def get_template_path_for_file(file_type: str) -> str:
    template_file_name = "template_{}.txt".format(file_type.lower())
    template_file_with_folder_name = os.path.join(TEMPLATE_FOLDER_NAME, template_file_name)

    return os.path.join(os.getcwd(), template_file_with_folder_name)

if __name__ == "__main__":
    main()

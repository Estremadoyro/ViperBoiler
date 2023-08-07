import os

def configure(file_type: str, template_path: str, module_name: str) -> str:
    # Variables
    obj_name = "{}{}".format(module_name, file_type)

    try:
        file = open(template_path, 'r')
        text = file.read()
        text = text % (
                module_name,
                obj_name
                )
    except FileNotFoundError as fnf_error:
        print("❌ {}".format(fnf_error))
        return ""
    else:
        return text

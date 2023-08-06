import os
from datetime import date

def configure(file_type: str, template_path: str, module_name: str, project_name: str) -> str:
    # Variables
    obj_name = "{}{}".format(module_name, file_type)
    user_name = os.getlogin()
    formated_date = date.today().strftime('%d/%m/%y')

    try:
        file = open(template_path, 'r')
        text = file.read()
        text = text % (
                obj_name, 
                project_name, 
                user_name, 
                formated_date)
    except FileNotFoundError as fnf_error:
        print("❌ {}".format(fnf_error))
        return ""
    else:
        return text

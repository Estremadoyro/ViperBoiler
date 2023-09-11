import sys
import os

sys.path.insert(0, os.path.join(os.getcwd(), "configuration_files"))

# Templates configuration files.
import configuration_header
import configuration_screen
import configuration_interactor
import configuration_presenter
import configuration_router
import configuration_module
import configuration_navigationbar

# Add content (body) by file_type
class ContentFactory():
    """Handle content creation for files."""
    def __init__(self, project_name: str):
        self.project_name = project_name

    def make_content(self, file_type: str, template_path: str, module_name: str) -> str:
        content = ""

        file_type_lower = file_type.lower()

        if file_type_lower == "screen":
            content += configuration_screen.configure(file_type, template_path, module_name)
        elif file_type_lower == "interactor":
            content += configuration_interactor.configure(file_type, template_path, module_name)
        elif file_type_lower == "presenter":
            content += configuration_presenter.configure(file_type, template_path, module_name)
        elif file_type_lower == "router":
            content += configuration_router.configure(file_type, template_path, module_name)
        elif file_type_lower == "module":
            content += configuration_module.configure(file_type, template_path, module_name)
        elif file_type_lower == "navigationbar":
            content += configuration_navigationbar.configure(file_type, template_path, module_name)

        return content

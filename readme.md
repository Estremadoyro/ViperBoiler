# VIPER Boiler

Python script designed to create/customize boilerplate code used in the VIPER architecture.

#### Requirements
Python 3.8+
### VIPER-M 
Architecture variation that will be generated by the project.

![Architecture](https://i.ibb.co/HpyPFH2/VIPER-M-drawio.png)
- This variation includes **Module** class in charge of assembling the module.
- There is **no Entity (Model)** addressed. As this approach considers it in a different level beyond VIPER.
- The **Screen** is an abstraction of a **UIViewController**.
- The **Module** object assembles the module by executing the **start()** method creating the Screen. It **must** only exist during creation and be disposed afterwards. Otherwise it may casuse a leak in memory (2 strong references to presenter alive).
- The **Screen** will hold the only **strong reference** to the **Presenter**. If it's disposed so will the rest of the objects (Presenter, Interactor, Router).



## Files organization

**Folders**
- `default_files` **.***
  - Used to create *stock* files, of the same kind, when needed.
- `template_files` **.txt**
  - Templates, with placeholders, that define the structure of the output files.
- `configuration_files` **.py**
  - Python files used to configure the templates (Inject variables).
- `output_processed_files` **.swift**
  - Contains the *output* final files after being *configured*. These are ment the copy/pasted in the target Xcode project.

**Files**
- `main.py`
  - Main script which holds most of the logic.
- `content_factory.py`
  - Factory in charge of assigning a *template_file* to a *configuration_file*
## Usage

The script requires only **2 user-input-variables**
- `PROJECT_NAME`
  - Name of the project the files will go to. Used for the files' headers.
  - *i.e. NotesApp*
- `MODULE_NAME`
  - Name of the **VIPER module**. Used for naming the other modules and their protocols.
  - *i.e NewNote*

Example:
```bash
python3 main.py PROJECT_NAME MODULE_NAME
```
Run:
```bash
python3 main.py NotesApp NewNote
```

If there are no errors, then the terminal-logs should look as the following.

![terminal_output](https://i.ibb.co/LdZ6Dqj/success-example.png)

Finally, your files will be located @ `output_processed_files`

![output_files](https://i.ibb.co/v1Mdc3f/Screenshot-2023-08-06-at-17-28-49.png)

🎉🎉🎉



## Customization

### Editing templates
Editing the templates with your own approach can be done as following:

#### 1. Open the file (/template_files) you want to customize.
Edit the file, add new variables/functions/protocols as you need.
#### 2. Adding placeholders
In case you need to inject the name of the *module/project/etc* into the file or other new external variable, simply **add the `%s` identifier** where needed.

Don't forget to save (write) the changes.

| template_interactor.txt | configuration_interactor.py |
| --- | --- |
| ![template_edit_example](https://i.ibb.co/ZHy02DJ/Screenshot-2023-08-06-at-17-40-15.png) | ![configuration_edit_example](https://i.ibb.co/BrX0PWz/Screenshot-2023-08-06-at-17-45-44.png) |

The newly generated **CastInteractor.swift** should look something like this.
![swift_output_example](https://i.ibb.co/FhQczpb/Screenshot-2023-08-06-at-17-59-41.png)

🎉🎉🎉

### Adding a new template (New File)
The script is not limited to VIPER files, as you could have already guessed, so creating different `.swift` files for different purposes such as *factories, protocols, enums, extensions, etc* can be achieved with relative ease.  

This example will cover the addition of a **CastNavigationBar** file.

#### 1. Create a new `template_*.txt` file
First, a new template file will be created named `template_CastNavigationBar.txt`. Then you can edit the file following the steps in the **Editing templates** section. **The case of the letters will determine the output file names.**

![navbar_new_file_example](https://i.ibb.co/7yqWbTq/Screenshot-2023-08-06-at-18-18-07.png)

![navbar_new_file_edited_example](https://i.ibb.co/Xkp6mJM/Screenshot-2023-08-06-at-18-29-42.png)

#### 2. Execute the script `main.py`
Re-executing the script will generate `/configuration_files/configuration_navigationbar.py` & `output_processed_files/CastNavigationBar.swift` files. The former, will be used for injecting *outside variables* into the template. 
```shell
python3 main.py AnimeCalendar Cast
```
If you look closely you will notice `NavigationBar` has been added a  *file identifier*.

![navbar_new_log](https://i.ibb.co/RgWBvWR/Screenshot-2023-08-06-at-18-33-14.png)

#### 3. Editing the `configuration_*.py` file

This file contains a **default implementation** that will need to be edited.
![navbar_new_configuration_file](https://i.ibb.co/488vKY4/Screenshot-2023-08-06-at-18-38-56.png)

Since we have added **2 external placeholders** into the `template_navigationbar.txt` we now need to inject them. Just as done @ **Editing templates**
![navbar_new_configuration_file_injected](https://i.ibb.co/GtMjwWk/navbar-configure-injected.png)

#### 4. Making `main.py` aware of the new file
Finally, in order to apply the configuration from `configuration_navigationbar.py` we need to make small changes in `content_factory.py`.

![content_factory](https://i.ibb.co/G7MJmSN/Screenshot-2023-08-06-at-18-49-03.png)

- Import the just edited `configuration_navigationbar.py` file so it can be accessed.
    - `import configuration_navigationbar`
- Add the condition for it **IN LOWERCASE**, as *string* comparison is **case sensitive**
- Then aggregate the content **+=** (Just as shown for the other files) with the `configuration_navigationbar`**.configure()** method.
- Save (write) the file. 

#### 5. Re-run the script for one last time
```shell
python3 main.py AnimeCalendar Cast
```
If everything went as planned `CastNavigationBar.swift` should've been updated with the injected variables.

![navbar_new_swift_file](https://i.ibb.co/HgG7Fkq/Screenshot-2023-08-06-at-18-59-28.png)

🎉🎉🎉

## License

[MIT](https://choosealicense.com/licenses/mit/)

###### If it was useful, a 🌟 would be highly appreciated!
import os
import platform
import subprocess

def build_library():
    current_os = platform.system()
    compiled_folder = os.path.join(os.getcwd(), 'compiled')
    object_files = [filename for filename in os.listdir(compiled_folder) if filename.endswith('.o')]
    if current_os == 'Windows':
        command_template = 'ar rcs {}.a {}'
        dll_command_template = 'g++ -shared {} -o {}.dll'
    else:
        command_template = 'ar rcs lib{}.a {}'
        dll_command_template = 'g++ -shared {} -o lib{}.so'

    for object_file in object_files:
        library_name = os.path.splitext(object_file)[0]
        command = command_template.format(library_name, os.path.join(compiled_folder, object_file))
        subprocess.run(command, shell=True)
        dll_command = dll_command_template.format(os.path.join(compiled_folder, object_file), library_name)
        subprocess.run(dll_command, shell=True)
        so_command = dll_command_template.format(os.path.join(compiled_folder, object_file), library_name)
        subprocess.run(so_command, shell=True)

    print("Library build completed.")

build_library()
#import re
import os

list_of_files = []
path = "../extDB-Build/Altis_Life.Altis/dialog"
for (dirpath, dirnames, filenames) in os.walk(path):
    for filename in filenames:
        if (filename.endswith('.hpp') or filename.endswith('.h')) and filename != "macro.h":
            list_of_files.append(filename)

print list_of_files

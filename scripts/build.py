#import re
import os

list_of_files = []
path = "../extDB-Build/Altis_Life.Altis/dialog"
for (dirpath, dirnames, filenames) in os.walk(path):
    for filename in filenames:
        if (filename.endswith('.hpp') or filename.endswith('.h')) and filename != "macro.h" and filename != "MasterHandler.h":
            list_of_files.append(filename)

print list_of_files
output = open(path + "/MasterHandler.h", "w")
output.write("/*\n	Master UI Resource File\n*/\n")
for file in list_of_files:
    output.write("#include \"")
    output.write(file)
    output.write("\"\n")

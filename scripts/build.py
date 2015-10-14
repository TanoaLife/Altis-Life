import re
import os
classStart = re.compile(ur'\s*file \= \"\S+";')
classEnd = re.compile(ur'\s*};')
pathfind = re.compile(ur"\"")
namesplit = re.compile(ur"fn_|[\.]")
isfunc = re.compile(ur"fn_\S+\.sqf")

print "Compiling Client-Side Functions.h"

# Building the Client-Side Functions.h
original = open("../extDB-Build/Altis_Life.Altis/Functions.h")

lines = original.readlines()

new = open("../extDB-Build/Altis_Life.Altis/Functions.h", "w")

skip = False

root = "../extDB-Build/Altis_Life.Altis/"

def getSQFFiles(directory) :
    files = []
    for item in os.listdir(directory):
        if os.path.isfile(os.path.join(directory, item)):
            if isfunc.match(item):
                files.append(item)
    return files


for line in lines:
    if skip:
        if classEnd.match(line):
            skip = False
            new.write(line)
    elif classStart.match(line):
        skip = True
        new.write(line)
        fname = re.split(pathfind, line)[1]
        currfiles = getSQFFiles(root+fname)
        for filename in currfiles:
            new.write("\t\tclass "+re.split(namesplit, filename)[1]+" {};\n")
    else:
        new.write(line)

print "Compiling Server-Side config.cpp"

# Building the Server-Side config.cpp
original = open("../extDB-Build/life_server/config.cpp")

lines = original.readlines()

new = open("../extDB-Build/life_server/config.cpp", "w")

skip = False

root = "../extDB-Build/life_server/"

for line in lines:
    if skip:
        if classEnd.match(line):
            skip = False
            new.write(line)
    elif classStart.match(line):
        skip = True
        new.write(line)
        fname = re.split(pathfind, line)[1]
        # Drop the absolute \life_server\ reference
        fname = fname[13:]
        currfiles = getSQFFiles(os.path.join(root,fname))
        for filename in currfiles:
            new.write("\t\t\tclass "+re.split(namesplit, filename)[1]+" {};\n")
    else:
        new.write(line)

print "Compiling dialog MasterHandler.h"

# Building the MasterHandler.h in dialog/
list_of_files = []
path = "../extDB-Build/Altis_Life.Altis/dialog"
for (dirpath, dirnames, filenames) in os.walk(path):
    for filename in filenames:
        if (filename.endswith('.hpp') or filename.endswith('.h')) and filename != "macro.h" and filename != "MasterHandler.h" and filename != "common.hpp":
            list_of_files.append(filename)

output = open(path + "/MasterHandler.h", "w")
output.write("/*\n	Master UI Resource File\n*/\n#include \"common.hpp\"\n")
for filename in list_of_files:
    output.write("#include \"")
    output.write(filename)
    output.write("\"\n")

print "Compile Complete"

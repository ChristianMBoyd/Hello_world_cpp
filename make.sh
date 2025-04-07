#! /usr/bin/env bash

BUILD_DIR=".build"
FILE="Hello_world"

# Add build directory and file to .gitignore
if [ ! -a .gitignore ]; then
    touch .gitignore
fi

if ! $(grep -q -i $BUILD_DIR .gitignore); then
    echo "/${BUILD_DIR}*" >> .gitignore
fi

if ! $(grep -q -i $FILE .gitignore); then
    echo $FILE >> .gitignore
fi

# Build and make the executable
if [ ! -d $BUILD_DIR ]; then
    mkdir $BUILD_DIR
fi 

cd $BUILD_DIR
cmake ..
make

# Copy the executable to the top level and demonstrate that it works.
cd ..
mv ${BUILD_DIR}/src/${FILE} $FILE
echo "Executable moved to top level.  Running..."
./${FILE}
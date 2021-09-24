#!/bin/bash

echo "now we are ready to go"
cd ../../..

cd composer-repo

mkdir tmp
touch tmp/change_py_files.txt

git diff-tree --name-status --no-commit-id -r 922fb6b15f7e1a9672d7b99e08815ab60117819a a2632c6a0a0a5a3c8580c7a423999dd27400b0f5 | grep -wv ^D | awk '{print $2}' >> tmp/change_py_files.txt

cd tmp
lines=$(wc -l change_py_files.txt)
echo "line count is $lines"
if [ "$lines" != 0 ];
then
     echo "there is change files"
else 
     echo "no change files are present"
fi

#############

#!bin/bash

Host="hoge"
files=("path/to/file" 
"path/to/file2" 
"path/to/file3")

echo "Start ${Host}"
for index in {0..2}
do
    echo ${files[$index]}
    scp -r ${files[$index]} ${Host}:~
done
ssh ${Host} ~/remote.sh bash <<SHELL
for index in {0..2}
files=("path/to/file" 
"path/to/file2" 
"path/to/file3")
to_path=("path/to/directory" 
"path/to/directory2" 
"path/to/directory3")
do
    sudo mv ${files[$index]} ${to_path[$index]}
done
SHELL
echo End
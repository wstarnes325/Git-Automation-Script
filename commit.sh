#!/bin/bash

repo=$1
pushd $repo
for i in {1..10000}; do
    filename="file$i.txt"
    echo -e "\e[0;32mCreating file [$filename]\e[0m"
    touch $filename
    git add $filename
    git commit -m "Added file [$filename] to repository [$repo]" &> /dev/null
    echo "Pushing to Github"
    git push &> /dev/null
    echo -e "\e[0;31mRemoving file [$filename]\e[0m"
    rm -rf file$i.txt
    git rm file$i.txt &> /dev/null
    git commit -m "Removed file [$filename] from repository from $repo" &> /dev/null
    echo -e "Pushing to Github"
    git push &> /dev/null
done
dirs -c

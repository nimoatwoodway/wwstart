#!/bin/bash

#set some constants
root="${PWD}"

#create some dirs
mkdir -p $root/mysql
mkdir -p $root/web

#create .gitignore if missing
if [ -e $root/.gitignore ]
then
  printf ".gitignore already exists\n"
else
  touch $root/.gitignore
  printf ".gitignore created\n"
fi

#add some lines to .gitignore, but only if we didnt done it before
if grep -q "wwstart" "$root/.gitignore";
then
  printf ".gitignore already customized\n"
else
  cmd="printf '\n#wwstart ignore stuff\n#from setup.sh\n#ignore docker\ndocker\n#macOS\n.DS_Store\n#PhpStorm configs\n.idea\n#DB Files\nmysql\n#ignore drupal private files\nprivate\n#ignore sass\n*.sass-cache*' >> $root/.gitignore"
  if eval $cmd; then
    printf ".gitignore customized\n"
  else
    printf ".gitignore write error\n"
  fi
fi

exit 0

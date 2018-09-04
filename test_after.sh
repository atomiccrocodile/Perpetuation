#!/bin/bash

reset='\033[0m'
title='\033[1;32m\033[4;32m'
text='\033[0;32m'
warning='\033[0;33m'
error='\033[0;31m'

echo -e "${warning}Enter the comment you wish to appear in the commit : ${reset}"

read -p '->  ' comment
if [ -z "$comment" ]; then #Make sure the comment is never empty
	echo -e "${error}Comment is empty. Comment will be set to 'Update'.${reset}"
	comment="Update"
fi

echo -e "${text}Copying and readying the different ReadMEs${reset}"
python create_link_readme.py
python readme_copy.py 

echo -e "${text}Creating the Json for the site and moving them${reset}"
python readme_to_site.py
cp news.json ../geeehesso.github.io/search
cp pres.json ../geeehesso.github.io/search
cp pub.json ../geeehesso.github.io/search

mv news.json ../geeehesso.github.io/inthenews
mv pres.json ../geeehesso.github.io/talks
mv pub.json ../geeehesso.github.io/publications

echo -e "${title}PERENISATION${reset}"
echo -e "${text}Adding the files${reset}"


echo -e "${text}Commit with the comment${reset}"


echo -e "${text}Pushing to GitHub${reset}"


echo -e "${title}SITE${reset}"
cd ..
cd geeehesso.github.io
echo -e "${text}Adding the files${reset}"

echo -e "${text}Commit${reset}"

echo -e "${text}Pushing to GitHub${reset}"

echo -e "${title}Done!${reset}"



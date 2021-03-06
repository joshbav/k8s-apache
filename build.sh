#!/bin/bash
echo Creating 1.yaml
./1.sh

echo
echo
echo Adding all files in repo and pushing to git

# how I changed it to ssh:  git remote set-url origin git@github.com:joshbav/k8s-apache.git


git config user.name “joshbav” --local
git config user.email "joshbav@users.noreply.github.com" --local
git add -A
git commit -m "Scripted commit $(date +%d-%b-%Y-%I:%M:%S%p)"
git push -u origin master

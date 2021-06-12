#!/bin/bash
echo Creating 1.yaml
./1.sh

echo
echo
echo Adding all files in repo and pushing to git
git config user.name “joshbav” 
git add -A
git commit -m "Scripted commit $(date +%d-%b-%Y-%I:%M:%S%p)"
git push -u origin master

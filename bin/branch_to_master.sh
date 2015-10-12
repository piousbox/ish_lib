#!/bin/bash
# 
# This script puts to master and staging.
#
# $1 = 0.21.0 (say)
#

if [ -z $1 ]
then
  echo "Usage: ./bin/branch_to_master.sh branch-name"
  echo "the <branch-name> will be merge to master and staging."
  exit
fi

git add .
git commit -am "some note"
git push origin $1
git checkout master
git merge 0.21.0
git push origin master
git checkout staging
git merge 0.21.0
git push origin staging
git checkout 0.21.0
echo "Success"

exit


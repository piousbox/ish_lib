#!/bin/bash

# visibly increment version of microsites2 in the UI

root_path="/home/piousbox/projects/microsites2"
cd $root_path
commit=`git log | head -n 1 | awk '{print $2}'`
echo "Commit is $commit"
echo $commit > "$root_path/app/views/application/_version.haml"
echo "%br" >> "$root_path/app/views/application/_version.haml"
tag=`git tag --points-at $commit`
echo $tag >> "$root_path/app/views/application/_version.haml"
echo "Tag is $tag"


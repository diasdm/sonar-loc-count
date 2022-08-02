#!/bin/bash
# Count LoC for GitHub repos/organizations

if [ $# -lt 3 ]; then
    echo "Usage: `basename $0` <user> <token> <org>"
    exit
fi

apiBase=https://api.github.com
user=$1
token=$2
org=$3

reposJson=$(gh repo list "${org}" -L 1000 --json name,defaultBranchRef)

readarray -t repos < <(jq -c '.[] | {name: .name, default_branch: .defaultBranchRef.name}' <<< $reposJson)

echo "Counting code from repos:"
for repo in "${repos[@]}"; do
    name=$(jq -r '.name' <<< $repo)
    branch=$(jq -r '.default_branch' <<< $repo)
    echo $name  - $branch    
done

fileList=""

for repo in "${repos[@]}"; do
    name=$(jq -r '.name' <<< $repo)
    branch=$(jq -r '.default_branch' <<< $repo)
    remoteUrl="https://${user}:${token}@github.com/${org}/${name}.git"
    fileList+="$name.cloc "
    echo "Checking out ${name} - ${branch}"
    git clone $remoteUrl --depth 1 --branch $branch $name
    echo "Counting ${name} - ${branch}"
    cloc $name --force-lang-def=sonar-lang-defs.txt --report-file=$name.cloc  
    rm -rf $name
done

echo "Building final report:"

cloc --sum-reports --force-lang-def=sonar-lang-defs.txt --report-file=$org $fileList
rm *.cloc

exit 0;


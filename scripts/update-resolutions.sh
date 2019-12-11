#!/bin/bash

# Helperfunction to retrieve the newest version for a given npm package and tag.
function actual_version(){
    if [[ "$1" == "" ]]; then
    echo "actual_version: ERROR- No npm package name passed"
    exit 0
    fi
    if [[ "$2" == "" ]]; then
    _tag="latest"
    else
    _tag="$2"
    fi
    _version=$(npm dist-tag ls $1| tr "\n"  " " | sed "s/.*${_tag}://" | xargs)
 
    if [[ "$1" == "" ]]; then
    echo "actual_version: ERROR- Could not retrieve version for $1 $2"
    exit 0
    fi
    echo $_version
} 

## Main
baseDir=$(cd $1|| exit; pwd)
if [[ "$baseDir" == "" ]]; then
    echo "ERROR: No package dir was defined"
    exit 0
fi

glspClient=$(actual_version @eclipse-glsp/client next)
glspTheiaIntegration=$(actual_version @eclipse-glsp/theia-integration next)
sprotty=$(actual_version sprotty next)
echo $glspClient $glspTheiaIntegration $sprotty

#!/usr/bin/env bash

checkForChangedFiles() {
    if [ -d node_modules ]; then
        echo "node modules folder detected."
        
        changedFiles=$(git log --pretty=oneline -1 --name-only | grep -E "package(-lock)*\.json")
        echo "changedFiles ==> $changedFiles"
        if [ -z $changedFiles ]; then
            echo "no Changes to package.json found, updates dont't need to be installed"
            exitFromTask 1
        else 
            echo "Changes to package.json detected, updates need to be installed"
            exitFromTask 0
        fi
    else
        echo "node modules not found, updates need to be installed"
        exitFromTask 0
    fi
    
}

exitFromTask() {
    if [ $1 == 0 ]; then
    echo -n "true" | tee test
    else
    echo -n "false" | tee test
    fi
    
    exit 0;
}

checkForChangedFiles


#!/usr/bin/env bash

changedFiles="$(git diff --name-only)"

checkForChangedFiles() {
    if [ -d node_modules ]; then
        echo "node modules folder detected."
        if [ $(echo "$changedFiles" | grep -E --quiet "package(-lock)*\.json") ]; then
            echo "Changes to package.json detected, updates need to be installed"
            exitFromTask 0
        else 
            echo "no Changes to package.json found, updates dont't need to be installed"
            exitFromTask 1
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

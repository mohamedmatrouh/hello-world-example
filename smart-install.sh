#!/usr/bin/env bash

changedFiles="$(git diff --name-only HEAD@{1} HEAD)"

checkForChangedFiles() {
    if [ -d node_modules ]; then
        echo "$changedFiles" | grep -E --quiet "package(-lock)*\.json" && eval packageJsonHasChanged
        exitFromTask 1
    else
        exitFromTask 0
    fi
    
}

packageJsonHasChanged() {
    echo "Changes to package.json detected, installing updates"
    exitFromTask 0
}

exitFromTask() {
    echo $1
    if [ $1 == 0 ]; then
        echo -n "true" | tee test
    else
        echo -n "false" | tee test
    fi

    exit 0;
}

checkForChangedFiles
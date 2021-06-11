#!/usr/bin/env bash

set -e

OBJECTS="$(cat objects.list) "

for O in $OBJECTS ; do
    echo -n "$O "
    kubectl get -o name $O 2>/dev/null 1>/dev/null
    if [ $? == 1 ]; then
        echo " MISSSING!"
    else
        echo " exist"
    fi
done



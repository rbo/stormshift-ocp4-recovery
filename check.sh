#!/usr/bin/env bash


#OBJECTS="$(cat objects.list) "

for O in $(cat $1) ; do
    printf "%-150s " $O
    kubectl get -o name $O 2>/dev/null 1>/dev/null
    if [ $? == 1 ]; then
        echo " MISSSING!"
    else
        echo " exist"
    fi
done



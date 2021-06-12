#!/usr/bin/env bash

for O in $(cat $1) ; do
    FILENAME="objects-4.6.28/${O//[\/\.:]/-}.yaml"
    kubectl apply -f $FILENAME
done


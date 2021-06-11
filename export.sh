#!/usr/bin/env bash

set -e

OBJECTS="$(cat objects.list) "

for O in $OBJECTS ; do
    FILENAME=${O//[\/\.:]/-}.yaml
    if [ -f $FILENAME ]; then
        echo "Skip $FILENAME"
        continue;
    fi
    echo "Export $O into $FILENAME"
    kubectl get -o yaml $O | \
        yq eval ' del( .metadata.uid, .metadata.creationTimestamp, .metadata.managedFields, .metadata.resourceVersion, .metadata.selfLink, .metadata.ownerReferences) ' - > $FILENAME

done



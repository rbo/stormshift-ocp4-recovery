#!/usr/bin/env bash

set -e

for O in $(cat $1 ) ; do
    FILENAME="objects/${O//[\/\.:]/-}.yaml"

    if [ -f $FILENAME ]; then
        echo "Skip $FILENAME"
        continue;
    fi
    echo "Export $O into $FILENAME"
    kubectl get -o yaml $O | \
        yq eval ' del( .metadata.uid, .metadata.creationTimestamp, .metadata.managedFields, .metadata.resourceVersion, .metadata.selfLink, .metadata.ownerReferences) ' - > $FILENAME

done



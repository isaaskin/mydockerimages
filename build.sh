#!/bin/bash

TEMPLATES_FOLDER="templates"
FILES=`ls $TEMPLATES_FOLDER`

for FILE in $FILES
do
    if git diff --quiet origin/main -- $TEMPLATES_FOLDER/$FILE; then
        echo "No differences found in $FILE"
    else
        echo "Differences found in $FILE"
        docker build -t isaaskin/capsule-template-$FILE:`cat $TEMPLATES_FOLDER/$FILE/VERSION` -t isaaskin/capsule-template-$FILE:latest $TEMPLATES_FOLDER/$FILE
        docker push isaaskin/capsule-template-$FILE:`cat $TEMPLATES_FOLDER/$FILE/VERSION`
        docker push isaaskin/capsule-template-$FILE
    fi
done
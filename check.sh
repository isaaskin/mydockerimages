#!/bin/bash

TEMPLATES_FOLDER="templates"
FILES=`ls $TEMPLATES_FOLDER`


# if git diff --quiet main HEAD; then
#     echo "No differences found."
# else
#     echo "There are differences."
# fi

for FILE in $FILES
do
    if git diff --quiet main HEAD -- $TEMPLATES_FOLDER/$FILE; then
        echo "No differences found."
    else
        echo "There are differences."
    fi
done
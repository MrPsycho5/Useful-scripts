#!/bin/bash
BASENAME=`basename $0`
FOLDERNAME=${PWD##*/}
if [ -z $1 ];
then
        echo "usage: ./$BASENAME <list of files>"
        exit
fi
for FILENAME in $@
do
        if [ "$FILENAME" != "$BASENAME" ]
        then
                if [ -f "$FILENAME" ]
                then
                        echo "$FILENAME -> $FOLDERNAME.${FILENAME##*.}"
                        mv "$FILENAME" "$FOLDERNAME.${FILENAME##*.}"
                else
                        echo "$FILENAME does not exist"
                fi
        fi
done

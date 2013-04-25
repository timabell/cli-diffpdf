#!/bin/sh

# check for tools needed
if [ -z `which pdftotext` ]
then
    echo "please install pdftotext" &>2
    exit 1
fi

#!/bin/sh

# check for two arguments being given
if [ $# -ne 2 ]
then
    echo "usage: cli-diffpdf file1.pdf file2.pdf" &>2
    exit 1
fi

# check for tools needed
if [ -z `which pdftotext` ]
then
    echo "please install pdftotext" &>2
    exit 1
fi

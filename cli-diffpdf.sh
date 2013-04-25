#!/bin/sh

# check for two arguments being given
if [ $# -ne 2 ]
then
    echo "usage: cli-diffpdf file1.pdf file2.pdf"
    exit 1
fi

# check for tools needed
if [ -z `which pdftotext` ]
then
    echo "please install pdftotext/xpdf"
    exit 1
fi

if [ -z `which wdiff` ]
then
    echo "please install wdiff!"
    exit 1
fi

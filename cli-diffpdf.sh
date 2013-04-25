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


# dump pdfs into tests
pdftotext -layout $1 &> file1.tmp
pdftotext -layout $2 &> file2.tmp

# compare the two textdumps
RED=$'\e'"[1;31m"
GREEN=$'\e'"[1;32m"
RESET=$'\e'"[0m"
wdiff -w$RED -x$RESET -y$GREEN -z$RESET -n file1.tmp file2.tmp

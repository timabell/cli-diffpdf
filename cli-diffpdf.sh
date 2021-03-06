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

mkdir -p tmp
cd tmp

# dump pdfs into tests
pdftotext -layout "$1" file1.tmp
pdftotext -layout "$2" file2.tmp

egrep -v 'Page.*of|DocuSign Envelope|^                                    In Process$|^$' file1.tmp | sed 's/In Process/          /g' > file1-filtered.tmp
egrep -v 'Page.*of|DocuSign Envelope|^                                    In Process$|^$' file2.tmp | sed 's/In Process/          /g' > file2-filtered.tmp

# compare the two textdumps
meld file1-filtered.tmp file2-filtered.tmp &

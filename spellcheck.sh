#!/bin/sh

for f in $(find public  -name "*.html") ; do echo $f ; aspell list --mode=html < $f | sort | uniq -c ; done



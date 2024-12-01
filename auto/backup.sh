#!/bin/bash

NOARGS=0
E_BADARGS=65
if [ $# = $NOARGS ]
then
echo "Usage: `basename $0` filename"
exit $E_BADARGS
fi
tar cvf - `find . -mtime -1 -type f -print` > $1.tar
gzip $1.tar

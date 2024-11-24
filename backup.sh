#!/bin/bash
# Backs up all files in current directory modified within last 24 hours
# in a "tarball" (tarred and gzipped file).
NOARGS=0
E_BADARGS=65
if [ $# = $NOARGS ]
then
echo "Usage: `basename $0` filename"
exit $E_BADARGS
fi
tar cvf - `find . -mtime -1 -type f -print` > $1.tar
gzip $1.tar

#!/bin/bash

TOTAL=`ls . | wc -l`

cd /opt/scripts

for i in `ls . | grep -v "build.sh" | grep -v "server.sh"` ;do
	 ./$i
	 echo $i
done

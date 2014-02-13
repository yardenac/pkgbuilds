#!/usr/bin/bash

qdir=/usr/share/quietnet

cmd=''
for arg; do
	 case "$arg" in
		  --listen) cmd='python listen.py'
	 esac
done

cd $qdir

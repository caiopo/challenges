#! /bin/bash

for i in $(echo */); do
	echo $i
	cd $i
	busted .
	if [ $? != 0 ]; then
		exit 1
	fi
	cd ..
done

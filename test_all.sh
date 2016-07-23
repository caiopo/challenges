#! /bin/bash

for i in $(echo */); do
	echo $i
	cd $i
	busted .
	cd ..
done

#! /bin/bash

for i in $(echo */); do
	cd $i

	FILENAME=$(ls | grep "lua" | grep --invert-match "_spec" | grep --invert-match "TracedArray.lua")

	echo $FILENAME

	exercism s $FILENAME

	cd ..
done

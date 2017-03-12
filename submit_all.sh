#! /bin/bash

for i in $(echo */); do
  cd $i

  FILENAME=$(ls | grep "exs" | grep --invert-match "test")

  echo $FILENAME

  exercism s $FILENAME

  cd ..
done

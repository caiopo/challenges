#! /bin/bash

for i in $(echo */); do
  echo $i
  elixir $i/*test.exs
  if [ $? != 0 ]; then
    exit 1
  fi
done

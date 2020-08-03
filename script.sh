#!/bin/bash +x
export status=$(cat result.txt | cut -d ':' -f 3 | cut -d ',' -f 1) 
if [ "$status" != '"OK"' ]; then
     echo -e "Quality Gate Failed. Please check the sonar for more info" && exit 1
  else       
     echo -e "Quality Gate Passed" && exit 0 
  fi

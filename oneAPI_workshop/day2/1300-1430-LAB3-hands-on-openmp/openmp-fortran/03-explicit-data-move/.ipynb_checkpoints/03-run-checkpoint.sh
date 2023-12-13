#!/bin/bash
/bin/echo "##" $(whoami) is running the first program 03-explicit-data-move.x
echo "########## Executing"
export OMP_TARGET_OFFLOAD="MANDATORY"
export LIBOMPTARGET_INFO=-1
export LIBOMPTARGET_DEBUG=1
export LIBOMPTARGET_PLUGIN=LEVEL0
./03-explicit-data-move.x 
echo "########## Done"


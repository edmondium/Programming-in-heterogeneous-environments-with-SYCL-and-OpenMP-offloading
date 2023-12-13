#!/bin/bash
/bin/echo "##" $(whoami) is running the first program 04-explicit-data-move-multp.x
echo "########## Executing"
export OMP_TARGET_OFFLOAD="MANDATORY"
export LIBOMPTARGET_INFO=-1
export LIBOMPTARGET_DEBUG=1
export LIBOMPTARGET_PLUGIN=LEVEL0
./04-explicit-data-move-multp.x 
echo "########## Done"


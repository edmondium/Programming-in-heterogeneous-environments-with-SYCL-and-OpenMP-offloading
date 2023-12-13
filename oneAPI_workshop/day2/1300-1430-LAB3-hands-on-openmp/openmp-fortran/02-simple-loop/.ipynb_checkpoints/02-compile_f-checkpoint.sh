#!/bin/bash
source /opt/intel/inteloneapi/setvars.sh > /dev/null 2>&1

filename=$(basename  $1)
outname=${filename%.*}.x

echo "########## Compiling"
echo "running ifx -fiopenmp -O2 -g -fopenmp-targets=spir64 -o $outname $filename"
ifx -fiopenmp -O2 -g -fopenmp-targets=spir64 -o $outname $filename 
echo "########## Done"

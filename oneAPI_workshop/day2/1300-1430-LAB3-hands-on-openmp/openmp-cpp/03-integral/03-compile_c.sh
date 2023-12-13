#!/bin/bash
source /opt/intel/inteloneapi/setvars.sh > /dev/null 2>&1

filename=$(basename  $1)
outname=${filename%.*}.x

echo "########## Compiling"
echo running icpx -fopenmp -O2 -g -o $outname $filename

icpx -fopenmp -O2 -g -o $outname $filename 

echo "########## Done"


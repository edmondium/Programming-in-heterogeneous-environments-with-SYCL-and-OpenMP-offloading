#!/bin/bash
echo "##" $(whoami)
echo " is running the program "
echo " 03-integral_par.x "
N=4
export OMP_NUM_THREADS=N
echo "##########"
echo "Executing with $N threads "
./03-integral_par.x
echo "########## Done"


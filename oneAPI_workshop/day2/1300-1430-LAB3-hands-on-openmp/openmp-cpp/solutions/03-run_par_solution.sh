#!/bin/bash
echo "##" $(whoami)
echo " is running the program "
echo " 03-integral_par.x "

for i in 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16
do
export OMP_NUM_THREADS=i
echo "##########"
echo "Executing with $i threads "
./03-integral_par.x > dum.dat  
echo "##########"

t=`grep run_time  dum.dat | cut -c14-25`

a=($i $t)

echo ${a[*]} >> timing.dat

done

echo "##########"
echo "All DONE"
echo "##########"

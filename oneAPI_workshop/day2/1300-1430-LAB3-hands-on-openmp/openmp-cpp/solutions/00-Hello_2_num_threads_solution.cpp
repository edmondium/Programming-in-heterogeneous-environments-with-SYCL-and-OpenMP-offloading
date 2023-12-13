// #include<iostream>
#include<omp.h>
#include<stdio.h>

#define MAX_NUM_THREADS 4

// This program is working with the old C printf function better
// somehow std::cout does something with the streams, which messes
// up the output.
// Therefore, we are using the C style printf function

//-----------------TASK-----------------------------
// in this program the output of the print statement is parallel
// print the number of the thread, which is printing.
// You can use the int ID for the thread number.
//
// use the openmp function
// omp_get_thread_num()
//-----------------TASK-----------------------------

int main()
{
    int ID;

    omp_set_num_threads(MAX_NUM_THREADS);

	#pragma omp parallel
	{
        ID = omp_get_thread_num();
		// std::cout << "HELLO SCHLUMBERGER " << " THREAD NUM = " << ID << " \n";
		printf("HELLO SCHLUMBERGER, THREAD NUM = %d \n", ID);
	}

	return 0;
}



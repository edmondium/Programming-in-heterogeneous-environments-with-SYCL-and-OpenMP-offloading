#include<iostream>
#include<omp.h>

#define MAX_NUM_THREADS 16

// In this program we have a parallel block
// which is indicated by the pragma statement.
// We have set the number of threads to 16
// but the instructions executed by each thread
// are unordered, this is the meaning of concurrency.

int main()
{
    omp_set_num_threads(MAX_NUM_THREADS);
	#pragma omp parallel
	{
		std::cout << "HELLO ";
		std::cout << "SCHLUMBERGER \n";

	}

	return 0;
}

// Concurrency defines operations that can execute in any order.
// Parallelism brings multiple hardware elements into the
// conversation so operations run at the same time.


#include<iostream>
#include<omp.h>

#define MAX_NUM_THREADS 4

//-----------------TASK-----------------------------
// in this program the output of the std::cout statement
// is in a parallel block.
//
// Calculate/measure the time the parallel block needs
// and print this time, the run_time.
//
// use the openmp functions
// omp_get_wtime()
//-----------------TASK-----------------------------

int main()
{
    double start_time, run_time;

    omp_set_num_threads(MAX_NUM_THREADS);

    // Your Code goes here
    
    #pragma omp parallel
    {
        // Your Code goes here
        std::cout << "Hello SCHLUMBERGER \n" ;
    }
    // Your Code goes here
    
    // std::cout << "run_time is: " << run_time << " \n" ;

    return 0;
}


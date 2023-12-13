#include<iostream>
#include<math.h>
#include<omp.h>

// In this program we are calculating the integral
// of a simple quadratic polynom from 0 to 1 numerically
// by simple summation.
// This program is parallelized using a SPMP pattern.
// We split the work up between the threads.
// It is assumed that the user is setting the number
// of threads in the shell.

constexpr int num_steps = 1000000;

#define MAX_NUM_THREADS 64

int main()
{
    double start_time, run_time;
    double x, step, integral;
    int i, j, actual_nthreads;

    double sum[MAX_NUM_THREADS] = {0.0};

    step = 1.0 / num_steps ;

    start_time = omp_get_wtime();

    #pragma omp parallel
    {
        int i;
        int id = omp_get_thread_num();
        int num_threads = omp_get_num_threads();

        if(id == 0) actual_nthreads = num_threads;

        for( i=id ; i < num_steps ; i += num_threads )
        {
                x = (i + 0.5) * step;
                sum[id] +=  x*x;
        }
    }

    for( i = 0; i < actual_nthreads; i++)
        integral += sum[i] ;

    integral = integral * step;
    run_time = omp_get_wtime() - start_time;
    
    std::cout << "------------------------------- \n"; 
    std::cout << "integral sum = "           <<  integral            << " \n";
    std::cout << "real sum of integral is: " <<  1./3               << " \n";
    std::cout << "error is: "                << abs(integral - 1./3) << " \n";

    std::cout << "------------------------------- \n";
    std::cout << "run_time is: " << run_time << " \n";
    std::cout << "------------------------------- \n";

    return 0;
}



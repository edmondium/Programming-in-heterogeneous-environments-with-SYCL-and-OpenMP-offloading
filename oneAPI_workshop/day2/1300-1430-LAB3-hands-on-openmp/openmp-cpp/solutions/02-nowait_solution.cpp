#include<iostream>
#include<math.h>
#include<omp.h>

// In this exercise  you have two independent loops.
// Your exercise is to parallelize both loops.
// Use the nowait clause, so the loops doesnt have to
// wait for each other
//
// #pragma omp for nowait

// If there are multiple independent loops within a
// parallel region, you can use the nowait clause
// to avoid the implied barrier at the end of the
// loop constructs.

#define MAX_NUM_THREADS 8
constexpr int N = 100;

int main()
{
    int a[N], y[N];
    float b[N], z[N];
    double start_time, run_time;

    omp_set_num_threads(MAX_NUM_THREADS);

    start_time = omp_get_wtime();

    // put your pragma statement here
    #pragma omp parallel
    {
        // put your pragma statement here
        #pragma omp for nowait
        for(int i = 0; i < N; ++i)
            { a[i] = i; b[i] = (a[i] * 3.141592) / 2.0 ; }

        // put your pragma statement here
        #pragma omp for nowait
        for(int i = 0; i < N; ++i)
            { y[i] = i; z[i] = sqrt(y[i]) ; }
    }

    run_time = omp_get_wtime() - start_time;
    std::cout << "------------------------------- \n";
    std::cout << "run_time is: " << run_time << " \n";
    std::cout << "------------------------------- \n";


    std::cout << "b = ";
    for(int i = 0; i < N; ++i) std::cout << b[i] << " ";
    std::cout << "\n";
    std::cout << "------------------------------- \n";
    std::cout << "z = ";
    for(int i = 0; i < N; ++i) std::cout << z[i] << " ";
    std::cout << "\n";
    std::cout << "------------------------------- \n";

    return 0;
}


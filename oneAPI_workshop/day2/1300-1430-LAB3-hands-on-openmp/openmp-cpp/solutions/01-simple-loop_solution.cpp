#include<iostream>
#include<omp.h>

// In this exercise you have one loop.
// use the correct openmp statement to
// parallelize this loop

#define MAX_NUM_THREADS 8

constexpr int N = 100;

int main()
{
    int a[N];
    float b[N];
    double start_time, run_time;

    omp_set_num_threads(MAX_NUM_THREADS);

    start_time = omp_get_wtime();
    // put your pragma statement here
    #pragma omp parallel for
        for(int i = 0; i < N; ++i)
            { a[i] = i; b[i] = (a[i] * 3.141592) / 2.0 ; }

    run_time = omp_get_wtime() - start_time;
    std::cout << "------------------------------- \n";
    std::cout << "run_time is: " << run_time << " \n";
    std::cout << "------------------------------- \n";

    std::cout << "a = ";
    for(int i = 0; i < N; ++i) std::cout << a[i] << " ";
    std::cout << "\n";

    std::cout << "------------------------------- \n";

    std::cout << "a = ";
    for(int i = 0; i < N; ++i) std::cout << b[i] << " ";
    std::cout << "\n";
    std::cout << "------------------------------- \n";

    return 0;
}


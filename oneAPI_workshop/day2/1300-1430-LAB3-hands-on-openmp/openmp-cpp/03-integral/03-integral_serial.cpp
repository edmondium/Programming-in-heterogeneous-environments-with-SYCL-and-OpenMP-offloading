#include<iostream>
#include<math.h>
#include<omp.h>

// In this program we are calculating the integral
// of a simple quadratic polynom from 0 to 1 numerically
// by simple summation.
//

constexpr int num_steps = 1000000;

int main()
{
    double start_time, run_time;
    double x, step, int_sum = 0.0 ;
    int i;

    step = 1.0 / num_steps ;

    start_time = omp_get_wtime();

    for(i = 0; i < num_steps; i++)
    {
        x = (i + 0.5) * step;
        int_sum = int_sum + x*x;
    }

    int_sum = int_sum * step ;

    run_time = omp_get_wtime() - start_time;

    std::cout << "integral sum = "           <<  int_sum            << " \n";
    std::cout << "real sum of integral is: " <<  1./3               << " \n";
    std::cout << "error is: "                << abs(int_sum - 1./3) << " \n";

    std::cout << "------------------------------- \n";
    std::cout << "run_time is: " << run_time << " \n";
    std::cout << "------------------------------- \n";

    return 0;
}



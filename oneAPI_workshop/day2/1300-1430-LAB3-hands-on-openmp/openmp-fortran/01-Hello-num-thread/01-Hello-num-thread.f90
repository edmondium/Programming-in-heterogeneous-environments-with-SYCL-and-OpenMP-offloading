program hello_world_omp_num_thread_solution
  use omp_lib

  ! in this program the print statement is in parallel region
  ! print the number of threads used after the print statement.
  ! use the openmp call
  ! omp_get_thread_num()
  ! play a bit around with the parameter NT

  integer, parameter :: NT = 16

  call omp_set_num_threads(NT)

  !$omp parallel
        print*, 
  !$omp end parallel

end program hello_world_omp_num_thread_solution


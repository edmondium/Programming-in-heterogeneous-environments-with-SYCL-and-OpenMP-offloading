program Hello
  use omp_lib

  ! make the print part parallel
  ! use !$omp parallel
  ! and set the number of threads with the call
  ! omp_set_num_threads()
  ! play a bit around with the parameter NT
  ! can you see concurrency?

  integer, parameter :: NT = 4

  call omp_set_num_threads(NT)

  !$omp parallel
    print*, "Hello "
    print*, "World "
  !$omp end parallel

end program Hello


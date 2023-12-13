program simple_loop
  use omp_lib

  ! play a bit around with the parameter NT
  ! In this exercise you have one loop for initialization
  ! and one loop where some calculations is done
  ! use omp target and omp teams distribute parallel do simd
  ! parallelize this loop on a target

  integer, parameter     :: N  = 1000
  integer, parameter     :: NT = 16
  real,    parameter     :: pi = 3.141592
  integer, dimension(N)  :: a
  real,    dimension(N)  :: b
  double precision       :: start_time, end_time

  call omp_set_num_threads(NT)

  do i=1 , N
    a(i) = i
  end do


  start_time = omp_get_wtime()
  ! parallalize this loop
  !$omp target device(0)
  !$omp teams distribute parallel do simd
  do i=1 , N
    b(i) = ( a(i) * pi ) * 0.5
  end do
  !$omp end teams distribute parallel do simd
  !$omp end target
  end_time = omp_get_wtime()

  write(*,*) a(:), "********************************************"
  write(*,*) b(:), "********************************************"
  write(*,*) "Work took: ", end_time - start_time, " seconds"

end program simple_loop


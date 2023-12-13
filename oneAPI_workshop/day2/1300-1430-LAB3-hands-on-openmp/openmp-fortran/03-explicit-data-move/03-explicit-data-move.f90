program explicit_data_move
  use omp_lib

  ! In this exercise you have one loop for initialization
  ! and one loop where some calculations is done
  ! use omp target and omp teams distribute parallel do simd
  ! parallelize this loop on a target
  ! in addition use explicit data movement

  integer, parameter     :: N  = 1024
  integer, parameter     :: NT = 16
  real,    parameter     :: pi = 3.141592
  real,    allocatable, dimension(:)  :: a, b, c
  integer :: i
  double precision       :: start_time, end_time

  allocate (a(N))
  allocate (b(N))
  allocate (c(N))

  call omp_set_num_threads(NT)
  ! initialize a, b and c
  do i=1 , N
    a(i) = i*pi
    b(i) = i*i*pi
    c(i) = i*i*i*pi
  end do


  start_time = omp_get_wtime()
  ! parallalize this loop and use explicit data movement
  do i=1 , N
    c(i) = c(i) + a(i) * b(i)
  end do
  end_time = omp_get_wtime()

  write(*,*) a(:), "********************************************"
  write(*,*) b(:), "********************************************"
  write(*,*) c(:), "********************************************"
  write(*,*) "Work took: ", end_time - start_time, " seconds"

end program explicit_data_move


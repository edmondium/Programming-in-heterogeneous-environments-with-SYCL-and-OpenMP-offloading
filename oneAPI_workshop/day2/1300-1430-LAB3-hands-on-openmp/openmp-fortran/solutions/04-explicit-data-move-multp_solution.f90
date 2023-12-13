program explicit_data_move_multp
  use omp_lib

  ! In this exercise you have one loop for initialization
  ! and one loop where some calculations is done
  ! use omp target and omp teams distribute parallel do simd
  ! parallelize this loop on a target
  ! in addition use explicit data movement to multiple target regions
  ! in this exercise we have 4 vectors
  ! a and b are initialized on the host
  ! for c and d some calculations are done
  ! offload the calculation of c to device and the
  ! calculation of d to a device

  integer, parameter     :: N  = 1024
  integer, parameter     :: NT = 16
  real,    parameter     :: pi = 3.141592
  real,    allocatable, dimension(:)  :: a, b, c, d
  integer :: i
  double precision       :: start_time, end_time

  allocate (a(N))
  allocate (b(N))
  allocate (c(N))
  allocate (d(N))

  call omp_set_num_threads(NT)
  ! initialize a, b
  do i=1 , N
    a(i) = i*pi
    b(i) = i*i*pi
  end do


  start_time = omp_get_wtime()
  ! parallalize this loop and use explicit data movement for c
  !$omp target map(to:a(1:N), b(1:N)) map(tofrom:c(1:N))
  !$omp teams distribute parallel do simd
  do i=1 , N
    c(i) = c(i) + a(i) * b(i)
  end do
  !$omp end teams distribute parallel do simd
  !$omp end target

  ! parallalize this loop and use explicit data movement for d
  !$omp target map(to:a(1:N), b(1:N)) map(tofrom:d(1:N))
  !$omp teams distribute parallel do simd
  do i=1 , N
    d(i) = d(i) + a(i) * c(i)
  end do
  !$omp end teams distribute parallel do simd
  !$omp end target

  end_time = omp_get_wtime()

!  write(*,*) "a = ", a(:), "********************************************"
!  write(*,*) "b = ", b(:), "********************************************"
!  write(*,*) "c = ", c(:), "********************************************"
!  write(*,*) "d = ", d(:), "********************************************"
  write(*,*) "Work took: ", end_time - start_time, " seconds"

end program explicit_data_move_multp


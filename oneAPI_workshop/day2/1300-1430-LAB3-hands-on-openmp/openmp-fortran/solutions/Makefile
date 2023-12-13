# Compiler settings
# this makefile is for your own computer with possible intel gpu or on the
# intel devcloud
# Soner Steiner
# Wien, 2023-12-08

FXX = ifx
FXXFLAGS = -qopenmp -fopenmp-targets=spir64 -O2 -g

# Setting the source and binary files
SRC = $(wildcard *.f90)
BIN = $(SRC:.f90=)

# Rules
default: 00-hello_world_omp_solution

00-hello_world_omp_solution: 00-hello_world_omp_solution.f90
	$(FXX) $(FXXFLAGS) -o 00-hello_world_omp_solution.x 00-hello_world_omp_solution.f90

01-hello_world_omp_num_thread_solution: 01-hello_world_omp_num_thread_solution.f90
	$(FXX) $(FXXFLAGS) -o 01-hello_world_omp_num_thread_solution.x 01-hello_world_omp_num_thread_solution.f90

02-simple_loop_solution: 02-simple_loop_solution.f90
	$(FXX) $(FXXFLAGS) -o 02-simple_loop_solution.x 02-simple_loop_solution.f90

03-explicit_data_move_solution: 03-explicit_data_move_solution.f90
	$(FXX) $(FXXFLAGS) -o 03-explicit_data_move_solution.x 03-explicit_data_move_solution.f90

04-explicit_data_move_multp_solution: 04-explicit_data_move_multp_solution.f90
	$(FXX) $(FXXFLAGS) -o 04-explicit_data_move_multp_solution.x 04-explicit_data_move_multp_solution.f90

clean:
	@$(RM) $(BIN)

# Setting the independent commands
.PHONY: default clean

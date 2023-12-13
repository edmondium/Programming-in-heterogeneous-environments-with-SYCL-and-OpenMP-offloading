
#include <sycl/sycl.hpp>
#include <iostream>

using namespace sycl;

int main() {

  std::cout << "running program:  simple-sycl-app \n" ;

  queue Q;    

  std::cout << "******************************************* \n";  
  std::cout << "Selected device: " <<
    Q.get_device().get_info<info::device::name>() << "\n";
  std::cout << "******************************************* \n";

  return 0;
}

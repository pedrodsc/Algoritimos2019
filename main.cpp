#include <iostream>
#include "LA.hpp"
int main (void){
  std::cout << "Teste da biblioteca" << '\n';
  int k=0;
  Matrix M(3,7);
  for(unsigned int i = 0; i < M.rows; i++)
    for(unsigned int j = 0; j < M.columns; j++){
      M.setElement(i,j,k++);
    }

  for(unsigned int i = 0; i < M.rows; i++){
    for(unsigned int j = 0; j < M.columns; j++)
      std::cout << M.getElement(i,j) << "(" << i << "," << j << ")" << '\t';
    std::cout << '\n';
  }
  //M = new Matrix(10);
}

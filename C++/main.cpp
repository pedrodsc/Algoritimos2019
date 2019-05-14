#include <iostream>
#include "LA.hpp"
int main (void){
  std::cout << "Teste da biblioteca" << '\n';
  int k=1;
  Matrix M(5,5);

  double testVec[25] = {1,3,2,0,0,
              2,3,1,0,0,
              0,0,1,1,6,
              0,0,0,5,0,
              0,0,0,0,1};
  M.fitVectorIntoMatrix(myVec);

  for(unsigned int i = 0; i < M.rows; i++){
    for(unsigned int j = 0; j < M.columns; j++)
      std::cout << M.getElement(i,j) << "(" << i << "," << j << ")" << '\t';
    std::cout << '\n';
  }

  std::cout << "\n\n" << "Reduced matrix: " << "\n\n";
  LA::rowReduce(M);

  for(unsigned int i = 0; i < M.rows; i++){
    for(unsigned int j = 0; j < M.columns; j++){
      std::cout << M.getElement(i,j) << '\t';
    }
    std::cout << '\n';
  }
}

#ifndef LA_HPP
#define LA_HPP

#include <iostream>

class Matrix{
  public:
      unsigned int rows, columns;
      double *matrix;
      Matrix(unsigned int n);
      Matrix(unsigned int rows, unsigned int columns);
      void setElement(unsigned int row, unsigned int column, double value);
      double getElement(unsigned int row, unsigned int column);
      void fitVectorIntoMatrix(double *vector);
};

Matrix::Matrix(unsigned int n){
    matrix = (double*) malloc(sizeof(double)*n*n);
    this->rows = n;
    this->columns = n;
}

Matrix::Matrix(unsigned int rows, unsigned int columns){
    matrix = (double *) malloc(sizeof(double)*rows*columns);
    this->rows = rows;
    this->columns = columns;

}

void Matrix::setElement(unsigned int row, unsigned int column, double value){

  this->matrix[row*this->columns+column] = value;
}

double Matrix::getElement(unsigned int row, unsigned int column){
  return this->matrix[row*this->columns+column];
}

void Matrix::fitVectorIntoMatrix(double *inputVector){
  for(int i = 0; i < this->rows*this->columns; i++)
    this->matrix[i] = inputVector[i];
}

class LA{
public:
  static void rowReduce(Matrix M);
};

void LA::rowReduce(Matrix M){
  unsigned int leader, i, j;
  double k, temp;
  for(leader = 0; leader < M.rows; leader++)
    for(i = leader + 1; i < M.rows; i++){
      k = M.getElement(i,leader) / M.getElement(leader,leader);
      for(j = 0; j < M.columns; j++){
        temp = M.getElement(i,j) - k*M.getElement(leader,j);
        M.setElement(i,j,temp);
      }
    }
}

#endif

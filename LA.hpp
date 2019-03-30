#ifndef LA_HPP
#define LA_HPP

class Matrix{
  public:
      unsigned int rows, columns;
      double *matrix;
      Matrix(unsigned int n);
      Matrix(unsigned int rows, unsigned int columns);
      void setElement(unsigned int row, unsigned int column, double value);
      double getElement(unsigned int row, unsigned int column);
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



#endif

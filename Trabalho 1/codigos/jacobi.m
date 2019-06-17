function [x,iter,res] = jacobi(A,b,tol,nmaxiter)
%
% Entrada: 
%   A,b = matriz, vetor independente
%   tol = tolerancia
%   nmaxiter = numero maximo de iteracoes
% Saida:
%   x = vetor solucao
%   iter = numero de iteracoes
%   res = norma relativa do maximo do residuo/b
%
    tic;
    [n,n]=size(A);
    D = diag(diag(A));
    D1 = inv(D);
    L = (tril(A)- D);
    U = (triu(A)- D);
    D1B = D1*b;
    D1LU = D1*(L+U);
    iter = 0;
    err = tol+1.0;  
    x0 = zeros(n,1);
    x = x0;
    while ((err > tol)&&(iter < nmaxiter))     
      x = D1B - D1LU*x0;
      iter = iter + 1;
      res(iter) = norm((b-A*x)/b,inf);  
      err = res(iter);       
      x0 = x;	   
    endwhile;
    printf("Solução após %d iterações\n",iter);
    toc;
endfunction;
     

           

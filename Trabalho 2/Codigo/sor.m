function [x,iter,res] = sor(A,b,tol,nmaxiter,w)
  %
  % Entrada: 
  %   A,b = matriz, vetor independente
  %   tol = tolerancia
  %   nmaxiter = numero maximo de iteracoes
  %   w = parametro SOR (w=1 Gauss-Seidel)
  % Saida:
  %   x = vetor solucao
  %   iter = numero de iteracoes
  %   res = norma do maximo do residuo/b
  %
  tic;
  [n,n]=size(A);
  
  D = diag(diag(A));
  L = (tril(A)- D);
  U = (triu(A)- D);
  # x(k+1) = inv(L+D/w)*[(D/w-D-U)x(k)+b]
  M = inv(L+D/w);
  N = (D/w-D-U);
  iter = 0;
  err = tol+1.;  
  x0 = zeros(n,1);
  x = x0;
  
  while (err > tol)&&(iter < nmaxiter)
    x = M*(N*x0+b);
    iter = iter + 1;
    res(iter) = norm((b-A*x)/b,inf);   
    err = res(iter);
    x0 = x;	    
  endwhile;
  printf("Solução após %d iterações\n",iter);
  toc;
endfunction;
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
     iter = 0;
     err = tol+1.0;  
     x0 = zeros(n,1);
     x = x0;
     while ((err > tol)&&(iter < nmaxiter))
     	for i=1:n
          soma = 0.0;
          for j = 1:(i-1)
            soma = soma + A(i,j)*x0(j);
          endfor
          for j = (i+1):n
	          soma = soma + A(i,j)*x0(j);
          endfor
	        x(i) = (b(i) - soma)/A(i,i);
        endfor          
	      iter = iter + 1;
        res(iter) = norm((b-A*x)/b,inf);  
        err = res(iter);       
        x0 = x;	   
     endwhile;
     toc;
endfunction;
            
     

           

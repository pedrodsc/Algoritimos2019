function [MJ,MS,MSOR] = fatora(A,w)
%
% Entrada:
%   A = matriz dos coeficientes
%   w = parametro SOR
% Saida:
%   MJ = matriz iteracao Jacobi
%   MS = matriz iteracao Gauss-Seidel
%   MSOR = matriz iteracao SOR
%
     [n,n]=size(A);
     E = zeros(n,n);
     D = zeros(n,n);
     F = zeros(n,n);
     D(1,1) = A(1,1); 
     F(1,2:n) = A(1,2:n);  
     for i=2:n-1
         D(i,i) = A(i,i);
         for j=1:i-1
           E(i,j) = A(i,j);
         endfor
         for j = i+1:n
           F(i,j) = A(i,j);
         endfor         
     endfor
     D(n,n) = A(n,n); 
     E(n,1:n-1) = A(n,1:n-1); 
     MJ   = - inv(D)*(E+F);
     MS   = - inv(E+D)*F ;
     MSOR =   inv(D+w*E)*((1-w)*D-w*F);
endfunction;
            
     

           

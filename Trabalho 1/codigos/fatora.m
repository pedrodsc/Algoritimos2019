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
    D = diag(diag(A));
    L = -(tril(A)- D);
    U = -(triu(A)- D);

    MJ   = inv(D)*(L+U);
    MS   = inv(D-L)*U ;
    MSOR = inv(D+w*L)*((1-w)*D-w*U);

endfunction;
            
     

           

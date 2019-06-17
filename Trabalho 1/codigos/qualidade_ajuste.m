function [r2,var] = qualidade_ajuste(x,y,m,pol)
%
% Entrada: 
%   n,x,y = tabela (x,y) com n experimentos
%   m,pol = polinomio pol de grau m
% Saida:
%   coef = coeficiente de determinacao
%  
    n = length(x);
    if length(y)~=n, error('x and y must be same length'); end
    x = x(:); y = y(:);
    
    sumy = sum(y);
    y2 = y.^2;
    sumy2 = sum(y2);
    res = y - polyval(pol,x);
    res2 = res.^2;
     
    Sr = sum(res2);
     
    den = sumy2-(sumy*sumy)/n;
    r2 = 1 - Sr/den;
    
    var = Sr/(n-(m+1));
%     
endfunction;
            
     

           

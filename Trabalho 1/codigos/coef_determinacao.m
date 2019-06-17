function r2 = coef_determinacao(yData,yfit)
%
% Entrada: 
%   yData = vetor com os valores tabelados (xData,yData)
%   yfit  = vetor com os valores da funcao de ajuste: f(xData)
% Saida:
%   r2 = coeficiente de determinacao
%  
    n = length(yData);
    if length(yfit)~=n, error('yData and yfit must be same length'); end
    yData = yData(:); yfit = yfit(:);    
    
    res = yData - yfit;
    res2 = res.^2;
    Sr = sum(res2);
     
    ymedio = sum(yData)/n;
    res = yData - ymedio;
    res2 = res.^2;
    St = sum(res2);
     
    r2 = 1 - Sr/St;
%     
endfunction;
            
     

           

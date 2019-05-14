function sigma = variancia(yData,yfit,p)
%
% Entrada: 
%   yData = vetor com os valores tabelados (xData,yData)
%   yfit  = vetor com os valores da funcao de ajuste: y(xData)
%   p     = numero de parametros
% Saida:
%   sigma = variancia residual
%

% verifica se o tamanho dos vetores sao iguais
  n = length(yData);
  if length(yfit)~=n, error('os vetores nao tem o mesmo tamanho'); end
  yData = yData(:); yfit = yfit(:);
    
  res = yData - yfit;
  res2 = res.^2;
  Sr = sum(res2);
     
  sigma = Sr/(n-p);
%     
endfunction;
            
     

           

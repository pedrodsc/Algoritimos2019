clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 6: Integracao 
%  
%   Calcular as integrais para as funcoes abaixo usando 
%   quadv (Simpson) e quad (Quadratura Gaussiana) disponiveis 
%   no octave
%
%   Funcoes:
%        f(x)=sin(x)*tan(x),   para 0<=x<=1
%        f(x)=x*tan(x),        para 0<=x<=pi/2    
%        f(x)=(1+x^2)^(3/2),   para 0<=x<=1    
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("6. Integracao");
disp("Calcular as integrais");
disp("f(x)=sin(x)*tan(x), para 0<=x<=1");
disp("f(x)=x*tan(x),      para 0<=x<=pi/2");
disp("f(x)=(1+x^2)^(3/2), para 0<=x<=1");
disp(" ");
disp(" ");

% Calcula as integrais para tres funcoes diferentes e
% imprime o valor exato e aproximados na tela

% primeira funcao
printf("Funcao: f(x)=sin(x)*tan(x), para 0<=x<=1\n")
function y = f(x)
	y=sin(x).*tan(x);
end

printf("Valor exato:                                                  %.8f...\n", 0.38472019)
printf("Valor aproximado usando a funcao quadv (Regra de Simpson):    %.8f...\n", quadv("f", 0, 1))  
printf("Valor aproximado usando a funcao quad (Quadratura Gaussiana): %.8f...\n", quad("f", 0, 1))  
pause

% segunda funcao
printf("\nFuncao: f(x)=x*tan(x), para 0<=x<=pi/2\n")
function y = f(x)
	y=x.*sin(x);
end

printf("Valor exato:                                                  %.8f...\n", 1.0)  
printf("Valor aproximado usando a funcao quadv (Regra de Simpson):    %.8f...\n", quadv("f", 0, pi/2))  
printf("Valor aproximado usando a funcao quad (Quadratura Gaussiana): %.8f...\n", quad("f", 0, pi/2))  
pause

% terceira funcao
printf("\nFuncao: f(x)=(1+x^2)^(3/2), para 0<=x<=1\n")
function y = f(x)
	y=(1.+(x.^2)).^1.5;
end

printf("Valor exato:                                                  %.8f...\n", 1.56795196)
printf("Valor aproximado usando a funcao quadv (Regra de Simpson):    %.8f...\n", quadv("f", 0, 1))  
printf("Valor aproximado usando a funcao quad (Quadratura Gaussiana): %.8f...\n", quad("f", 0, 1))  

disp(' ');
disp('Final da Questao 6');


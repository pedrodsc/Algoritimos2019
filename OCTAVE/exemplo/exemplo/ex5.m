clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 5: Interpolacao
%
% Ex:
%   1) Calcular uma sequencia de polinomios de interpolacao 
%   para a funcao f(x) = 1./(x.+10) + x.^3 + x.^2 - 3 tabelada 
%   no intervalo [-1,1] resolvendo o sistema de Vandermonde
%
%   2) Interpolar a funcao y = sin(2*pi*x/5) no intervalo [0,10]
%   usando diferentes metodos disponiveis no octave: linear, 
%   spline, cubic, nearest
%   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("5. Interpolacao");
disp("Exemplo 1: Calcular uma sequencia de polinomios de interpolacao");
disp("para a funcao f(x) = 1./(x.+10) + x.^3 + x.^2 - 3 tabelada no intervalo [-1,1]");
disp(" ");

% calcula a tabela de pontos (fx,fy)
function y = f(x)
	y = 1./(x.+10) + x.^3 + x.^2 - 3;
end
n = 100;
fx = -1:2/n:1;
fy = f(fx);

% calcula os polinomios interpoladores grau=1,2,3 e 4
% montando e resolvendo o sistema de Vandermonde
for grau = 1:4
	n = grau;
	x = -1:2/n:1;
	y = f(x);

	po = fliplr((fliplr (vander (x))\(y'))'); 
	py = polyval(po, fx);
	
	plot(fx, py , fx, fy , x, y, "*")
	printf("Numero de pontos de interpolacao = %d \n", length(x))
	legend(strcat("polinomio interpolador de grau ", num2str(grau)), "funcao f(x)")
	pause
end

% interpolar a funcao y = sin(2*pi*x/5) no intervalo [0,10] usando diferentes
% metodos disponiveis no octave: linear, spline, cubic, nearest
disp(" ");
disp("Exemplo 2: interpolar a funcao y = sin(2*pi*x/5) no intervalo [0,10]");
disp("usando diferentes metodos: linear, spline, cubic, nearest");
disp(" ");
xf = [0:0.05:10];
yf = sin (2*pi*xf/5);
xp = [0:10];
yp = sin (2*pi*xp/5);
lin = interp1 (xp, yp, xf);
spl = interp1 (xp, yp, xf, "spline");
cub = interp1 (xp, yp, xf, "cubic");
near = interp1 (xp, yp, xf, "nearest");
plot (xf, yf, "r", xf, lin, "g", xf, spl, "b",xf, cub, "c", xf, near, "m", xp, yp, "r*");
title('Interpolacao de y = sin(2*pi*x/5) no intervalo [0,10] usando diferentes metodos');
legend ("original", "linear", "spline", "cubic", "nearest")
disp('Final da Questao 5');

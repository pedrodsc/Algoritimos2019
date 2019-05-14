clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 4: Raizes de Equacoes
%              y = x**2 + 3*x - 4 = 0
%
% Determinar os zeros da equacao usando Newton 
% e diferentes valores para o ponto inicial x0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("4. Raizes de Equacoes");
printf("Encontrar as raizes de x**2 + 3*x - 4 = 0 usando Newton:\n\n");

function y = f(x)
	% Funcao
	y = x**2 + 3*x - 4;
end
	
function y = df(x)
	% Derivada da Funcao
	y = 2*x + 3;
end

function [x, iter, error] = Newton (x0, epsilon, iterMax)
% Metodo de Newton:
%   Entrada: 
%     x0 = aproximacao inicial
%     epsilon = precisao desejada
%     iterMax = numero de iteracoes maxima
%   Saida:
%     x = raiz
%     iter = numero de iteracoes
%     error = 1 --> nao convergiu
%
	fx = f(x0);
	dfx = df(x0);
	x = x0;
	iter = 0;
	
	dx = epsilon+1;
	while ( (abs(dx) > epsilon || abs(fx) > epsilon) && (abs(dfx) > 10e-6) && (iter < iterMax) )
		dx = -fx / dfx;
		x += dx;		
		fx = f(x);
		dfx = df(x);
		iter++;
	end

	error = 0;
	if (abs(dfx) < 10e-6)
		if abs(fx) < epsilon
			error = 0;
		else
			error = 1;
		end		
	end
end

function DrawFunction (x0, xf)
	% Desenha o grafico da funcao f(x) no intervalo [x0, xf]
	% e mostra graficamente os zeros exatos (-4,1)
	x = x0:0.2:xf;
	for i = 1:length(x)
		y(i) = f(x(i));
		z(i) = 0;
	end	
	plot(-4,0,'*',1,0,'*',x, z , x, y, "--");
end

% mostra os zeros da funcao graficamente
DrawFunction(-5, 5);

% define a precisao e o numero maximo de iteracoes
% para o metodo de Newton
epsilon = 0.0001;
itermax = 200;

% calcula as raizes por Newton e imprime os resultados
%    x0 = aproximacao inicial
%    raiz = root, 
%    iter = numero de iteracoes
%    error = 1 --> nao convergiu

% Calcula as raizes para diferentes valores de x0
x0 = -1.5;
[root, iter, error] = Newton(x0, epsilon, itermax);
if ( error == 1 ) 
	printf("Nao encontrou a raiz com x0 = %f\n",x0);
else
	printf("raiz = %f em %d iteracoes com x0 = %f\n",root,iter,x0);
end

x0 = -3;
[root, iter, error] = Newton(x0, epsilon, itermax);
if ( error == 1 ) 
	printf("Nao encontrou a raiz com x0 = %f\n",x0);
else
	printf("raiz = %f em %d iteracoes com x0 = %f\n",root,iter,x0);
end

x0 = 2;
[root, iter, error] = Newton(x0, epsilon, itermax);
if ( error == 1 ) 
	printf("Nao encontrou a raiz com x0 = %f\n",x0);
else
	printf("raiz = %f em %d iteracoes com x0 = %f\n",root,iter,x0);
end

disp(' ');
disp('Final da Questao 4');


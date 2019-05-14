clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 1: Resolucao de Sistemas Lineares,
%            calculo de determinantes, calculo da inversa,
%            produto matriz-vetor
%
% Seja o sistema Ax = b
%         
% onde
%                 
%         |  2  1 -1  5  6 |       | 13 |
%     A = |  1  2  3 -7 -2 |   B = | -3 | 
%         | -7  3  2  0  4 |       |  2 |
%         | -1  0  3  1  1 |       |  4 |    
%         |  3  5 -8  1  7 |       |  8 |  
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Resolucao de um sistema linear Ax = b usando o comando x = A\b');
disp('comando para entrar a matriz A: ');
disp(' A=[2  1 -1  5  6; 1  2  3 -7 -2; -7  3  2  0  4; -1  0  3  1  1; 3  5 -8  1  7]');
disp('comando para definir o vetor b: ');
disp(' b=[13; -3; 2; 4; 8]');
disp(' ');
A=[2  1 -1  5  6; 1  2  3 -7 -2; -7  3  2  0  4; -1  0  3  1  1; 3  5 -8  1  7]
b=[13; -3; 2; 4; 8]
x = A\b
disp(' ');
disp('Tecle alguma coisa para continuar...'); pause;
clc;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Determinante de A e inversa de A.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('Determinante de A ( det(A) ) e inversa de A ( inv(A) ):');
disp(' ');
determinate = det(A)
inversa_A = inv(A)
disp(' ');
disp('Tecle alguma coisa para continuar...'); pause
clc;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% produto matriz-vetor: c = A*b.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('produto c = A*b:');
disp(' ');
c = A * b
disp(' ');
disp('Tecle alguma coisa para continuar...'); pause
clc;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 2: Resolva o sistema H x = b pelo metodo de 
%            Gauss-Seidel and SOR com precisao E=10^-7 
%            utilizando o octave/matlab. 
%
%           4  1 0 0 0 0 ... 0  0  0 0       1
%          -2  4 1 0 0 0 ... 0  0  0 0       2
%           0 -2 4 1 0 0 ... 0  0  0 0       3
%     H =   .                            b = 4
%           .
%           0  0 0 0 0 0 ... 0 -2  4 1       18
%           0  0 0 0 0 0 ... 0  0 -2 4       19
%
% Para isso, e' necessario fazer um codigo na linguagem do 
% octave/matlab para resolver o problema.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
disp('Fazer um programa para resolver o sistema Hx=b pelo');
disp('metodo iterativo de Gauss-Seidel');
% construcao da matriz H e vetor b 'so para mostrar na tela
% no c'odigo de gauss-seidel s'o precisamos definir os valores 
% das diagonais
h4 = zeros(19,1);
h4 += 4;
h2 = zeros(18,1);
h2 += -2;
h1 = zeros(18,1);
h1 += 1;
H = diag(h4,0);
H += diag(h2,-1);
H += diag(h1,1);
b=zeros(19,1);
b+=3;
b(1) = 5;
b(19) = 2;
% inprime matriz H e vetor b
H
b

function [x, iteration] = method_sor (w)
	% Inicializa vetor x para iteracao k = 0
	for i = 1:19
		x(i) = 0;
	end
	
	iteration = 0;
	while true
		iteration++;

		% Guarda a iteracao anterior
		for i = 1:19
			oldX(i) = x(i);
		end

		% Executa iteracao
		x(1) = (5 - x(2)) / 4;
		x(1) = w * x(1) + (1-w) * oldX(1);
		for i = 2:18
			x(i) = (3 + 2*x(i-1) - x(i+1)) / 4;
			x(i) = w * x(i) + (1-w) * oldX(i);
		end
		x(19) = (2 + 2*x(18)) / 4;
		x(19) = w * x(19) + (1-w) * oldX(19);
		
		% Criterio de parada
		if ( max(abs(x - oldX)) / max(abs(x)) ) < 10^-7
			break
		end
		
		if iteration >= 500 
			printf('Gauss-seidel nao convergiu em 500 iteracoes \n');
			break			
		end
	end
endfunction

% resolve o sistema Hx = b por Gauss-Seidel (w=1)
w = 1;
[sol,iteration] = method_sor (w);
% imprime solucao
printf('Solucao por Gauss-Seidel:\n');
printf('Numero de iteracoes: ');
iteration
x = sol'
disp(' ');
disp('Final da Questao 1');

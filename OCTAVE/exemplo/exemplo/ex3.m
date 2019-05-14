clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 3: Solucao de Equacoes Diferenciais Ordinarias
%                y' = x + y
%                y(0) = 1
% Calcular a solucao pelo metodo de Euler no intervalo [0,4]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('3. Equacoes Diferenciais Ordinarias');
disp(' Resolver o PVI dy/dx = x + y, y(0) = 1');
disp(' pelo metodo de Euler no intervalo [0,4].');
disp(' ');

function w = f (x, y)
	% y' = f (x, y)
	w = x + y;
end

function [VetX, VetY] = Euler (a, b, h, y0)
	% Runge-Kutta de Ordem 1
	x = a;
	y = y0;
	Fxy = f(x, y);
	VetX(1) = x;
	VetY(1) = y;
	
	index = 2;
	
	while (x < b)
		x += h;	
				
		y += h * Fxy;
		Fxy = f(x, y);
		
		VetX(index) = x;
		VetY(index) = y;
		index++;
	end
end

function itemA()	
	h = 0.4;
	index = 1;
	dh = 0.1;

	while h >= 0.1
		% Solucao por Euler
		[x, y] = Euler(0.0, 4.0, h, 1);
		% Solucao exata
		for i = 1:length(x)
			ty(i) = 2 * e**x(i) - (x(i)+1);
		end
		
		% Calcula erro maximo
		error(index) = max(abs(y - ty));
		index++;
		
		% Plota a solucao exata e aproximada
		printf('Exibindo grafico para ');
		h
		plot(x, ty, x, y, x, y,"*");
		title('Runge-Kutta Ordem 1');
		xlabel('x');
		ylabel('y');
		legend('Exata', 'Aproximada');
		disp("Enter para prosseguir...");
		pause;
		
		% Resolve para um h - dh
		h -= dh;
	end
	
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% - Questao 3:
% Equacoes diferenciais ordinarias
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
itemA();
disp('Final da Questao 3');


%--------------------------------------------------------------------------
% Este programa ...
% (Adicionar comentários sobre o que o programa faz.)
%-------------------------------------------------------------------------- 

clc;
close all;
clear;

%-------------------------------------------------------------------------- 
% Entrada de dados
%-------------------------------------------------------------------------- 

%Matriz com os potenciais elétricos medidos em cada ponto:
% P = [...];
%-------------------------------------------------------------------------- 

%-------------------------------------------------------------------------- 
% (Adicionar comentários sobre o que cada trecho do programa faz.)
%-------------------------------------------------------------------------- 
num_linhas = 10;
num_colunas = 14;
P = rand(num_linhas, num_colunas);
[X,Y] = meshgrid(1:num_colunas, 1:num_linhas); % [X,Y] Matriz das posicoes (eixos 'x' e 'y')

%[X,Y] = meshgrid(xgv,ygv) replicates the grid vectors xgv and ygv to
%produce a full grid. This grid is represented by the output coordinate
%arrays X and Y.
%The sizes of the output arrays are determined by the length of the
%grid vectors. For grid vectors xgv and ygv of length M and N respectively,
%X and Y will have N rows and M columns.
%-------------------------------------------------------------------------- 

%-------------------------------------------------------------------------- 
% Plota os resultados de potencial medidos
%--------------------------------------------------------------------------
surfc(X,Y,P); % Plota a superficie 3D ja com curvas de nivel

% surfc(X,Y,Z) uses Z for the color data and surface height. X and Y are
% vectors or matrices defining the x and y components of a surface.
% If X and Y are vectors, length(X) = n and length(Y) = m,
% where [m,n] = size(Z).
% In this case, the vertices of the surface faces are (X(j),
% Y(i), Z(i,j)) triples. To create X and Y matrices for arbitrary
% domains, use the meshgrid function.

xlabel('X');
ylabel('Y');
zlabel('Tensao medida [V]');
title('Título...');
%--------------------------------------------------------------------------

%-------------------------------------------------------------------------- 
% Prepara janela e plota as linhas equipotenciais
%--------------------------------------------------------------------------
figure                   % abre uma janela de figura
hold on                  % mantem a janela aberta para plotar
contour(X,Y,P); %Plota as curvas de nivel no intervalo em [v];

% A contour plot displays isolines of matrix Z.
% contour(Z) draws a contour plot of matrix Z, where Z is
% interpreted as heights with respect to the x-y plane. Z must
% be at least a 2-by-2 matrix that contains at least two different values.
% The number of contour lines and the values of the contour lines are
% chosen automatically based on the minimum and maximum values of Z.
%The ranges of the x- and y-axis are [1:n] and [1:m], where [m,n] = size(Z).

xlabel('X');
ylabel('Y');
title('Título...');
%--------------------------------------------------------------------------

%--------------------------------------------------------------------------
% Prepara janela e plota o campo eletrico
%--------------------------------------------------------------------------
figure                   % abre uma janela de figura
hold on                  % mantem a janela aberta para plotar
contour(X,Y,P);   % Plota novamente as linhas equipoteciais na nova janela

[Dx,Dy] = gradient(P); % Na matriz de duas colunas [Dx,Dy], a coluna Dx
% significa a diferencial em X, e Db significa a diferencial em Y,
% ou seja, cada linha da matriz [Dx,Dy] corresponde as
% componentes (x,y) de cada vetor gradiente.

% [FX,FY] = gradient(F) where F is a matrix returns the x and y components
% of the two-dimensional numerical gradient. FX corresponds to ∂F/∂x, the
% differences in x (horizontal) direction. FY corresponds to  ∂F/∂y, the
% differences in the y (vertical) direction. The
% spacing between points in each direction is assu
med to be one.

quiver(X,Y,-Dx,-Dy,1.0); % Plota na mesma janela das linhas equipotenciais
% os vetores do campo eletrico, em cada ponto (X,Y), com
% escala de 1.5 (opcional)

% quiver(x,y,u,v)  plots vectors as arrows at the coordinates specified 
% in each corresponding pair of elements in x and y.
% The matrices x, y, u, and v must all be the same size and contain 
% corresponding position and velocity components. However, x and y can
% also be vectors, as explained in the next section. By default, the
% arrows are scaled to just not overlap, but you can scale them to be
% longer or shorter if you want.

xlabel('X');
ylabel('Y');
title('Título...');
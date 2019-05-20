clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 2: Ajuste de Curvas 
%   p1(x) = a1x + a2                                 
%   p5(x) = a1 x^5 + a2 x^4 + a3 x^3 + a2 x^2 + a1 x + a0 
%
% Ajuste a tabela de dados armazenada no arquivo dados.m 
% polinomios de grau 1 e 5. Faca o grafico dos ajustes.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('2. Ajuste de Curvas: ajuste a tabela de dados armazenada no arquivo');
disp('dados.m polinomios de grau 1 e 5. Faca o grafico dos ajustes.');
disp(' ');

load dados.txt
[l,c] = size(dados);
x = dados(1:l,1);
y = dados(1:l,2);
n = 1;
p1 = polyfit(x,y,n);
fprintf('\n');
fprintf('p1(x) = %3.2f x + %3.2f\n', p1(1), p1(2));
[r2,var] = qualidade_ajuste(x,y,n,p1)
n = 2;
p2 = polyfit(x,y,n);
fprintf('\n');
fprintf('p2(x) = %3.2f x^2 %3.2f x + %3.2f\n', p2(1), p2(2), p2(3));
n = 3;
p3 = polyfit(x,y,n);
fprintf('\n');
fprintf('p3(x) = %3.2f x^3 %3.2f x^2 %3.2f x + %3.2f\n', p3(1), p3(2), p3(3), p3(4));
n = 4;
p4 = polyfit(x,y,n);
fprintf('\n');
fprintf('p4(x) = %3.2f x^4 %3.2f x^3 %3.2f x^2 %3.2f x + %3.2f\n', p4(1), p4(2), p4(3), p4(4), p4(5));
n = 5;
p5 = polyfit(x,y,n);
fprintf('\n');
fprintf('p5(x) = %3.2f x^5  %3.2f x^4  %3.2f x^3  %3.2f x^2 + %3.2f x  %3.2f\n', p5(1), p5(2), p5(3), p5(4), p5(5), p5(6));
fprintf('\n');
fprintf('\n');

xi = linspace(2.60,3.1,15);
z1 = polyval(p1,xi);
z2 = polyval(p2,xi);
z3 = polyval(p3,xi);
z4 = polyval(p4,xi);
z5 = polyval(p5,xi);
plot(x,y,'*',xi,z1,";grau 1;",xi,z2,";grau 2;",xi,z3,";grau 3;",xi,z4,";grau 4;",xi,z5,";grau 5;")
xlabel('x'),ylabel('y = f(x)')
title('Ajuste de curvas usando polinomios de graus 1 e 5')
disp('Final da Questao 2');







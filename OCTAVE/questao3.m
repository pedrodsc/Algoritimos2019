%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 1: Ajuste de Curvas 
%   p1(x) = a1x + a0   
%   p2(x) = a2 x^2 + a1 x + a0 
%   p3(x) = a3 x^3 + a2 x^2 + a1 x + a0 
%   p4(x) = a4 x^4 + a3 x^3 + a2 x^2 + a1 x + a0                               
%   p5(x) = a5 x^5 + a4 x^4 + a3 x^3 + a2 x^2 + a1 x + a0 
%
% Ajuste a tabela de dados armazenada no arquivo dados.txt 
% polinômios de grau 1 a 5. Os gráfico dos ajustes foram feitos a seguir.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('1. Ajuste de Curvas: ajustando a tabela de dados armazenada no arquivo dados.txt com polinomios de grau 1 a 5.');
disp('Os dados de r2 e var de cada funcao de ajuste aparecerao na tela a seguir.');
disp(' ');

load dados.txt
[l,c] = size(dados);
x = dados(1:l,1);
y = dados(1:l,2); 
xi = linspace(2.60,3.1,15);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Grau 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = 1;
p1 = polyfit(x,y,n);
fprintf('\n');
fprintf('p1(x) = %3.2f x + %3.2f\n', p1(1), p1(2));
[r2,var] = qualidade_ajuste(x,y,n,p1)

z1 = polyval(p1,xi);
plot(x,y,'*',xi,z1,";Grau 1;")
xlabel('x'),ylabel('y = f(x)')
title('Ajuste de curvas usando polinomios de graus 1 a 5')
pause(3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Grau 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = 2;
p2 = polyfit(x,y,n);
fprintf('\n');
fprintf('p2(x) = %3.2f x^2 %3.2f x + %3.2f\n', p2(1), p2(2), p2(3));
[r2,var] = qualidade_ajuste(x,y,n,p2)

z2 = polyval(p2,xi);
plot(x,y,'*',xi,z2,";Grau 2;")
xlabel('x'),ylabel('y = f(x)')
title('Ajuste de curvas usando polinomios de graus 1 a 5')
pause(3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Grau 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = 3;
p3 = polyfit(x,y,n);
fprintf('\n');
fprintf('p3(x) = %3.2f x^3 %3.2f x^2 %3.2f x + %3.2f\n', p3(1), p3(2), p3(3), p3(4));
[r2,var] = qualidade_ajuste(x,y,n,p3)

z3 = polyval(p3,xi);
plot(x,y,'*',xi,z3,";Grau 3;")
xlabel('x'),ylabel('y = f(x)')
title('Ajuste de curvas usando polinomios de graus 1 a 5')
pause(3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Grau 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = 4;
p4 = polyfit(x,y,n);
fprintf('\n');
fprintf('p4(x) = %3.2f x^4 %3.2f x^3 %3.2f x^2 %3.2f x + %3.2f\n', p4(1), p4(2), p4(3), p4(4), p4(5));
[r2,var] = qualidade_ajuste(x,y,n,p4)

z4 = polyval(p4,xi);
plot(x,y,'*',xi,z4,";Grau 4;")
xlabel('x'),ylabel('y = f(x)')
title('Ajuste de curvas usando polinomios de graus 1 a 5')
pause(3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Grau 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n = 5;
p5 = polyfit(x,y,n);
fprintf('\n');
fprintf('p5(x) = %3.2f x^5  %3.2f x^4  %3.2f x^3  %3.2f x^2 + %3.2f x  %3.2f\n', p5(1), p5(2), p5(3), p5(4), p5(5), p5(6));
[r2,var] = qualidade_ajuste(x,y,n,p5)

z5 = polyval(p5,xi);
plot(x,y,'*',xi,z5,";Grau 5;")
xlabel('x'),ylabel('y = f(x)')
title('Ajuste de curvas usando polinomios de graus 1 a 5')
pause(3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('\n');
fprintf('\n');


plot(x,y,'*',xi,z3,";Grau 3;")
xlabel('x'),ylabel('y = f(x)')
title('Ajuste de curvas usando polinomios de graus 1 a 5')

disp('Como o polinomio de grau 3 permitiu assim a menor variancia residual, ele foi o escolhido para a nossa aproxima��o,');
disp('ao substituir 2,8 volumes nesta equacao teremos uma boa estimativa para a funcao.');
fprintf('\n');
fprintf('p3(2.8) = %3.2f*(2.8)^3 %3.2f*(2.8)^2 +%3.2f*(2.8) %3.2f\n', p3(1), p3(2), p3(3), p3(4));
fprintf('\n');
estimativa = (p3(1)*2.8^3)+(p3(2)*2.8^2)+(p3(3)*2.8)+p3(4)
disp(' ');

disp('Final da Questao 1 de Ajuste de Curvas');
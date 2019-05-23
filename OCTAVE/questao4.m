clc
clear

disp('2. Ajuste de Curvas: ajuste a tabela de dados armazenada no arquivo');
disp('dados.m polinomios de grau 1 e 5. Faca o grafico dos ajustes.');
disp(' ');

load dados4.txt
[l,c] = size(dados4);
x = dados4(1:l,1);
y = dados4(1:l,2);
y = y.^-1;
disp(' ');
fprintf('v1(x) = %3.3f x + %3.3f\n', p1(1), p1(2));
xi = linspace(0,10,10);
z1 = polyval(p1,xi);

vm1 = p1(1)/p1(2);
s1 = 1./p1(2);

plot(x,y,'*',xi,z1,";Linerarização;")
xlabel('x'),ylabel('y = f(x)')
title('Ajuste de curvas dos casos')
pause(5);

p2 = polyfit(x,y,1);
z2 = polyval(p2,xi);
plot(x,y,'*',xi,z2,";Linerarização 2;")



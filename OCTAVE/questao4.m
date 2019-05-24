clc
clear

disp('2. Ajuste de Curvas: ajuste a tabela de dados armazenada no arquivo');
disp('Para as funcoes v = Vm[S]/(Ks + [S]) e v = Vm[S]^2/(Ks^2 + [S]^2) ');
disp(' ');

load dados4.txt
[l,c] = size(dados4);
x = dados4(1:l,1);
y = dados4(1:l,2);

disp('Como a funcao do primeiro caso e v = Vm[S]/(Ks + [S]) precisamos de um');
disp('Plano intermediario onde essa funcao seria linear na forma c = ax + b. ');
disp(' ');
disp('Invertendo a funcao dos dois lados para manter a igualdade, temos: ');
disp(' ');
disp(' 1/v = Ks/Vm[S] + 1/Vm');
disp(' ');
disp(' Chamando 1/v de Y e 1/[S] de X, teremos entao:  ');
disp(' ');
disp(' Y = (Ks/Vm)*X + 1/Vm');
disp(' ');
disp(' Ks/Vm chamaremos de a e 1/Vm de b, tendo assim: ');
disp(' ');
disp(' Y = aX + b');

x = x.^-1;
y = y.^-1;
disp(' ');

xi = linspace(0,1,10);

p1 = polyfit(x,y,1);
fprintf('Y(x) = %3.3f x + %3.3f\n', p1(1), p1(2));
z1 = polyval(p1,xi);
plot(x,y,'*',xi,z1,";Linerarizacao caso 1;")

disp(' ');
disp('Para estimar o valor de [S] = 7, usaremos a linearizacao para encontrar os valores Vm e Ks: ');
disp(' ');
disp('Para encontrar o valor de Vm, basta inverter ao coeficiente linear da equacao Y = aX + b');
disp(' ');
Vm = 1/p1(2)
disp(' ');
disp('Para encontrar o valor de Ks, basta multiplicar Vm ao coeficiente angular da equacao Y = aX + b');
disp(' ');
Ks = Vm*p1(1)
disp(' ');
fprintf(' Logo temos a equacao v do caso 1 temos a aproximacao, v = %3.3f[S]/(%3.3f + [S])  ', Vm,Ks);
disp(' ');
disp(' ');
disp(' Substituindo o valor de [S] como 7 temos: ');
disp(' ');
Presult = (7*Vm)/( Ks + 7)
disp(' ');
[r2,var] = qualidade_ajuste(x,y,1,p1);
fprintf(' r2 do caso 1 e %3.3f ', r2);
disp(' ');
disp(' ');

x = x.^2;
disp(' ');
disp(' ');

hold on

p2 = polyfit(x,y,1);
fprintf('Y(x) = %3.3f x + %3.3f\n', p2(1), p2(2));
z2 = polyval(p2,xi);
plot(x,y,'*',xi,z2,";Linerarizacao caso 2;")

disp(' ');
disp('Como a funcao do segundo caso e v = Vm[S]^2/(Ks^2 + [S]^2) precisamos de um');
disp('Plano intermediario onde essa funcao seria linear na forma c = ax + b. ');
disp(' ');
disp('Invertendo a funcao dos dois lados para manter a igualdade, temos: ');
disp(' ');
disp(' 1/v = Ks^2/Vm[S]^2 + 1/Vm');
disp(' ');
disp(' Chamando 1/v de Y e 1/[S]^2 de X, teremos entao:  ');
disp(' ');
disp(' Y = (Ks^2/Vm)*X + 1/Vm');
disp(' ');
disp(' Ks^2/Vm chamaremos de a e 1/Vm de b, tendo assim: ');
disp(' ');
disp(' Y = aX + b');
disp(' ');
disp('Para encontrar o valor de Vm no caso 2, basta inverter o coeficiente linear  da equacao Y = aX + b');
disp(' ');
Vm = 1/p2(2)
disp(' ');
disp('Para encontrar o valor de Ks, basta multiplicar Vm ao coeficiente angular da equacao Y = aX + b e elevar a 1/2');
disp(' ');
Ks = (Vm*p2(1))^1/2
disp(' ');
fprintf(' Logo temos a equacao v do caso 2 temos a aproximacao, v = %3.3f[S]^2/(%3.3f^2 + [S]^2)  ', Vm,Ks);
disp(' ');
disp(' ');
disp(' Substituindo o valor de [S] como 7 temos: ');
disp(' ');
Presult = ((7^2)*Vm)/((Ks^2) + (7^2))
disp(' ');


[r2,var] = qualidade_ajuste(x,y,1,p2);
fprintf(' r2 do caso 2 e %3.3f', r2);
disp(' ');
disp(' ');
disp(' ');
hold off







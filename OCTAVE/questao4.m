clc
clear

disp('2. Ajuste de Curvas: ajuste a tabela de dados armazenada no arquivo');
disp('Para as fun��es v = Vm[S]/(Ks + [S]) e v = Vm[S]�/(Ks + [S]�) ');
disp(' ');

load dados4.txt
[l,c] = size(dados4);
x = dados4(1:l,1);
y = dados4(1:l,2);

disp('Como a fun��o do primeiro caso � v = Vm[S]/(Ks + [S]) precisamos de um');
disp('Plano intermedi�rio onde essa fun��o seria linear na forma c = ax + b. ');
disp(' ');
disp('Invertendo a fun��o dos dois lados para manter a igualdade, temos: ');
disp(' 1/y = Ks/Vm[S] + 1/Vm');
disp(' ');
disp(' Chamando 1/y de Y e 1/[S] de X, teremos ent�o:  ');
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
plot(x,y,'*',xi,z1,";Linerariza��o;")

disp(' ');

disp('Para estimar o valor de [S] = 7, usaremos a lineariza��o para encontrar os valores Vm e Ks: ');
disp(' ');
disp('Para encontrar o valor de Vm, basta inverter ao coeficiente linear da equa��o Y = aX + b');
disp(' ');
Vm = 1/p1(2)
disp(' ');
disp('Para encontrar o valor de Ks, basta multiplicar Vm ao coeficiente angular da equa��o Y = aX + b');
disp(' ');
Ks = Vm*p1(1)
disp(' ');
fprintf(' Logo temos a equa��o v aproximada inicial, v = %3.3f[S]/(%3.3f + [S])  ', Vm,Ks);
disp(' ');
disp(' ');
disp(' Substituindo o valor de [S] como 7 temos: ');
disp(' ');
Presult = (7*Vm)/( Ks + 7)




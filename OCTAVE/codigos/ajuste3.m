clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 2: Ajuste de Curvas, caso nao linear
%     y = a exp( bx )
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('2. Ajuste de Curvas: y = a exp( bx )');
disp(' ');

xData = [2.65; 2.65; 2.70; 2.70; 2.75; 2.75; 2.85; 2.85; 2.90; 2.90; 2.95; 2.95; 3.00; 3.00];
yData = [6.85; 6.80; 6.70; 6.30; 6.33; 6.20; 5.90; 5.82; 5.80; 5.80; 6.15; 6.00; 6.30; 6.15];
F = ones(length(xData),3);
F(:,2) = exp(xData(:));
F(:,3) = xData(:).*exp(-xData(:));
a = F\yData

%plota o grafico
xp = 1:0.1:8;
yp = a(1) + a(2) * exp(xp) + a(3) * xp .* exp(-xp);
plot(xData,yData,'o',xp,yp)
xlabel('x'),ylabel('y')
title('Ajuste de curvas, caso nao linear - y = a exp( bx )')
grid on

fprintf('\n');
disp('Final da Questao de Ajuste');







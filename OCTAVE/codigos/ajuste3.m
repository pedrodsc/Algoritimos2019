clc
clear
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Questao 2: Ajuste de Curvas, caso nao linear
%     y = a exp( bx )
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('2. Ajuste de Curvas: y = a exp( bx )');
disp(' ');

xData = [1.2; 2.8; 4.3; 5.4; 6.8; 7.9];
yData = [7.5; 16.1; 38.9; 67.0; 146.6; 266.2];
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







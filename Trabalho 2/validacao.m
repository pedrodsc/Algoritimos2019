clear
clc

intervalX = [0,10]
intervalY = [0,5]

x = linspace(intervalX(1),intervalX(2),10)
y = linspace(intervalY(1),intervalY(2),10)
[xx,yy] = meshgrid(x,y)
surf(xx,yy,((xx*(10-xx))+(yy*(5-yy)))/5)
%surf(xx,yy,((xx*(10-xx))*(yy*(5-yy)))/10)
%NA FRONTEIRA
%V = 0  
%V =(0.625*xxx*(10 - xxx)) Y = 2,5 
 

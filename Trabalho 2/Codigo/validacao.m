clear
clc

# Item 4. do trabalho usando para testar o programa com uma função conhecida.

intervalX = [0,10]
intervalY = [0,5]

x = linspace(intervalX(1),intervalX(2),10)
y = linspace(intervalY(1),intervalY(2),10)
[xx,yy] = meshgrid(x,y)
<<<<<<< HEAD:Trabalho 2/validacao.m
surf(xx,yy,((xx*(10-xx))+(yy*(5-yy)))/5)
%surf(xx,yy,((xx*(10-xx))*(yy*(5-yy)))/10)
%NA FRONTEIRA
%V = 0  
%V =(0.625*xxx*(10 - xxx)) Y = 2,5 
 
=======
# F(x,y)
#mesh(xx,yy,(xx*(10-xx)+yy*(5-yy))/5)
plot3(xx,yy,(xx*(10-xx)+yy*(5-yy))/5)
# V(x,y)
#mesh(xx,yy,(xx*(10-xx)*yy*(5-yy))/10)

>>>>>>> master:Trabalho 2/Codigo/validacao.m

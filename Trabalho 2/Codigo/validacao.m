clear
clc

graphics_toolkit("gnuplot")
##graphics_toolkit("qt")

tol = 0.000001;
nmaxiter = 1000;
w = 1;

# Item 4. do trabalho usando para testar o programa com uma função conhecida.

hx = 0.5;
hy = 0.5;

a = -1/hx^2;
b = a;
c = -1/hy^2;
d = c;
e = 2*(1/hx^2 + 1/hy^2);

intervalX = [0,10];
intervalY = [0,5];

nx = (intervalX(2) - intervalX(1))/hx+1;
ny = (intervalY(2) - intervalY(1))/hy+1;

n = nx*ny;
A = sparse(n);
x = linspace(intervalX(1),intervalX(2),nx);
y = linspace(intervalY(1),intervalY(2),ny);

[xx,yy] = meshgrid(x,y);

# Um loop pra cada diagonal, otimizar isso depois
for i = (1:n)
  A(i,i) = e;
endfor

for i = (1:n-1)
  if mod(i,nx) == 0
    A(i,i+1) = 0;
    A(i+1,i) = 0;
  else
    A(i,i+1) = a;
    A(i+1,i) = b;
  endif
endfor

for i = (1:n-nx)
  A(i,i+nx) = c;
  A(i+nx,i) = d;
endfor

# F(x,y)
figure(3)
mesh(xx,yy,(xx.*(10-xx)+yy.*(5-yy))/5)
title("F(x,y)")
# V(x,y)
figure(2)
vv = (xx.*(10-xx).*yy.*(5-yy))/10;
mesh(xx,yy,vv)
title("V(x,y)")

## Condições de contorno
## V = 0 na fronteira do retângulo
## V = 0.625x(10-x) y = 2.5, 0 < x < 10

F = (xx.*(10-xx)+yy.*(5-yy))/5;
g = F';

## Condições de contorno

# Borda em 0
#                         | x1 y1 x2 y2 
[A,g] = carga_linear(A,g,0 ,1 ,1 ,1 ,ny ,nx,ny); 
[A,g] = carga_linear(A,g,0 ,1 ,1 ,nx,1  ,nx,ny);
[A,g] = carga_linear(A,g,0 ,1 ,ny,nx,ny ,nx,ny);
[A,g] = carga_linear(A,g,0 ,nx,1 ,nx,ny ,nx,ny);

[v,iter,res] = sor(A,g,tol,nmaxiter,w);
#[x,iter,res] = sor2(A,g,nx,ny,tol,nmaxiter,w);
zz = reshape(v,nx,ny)';

erro = max(vv(:)-zz(:))
erro_s = mat2str(erro)
figure(3)
mesh(xx,yy,zz)
title("V(x,y) calculado")
legend(strcat("Erro = ",erro_s))

figure(4)
[dx,dy] = gradient(zz);
mesh(xx,yy,-dx-dy)
clear
clc

graphics_toolkit("gnuplot")

tol = 0.001;
nmaxiter = 100;
w = 1;

# Item 4. do trabalho usando para testar o programa com uma função conhecida.

hx = 1;
hy = 1;

a = -1/hx*hx;
b = a;
c = -1/hy*hy;
d = c;
e = -2*(1/hx*hx + 1/hy*hy);

intervalX = [0,10];
intervalY = [0,5];

nx = (intervalX(2) - intervalX(1))/hx+1;
ny = (intervalY(2) - intervalY(1))/hy+1;

n = nx*ny;
A = zeros(n,n);

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

figure(1)
spy(A)
title("spy(A)")

# F(x,y)
figure(2)
mesh(xx,yy,(xx.*(10-xx)+yy.*(5-yy))/5)
title("F(x,y)")
# V(x,y)
figure(3)
mesh(xx,yy,(xx.*(10-xx).*yy.*(5-yy))/10)
title("V(x,y)")

F = -(xx.*(10-xx)+yy.*(5-yy))/5

## Condições de contorno
## V = 0 na fronteira do retângulo
## V = 0.625x(10-x) y = 2.5, 0 < x < 10

b = F'(:);

[x,iter,res] = sor(A,b,tol,nmaxiter,w);
zz = reshape(x,nx,ny)';

figure(4)
mesh(xx,yy,zz)
title("Teste")
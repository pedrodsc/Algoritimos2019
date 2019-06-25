clear
clc

graphics_toolkit("gnuplot")
##graphics_toolkit("qt")

tol = 0.000001;
nmaxiter = 1000;
w = 1;

# Item 4. do trabalho usando para testar o programa com uma função conhecida.

hx = 0.25
hy = 0.25

a = -1/hx^2;
b = a;
c = -1/hy^2;
d = c;
e = 2*(1/hx^2 + 1/hy^2);

intervalX = [0,10];
intervalY = [0,5];

nx = (intervalX(2) - intervalX(1))/hx+1
ny = (intervalY(2) - intervalY(1))/hy+1

t = cos(pi/nx) + cos(pi/ny);
w = (8 - sqrt(64 - 16*t^2))/t^2

n = nx*ny
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

## Condições de contorno
g = zeros(n,1);

# Placa positiva
x1 = ceil(nx*3/10);y1 = ceil(ny*3/5);
x2 = ceil(nx*7/10);y2 = ceil(ny*3/5);
[A,g] = carga_linear(A,g,5,x1,y1,x2,y2,nx,ny);
g = g';
# Placa negativa
x1 = ceil(nx*3/10);y1 = ceil(ny*2/5);
x2 = ceil(nx*7/10);y2 = ceil(ny*2/5);
[A,g] = carga_linear(A,g,-5,x1,y1,x2,y2,nx,ny);

# Borda em 0
#                         | x1 y1 x2 y2 
[A,g] = carga_linear(A,g,0 ,1 ,1 ,1 ,ny ,nx,ny); 
[A,g] = carga_linear(A,g,0 ,1 ,1 ,nx,1  ,nx,ny);
[A,g] = carga_linear(A,g,0 ,1 ,ny,nx,ny ,nx,ny);
[A,g] = carga_linear(A,g,0 ,nx,1 ,nx,ny ,nx,ny);

[v,iter,res] = sor(A,g,tol,nmaxiter,w);
#[x,iter,res] = sor2(A,g,nx,ny,tol,nmaxiter,w);
zz = reshape(v,nx,ny)';

[dx,dy] = gradient(zz);

# Desenhos

hold off
figure(1)
surf(xx,yy,zz)
title("V(x,y)")
xlabel("X")
ylabel("Y")

gg = reshape(g,nx,ny)';
figure(2)
mesh(xx,yy,gg)
title("Carga")
xlabel("X")
ylabel("Y")

figure(3)
contour(xx,yy,zz,-5:5)
hold on
quiver(xx,yy,-dx,-dy,'b')
title("Gradiente")
xlabel("X")
ylabel("Y")
plot((3:7),2*ones(5,1),'b')
plot((3:7),3*ones(5,1),'r')

hold off

figure(4)
colormap("rainbow");
pcolor(xx,yy,sqrt(dx.*dx + dy.*dy))
shading interp;
hold on
plot((3:7),3*ones(5,1),'r')
plot((3:7),2*ones(5,1),'b')
quiver(xx,yy,-1.5*dx,-1.5*dy,'b')
axis([-.5, 10.5, -.5, 5.5])
title("Intensidade do Campo Elétrico")
xlabel("X")
ylabel("Y")
grid off

hold off

figure(5)
colormap("jet");
pcolor(xx,yy,zz);
shading interp;
hold on
plot((3:7),2*ones(5,1),'r')
plot((3:7),3*ones(5,1),'b')
title("Potencial")
xlabel("X")
ylabel("Y")

hold off
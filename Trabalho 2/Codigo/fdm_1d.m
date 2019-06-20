clear
clc

graphics_toolkit("gnuplot")

tol = 0.0001;
nmaxiter = 100;
w = 1;

hx = 0.1;

e = 2/hx^2
a = -1/hx^2
b = -1/hx^2

intervalX = [0,10];

nx = (intervalX(2) - intervalX(1))/hx+1;

n = nx;

x = linspace(intervalX(1),intervalX(2),nx);

A = e*eye(n);

for i = (1:n-1)
  A(i,i+1) = a;
  A(i+1,i) = b;
endfor

A(1,1) = 1;
A(1,2) = 0;
A(end,end) = 1;
A(end,n-1) = 0;


##F = x.*(10-x);
##F = F';
F = zeros(n,1);

p1 = 25;
F(p1,1) = 1;

A(p1,p1-1) = 0;
A(p1,p1) = 1;
A(p1,p1+1) = 0;

##p2 = 75;
##F(p2,1) = -1;
##
##A(p2,p2-1) = 0;
##A(p2,p2) = 1;
##A(p2,p2+1) = 0;

##v = F \ A
[v,iter,res] = sor(A,F,tol,nmaxiter,w);
figure(1)
plot(v)
title("v")

figure(2)
plot(F)
title("F")


clear all
clc

addpath("codigos/")

disp(ctime(time()))

tol = 0.001;
nmaxiter = 1000;
w = 0.1;
n = 1;

ws = zeros(19,1);
iters = zeros(19,1);
ress = cell(19,1);

load "SuiteSparse Matrix Collection/hor_131"
A = Problem.A;
b = A*ones(rows(A),1);
disp("Fazendo um sweep de 0 < w < 2");
while w < 2
  printf("\nIteração de número %d | w = %f\n",n,w);
  [XPS,iter,res] = sor(A,b,tol,nmaxiter,w);
  printf("\nTotal: %d | res = %f\n",iter,res(iter));
  iters(n) = iter;
  ress(n) = res;
  ws(n) = w;
  w = w + 0.1;
  n = n +1;
endwhile

save sweep_hor_131.mat

clear all
clc

addpath("codigos/")

disp(ctime(time()))

tol = 0.00001;
nmaxiter = 10000;
w = 1.2;

disp("Calculando plat362.")

load "SuiteSparse Matrix Collection/plat362"
A = Problem.A;
b = A*ones(rows(A),1);
disp("\nJacobi");
[XPJ,iterPJ,resPJ] = jacobi(A,b,tol,nmaxiter);
disp("\nSeidel");
[XPS,iterPS,resPS] = sor(A,b,tol,nmaxiter,1);
disp("\nSOR");
[XPSOR,iterPSOR,resPSOR] = sor(A,b,tol,nmaxiter,w);

disp("\nCalculando hor_131")

load "SuiteSparse Matrix Collection/hor_131"
H = Problem.A;
b = H*ones(rows(H),1);
disp("\nJacobi");
[XHJ,iterHJ,resHJ] = jacobi(H,b,tol,nmaxiter);
disp("\nSeidel");
[XHS,iterHS,resHS] = sor(H,b,tol,nmaxiter,1);
disp("\nSOR");
[XHSOR,iterHSOR,resHSOR] = sor(H,b,tol,nmaxiter,w);

disp("\nCalculando rail_5177")

load "SuiteSparse Matrix Collection/rail_5177"
R = Problem.A;
b = R*ones(rows(R),1);
disp("\nJacobi");
[XRJ,iterRJ,resRJ] = jacobi(R,b,tol,nmaxiter);
disp("\nSeidel");
[XRS,iterRS,resRS] = sor(R,b,tol,nmaxiter,1);
disp("\nSOR");
[XRSOR,iterRSOR,resRSOR] = sor(R,b,tol,nmaxiter,w);

save variaveis.mat 

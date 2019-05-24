epsilon = 0.0001;
niter = 10000;
w = 0.5;

printf("\n\
  Escolha uma matriz para ser resolvida.\n\
  1 plat362\n\
  2 hor_131\n\
  3 rail_5177 (Observação: extremamente demorada)\n\
  \n\
  Qual matriz você deseja revolver?(Padrão=Retorna): ");
escolha = kbhit();
disp(escolha);

switch(escolha)
  case '1'
    
    load "SuiteSparse Matrix Collection/plat362"
    if valoresCarregados
      XJ = XPJ;
      iterJ = iterPJ;
      resJ = resPJ;
      XS = XPS;
      iterS = iterPS;
      resS = resPS;
      XSOR = XPSOR;
      iterSOR = iterPSOR;
      resSOR = resPSOR;
    endif
  case '2'
    
    load "SuiteSparse Matrix Collection/hor_131"
    if valoresCarregados
      XJ = XHJ;
      iterJ = iterHJ;
      resJ = resHJ;
      XS = XHS;
      iterS = iterHS;
      resS = resHS;
      XSOR = XHSOR;
      iterSOR = iterHSOR;
      resSOR = resHSOR;
    endif
    
  case '3'
    
    load "SuiteSparse Matrix Collection/hor_131"
    if valoresCarregados
      XJ = XRJ;
      iterJ = iterRJ;
      resJ = resRJ;
      XS = XRS;
      iterS = iterRS;
      resS = resRS;
      XSOR = XRSOR;
      iterSOR = iterRSOR;
      resSOR = resRSOR;
    endif
    
  otherwise
    continue
endswitch

A = Problem.A;

b = A*ones(rows(A),1);
    
printf("\n\
Escolha um método para resolver a matriz.\n\
1 Jacobi\n\
2 Seidel\n\
3 SOR\n\
\n\
Qual você deseja utilizar?(Padrão=Retorna): ");
escolha = kbhit();
disp(escolha);
switch(escolha)
  case '1'
    % Resolve A por Jacobi
    if valoresCarregados
      printf("Matriz já calculada.\nPulando para resultados.\n");
    else
      [XJ,iterJ,resJ] = jacobi(A,b,epsilon,niter);
    endif
    
    printf("O método de Gauss-Jacobi levou %d iterações.\n\r",iterJ);
    plot(resJ(1:40));
    printf("Avançar?(Pressione alguma tecla)\n");
    escolha = kbhit();
    close all
  case '2'
    % Resolve A por Seidel
    if valoresCarregados
      printf("Matriz já calculada.\nPulando para resultados.\n");
    else
      [XS,iterS,resS] = sor(A,b,epsilon,niter,1);
    endif
    printf("O método de Gauss-Seidel levou %d iterações.\n\r",iterS);
    plot(resS(1:40));
    printf("Avançar?(Pressione alguma tecla)\n");
    escolha = kbhit();
    close all
  case '3'
    % Resolve A por SOR
    if valoresCarregados
      printf("Matriz já calculada.\nPulando para resultados.\n");
    else
      printf("Usando w = %f.\n",w);
      [XSOR,iterSOR,resSOR] = sor(A,b,epsilon,niter,w);
    endif
    printf("O método de Gauss-Seidel levou %d iterações.\n\r",iterSOR);
    plot(resSOR(1:40));
    printf("Avançar?(Pressione alguma tecla)\n");
    escolha = kbhit();
    close all
 otherwise
   continue
endswitch
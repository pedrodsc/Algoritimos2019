clear all
clc

addpath("codigos/")

ctime(time())
epsilon = 0.0001
niter = 10000
w = 0.5
rodarPrograma = 1;
while (rodarPrograma)
  introducao = "\n\
  Esse é o trabalho de Algoritimos Numéricos dos alunos Pedro Vinicius Custodio e João Vitor Marçal.\n\
  Todos os resultados foram previamente calculados, você pode carregá-los escolhendo a primeira opção\n\
  ou pode optar por calculá-los novamente.\n\
  \n\
  1 Carregar os valores previamente calculados.\n\
  2 Rodar os algoritimos.\n\
  3 Sair.\n\
  O que você deseja?(Padrão = 1): ";
  printf("%s",introducao);
  escolha = kbhit();
  disp(escolha);
  if escolha == '1'
    load variaveis.mat
  elseif escolha == '2'
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
            [XPJ,iterPj,resPJ] = jacobi(A,b,epsilon,niter);
            printf("O método de Gauss-Jacobi levou %d iterações.\n\r",iterPj);
          case '2'
            % Resolve A por Seidel
            [XPS,iterPS,resPS] = sor(A,b,epsilon,niter,1);
            printf("O método de Gauss-Seidel levou %d iterações.\n\r",iterPS);
          case '3'
            % Resolve A por SOR
            [XPSOR,iterPSOR,resPSOR] = sor(A,b,epsilon,niter,w);
            printf("O método SOR levou %d iterações.\n\r",iterPSOR);
         otherwise
           continue
        endswitch
      case '2'
        
        load "SuiteSparse Matrix Collection/hor_131"

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
            [XHJ,iterHJ,resHJ] = jacobi(A,b,epsilon,niter);
            printf("O método de Gauss-Jacobi levou %d iterações.\n\r",iterHJ);
          case '2'
            % Resolve A por Seidel
            [XHS,iterHS,resHS] = sor(A,b,epsilon,niter,1);
            printf("O método de Gauss-Seidel levou %d iterações.\n\r",iterHS);
          case '3'
            % Resolve A por SOR
            [XHSOR,iterHSOR,resHSOR] = sor(A,b,epsilon,niter,w);
            printf("O método SOR levou %d iterações.\n\r",iterHSOR);
        otherwise
          continue
        endswitch
      case '3'
        
        load "SuiteSparse Matrix Collection/hor_131"

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
            [XRJ,iterRJ,resRJ] = jacobi(A,b,epsilon,niter);
            printf("O método de Gauss-Jacobi levou %d iterações.\n\r",iterRJ);
          case '2'
            % Resolve A por Seidel
            [XRS,iterRS,resRS] = sor(A,b,epsilon,niter,1);
            printf("O método de Gauss-Seidel levou %d iterações.\n\r",iterRS);
          case '3'
            % Resolve A por SOR
            [XRSOR,iterHSOR,resRSOR] = sor(A,b,epsilon,niter,w);
            printf("O método SOR levou %d iterações.\n\r",iterRSOR); 
        otherwise
          continue
        endswitch
      otherwise
        continue
    endswitch
  else
    rodarPrograma = 0;
    disp("\nFim")
    continue
  endif
endwhile
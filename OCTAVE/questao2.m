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

    P = Problem.A;

    b = P*ones(rows(P),1);
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
        
        [XPJ,iterPj,resPJ] = jacobi(P,b,epsilon,niter);
        printf("O método de Gauss-Jacobi levou %d iterações.\n\r",iterPj);
      case '2'
        % Resolve A por Seidel
        [XPS,iterPS,resPS] = sor(P,b,epsilon,niter,1);
        printf("O método de Gauss-Seidel levou %d iterações.\n\r",iterPS);
      case '3'
        % Resolve A por SOR
        [XPSOR,iterPSOR,resPSOR] = sor(P,b,epsilon,niter,w);
        printf("O método SOR levou %d iterações.\n\r",iterPSOR);
     otherwise
       continue
    endswitch
  case '2'
    
    load "SuiteSparse Matrix Collection/hor_131"

    H = Problem.A;

    b = H*ones(rows(H),1);
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
        [XHJ,iterHJ,resHJ] = jacobi(H,b,epsilon,niter);
        printf("O método de Gauss-Jacobi levou %d iterações.\n\r",iterHJ);
      case '2'
        % Resolve A por Seidel
        [XHS,iterHS,resHS] = sor(H,b,epsilon,niter,1);
        printf("O método de Gauss-Seidel levou %d iterações.\n\r",iterHS);
      case '3'
        % Resolve A por SOR
        [XHSOR,iterHSOR,resHSOR] = sor(H,b,epsilon,niter,w);
        printf("O método SOR levou %d iterações.\n\r",iterHSOR);
    otherwise
      continue
    endswitch
  case '3'
    
    load "SuiteSparse Matrix Collection/hor_131"

    R = Problem.A;

    b = R*ones(rows(R),1);
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
        [XRJ,iterRJ,resRJ] = jacobi(R,b,epsilon,niter);
        printf("O método de Gauss-Jacobi levou %d iterações.\n\r",iterRJ);
      case '2'
        % Resolve A por Seidel
        [XRS,iterRS,resRS] = sor(R,b,epsilon,niter,1);
        printf("O método de Gauss-Seidel levou %d iterações.\n\r",iterRS);
      case '3'
        % Resolve A por SOR
        [XRSOR,iterHSOR,resRSOR] = sor(R,b,epsilon,niter,w);
        printf("O método SOR levou %d iterações.\n\r",iterRSOR); 
    otherwise
      continue
    endswitch
  otherwise
    continue
endswitch
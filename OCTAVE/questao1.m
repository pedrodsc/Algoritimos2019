printf("\n\
  Primeira questão - Métodos diretos\
  \n\
  Escolha uma matriz para ser carregada.\n\
  1 plat362\n\
  2 hor_131\n\
  3 rail_5177\n\
  4 Retorna\
  \n\
  Qual matriz você deseja carregar?(Padrão=Retorna): ");
escolha = kbhit();
disp(escolha);
switch(escolha)
  case '1'
    if (valoresCarregados == 0)
      load "SuiteSparse Matrix Collection/plat362"

      P = Problem.A;
     
      printf("Matriz carregada. Realizar fatoração LU?(S/N): ");
      escolha = kbhit();
      if escolha == 'n'
        continue
      endif
      [LP,UP,PP] = lu(P)
      save LUP.mat
    endif
    
    figure(1);
    spy(P);
    title ("Matriz esparça plat362");
    
    figure(2);
    spy(LP);
    title ("Matriz L");
    legend ("Observe o preenchimento da matriz");
    
    figure(3);
    spy(UP);
    title ("Matriz esparça U");
    legend ("Observe o preenchimento da matriz");
    
    printf("Avançar e fechar janelas?(Pressione alguma tecla)");
    escolha = kbhit();
    
    
    b = P*ones(rows(P),1);
    printf("\nCalculando o vetor x por x = A\b\n");
    printf("Avançar?(Pressione alguma tecla)");
    escolha = kbhit();
    XP = P\b
    
    printf("Avançar?(Pressione alguma tecla)");
    escolha = kbhit();
    
    printf("Questão c)\n");
    cond(P)
    
  case '2'
    
    if (valoresCarregados == 0)
      load "SuiteSparse Matrix Collection/hor_131"

      H = Problem.A;
      
      printf("Matriz carregada. Realizar fatoração LU?(S/N): ");
      escolha = kbhit();
      if escolha == 'n'
        continue
      endif
      [LH,UH,PH] = lu(H)
      save LUH.mat
    endif
    
    figure(1);
    spy(H);
    title ("Matriz esparça hor_131");
    
    figure(2);
    spy(LH);
    title ("Matriz L");
    legend ("Observe o preenchimento da matriz");
    
    figure(3);
    spy(UH);
    title ("Matriz esparça U");
    legend ("Observe o preenchimento da matriz");
    
    printf("Avançar e fechar janelas?(Pressione alguma tecla)");
    escolha = kbhit();
    
    b = H*ones(rows(H),1);
    printf("\nCalculando o vetor x por x = A\b\n");
    printf("Avançar?(Pressione alguma tecla)");
    escolha = kbhit();
    XP = H\b
    
    printf("Avançar?(Pressione alguma tecla)");
    escolha = kbhit();
    
    printf("\nQuestão c)\n");
    cond(H)
    
  case '3'
    
    if (valoresCarregados == 0)
      load "SuiteSparse Matrix Collection/rail_5177"

      R = Problem.A;

      b = R*ones(rows(R),1);
      
      printf("Matriz carregada. Realizar fatoração LU?(S/N): ");
      escolha = kbhit();
      if escolha == 'n'
        continue
      endif
      [LR,UR,PR] = lu(R)
      save LUR.mat
    endif
    
    figure(1);
    spy(R);
    title ("Matriz esparça rail_5177");
    
    figure(2);
    spy(LR);
    title ("Matriz L");
    legend ("Observe o preenchimento da matriz");
    
    figure(3);
    spy(UR);
    title ("Matriz esparça U");
    legend ("Observe o preenchimento da matriz");
    
    printf("Avançar e fechar janelas?(Pressione alguma tecla)");
    escolha = kbhit();
    
    b = R*ones(rows(R),1);
    printf("\nCalculando o vetor x por x = A\b\n");
    printf("Avançar?(Pressione alguma tecla)");
    escolha = kbhit();
    XP = R\b
    
    printf("Avançar?(Pressione alguma tecla)");
    escolha = kbhit();
    
    printf("Questão c)\n");
    cond(R)
    
  otherwise
    continue
endswitch
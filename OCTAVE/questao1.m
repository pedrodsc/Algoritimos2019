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
    titulo = "Matriz esparça plat362";
    A = P;
    L = LP;
    U = UP;
    p = PP;
    
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
    titulo = "Matriz esparça hor_131";
    A = H;
    L = LH;
    U = UH;
    p = PH;
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
    titulo = "Matriz esparça rail_5177";
    A = R;
    L = LR;
    U = UR;
    p = PR;
  otherwise
    continue
endswitch

# LETRA A) ################################################
figure(1);
spy(A);
title (titulo);

figure(2);
spy(L);
title ("Matriz L");
legend ("Observe o preenchimento da matriz");

figure(3);
spy(U);
title ("Matriz esparça U");
legend ("Observe o preenchimento da matriz");

printf("Avançar e fechar janelas?(Pressione alguma tecla)");
escolha = kbhit();
close all
# LETRA B #################################################
b = A*ones(rows(A),1);
printf("\nCalculando o vetor x por x = A\b\n");
printf("Avançar?(Pressione alguma tecla)");
escolha = kbhit();
x = A\b
printf("Calcular norma?(Pressione alguma tecla)\n");
escolha = kbhit();
normA = norm((b- A*x)/b,inf)
printf("Avançar?(Pressione alguma tecla)\n");
escolha = kbhit();

# LETRA C #################################################
printf("Calculando o condicionamento da matriz.\n");
cond(A)
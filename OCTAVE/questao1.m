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
disp("--------------------------------------------------------")
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
    endif
    titulo = "Matriz esparsa original plat362";
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

    endif
    titulo = "Matriz esparsa original hor_131";
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
    endif
    titulo = "Matriz esparsa original rail_5177";
    A = R;
    L = LR;
    U = UR;
    p = PR;
  otherwise
    continue
endswitch

# LETRA A) ################################################
disp("\nItem a)\n")
##figure(1);
figure(1, 'position',[100,200,1000,600]);
subplot(1,3,1);
spy(A);
title (titulo);

##figure(2);
subplot(1,3,2);
spy(L);
title ("Matriz L");
##legend ("Observe o preenchimento da matriz");

##figure(3);
subplot(1,3,3);
spy(U);
title ("Matriz U");
##legend ("Observe o preenchimento da matriz");

disp("É possível observar que as matrizes L e U apresentam um número maior de elementos não nulos");
printf("\nAvançar e fechar janelas?(Pressione alguma tecla)\n");
escolha = kbhit();
disp("--------------------------------------------------------")
close all
# LETRA B #################################################
disp("\nItem b)")
b = A*ones(rows(A),1);
printf("\nCalculando a solução do sistema por x = A\\b\n");
printf("\nCalcular?(Pressione alguma tecla)\n");
escolha = kbhit();
x = A\b
disp("A norma do resíduo é calculada para saber a exatidão da solução encontrada.\
 Idealmente seu valor é zero.")
printf("\nAvaçar e calcular a norma do resíduo?(Pressione alguma tecla)\n");
escolha = kbhit();
normA = norm((b- A*x)/b,inf);
printf("\nResposta: %f\n",normA);

printf("\nAvançar?(Pressione alguma tecla)\n");
disp("--------------------------------------------------------")
escolha = kbhit();

# LETRA C #################################################
disp("\nItem c)\n")

disp("\nUm sistema mal condicionado é um sistema em que pequenas modifica̧cões nos\n\
coeficientes do sistema resultam  em  grandes modificacões na solução.\n\
Isso é um problema, pois os computadores apresentam precisão finita e uma modificação\n\
pode ser gerada por arredondamento.\n\
O cálculo do condicionamento da matriz pode ser feito pelo produto da norma da matriz\n\
pela norma de sua inversa. Menores valores indicam um sistema melhor condicionada.\n");

printf("\nCalculando o condicionamento da matriz.\n");
cond(A)
printf("\nAvançar?(Pressione alguma tecla)\n");
disp("--------------------------------------------------------")
escolha = kbhit();
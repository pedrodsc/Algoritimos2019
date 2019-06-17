# A biblioteca glibc 2.28 apresenta um bug que compromente o funcionamento do Octave 5.1.0.
# Caso o programa encerre ao iniciar, por conta de leituras indevidas do teclado, reinicie o Octave.
# Referência https://savannah.gnu.org/bugs/?55854

clear all
clc

addpath("codigos/")

disp(ctime(time()))

rodarPrograma = 1;
valoresCarregados = 0;

introducao = "\n\
  Trabalho de Algoritimos Numéricos dos alunos Pedro Vinicius Custodio e João Vitor Marçal.\n\
  Todos os resultados foram previamente calculados. Você pode carregá-los escolhendo\n\
  a primeira opção, evitando esperar, ou pode optar por calculá-los novamente.\n";
  
printf("%s",introducao);

while (rodarPrograma)
  
  printf("\n\n\
  1 Iniciar apresentação\n\
  2 Rodar os algoritimos\n\
  3 Sair\n\
  O que você deseja?(Padrão = 3): ");
  
  escolha = kbhit();
  disp(escolha);
  if escolha == '1'
    valoresCarregados = 1;
    load variaveis2.mat
    load LUP.mat
    load LUH.mat
    load LUR.mat
    printf("\nValores carregados\n");
    printf("\nDigite o número da questão(1, 2, 3, 4 ou 5(TODAS)): ");
    escolha = kbhit();
    disp(escolha);
    switch(escolha)
      case '1'
        run questao1.m
      case '2'
        run questao2.m
      case '3'
        run questao3.m
      case '4'
        run questao4.m
      case '5'
        run questao1.m
        run questao2.m
        run questao3.m
        run questao4.m
    otherwise
      continue
    endswitch
    valoresCarregados = 0;
  elseif escolha == '2'
    printf("\nDigite o número da questão(1, 2): ");
    escolha = kbhit();
    disp(escolha);
    switch(escolha)
      case '1'
        run questao1.m
      case '2'
        run questao2.m
    otherwise
      continue
    endswitch
      
    
  else
    rodarPrograma = 0;
    disp("\nFim")
    continue
  endif
endwhile
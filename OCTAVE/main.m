# A biblioteca glibc 2.28 apresenta um bug que compromente o funcionamento do Octave 5.1.0.
# Caso o programa encerre ao iniciar, por conta de leituras indevidas do teclado, reinicie o Octave.
# Referência https://savannah.gnu.org/bugs/?55854

clear all
clc

addpath("codigos/")

disp(ctime(time()))

epsilon = 0.0001;
niter = 10000;
w = 0.5;
rodarPrograma = 1;
valoresCarregados = 0;

introducao = "\n\
  Esse é o trabalho de Algoritimos Numéricos dos alunos Pedro Vinicius Custodio e João Vitor Marçal.\n\
  Todos os resultados foram previamente calculados, você pode carregá-los escolhendo a primeira opção\n\
  ou pode optar por calculá-los novamente.\n";
  
printf("%s",introducao);

while (rodarPrograma)
  
  printf("\n\
  1 Carregar os valores previamente calculados.\n\
  2 Rodar os algoritimos.\n\
  3 Sair.\n\
  O que você deseja?(Padrão = 1): ");
  
  escolha = kbhit();
  disp(escolha);
  if escolha == '1'
    load variaveis.mat
    load LUP.mat
    load LUH.mat
    load LUR.mat
    printf("\nValores carregados\n");
    valoresCarregados = 1;
  elseif escolha == '2'
    printf("Digite o número da questão(1, 2, 3 ou 4): ");
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
    otherwise
      continue
    endswitch
  else
    rodarPrograma = 0;
    disp("\nFim")
    continue
  endif
endwhile
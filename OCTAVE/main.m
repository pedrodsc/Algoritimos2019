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
    run questao2.m
  else
    rodarPrograma = 0;
    disp("\nFim")
    continue
  endif
endwhile
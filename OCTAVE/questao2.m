# As funções jacobi() e sor() foram modificadas e a função fatora
# foi movida para dentro das funções jacobi() e sor(), portanto
# a fatoração da matriz A ocorre dentro dessas funçoes
epsilon = 0.0001;
niter = 10000;
w = 1.2;

if valoresCarregados
    load sweeps_w.mat
    disp("\nSegunda questão - Métodos iterativos")
    ### LETRA A #################################################
    disp("\nItem a)")
    # Jacobi
    disp("\nO método de Jacobi não apresentou bons resultados divergiu em todas as 3 matrizes escolhidas.")
    disp("Nas duas primeiras, plat362 e hor_131, o método rápidamente diverge.")

    figure(1, 'position',[100,100,1200,600]);

    subplot(1,2,1);
    plot(resPJ(1:20),"r;;")
    title("plat362");
    xlabel ("Iteração");
    ylabel ("resíduo");

    subplot(1,2,2);
    plot(resHJ(1:20),"r;;")
    title("hor_131");
    xlabel ("Iteração");
    ylabel ("resíduo");

    printf("\nAvançar e fechar janelas?(Pressione alguma tecla)\n");
    escolha = kbhit();
    disp("--------------------------------------------------------")
    close all

    disp("\nNa matriz rail_5177 o método apresentou um comportamento diferente. O resíduo inicialmente decresce,\n\
    porém logo começa a subir e apresentar uma oscilação, divergindo.")

    figure(1, 'position',[100,200,1200,600]);

    plot(resRJ(1:300),"r;;")
    title("rail_5177");
    xlabel ("Iteração");
    ylabel ("resíduo");

    printf("\nAvançar e fechar janelas?(Pressione alguma tecla)\n");
    escolha = kbhit();
    disp("--------------------------------------------------------")
    close all

    # Seidel 
    disp("\nO método de Gauss-Seidel convergiu nos 3 sistemas.")

    figure(1, 'position',[100,100,1200,700]);

    subplot(1,3,1);
    plot(resPS(1:40),"r;;")
    title("plat362");
    xlabel ("Iteração");
    ylabel ("resíduo");

    subplot(1,3,2);
    plot(resHS(1:40),"r;;")
    title("hor_131");
    xlabel ("Iteração");
    ylabel ("resíduo");

    subplot(1,3,3);
    plot(resRS(1:length(resRS)),"r;;")
    title("rail_5177");
    xlabel ("Iteração");
    ylabel ("resíduo");

    printf("\nAvançar e fechar janelas?(Pressione alguma tecla)\n");
    escolha = kbhit();
    disp("--------------------------------------------------------")
    close all

    ### Parte do W e SOR ############################################
    disp("\nO método SOR convergiu nos 3 sistemas para vários valores de w.")
    disp("A exceção foi a matriz hor_131, em que valores maiores que 1.3 causavam divergência.")
    disp("\nPara testar o efeito do valor de ômega no algoritimo SOR, todas os sistemas foram resolvidos várias\n\
    vezes e foram armazenados o número de iterações necessárias para a solução e os resíduos para cada ômega.")
    disp("\nPara poupar tempo, o número de iterações foi limitado a 1000 e a tolerância ajustada para 0.001.")

    figure(1, 'position',[100,200,1400,700]);

    subplot(2,3,1);
    plot(ws,resWP,"r;;")
    title("plat362");
    xlabel ("w");
    ylabel ("resíduo");

    subplot(2,3,2);
    plot(ws,resWH,"r;;")
    title("hor_131");
    xlabel ("w");
    ylabel ("resíduo");

    subplot(2,3,3);
    plot(ws,resWR,"r;;")
    title("rail_5177");
    xlabel ("w");
    ylabel ("resíduo");

    subplot(2,3,4);
    plot(ws,itersWP,"b;;")
    xlabel ("w");
    ylabel ("Iterações");

    subplot(2,3,5);
    plot(ws,itersWH,"b;;")
    xlabel ("w");
    ylabel ("Iterações");

    subplot(2,3,6);
    plot(ws,itersWR,"b;;")
    xlabel ("w");
    ylabel ("Iterações");

    printf("\nAvançar e fechar janelas?(Pressione alguma tecla)\n");
    escolha = kbhit();
    disp("--------------------------------------------------------")
    close all
    # SOR

    figure(1, 'position',[100,100,1500,700]);

    subplot(1,3,1);
    plot(resPS(1:40),"r;;")
    title("plat362");
    xlabel ("Iteração");
    ylabel ("resíduo");

    subplot(1,3,2);
    plot(resHS(1:40),"r;;")
    title("hor_131");
    xlabel ("Iteração");
    ylabel ("resíduo");

    subplot(1,3,3);
    plot(resRS(1:length(resRS)),"r;;")
    title("rail_5177");
    xlabel ("Iteração");
    ylabel ("resíduo");

    disp("\nCom base no resultados obtidos w = 1.2 parece ser a melhor escolha para os 3 sistemas")
    
    printf("\nAvançar e fechar janelas?(Pressione alguma tecla)\n");
    escolha = kbhit();
    disp("--------------------------------------------------------")
    close all
############################################################
else
    printf("\n\
      Escolha uma matriz para ser resolvida.\n\
      1 plat362\n\
      2 hor_131\n\
      3 rail_5177 (demorada)\n\
      4 Retorna\
      \n\
      Qual matriz você deseja resolver?(Padrão=4): ");
    escolha = kbhit();
    disp(escolha);

    switch(escolha)
      case '1'
        
        load "SuiteSparse Matrix Collection/plat362"

      case '2'
        
        load "SuiteSparse Matrix Collection/hor_131"
        
      case '3'
        
        load "SuiteSparse Matrix Collection/hor_131"
        
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
        [XJ,iterJ,resJ] = jacobi(A,b,epsilon,niter);

        printf("O método de Gauss-Jacobi levou %d iterações.\n\r",iterJ);
        plot(resJ(1:40));
        printf("Retornar?(Pressione alguma tecla)\n");
        escolha = kbhit();
        close all
      case '2'
        % Resolve A por Seidel

        [XS,iterS,resS] = sor(A,b,epsilon,niter,1);

        printf("O método de Gauss-Seidel levou %d iterações.\n\r",iterS);
        plot(resS(1:40));
        printf("Retornar?(Pressione alguma tecla)\n");
        escolha = kbhit();
        close all
      case '3'
        % Resolve A por SOR
        printf("Usando w = %f.\n",w);
        [XSOR,iterSOR,resSOR] = sor(A,b,epsilon,niter,w);

        printf("O método de Gauss-Seidel levou %d iterações.\n\r",iterSOR);
        plot(resSOR(1:40));
        printf("Retornar?(Pressione alguma tecla)\n");
        escolha = kbhit();
        close all
     otherwise
       continue
    endswitch
endif
  
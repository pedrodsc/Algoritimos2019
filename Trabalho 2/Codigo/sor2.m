function [x,iter,res] = sor2(A,b,nx,ny,tol,nmaxiter,w)
  %
  % Essa função resolve matrizes esparsas pentadiagonais.
  %
  %
  % Entrada: 
  %   A,b = matriz, vetor independente
  %   nx,ny = numero de pontos em cada coordenada
  %   tol = tolerancia
  %   nmaxiter = numero maximo de iteracoes
  %   w = parametro SOR (w=1 Gauss-Seidel)
  % Saida:
  %   x = vetor solucao
  %   iter = numero de iteracoes
  %   res = norma do maximo do residuo/b
  %
  tic;
  
  n = rows(b);
  iter = 1;
  err = tol+1.;  
  x0 = zeros(n,1);
  x = x0;
  while (err > tol)&&(iter < nmaxiter)
    # De acordo com o Solving the Generalized Poisson Equation Using the Finite-Difference Method
    # os quatro cantos serão ignorados, pois eles não ajudam com a solução dos pontos
    # no interior da solução.
    # Último parágrafo da página 5.
    
    # A ordem esperada de A é [d,b,e,a,c]
    
    # Primeira linha
    for p = (2:nx-1)
      
      dp = A(p,1);
      bp = A(p,2);
      ep = A(p,3);
      ap = A(p,4);
      cp = A(p,5);
      
      fp = b(p);
      
      x(p) = (w/ep)*(fp - bp*x(p-1) - ap*x0(p+1) - cp*x0(p+nx)) + (1-w)*x0(p);
      
    endfor
    
    # Resto
    
    for p = (nx+1:n-nx)
      
      dp = A(p,1);
      bp = A(p,2);
      ep = A(p,3);
      ap = A(p,4);
      cp = A(p,5);
      
      fp = b(p);
      
      x(p) = (w/ep)*(fp - dp*x(p-nx) - bp*x(p-1) - ap*x0(p+1) - cp*x0(p+nx)) + (1-w)*x0(p);
    endfor
    
    # Última linha
    
    for p = (n-nx+1:n-1)
      
      dp = A(p,1);
      bp = A(p,2);
      ep = A(p,3);
      ap = A(p,4);
      cp = A(p,5);
      
      fp = b(p);
      
      x(p) = (w/ep)*(fp - dp*x(p-nx) - bp*x(p-1) - ap*x0(p+1)) + (1-w)*x0(p);
    endfor
    
    
    iter = iter + 1;
    res(iter) = norm((b-A.*x)./b,inf);   
    err = res(iter);
    x0 = x;	    
  endwhile;
  printf("Solução após %d iterações\n",iter);
  toc;
endfunction

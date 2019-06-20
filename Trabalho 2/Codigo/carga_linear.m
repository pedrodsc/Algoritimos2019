function [A,b] = carga_linear(A,b,q,x1,y1,x2,y2,nx,ny)
  
  n = nx*ny;
  b = reshape(b,nx,ny);
  

  for i = (x1:x2)
    for j = (y1:y2)
      b(i,j) = q;
      p = (j-1)*nx + i;
      A(p,:) = zeros(1,n);
      A(p,p) = 1;
    endfor
  endfor
  
  b = b(:);
  
endfunction

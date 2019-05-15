function [elapsedTime,normA,x] = resolveDireto (A)

  n = rows(A);
  b = A*ones(n,1);
  t0 = clock();
  x = A\b;
  elapsedTime = etime(clock(),t0);
  normA = norm((b - A*x)/b,inf)
endfunction

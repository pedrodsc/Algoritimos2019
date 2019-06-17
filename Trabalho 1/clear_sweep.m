clear all
clc

addpath("codigos/")

disp(ctime(time()))

load sweep_rail_5177.mat

itersWR = iters;
resWR = zeros(19,1);
for i = (1:19)
  res = ress{i};
  resWR(i) = res(length(res));
endfor

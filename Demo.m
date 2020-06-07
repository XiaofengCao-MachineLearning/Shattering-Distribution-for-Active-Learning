clear;clc
load Syndata.mat

K=rbfkernel(data,data,1.8);

ID=Halving(K, 400);

X=data(ID,:);

SDAL(X,4)
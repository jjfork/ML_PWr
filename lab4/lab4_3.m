clear all
close all
clc

num_eles=50;
a=-2;
b=5;
c=7;
x=1:1:num_eles;
y=a*x+b*randn(1,num_eles);
y=y+c;

Y=y';X=x';
X=[ones(size(X)) X X*10];

A=regress(Y,X);
Ye=A'*X';

figure(1)
plot(y,x,'o');title('Multiple linear regression');grid on;hold on;
plot(Ye,x,"LineWidth",3)
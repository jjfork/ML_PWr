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

Y=y';
X=x';
B1=regress(Y,X);
ye1=B1*x;

figure(1)
plot(y,x,'o');title('Multiple linear regression(fake');grid on;hold on;
plot(ye1,x,"LineWidth",3)
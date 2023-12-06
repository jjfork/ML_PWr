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
%X=[ones(size(X)) X X*10];

w=polyfit(x,y,5);
ye=polyval(w,x);
figure(1)
plot(x,y,'k');title('Regression');grid on;hold on;
plot(x,ye,"LineWidth",3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[w,D]=polyfit(x,y,1);
[ye,D1]=polyval(w,x,D);
X=[X.^2 X ones(size(X))];
ye=X * w';
figure(2)
plot(x,y,'*k',"LineWidth",3);grid;hold
plot(x,ye,'r','LineWidth',3)
plot(x,ye-1*D1,'g','LineWidth',3)
plot(x,ye+1*D1,'g','LineWidth',3)
title('Regression');legend('values','regression','bounds')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

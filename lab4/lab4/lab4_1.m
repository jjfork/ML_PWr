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
X=[ones(size(X)) X];

B1=y/x;
ye1=B1*x;

figure(1)
plot(y,x,'o');title('Simle Linear egession (slope)');grid on;hold on;
plot(ye1,x,"LineWidth",3)

B2=X\Y;
ye2=X*B2;

figure(2)
plot(x,y,'*',"LineWidth",3); grid on; hold on;
plot(x,ye2,"LineWidth",3)
title('Simple Linear egession (slop and intercept)')
R21=1-sum((y-ye1').^2)/sum((y-mean(y)).^2);
R22=1-sum((y-ye2').^2)/sum((y-mean(y)).^2);
%least squares method
xm=sum(x)/length(x);
ym=sum(y)/length(y);

a1=(sum((x-xm).*(y-ym)))./(sum((x-xm).^2));
a0=ym-(a1*xm);

B3=[a0;a1];

ye3=X*B3;

figure(3)
plot(x,y,'*','LineWidth',3);grid;hold
plot(x,ye3,'k','LineWidth',3);
title('Linear regession')

R23=1-sum((y-ye3').^2)/sum((y-mean(y)).^2);
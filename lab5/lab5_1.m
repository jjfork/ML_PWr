clear all 
close all
clc


x1 = rand(300,2)*10;
x2 = x1 + 100;
X = [x1; x2]';
y = [ones(1, size(x1, 1)) * 0.2 ones(1, size(x1, 1)) * 0.7];

figure(1)
plot(X(1,:), X(2,:),'*');
grid on;
hold on;

figure(2)
plot(y,'ok');
grid on;
hold on;

MN=150;
DF=5;
GOAL=0;
SPREAD=0.7;

NN_model_rbf=newrbe(X,y,SPREAD)

X_mod = X + randn(size(X)) * 0.05;

network = newrb(X_mod,y,GOAL,SPREAD,MN,DF);
y_nn = NN_model_rbf(X_mod);

figure(2)
plot(X(1,:), X(2,:),'*'); grid on; hold on;
plot(y_nn, 'r');
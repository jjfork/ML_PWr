clear all 
close all
clc
warning off all
x=-1:0.05:1;
y=3*sin(pi*x)-cos(pi*x);
net=newff(minmax(x),[10,1],{'tansig','purelin'},'traingd');
net.trainParam.show = 5;
net.trainParam.epochs = 1000;
net.trainParam.goal = 1e-4;
net.trainParam.lr = 0.05;
net = train(net, x, y);
xtest=-1.0:0.01:1.0;
% ytest=1.2*sin(pi*xtest)-cos(2.4*pi*xtest);
ytest=3*sin(pi*xtest)-cos(pi*xtest);
net_output=sim(net,xtest); 
% the test results 
plot(xtest,ytest,'b+');
hold on; 
plot(xtest,net_output,'r-');
hold off;
xlabel('x'),ylabel('y'),title('Sequential Mode, Number of Hidden Neuron = 10') 
legend('Target Output')
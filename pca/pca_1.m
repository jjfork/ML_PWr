clear all
close all
clc

%step-1
num_elem=50;
data1=linspace(-2,4,num_elem);
data1=data1';
data1=data1+(rand(size(data1))*0.3);
data2=linspace(-2,4,num_elem);
data2=data2';
data2=data2+(randn(size(data2)).*0.5);
data2=data2+3.79;
data_orig=[data1 data2];

[coeff,score,latent,tsquared,explained,mu] = pca(data_orig);
Xcentered = score*coeff'+mu;

figure(1)
plot(data_orig(:,1),data_orig(:,2),'x','MarkerSize',7,"LineWidth",3);grid;hold
plot(Xcentered(:,1),Xcentered(:,2),'o','MarkerSize',3,"LineWidth",3);
xlabel('x');ylabel('y');title('initial data')
a=linspace(-2,4,num_elem);
%plot(a,a,'g');
legend('input data', 'Matlab>pca<function')

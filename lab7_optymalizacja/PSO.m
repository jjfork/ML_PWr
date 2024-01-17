clear all
close all
clc

opt=optimoptions('particleswarm','PlotFcn',@pswplotbestf);
opt.MaxIterations=5;
opt.SwarmSize=20;
%[wartosc_wyznaczona, wartosc_f]=ga(@f_error_func_v2,2,[],[],[],[],[0.01 0.0001],[200 20],[],opt);
warotsci_obliczone = particleswarm(@cost_fun, 1, -5, 5, opt);

x=-10:01:10;
y=cost_fun(x)
figure(2)
plot(x,y,'LineWidth',2);grid;xlabel('x');ylabel('y');hold
qy=-50:0.1:50;
qx=ones(size(qy))*warotsci_obliczone;
plot(warotsci_obliczone,cost_fun(warotsci_obliczone),'xr','MarkerSize',7,'LineWidth',3);
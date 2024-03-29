cost_fun_3d=@(x) [(x(1).*exp(-(sin(x(1)).^2+x(2).^2)))];



opt=optimoptions('particleswarm','PlotFcn',@pswplotbestf);
opt.MaxIterations=25;
opt.SwarmSize=20;


lb=[-10 -10]; ub=[10 100];

warotsci_obliczone = particleswarm(cost_fun_3d,2,lb,ub,opt)

figure(2)

fsurf(@(x1,x2)x1.*exp(-(sin(x1).^2+x2.^2))); grid on; hold;box;

cost_fun_3d([warotsci_obliczone(1) warotsci_obliczone(2)])
plot3(warotsci_obliczone(1), warotsci_obliczone(2), cost_fun_3d([warotsci_obliczone(1) ...
    warotsci_obliczone(2)]), 'xr', 'MarkerSize', 7, 'LineWidth',3)
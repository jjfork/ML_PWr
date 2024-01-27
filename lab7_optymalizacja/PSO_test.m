clear all
close all
clc

opt=optimoptions('particleswarm','PlotFcn',@pswplotbestf);

max_iterations = [2,10,20,50,100];

swarm_sizes = [5,20,50,60];

params1 = [8, 7, 3];
params2 = [9, 6, 2];
params3 = [6, 6, 6];


cost_fun1 = @(x, params) params(1) * x.^2 + params(2) * x + params(3);
cost_fun2 = @(x, params) params(1) * x.^3 + params(2) * x.^2 + params(3) * x;
cost_fun3 = @(x, params) params(1) * x.^4 + params(2) * x.^3 + params(3) * 2 * x;


for j = 1:length(swarm_sizes)
    opt.SwarmSize = swarm_sizes(j);
    
    for k = 1:3
        if k == 1
            cost_fun = cost_fun1;
            params = params1;
        elseif k == 2
            cost_fun = cost_fun2;
            params = params2;
        else 
            cost_fun = cost_fun3;
            params = params3;
        end
        
        for i = 1:length(max_iterations)
            opt.MaxIterations = max_iterations(i);
            
            warotsci_obliczone = particleswarm(@(x) cost_fun(x, params), 1, -5, 5, opt);
            
            best_func_val = cost_fun(warotsci_obliczone, params);
            
            x=-10:01:10;
            y=cost_fun(x, params)
            figure((k)*length(max_iterations)+i);
            plot(x,y,'LineWidth',2);grid;xlabel('x');ylabel('y');hold
            qy=-50:0.1:50;
            qx=ones(size(qy))*warotsci_obliczone;
            plot(warotsci_obliczone,cost_fun(warotsci_obliczone, params),'xr','MarkerSize',7,'LineWidth',3);
            
            if k == 1
                title(['Cost Function: ', num2str(k), newline, ...
                 'Max Iterations: ', num2str(opt.MaxIterations), newline, ...
                  'Swarm Size: ', num2str(opt.SwarmSize), newline, ...
                 'y = ', num2str(params(1)), 'x^2 + ', num2str(params(2)), 'x + ', num2str(params(3)), newline, ...
                  'Best Function Value: ', num2str(best_func_val)]);
            elseif k == 2
                 title(['Cost Function: ', num2str(k), newline, ...
                 'Max Iterations: ', num2str(opt.MaxIterations), newline, ...
                  'Swarm Size: ', num2str(opt.SwarmSize), newline, ...
                 'y = ', num2str(params(1)), 'x^3 + ', num2str(params(2)), 'x.^2 + ', num2str(params(3)), '*x', newline, ...
                  'Best Function Value: ', num2str(best_func_val)]);
            else 
                title(['Cost Function: ', num2str(k), newline, ...
                 'Max Iterations: ', num2str(opt.MaxIterations), newline, ...
                  'Swarm Size: ', num2str(opt.SwarmSize), newline, ...
                 'y = ', num2str(params(1)), 'x^4 + ', num2str(params(2)), 'x.^3 + ', num2str(params(3)), '* 2 * x' , newline, ...
                  'Best Function Value: ', num2str(best_func_val)]);
            end
        end
    end
end

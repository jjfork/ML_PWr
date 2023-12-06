clc;


range = [0, 4];
number_n_hl = 15;
number_n_hl_2 = 15;
number_n_o = 1;

t = linspace(0, 10, 200);
y = [1 1 0 0; 0 1 0 1];

Y_all = [y(1:5); y(2:6)];

figure(1)
plot(y(1:199), 'k'); grid on; hold on;
plot(y(2:200), 'k'); hold on;

network = newff([range; range], [number_n_hl number_n_hl_2 number_n_o], {'tansig', 'tansig', 'purelin'}, 'trainlm');
network.trainParam.epochs = 200;
network.trainParam.goal = 1e-5;
network = train(network, Y_all, y(1:5));

Y_mod = Y_all + randn(size(y(1:5))) * 0.005;

y_nn = sim(network, Y_mod);

figure(2)
plot(y, 'k'); grid on; hold on;
plot(y_nn, 'r');

clc;


range = [0, 10];
number_n_hl = 15;
number_n_hl_2 = 15;
number_n_o = 1;

% Define y(t) as ((sin(2t)+0.2sin(8t))e^-t
t = linspace(0, 10, 200);
y = ((sin(2*t)+0.2*sin(8*t)).*exp(-t));
% TUTAJ SE ZMIEN NA JAKIS INNY WZOR CO ON CHCIAL

Y_all = [y(1:199); y(2:200)];

figure(1)
plot(y(1:199), 'k'); grid on; hold on;
plot(y(2:200), 'k'); hold on;

network = newff([range; range], [number_n_hl number_n_hl_2 number_n_o], {'tansig', 'tansig', 'purelin'}, 'trainlm');
network.trainParam.epochs = 200;
network.trainParam.goal = 1e-5;
network = train(network, Y_all, y(1:199));

Y_mod = Y_all + randn(size(y(1:199))) * 0.005;

y_nn = sim(network, Y_mod);

figure(2)
plot(y, 'k'); grid on; hold on;
plot(y_nn, 'r');

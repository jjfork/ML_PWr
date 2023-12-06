
range = [-20, 20];
number_n_hl = 15;
number_n_hl_2 = 15;
number_n_o = 1;


x = linspace(range(1), range(2), 201);
y1 = a * x(1:200);
y2 = a * x(2:201);
y_sin = sin(x1);

Y_all = [y1; y2];

figure(1)
plot(y1, 'k'); grid on; hold on;
plot(y2, 'k'); hold on;
plot(y_sin);


network = newff([range; range], [number_n_hl number_n_hl_2 number_n_o], {'tansig', 'tansig', 'purelin'}, 'trainlm');
network.trainParam.epochs = 200;
network.trainParam.goal = 1e-5;
network = train(network, Y_all, y_sin);


Y_mod = Y_all + randn(size(y_sin)) * 0.05;

y_nn = sim(network, Y_mod);


figure(2)
plot(y_sin, 'k'); grid on; hold on;
plot(y_nn, 'r');

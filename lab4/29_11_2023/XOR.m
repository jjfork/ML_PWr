x1 = [0 1 0 1];
x2 = [0 0 1 1];

Y_all = [1 2 3 4];
Y = [0 1 1 0];

X = [x1; x2];

figure(1)
plot(Y_all, x1, 'ko'); grid on; hold on;
plot(Y_all, x2, 'r*'); grid on;


range = [0, 4];
number_n_hl = 20;
number_n_hl_2 = 20;
number_n_o = 1;

network = newff([range; range], [number_n_hl number_n_hl_2 number_n_o], {'tansig', 'tansig', 'purelin'}, 'trainlm');
network.trainParam.epochs = 200;
network.trainParam.goal = 0;

network = train(network, X, Y);

% Add disturbance in Y_all and save to new Y_mod
y_nn = sim(network, X);

figure(2)
plot(y_nn, 'go'); grid on;
clear all
close all
clc

A = [0 1 1 1 0;
    1 0 0 0 1;
    1 0 0 0 1;
    1 0 0 0 1;
    0 1 1 1 0];
a = A(:)';
in_data_train = a;
out_data_train = 0;
A = [0 0 0 1 0;
    0 0 1 1 0;
    0 1 0 1 0;
    0 0 0 1 0;
    0 0 0 1 0];
a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 1];
A = [0 0 1 1 0;
    0 1 0 0 1;
    0 0 0 1 0;
    0 0 1 0 0;
    0 1 1 1 1];
a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 2];
A = [0 0 1 1 0;
    0 0 0 1 0;
    0 0 1 1 0;
    0 0 0 1 0;
    0 0 1 1 0];
a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 3];
A = [0 0 0 1 0;
    0 0 1 1 0;
    0 1 0 1 0;
    1 1 1 1 1;
    0 0 0 1 0];
a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 4];
A = [1 1 1 1 1;
    1 0 0 0 0;
    1 1 1 1 0;
    0 0 0 0 1;
    1 1 1 1 0];
a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 5];
A = [0 1 1 1 0;
    1 0 0 0 0;
    1 1 1 1 0;
    1 0 0 0 1;
    0 1 1 1 0];

a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 6];

A = [1 1 1 1 1;
    0 0 0 0 1;
    0 0 0 1 0;
    0 0 1 0 0;
    0 1 0 0 0];

a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 7];

A = [0 1 1 1 0;
    1 0 0 0 1;
    0 1 1 1 0;
    1 0 0 0 1;
    0 1 1 1 0];

a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 8];

A = [0 1 1 1 0;
    1 0 0 0 1;
    0 1 1 1 1;
    0 0 0 0 1;
    0 1 1 1 0];

a = A(:)';
in_data_train = [in_data_train; a];
out_data_train = [out_data_train; 9];
range = [-10 10];liczba_n_h1=5;liczba_n_h2=6;liczba_n_o=1;
NN_model=newff([range;range;range;range;range;range;range;range;range; ...
    range;range;range;range;range;range;range;range;range;range;range; ...
    range;range;range;range;range;] ...
    ,[liczba_n_h1 liczba_n_o],{'tansig','purelin'}, 'trainlm');
NN_model.trainParam.epochs=150;

view(NN_model);
NN_model_t=train(NN_model, in_data_train',out_data_train');
in_data_test=in_data_train;
out_data_test=out_data_train;

y_nn=sim(NN_model_t, in_data_test');

figure(1)
bar3h([out_data_test,y_nn']);legend('ref','nn_o_u_t')
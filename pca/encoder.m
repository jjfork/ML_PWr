close all
clear all
clc

x=-10:0.1:10;
y=sin(x);

hiddenSize=35;

autoenc=trainAutoencoder(y,hiddenSize,'EncoderTransferFunction','logsig', ...
    'DecoderTransferFunction','purelin','MaxEpochs',200);

a=0;
yt=y+(a*rand*(size(y)));
ye=predict(autoenc,yt);

figure(5)
plot(ye,'r');grid;hold;plot(yt,'b');legend

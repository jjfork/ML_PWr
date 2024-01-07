close all
clear all
clc

x=-10:0.1:10;
y=sin(x);

for hiddenSize = [10, 20, 30, 40, 50]
  for maxEpochs = [50, 100, 150, 200, 250]
     autoenc=trainAutoencoder(y,hiddenSize, ...
         'EncoderTransferFunction','logsig', ...
        'DecoderTransferFunction','purelin', ...
        'MaxEpochs',maxEpochs);
     
     a=0.1;
     yt=y+(a*rand(size(y,1),1));
     
    ye=predict(autoenc,yt);

    reconstructionError = sum((ye-y).^2);

    fprintf('Hidden Layer Size: %d, Number of Epochs: %d, Reconstruction Error: %.2f, EncoderFunction: logsig, DecoderFunction: purelin\n', hiddenSize, maxEpochs, reconstructionError);

    figure;
    plot(ye,'r');grid;hold;plot(yt,'b');legend('Original Data','Reconstructed Data');
    title(['Hidden Layer Size: ', num2str(hiddenSize), ', Number of Epochs: ', num2str(maxEpochs), ' Recontruction Error: ', num2str(reconstructionError)]);
    subtitle('EncoderFunction: logsig, DecoderFunction: purelin')
  end
end

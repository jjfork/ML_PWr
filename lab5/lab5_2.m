clear all
close all
clc

x1 = rand(300, 2) * 10;
x2 = x1 + 100;
X = [x1; x2];

figure(1);grid on; hold on;box;
xlabel('coordinate x_1');
ylabel('coordinate x_2');
title('data')

for i = 1:size(X, 1)
    plot(X(i,1),X(i,2),'*')
end

k = 100;
[idx, C] = kmeans(X, k);
cluster_num = idx;
center_coordinate = C;



for i = 1:size(C, 1)
    figure(2)
    plot(C(i,1),C(i,2),'*')
    figure(3)
    image(C)
end

%%TO NIE DZIALA JESZCZE JAK COS
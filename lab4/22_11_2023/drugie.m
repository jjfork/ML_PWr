num_elements = 50;
x = linspace(0,num_elements,50);

a1 = 0.1;
a2 = 0.4;

b1 = 5;
b2 = 8;

y1 = a1 * x + b1;
y2 = a2 * x + b2;
y_sin = sin(x);

plot(x, y1, 'k'); grid on; hold on;
plot(x, y2, 'k'); hold on;
plot(x, y_sin);


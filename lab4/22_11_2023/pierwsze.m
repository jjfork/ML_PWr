
x = linspace(0, 200, 201)

% Define the two linear functions
y1 = 2*x + 3;
y2 = -x + 5;

% Relocate the two linear functions by one sample
y1_shifted = circshift(y1, 1);
y2_shifted = circshift(y2, 1);

% Define the sinusoidal function
y3 = sin(x/10);

% Plot the three functions in the same graph
figure
plot(x, y1, 'r', x, y2, 'g', x, y3, 'b')
hold on
legend('y1 shifted', 'y2 shifted', 'y3 = sin(x/10)')
xlabel('Number of samples')
ylabel('y')
title('Plot of three functions')
grid on

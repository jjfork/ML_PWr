clear all
close all
clc

num_elements=50;
a=-2;
b=5;
c=7;
x=1:1:num_elements;
y=a*x+b*randn(1,num_elements);
y=y+c;

Y=y';
X=x';

X=[ones(size(X)) X];

A=randn(2,1);
alfa=0.00001;
num_iteration=30;

for i=1:1:num_iteration

predictions = X * A;

errors = predictions - Y;


gradient = X' * errors;

% Update parameters using gradient descent
A = A - alfa * gradient;

% Calculate the cost (mean squared error)
cost = sum(errors.^2) / (2 * num_elements);

% Display the current iteration and cost
fprintf('Iteration %d: Cost = %.4f\n', i, cost);
end

% Display the final linear regression parameters
fprintf('Final Parameters (a, b): %.4f, %.4f\n', A(2), A(1));

figure(1)

plot(x, y, 'o');grid on;hold on;
xlabel('x');
ylabel('y');


% Narysuj prostą regresji na wykresie
x_range = min(x):0.1:max(x);
y_regression = A(2) * x_range + A(1);
plot(x_range, y_regression, 'r', 'LineWidth', 2);

grid on;
xlabel('x');
ylabel('y');
legend('Dane', 'Prosta regresji');
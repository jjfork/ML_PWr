% Create an instance of PSOClass with parameters a, b, c
pso = PSOClass(1, 2, 3);

% Run the PSO algorithm with minimum and maximum values for the variables
[x, fval] = pso.runPSO(2, 10);

% Plot the results
pso.plotResults(x, fval, 'x', 'y');

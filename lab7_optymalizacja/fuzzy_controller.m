clc;
close all;

tm = 0.2;
te = 0.005;
ts = 0.0001;

ki = 18.3255;
kp = 8.2530;

load_system('simulink_silnik_fuzzy_controller.slx');
simOut = sim('simulink_silnik_fuzzy_controller.slx');

x = [ki kp];


f_error_func(x)

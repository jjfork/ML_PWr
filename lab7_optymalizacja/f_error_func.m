function z=f_error_func(x)

global kp ki

kp=x(1);
ki=x(2);
sim("simulink_silnik_fuzzy_controller.slx");

z = 0.5*(sum(e.^2));
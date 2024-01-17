function z=f_error_func_v2(x)

global kp ki

kp=x(1);
ki=x(2);
sim("simulink_silnik_fuzzy_controller.slx");

q1=1;q2=2000;
z = (q1*mse(e(1:2500)))+(q2*mse(e(3600:4000)));
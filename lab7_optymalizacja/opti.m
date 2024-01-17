

global kp ki

tm = 0.2;
te = 0.005;
ts = 0.001;

opt=optimoptions('ga','PlotFcn',@gaplotbestf);
opt.MaxGenerations=10
opt.PopulationSize=20
[wartosc_wyznaczona, wartosc_f]=ga(@f_error_func_v2,2,[],[],[],[],[0.01 0.0001],[200 20],[],opt);
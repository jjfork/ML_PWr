clc 
clear all
close all
warning off

global kp ki

opt=optimoptions('ga','PlotFcn',@gaplotbestf);
opt.MaxGenerations=5
opt.PopulationSize=10
[wartosc_wyznaczona, wartosc_f]=ga(@f_error_func,2,[],[],[],[],[1 1],[100 100],[],opt);
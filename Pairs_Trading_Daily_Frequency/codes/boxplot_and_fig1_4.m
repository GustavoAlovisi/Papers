clear all; close all; clc;

addpath('C:\Users\fsabino\Documents\MATLAB\matlab2tikz')

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c1_005cc = ds_vw_cc;
abs_mix_d0p5c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c1_010cc = ds_vw_cc;
abs_mix_d0p5c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c1_015cc = ds_vw_cc;
abs_mix_d0p5c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c1_020cc = ds_vw_cc;
abs_mix_d0p5c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c1_025cc = ds_vw_cc;
abs_mix_d0p5c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c1_030cc = ds_vw_cc;
abs_mix_d0p5c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c1_035cc = ds_vw_cc;
abs_mix_d0p5c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c1_040cc = ds_vw_cc;
abs_mix_d0p5c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c1_045cc = ds_vw_cc;
abs_mix_d0p5c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c1_050cc = ds_vw_cc;
abs_mix_d0p5c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c1_055cc = ds_vw_cc;
abs_mix_d0p5c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c2_005cc = ds_vw_cc;
abs_mix_d0p5c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c2_010cc = ds_vw_cc;
abs_mix_d0p5c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c2_015cc = ds_vw_cc;
abs_mix_d0p5c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c2_020cc = ds_vw_cc;
abs_mix_d0p5c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c2_025cc = ds_vw_cc;
abs_mix_d0p5c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c2_030cc = ds_vw_cc;
abs_mix_d0p5c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c2_035cc = ds_vw_cc;
abs_mix_d0p5c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c2_040cc = ds_vw_cc;
abs_mix_d0p5c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c2_045cc = ds_vw_cc;
abs_mix_d0p5c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c2_050cc = ds_vw_cc;
abs_mix_d0p5c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p5c2_055cc = ds_vw_cc;
abs_mix_d0p5c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c1_005cc = ds_vw_cc;
abs_mix_d0p10c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c1_010cc = ds_vw_cc;
abs_mix_d0p10c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c1_015cc = ds_vw_cc;
abs_mix_d0p10c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c1_020cc = ds_vw_cc;
abs_mix_d0p10c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c1_025cc = ds_vw_cc;
abs_mix_d0p10c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c1_030cc = ds_vw_cc;
abs_mix_d0p10c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c1_035cc = ds_vw_cc;
abs_mix_d0p10c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c1_040cc = ds_vw_cc;
abs_mix_d0p10c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c1_045cc = ds_vw_cc;
abs_mix_d0p10c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c1_050cc = ds_vw_cc;
abs_mix_d0p10c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c1_055cc = ds_vw_cc;
abs_mix_d0p10c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c2_005cc = ds_vw_cc;
abs_mix_d0p10c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c2_010cc = ds_vw_cc;
abs_mix_d0p10c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c2_015cc = ds_vw_cc;
abs_mix_d0p10c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c2_020cc = ds_vw_cc;
abs_mix_d0p10c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c2_025cc = ds_vw_cc;
abs_mix_d0p10c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c2_030cc = ds_vw_cc;
abs_mix_d0p10c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c2_035cc = ds_vw_cc;
abs_mix_d0p10c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c2_040cc = ds_vw_cc;
abs_mix_d0p10c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c2_045cc = ds_vw_cc;
abs_mix_d0p10c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c2_050cc = ds_vw_cc;
abs_mix_d0p10c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p10c2_055cc = ds_vw_cc;
abs_mix_d0p10c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c1_005cc = ds_vw_cc;
abs_mix_d0p15c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c1_010cc = ds_vw_cc;
abs_mix_d0p15c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c1_015cc = ds_vw_cc;
abs_mix_d0p15c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c1_020cc = ds_vw_cc;
abs_mix_d0p15c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c1_025cc = ds_vw_cc;
abs_mix_d0p15c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c1_030cc = ds_vw_cc;
abs_mix_d0p15c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c1_035cc = ds_vw_cc;
abs_mix_d0p15c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c1_040cc = ds_vw_cc;
abs_mix_d0p15c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c1_045cc = ds_vw_cc;
abs_mix_d0p15c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c1_050cc = ds_vw_cc;
abs_mix_d0p15c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c1_055cc = ds_vw_cc;
abs_mix_d0p15c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c2_005cc = ds_vw_cc;
abs_mix_d0p15c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c2_010cc = ds_vw_cc;
abs_mix_d0p15c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c2_015cc = ds_vw_cc;
abs_mix_d0p15c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c2_020cc = ds_vw_cc;
abs_mix_d0p15c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c2_025cc = ds_vw_cc;
abs_mix_d0p15c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c2_030cc = ds_vw_cc;
abs_mix_d0p15c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c2_035cc = ds_vw_cc;
abs_mix_d0p15c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c2_040cc = ds_vw_cc;
abs_mix_d0p15c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c2_045cc = ds_vw_cc;
abs_mix_d0p15c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c2_050cc = ds_vw_cc;
abs_mix_d0p15c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p15c2_055cc = ds_vw_cc;
abs_mix_d0p15c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c1_005cc = ds_vw_cc;
abs_mix_d0p20c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c1_010cc = ds_vw_cc;
abs_mix_d0p20c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c1_015cc = ds_vw_cc;
abs_mix_d0p20c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c1_020cc = ds_vw_cc;
abs_mix_d0p20c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c1_025cc = ds_vw_cc;
abs_mix_d0p20c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c1_030cc = ds_vw_cc;
abs_mix_d0p20c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c1_035cc = ds_vw_cc;
abs_mix_d0p20c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c1_040cc = ds_vw_cc;
abs_mix_d0p20c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c1_045cc = ds_vw_cc;
abs_mix_d0p20c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c1_050cc = ds_vw_cc;
abs_mix_d0p20c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c1_055cc = ds_vw_cc;
abs_mix_d0p20c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c2_005cc = ds_vw_cc;
abs_mix_d0p20c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c2_010cc = ds_vw_cc;
abs_mix_d0p20c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c2_015cc = ds_vw_cc;
abs_mix_d0p20c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c2_020cc = ds_vw_cc;
abs_mix_d0p20c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c2_025cc = ds_vw_cc;
abs_mix_d0p20c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c2_030cc = ds_vw_cc;
abs_mix_d0p20c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c2_035cc = ds_vw_cc;
abs_mix_d0p20c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c2_040cc = ds_vw_cc;
abs_mix_d0p20c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c2_045cc = ds_vw_cc;
abs_mix_d0p20c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c2_050cc = ds_vw_cc;
abs_mix_d0p20c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p20c2_055cc = ds_vw_cc;
abs_mix_d0p20c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c1_005cc = ds_vw_cc;
abs_mix_d0p25c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c1_010cc = ds_vw_cc;
abs_mix_d0p25c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c1_015cc = ds_vw_cc;
abs_mix_d0p25c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c1_020cc = ds_vw_cc;
abs_mix_d0p25c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c1_025cc = ds_vw_cc;
abs_mix_d0p25c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c1_030cc = ds_vw_cc;
abs_mix_d0p25c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c1_035cc = ds_vw_cc;
abs_mix_d0p25c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c1_040cc = ds_vw_cc;
abs_mix_d0p25c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c1_045cc = ds_vw_cc;
abs_mix_d0p25c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c1_050cc = ds_vw_cc;
abs_mix_d0p25c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c1_055cc = ds_vw_cc;
abs_mix_d0p25c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c2_005cc = ds_vw_cc;
abs_mix_d0p25c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c2_010cc = ds_vw_cc;
abs_mix_d0p25c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c2_015cc = ds_vw_cc;
abs_mix_d0p25c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c2_020cc = ds_vw_cc;
abs_mix_d0p25c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c2_025cc = ds_vw_cc;
abs_mix_d0p25c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c2_030cc = ds_vw_cc;
abs_mix_d0p25c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c2_035cc = ds_vw_cc;
abs_mix_d0p25c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c2_040cc = ds_vw_cc;
abs_mix_d0p25c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c2_045cc = ds_vw_cc;
abs_mix_d0p25c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c2_050cc = ds_vw_cc;
abs_mix_d0p25c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p25c2_055cc = ds_vw_cc;
abs_mix_d0p25c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c1_005cc = ds_vw_cc;
abs_mix_d0p30c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c1_010cc = ds_vw_cc;
abs_mix_d0p30c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c1_015cc = ds_vw_cc;
abs_mix_d0p30c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c1_020cc = ds_vw_cc;
abs_mix_d0p30c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c1_025cc = ds_vw_cc;
abs_mix_d0p30c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c1_030cc = ds_vw_cc;
abs_mix_d0p30c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c1_035cc = ds_vw_cc;
abs_mix_d0p30c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c1_040cc = ds_vw_cc;
abs_mix_d0p30c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c1_045cc = ds_vw_cc;
abs_mix_d0p30c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c1_050cc = ds_vw_cc;
abs_mix_d0p30c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c1_055cc = ds_vw_cc;
abs_mix_d0p30c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c2_005cc = ds_vw_cc;
abs_mix_d0p30c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c2_010cc = ds_vw_cc;
abs_mix_d0p30c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c2_015cc = ds_vw_cc;
abs_mix_d0p30c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c2_020cc = ds_vw_cc;
abs_mix_d0p30c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c2_025cc = ds_vw_cc;
abs_mix_d0p30c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c2_030cc = ds_vw_cc;
abs_mix_d0p30c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c2_035cc = ds_vw_cc;
abs_mix_d0p30c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c2_040cc = ds_vw_cc;
abs_mix_d0p30c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c2_045cc = ds_vw_cc;
abs_mix_d0p30c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c2_050cc = ds_vw_cc;
abs_mix_d0p30c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p30c2_055cc = ds_vw_cc;
abs_mix_d0p30c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c1_005cc = ds_vw_cc;
abs_mix_d0p35c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c1_010cc = ds_vw_cc;
abs_mix_d0p35c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c1_015cc = ds_vw_cc;
abs_mix_d0p35c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c1_020cc = ds_vw_cc;
abs_mix_d0p35c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c1_025cc = ds_vw_cc;
abs_mix_d0p35c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c1_030cc = ds_vw_cc;
abs_mix_d0p35c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c1_035cc = ds_vw_cc;
abs_mix_d0p35c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c1_040cc = ds_vw_cc;
abs_mix_d0p35c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c1_045cc = ds_vw_cc;
abs_mix_d0p35c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c1_050cc = ds_vw_cc;
abs_mix_d0p35c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c1_055cc = ds_vw_cc;
abs_mix_d0p35c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c2_005cc = ds_vw_cc;
abs_mix_d0p35c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c2_010cc = ds_vw_cc;
abs_mix_d0p35c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c2_015cc = ds_vw_cc;
abs_mix_d0p35c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c2_020cc = ds_vw_cc;
abs_mix_d0p35c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c2_025cc = ds_vw_cc;
abs_mix_d0p35c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c2_030cc = ds_vw_cc;
abs_mix_d0p35c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c2_035cc = ds_vw_cc;
abs_mix_d0p35c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c2_040cc = ds_vw_cc;
abs_mix_d0p35c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c2_045cc = ds_vw_cc;
abs_mix_d0p35c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c2_050cc = ds_vw_cc;
abs_mix_d0p35c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_mix_d0p35c2_055cc = ds_vw_cc;
abs_mix_d0p35c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c1_005cc = ds_vw_cc;
sq_mix_d0p5c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c1_010cc = ds_vw_cc;
sq_mix_d0p5c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c1_015cc = ds_vw_cc;
sq_mix_d0p5c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c1_020cc = ds_vw_cc;
sq_mix_d0p5c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c1_025cc = ds_vw_cc;
sq_mix_d0p5c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c1_030cc = ds_vw_cc;
sq_mix_d0p5c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c1_035cc = ds_vw_cc;
sq_mix_d0p5c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c1_040cc = ds_vw_cc;
sq_mix_d0p5c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c1_045cc = ds_vw_cc;
sq_mix_d0p5c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c1_050cc = ds_vw_cc;
sq_mix_d0p5c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c1_055cc = ds_vw_cc;
sq_mix_d0p5c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c2_005cc = ds_vw_cc;
sq_mix_d0p5c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c2_010cc = ds_vw_cc;
sq_mix_d0p5c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c2_015cc = ds_vw_cc;
sq_mix_d0p5c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c2_020cc = ds_vw_cc;
sq_mix_d0p5c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c2_025cc = ds_vw_cc;
sq_mix_d0p5c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c2_030cc = ds_vw_cc;
sq_mix_d0p5c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c2_035cc = ds_vw_cc;
sq_mix_d0p5c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c2_040cc = ds_vw_cc;
sq_mix_d0p5c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c2_045cc = ds_vw_cc;
sq_mix_d0p5c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c2_050cc = ds_vw_cc;
sq_mix_d0p5c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p5c2_055cc = ds_vw_cc;
sq_mix_d0p5c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c1_005cc = ds_vw_cc;
sq_mix_d0p10c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c1_010cc = ds_vw_cc;
sq_mix_d0p10c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c1_015cc = ds_vw_cc;
sq_mix_d0p10c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c1_020cc = ds_vw_cc;
sq_mix_d0p10c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c1_025cc = ds_vw_cc;
sq_mix_d0p10c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c1_030cc = ds_vw_cc;
sq_mix_d0p10c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c1_035cc = ds_vw_cc;
sq_mix_d0p10c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c1_040cc = ds_vw_cc;
sq_mix_d0p10c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c1_045cc = ds_vw_cc;
sq_mix_d0p10c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c1_050cc = ds_vw_cc;
sq_mix_d0p10c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c1_055cc = ds_vw_cc;
sq_mix_d0p10c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c2_005cc = ds_vw_cc;
sq_mix_d0p10c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c2_010cc = ds_vw_cc;
sq_mix_d0p10c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c2_015cc = ds_vw_cc;
sq_mix_d0p10c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c2_020cc = ds_vw_cc;
sq_mix_d0p10c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c2_025cc = ds_vw_cc;
sq_mix_d0p10c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c2_030cc = ds_vw_cc;
sq_mix_d0p10c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c2_035cc = ds_vw_cc;
sq_mix_d0p10c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c2_040cc = ds_vw_cc;
sq_mix_d0p10c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c2_045cc = ds_vw_cc;
sq_mix_d0p10c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c2_050cc = ds_vw_cc;
sq_mix_d0p10c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p10c2_055cc = ds_vw_cc;
sq_mix_d0p10c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c1_005cc = ds_vw_cc;
sq_mix_d0p15c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c1_010cc = ds_vw_cc;
sq_mix_d0p15c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c1_015cc = ds_vw_cc;
sq_mix_d0p15c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c1_020cc = ds_vw_cc;
sq_mix_d0p15c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c1_025cc = ds_vw_cc;
sq_mix_d0p15c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c1_030cc = ds_vw_cc;
sq_mix_d0p15c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c1_035cc = ds_vw_cc;
sq_mix_d0p15c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c1_040cc = ds_vw_cc;
sq_mix_d0p15c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c1_045cc = ds_vw_cc;
sq_mix_d0p15c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c1_050cc = ds_vw_cc;
sq_mix_d0p15c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c1_055cc = ds_vw_cc;
sq_mix_d0p15c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c2_005cc = ds_vw_cc;
sq_mix_d0p15c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c2_010cc = ds_vw_cc;
sq_mix_d0p15c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c2_015cc = ds_vw_cc;
sq_mix_d0p15c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c2_020cc = ds_vw_cc;
sq_mix_d0p15c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c2_025cc = ds_vw_cc;
sq_mix_d0p15c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c2_030cc = ds_vw_cc;
sq_mix_d0p15c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c2_035cc = ds_vw_cc;
sq_mix_d0p15c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c2_040cc = ds_vw_cc;
sq_mix_d0p15c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c2_045cc = ds_vw_cc;
sq_mix_d0p15c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c2_050cc = ds_vw_cc;
sq_mix_d0p15c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p15c2_055cc = ds_vw_cc;
sq_mix_d0p15c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c1_005cc = ds_vw_cc;
sq_mix_d0p20c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c1_010cc = ds_vw_cc;
sq_mix_d0p20c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c1_015cc = ds_vw_cc;
sq_mix_d0p20c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c1_020cc = ds_vw_cc;
sq_mix_d0p20c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c1_025cc = ds_vw_cc;
sq_mix_d0p20c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c1_030cc = ds_vw_cc;
sq_mix_d0p20c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c1_035cc = ds_vw_cc;
sq_mix_d0p20c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c1_040cc = ds_vw_cc;
sq_mix_d0p20c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c1_045cc = ds_vw_cc;
sq_mix_d0p20c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c1_050cc = ds_vw_cc;
sq_mix_d0p20c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c1_055cc = ds_vw_cc;
sq_mix_d0p20c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c2_005cc = ds_vw_cc;
sq_mix_d0p20c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c2_010cc = ds_vw_cc;
sq_mix_d0p20c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c2_015cc = ds_vw_cc;
sq_mix_d0p20c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c2_020cc = ds_vw_cc;
sq_mix_d0p20c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c2_025cc = ds_vw_cc;
sq_mix_d0p20c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c2_030cc = ds_vw_cc;
sq_mix_d0p20c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c2_035cc = ds_vw_cc;
sq_mix_d0p20c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c2_040cc = ds_vw_cc;
sq_mix_d0p20c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c2_045cc = ds_vw_cc;
sq_mix_d0p20c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c2_050cc = ds_vw_cc;
sq_mix_d0p20c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p20c2_055cc = ds_vw_cc;
sq_mix_d0p20c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c1_005cc = ds_vw_cc;
sq_mix_d0p25c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c1_010cc = ds_vw_cc;
sq_mix_d0p25c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c1_015cc = ds_vw_cc;
sq_mix_d0p25c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c1_020cc = ds_vw_cc;
sq_mix_d0p25c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c1_025cc = ds_vw_cc;
sq_mix_d0p25c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c1_030cc = ds_vw_cc;
sq_mix_d0p25c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c1_035cc = ds_vw_cc;
sq_mix_d0p25c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c1_040cc = ds_vw_cc;
sq_mix_d0p25c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c1_045cc = ds_vw_cc;
sq_mix_d0p25c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c1_050cc = ds_vw_cc;
sq_mix_d0p25c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c1_055cc = ds_vw_cc;
sq_mix_d0p25c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c2_005cc = ds_vw_cc;
sq_mix_d0p25c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c2_010cc = ds_vw_cc;
sq_mix_d0p25c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c2_015cc = ds_vw_cc;
sq_mix_d0p25c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c2_020cc = ds_vw_cc;
sq_mix_d0p25c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c2_025cc = ds_vw_cc;
sq_mix_d0p25c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c2_030cc = ds_vw_cc;
sq_mix_d0p25c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c2_035cc = ds_vw_cc;
sq_mix_d0p25c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c2_040cc = ds_vw_cc;
sq_mix_d0p25c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c2_045cc = ds_vw_cc;
sq_mix_d0p25c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c2_050cc = ds_vw_cc;
sq_mix_d0p25c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p25c2_055cc = ds_vw_cc;
sq_mix_d0p25c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c1_005cc = ds_vw_cc;
sq_mix_d0p30c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c1_010cc = ds_vw_cc;
sq_mix_d0p30c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c1_015cc = ds_vw_cc;
sq_mix_d0p30c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c1_020cc = ds_vw_cc;
sq_mix_d0p30c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c1_025cc = ds_vw_cc;
sq_mix_d0p30c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c1_030cc = ds_vw_cc;
sq_mix_d0p30c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c1_035cc = ds_vw_cc;
sq_mix_d0p30c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c1_040cc = ds_vw_cc;
sq_mix_d0p30c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c1_045cc = ds_vw_cc;
sq_mix_d0p30c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c1_050cc = ds_vw_cc;
sq_mix_d0p30c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c1_055cc = ds_vw_cc;
sq_mix_d0p30c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c2_005cc = ds_vw_cc;
sq_mix_d0p30c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c2_010cc = ds_vw_cc;
sq_mix_d0p30c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c2_015cc = ds_vw_cc;
sq_mix_d0p30c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c2_020cc = ds_vw_cc;
sq_mix_d0p30c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c2_025cc = ds_vw_cc;
sq_mix_d0p30c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c2_030cc = ds_vw_cc;
sq_mix_d0p30c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c2_035cc = ds_vw_cc;
sq_mix_d0p30c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c2_040cc = ds_vw_cc;
sq_mix_d0p30c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c2_045cc = ds_vw_cc;
sq_mix_d0p30c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c2_050cc = ds_vw_cc;
sq_mix_d0p30c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p30c2_055cc = ds_vw_cc;
sq_mix_d0p30c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c1_005cc = ds_vw_cc;
sq_mix_d0p35c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c1_010cc = ds_vw_cc;
sq_mix_d0p35c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c1_015cc = ds_vw_cc;
sq_mix_d0p35c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c1_020cc = ds_vw_cc;
sq_mix_d0p35c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c1_025cc = ds_vw_cc;
sq_mix_d0p35c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c1_030cc = ds_vw_cc;
sq_mix_d0p35c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c1_035cc = ds_vw_cc;
sq_mix_d0p35c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c1_040cc = ds_vw_cc;
sq_mix_d0p35c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c1_045cc = ds_vw_cc;
sq_mix_d0p35c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c1_050cc = ds_vw_cc;
sq_mix_d0p35c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c1_055cc = ds_vw_cc;
sq_mix_d0p35c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c2_005cc = ds_vw_cc;
sq_mix_d0p35c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c2_010cc = ds_vw_cc;
sq_mix_d0p35c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c2_015cc = ds_vw_cc;
sq_mix_d0p35c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c2_020cc = ds_vw_cc;
sq_mix_d0p35c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c2_025cc = ds_vw_cc;
sq_mix_d0p35c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c2_030cc = ds_vw_cc;
sq_mix_d0p35c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c2_035cc = ds_vw_cc;
sq_mix_d0p35c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c2_040cc = ds_vw_cc;
sq_mix_d0p35c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c2_045cc = ds_vw_cc;
sq_mix_d0p35c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c2_050cc = ds_vw_cc;
sq_mix_d0p35c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_mix_d0p35c2_055cc = ds_vw_cc;
sq_mix_d0p35c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c1_005cc = ds_vw_cc;
abs_nomix_d0p5c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c1_010cc = ds_vw_cc;
abs_nomix_d0p5c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c1_015cc = ds_vw_cc;
abs_nomix_d0p5c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c1_020cc = ds_vw_cc;
abs_nomix_d0p5c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c1_025cc = ds_vw_cc;
abs_nomix_d0p5c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c1_030cc = ds_vw_cc;
abs_nomix_d0p5c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c1_035cc = ds_vw_cc;
abs_nomix_d0p5c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c1_040cc = ds_vw_cc;
abs_nomix_d0p5c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c1_045cc = ds_vw_cc;
abs_nomix_d0p5c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c1_050cc = ds_vw_cc;
abs_nomix_d0p5c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c1_055cc = ds_vw_cc;
abs_nomix_d0p5c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c2_005cc = ds_vw_cc;
abs_nomix_d0p5c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c2_010cc = ds_vw_cc;
abs_nomix_d0p5c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c2_015cc = ds_vw_cc;
abs_nomix_d0p5c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c2_020cc = ds_vw_cc;
abs_nomix_d0p5c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c2_025cc = ds_vw_cc;
abs_nomix_d0p5c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c2_030cc = ds_vw_cc;
abs_nomix_d0p5c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c2_035cc = ds_vw_cc;
abs_nomix_d0p5c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c2_040cc = ds_vw_cc;
abs_nomix_d0p5c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c2_045cc = ds_vw_cc;
abs_nomix_d0p5c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c2_050cc = ds_vw_cc;
abs_nomix_d0p5c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p5c2_055cc = ds_vw_cc;
abs_nomix_d0p5c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c1_005cc = ds_vw_cc;
abs_nomix_d0p10c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c1_010cc = ds_vw_cc;
abs_nomix_d0p10c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c1_015cc = ds_vw_cc;
abs_nomix_d0p10c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c1_020cc = ds_vw_cc;
abs_nomix_d0p10c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c1_025cc = ds_vw_cc;
abs_nomix_d0p10c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c1_030cc = ds_vw_cc;
abs_nomix_d0p10c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c1_035cc = ds_vw_cc;
abs_nomix_d0p10c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c1_040cc = ds_vw_cc;
abs_nomix_d0p10c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c1_045cc = ds_vw_cc;
abs_nomix_d0p10c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c1_050cc = ds_vw_cc;
abs_nomix_d0p10c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c1_055cc = ds_vw_cc;
abs_nomix_d0p10c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c2_005cc = ds_vw_cc;
abs_nomix_d0p10c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c2_010cc = ds_vw_cc;
abs_nomix_d0p10c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c2_015cc = ds_vw_cc;
abs_nomix_d0p10c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c2_020cc = ds_vw_cc;
abs_nomix_d0p10c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c2_025cc = ds_vw_cc;
abs_nomix_d0p10c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c2_030cc = ds_vw_cc;
abs_nomix_d0p10c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c2_035cc = ds_vw_cc;
abs_nomix_d0p10c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c2_040cc = ds_vw_cc;
abs_nomix_d0p10c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c2_045cc = ds_vw_cc;
abs_nomix_d0p10c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c2_050cc = ds_vw_cc;
abs_nomix_d0p10c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p10c2_055cc = ds_vw_cc;
abs_nomix_d0p10c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c1_005cc = ds_vw_cc;
abs_nomix_d0p15c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c1_010cc = ds_vw_cc;
abs_nomix_d0p15c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c1_015cc = ds_vw_cc;
abs_nomix_d0p15c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c1_020cc = ds_vw_cc;
abs_nomix_d0p15c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c1_025cc = ds_vw_cc;
abs_nomix_d0p15c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c1_030cc = ds_vw_cc;
abs_nomix_d0p15c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c1_035cc = ds_vw_cc;
abs_nomix_d0p15c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c1_040cc = ds_vw_cc;
abs_nomix_d0p15c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c1_045cc = ds_vw_cc;
abs_nomix_d0p15c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c1_050cc = ds_vw_cc;
abs_nomix_d0p15c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c1_055cc = ds_vw_cc;
abs_nomix_d0p15c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c2_005cc = ds_vw_cc;
abs_nomix_d0p15c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c2_010cc = ds_vw_cc;
abs_nomix_d0p15c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c2_015cc = ds_vw_cc;
abs_nomix_d0p15c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c2_020cc = ds_vw_cc;
abs_nomix_d0p15c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c2_025cc = ds_vw_cc;
abs_nomix_d0p15c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c2_030cc = ds_vw_cc;
abs_nomix_d0p15c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c2_035cc = ds_vw_cc;
abs_nomix_d0p15c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c2_040cc = ds_vw_cc;
abs_nomix_d0p15c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c2_045cc = ds_vw_cc;
abs_nomix_d0p15c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c2_050cc = ds_vw_cc;
abs_nomix_d0p15c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p15c2_055cc = ds_vw_cc;
abs_nomix_d0p15c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c1_005cc = ds_vw_cc;
abs_nomix_d0p20c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c1_010cc = ds_vw_cc;
abs_nomix_d0p20c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c1_015cc = ds_vw_cc;
abs_nomix_d0p20c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c1_020cc = ds_vw_cc;
abs_nomix_d0p20c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c1_025cc = ds_vw_cc;
abs_nomix_d0p20c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c1_030cc = ds_vw_cc;
abs_nomix_d0p20c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c1_035cc = ds_vw_cc;
abs_nomix_d0p20c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c1_040cc = ds_vw_cc;
abs_nomix_d0p20c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c1_045cc = ds_vw_cc;
abs_nomix_d0p20c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c1_050cc = ds_vw_cc;
abs_nomix_d0p20c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c1_055cc = ds_vw_cc;
abs_nomix_d0p20c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c2_005cc = ds_vw_cc;
abs_nomix_d0p20c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c2_010cc = ds_vw_cc;
abs_nomix_d0p20c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c2_015cc = ds_vw_cc;
abs_nomix_d0p20c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c2_020cc = ds_vw_cc;
abs_nomix_d0p20c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c2_025cc = ds_vw_cc;
abs_nomix_d0p20c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c2_030cc = ds_vw_cc;
abs_nomix_d0p20c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c2_035cc = ds_vw_cc;
abs_nomix_d0p20c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c2_040cc = ds_vw_cc;
abs_nomix_d0p20c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c2_045cc = ds_vw_cc;
abs_nomix_d0p20c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c2_050cc = ds_vw_cc;
abs_nomix_d0p20c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p20c2_055cc = ds_vw_cc;
abs_nomix_d0p20c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c1_005cc = ds_vw_cc;
abs_nomix_d0p25c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c1_010cc = ds_vw_cc;
abs_nomix_d0p25c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c1_015cc = ds_vw_cc;
abs_nomix_d0p25c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c1_020cc = ds_vw_cc;
abs_nomix_d0p25c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c1_025cc = ds_vw_cc;
abs_nomix_d0p25c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c1_030cc = ds_vw_cc;
abs_nomix_d0p25c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c1_035cc = ds_vw_cc;
abs_nomix_d0p25c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c1_040cc = ds_vw_cc;
abs_nomix_d0p25c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c1_045cc = ds_vw_cc;
abs_nomix_d0p25c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c1_050cc = ds_vw_cc;
abs_nomix_d0p25c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c1_055cc = ds_vw_cc;
abs_nomix_d0p25c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c2_005cc = ds_vw_cc;
abs_nomix_d0p25c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c2_010cc = ds_vw_cc;
abs_nomix_d0p25c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c2_015cc = ds_vw_cc;
abs_nomix_d0p25c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c2_020cc = ds_vw_cc;
abs_nomix_d0p25c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c2_025cc = ds_vw_cc;
abs_nomix_d0p25c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c2_030cc = ds_vw_cc;
abs_nomix_d0p25c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c2_035cc = ds_vw_cc;
abs_nomix_d0p25c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c2_040cc = ds_vw_cc;
abs_nomix_d0p25c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c2_045cc = ds_vw_cc;
abs_nomix_d0p25c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c2_050cc = ds_vw_cc;
abs_nomix_d0p25c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p25c2_055cc = ds_vw_cc;
abs_nomix_d0p25c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c1_005cc = ds_vw_cc;
abs_nomix_d0p30c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c1_010cc = ds_vw_cc;
abs_nomix_d0p30c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c1_015cc = ds_vw_cc;
abs_nomix_d0p30c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c1_020cc = ds_vw_cc;
abs_nomix_d0p30c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c1_025cc = ds_vw_cc;
abs_nomix_d0p30c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c1_030cc = ds_vw_cc;
abs_nomix_d0p30c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c1_035cc = ds_vw_cc;
abs_nomix_d0p30c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c1_040cc = ds_vw_cc;
abs_nomix_d0p30c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c1_045cc = ds_vw_cc;
abs_nomix_d0p30c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c1_050cc = ds_vw_cc;
abs_nomix_d0p30c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c1_055cc = ds_vw_cc;
abs_nomix_d0p30c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c2_005cc = ds_vw_cc;
abs_nomix_d0p30c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c2_010cc = ds_vw_cc;
abs_nomix_d0p30c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c2_015cc = ds_vw_cc;
abs_nomix_d0p30c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c2_020cc = ds_vw_cc;
abs_nomix_d0p30c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c2_025cc = ds_vw_cc;
abs_nomix_d0p30c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c2_030cc = ds_vw_cc;
abs_nomix_d0p30c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c2_035cc = ds_vw_cc;
abs_nomix_d0p30c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c2_040cc = ds_vw_cc;
abs_nomix_d0p30c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c2_045cc = ds_vw_cc;
abs_nomix_d0p30c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c2_050cc = ds_vw_cc;
abs_nomix_d0p30c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p30c2_055cc = ds_vw_cc;
abs_nomix_d0p30c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c1_005cc = ds_vw_cc;
abs_nomix_d0p35c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c1_010cc = ds_vw_cc;
abs_nomix_d0p35c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c1_015cc = ds_vw_cc;
abs_nomix_d0p35c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c1_020cc = ds_vw_cc;
abs_nomix_d0p35c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c1_025cc = ds_vw_cc;
abs_nomix_d0p35c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c1_030cc = ds_vw_cc;
abs_nomix_d0p35c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c1_035cc = ds_vw_cc;
abs_nomix_d0p35c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c1_040cc = ds_vw_cc;
abs_nomix_d0p35c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c1_045cc = ds_vw_cc;
abs_nomix_d0p35c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c1_050cc = ds_vw_cc;
abs_nomix_d0p35c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c1_055cc = ds_vw_cc;
abs_nomix_d0p35c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c2_005cc = ds_vw_cc;
abs_nomix_d0p35c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c2_010cc = ds_vw_cc;
abs_nomix_d0p35c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c2_015cc = ds_vw_cc;
abs_nomix_d0p35c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c2_020cc = ds_vw_cc;
abs_nomix_d0p35c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c2_025cc = ds_vw_cc;
abs_nomix_d0p35c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c2_030cc = ds_vw_cc;
abs_nomix_d0p35c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c2_035cc = ds_vw_cc;
abs_nomix_d0p35c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c2_040cc = ds_vw_cc;
abs_nomix_d0p35c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c2_045cc = ds_vw_cc;
abs_nomix_d0p35c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c2_050cc = ds_vw_cc;
abs_nomix_d0p35c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
abs_nomix_d0p35c2_055cc = ds_vw_cc;
abs_nomix_d0p35c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c1_005cc = ds_vw_cc;
sq_nomix_d0p5c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c1_010cc = ds_vw_cc;
sq_nomix_d0p5c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c1_015cc = ds_vw_cc;
sq_nomix_d0p5c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c1_020cc = ds_vw_cc;
sq_nomix_d0p5c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c1_025cc = ds_vw_cc;
sq_nomix_d0p5c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c1_030cc = ds_vw_cc;
sq_nomix_d0p5c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c1_035cc = ds_vw_cc;
sq_nomix_d0p5c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c1_040cc = ds_vw_cc;
sq_nomix_d0p5c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c1_045cc = ds_vw_cc;
sq_nomix_d0p5c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c1_050cc = ds_vw_cc;
sq_nomix_d0p5c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c1_055cc = ds_vw_cc;
sq_nomix_d0p5c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c2_005cc = ds_vw_cc;
sq_nomix_d0p5c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c2_010cc = ds_vw_cc;
sq_nomix_d0p5c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c2_015cc = ds_vw_cc;
sq_nomix_d0p5c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c2_020cc = ds_vw_cc;
sq_nomix_d0p5c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c2_025cc = ds_vw_cc;
sq_nomix_d0p5c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c2_030cc = ds_vw_cc;
sq_nomix_d0p5c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c2_035cc = ds_vw_cc;
sq_nomix_d0p5c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c2_040cc = ds_vw_cc;
sq_nomix_d0p5c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c2_045cc = ds_vw_cc;
sq_nomix_d0p5c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c2_050cc = ds_vw_cc;
sq_nomix_d0p5c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p5c2_055cc = ds_vw_cc;
sq_nomix_d0p5c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c1_005cc = ds_vw_cc;
sq_nomix_d0p10c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c1_010cc = ds_vw_cc;
sq_nomix_d0p10c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c1_015cc = ds_vw_cc;
sq_nomix_d0p10c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c1_020cc = ds_vw_cc;
sq_nomix_d0p10c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c1_025cc = ds_vw_cc;
sq_nomix_d0p10c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c1_030cc = ds_vw_cc;
sq_nomix_d0p10c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c1_035cc = ds_vw_cc;
sq_nomix_d0p10c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c1_040cc = ds_vw_cc;
sq_nomix_d0p10c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c1_045cc = ds_vw_cc;
sq_nomix_d0p10c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c1_050cc = ds_vw_cc;
sq_nomix_d0p10c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c1_055cc = ds_vw_cc;
sq_nomix_d0p10c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c2_005cc = ds_vw_cc;
sq_nomix_d0p10c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c2_010cc = ds_vw_cc;
sq_nomix_d0p10c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c2_015cc = ds_vw_cc;
sq_nomix_d0p10c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c2_020cc = ds_vw_cc;
sq_nomix_d0p10c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c2_025cc = ds_vw_cc;
sq_nomix_d0p10c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c2_030cc = ds_vw_cc;
sq_nomix_d0p10c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c2_035cc = ds_vw_cc;
sq_nomix_d0p10c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c2_040cc = ds_vw_cc;
sq_nomix_d0p10c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c2_045cc = ds_vw_cc;
sq_nomix_d0p10c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c2_050cc = ds_vw_cc;
sq_nomix_d0p10c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p10c2_055cc = ds_vw_cc;
sq_nomix_d0p10c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c1_005cc = ds_vw_cc;
sq_nomix_d0p15c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c1_010cc = ds_vw_cc;
sq_nomix_d0p15c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c1_015cc = ds_vw_cc;
sq_nomix_d0p15c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c1_020cc = ds_vw_cc;
sq_nomix_d0p15c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c1_025cc = ds_vw_cc;
sq_nomix_d0p15c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c1_030cc = ds_vw_cc;
sq_nomix_d0p15c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c1_035cc = ds_vw_cc;
sq_nomix_d0p15c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c1_040cc = ds_vw_cc;
sq_nomix_d0p15c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c1_045cc = ds_vw_cc;
sq_nomix_d0p15c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c1_050cc = ds_vw_cc;
sq_nomix_d0p15c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c1_055cc = ds_vw_cc;
sq_nomix_d0p15c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c2_005cc = ds_vw_cc;
sq_nomix_d0p15c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c2_010cc = ds_vw_cc;
sq_nomix_d0p15c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c2_015cc = ds_vw_cc;
sq_nomix_d0p15c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c2_020cc = ds_vw_cc;
sq_nomix_d0p15c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c2_025cc = ds_vw_cc;
sq_nomix_d0p15c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c2_030cc = ds_vw_cc;
sq_nomix_d0p15c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c2_035cc = ds_vw_cc;
sq_nomix_d0p15c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c2_040cc = ds_vw_cc;
sq_nomix_d0p15c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c2_045cc = ds_vw_cc;
sq_nomix_d0p15c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c2_050cc = ds_vw_cc;
sq_nomix_d0p15c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p15c2_055cc = ds_vw_cc;
sq_nomix_d0p15c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c1_005cc = ds_vw_cc;
sq_nomix_d0p20c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c1_010cc = ds_vw_cc;
sq_nomix_d0p20c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c1_015cc = ds_vw_cc;
sq_nomix_d0p20c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c1_020cc = ds_vw_cc;
sq_nomix_d0p20c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c1_025cc = ds_vw_cc;
sq_nomix_d0p20c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c1_030cc = ds_vw_cc;
sq_nomix_d0p20c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c1_035cc = ds_vw_cc;
sq_nomix_d0p20c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c1_040cc = ds_vw_cc;
sq_nomix_d0p20c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c1_045cc = ds_vw_cc;
sq_nomix_d0p20c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c1_050cc = ds_vw_cc;
sq_nomix_d0p20c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c1_055cc = ds_vw_cc;
sq_nomix_d0p20c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c2_005cc = ds_vw_cc;
sq_nomix_d0p20c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c2_010cc = ds_vw_cc;
sq_nomix_d0p20c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c2_015cc = ds_vw_cc;
sq_nomix_d0p20c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c2_020cc = ds_vw_cc;
sq_nomix_d0p20c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c2_025cc = ds_vw_cc;
sq_nomix_d0p20c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c2_030cc = ds_vw_cc;
sq_nomix_d0p20c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c2_035cc = ds_vw_cc;
sq_nomix_d0p20c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c2_040cc = ds_vw_cc;
sq_nomix_d0p20c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c2_045cc = ds_vw_cc;
sq_nomix_d0p20c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c2_050cc = ds_vw_cc;
sq_nomix_d0p20c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p20c2_055cc = ds_vw_cc;
sq_nomix_d0p20c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c1_005cc = ds_vw_cc;
sq_nomix_d0p25c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c1_010cc = ds_vw_cc;
sq_nomix_d0p25c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c1_015cc = ds_vw_cc;
sq_nomix_d0p25c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c1_020cc = ds_vw_cc;
sq_nomix_d0p25c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c1_025cc = ds_vw_cc;
sq_nomix_d0p25c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c1_030cc = ds_vw_cc;
sq_nomix_d0p25c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c1_035cc = ds_vw_cc;
sq_nomix_d0p25c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c1_040cc = ds_vw_cc;
sq_nomix_d0p25c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c1_045cc = ds_vw_cc;
sq_nomix_d0p25c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c1_050cc = ds_vw_cc;
sq_nomix_d0p25c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c1_055cc = ds_vw_cc;
sq_nomix_d0p25c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c2_005cc = ds_vw_cc;
sq_nomix_d0p25c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c2_010cc = ds_vw_cc;
sq_nomix_d0p25c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c2_015cc = ds_vw_cc;
sq_nomix_d0p25c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c2_020cc = ds_vw_cc;
sq_nomix_d0p25c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c2_025cc = ds_vw_cc;
sq_nomix_d0p25c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c2_030cc = ds_vw_cc;
sq_nomix_d0p25c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c2_035cc = ds_vw_cc;
sq_nomix_d0p25c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c2_040cc = ds_vw_cc;
sq_nomix_d0p25c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c2_045cc = ds_vw_cc;
sq_nomix_d0p25c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c2_050cc = ds_vw_cc;
sq_nomix_d0p25c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p25c2_055cc = ds_vw_cc;
sq_nomix_d0p25c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c1_005cc = ds_vw_cc;
sq_nomix_d0p30c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c1_010cc = ds_vw_cc;
sq_nomix_d0p30c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c1_015cc = ds_vw_cc;
sq_nomix_d0p30c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c1_020cc = ds_vw_cc;
sq_nomix_d0p30c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c1_025cc = ds_vw_cc;
sq_nomix_d0p30c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c1_030cc = ds_vw_cc;
sq_nomix_d0p30c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c1_035cc = ds_vw_cc;
sq_nomix_d0p30c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c1_040cc = ds_vw_cc;
sq_nomix_d0p30c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c1_045cc = ds_vw_cc;
sq_nomix_d0p30c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c1_050cc = ds_vw_cc;
sq_nomix_d0p30c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c1_055cc = ds_vw_cc;
sq_nomix_d0p30c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c2_005cc = ds_vw_cc;
sq_nomix_d0p30c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c2_010cc = ds_vw_cc;
sq_nomix_d0p30c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c2_015cc = ds_vw_cc;
sq_nomix_d0p30c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c2_020cc = ds_vw_cc;
sq_nomix_d0p30c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c2_025cc = ds_vw_cc;
sq_nomix_d0p30c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c2_030cc = ds_vw_cc;
sq_nomix_d0p30c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c2_035cc = ds_vw_cc;
sq_nomix_d0p30c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c2_040cc = ds_vw_cc;
sq_nomix_d0p30c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c2_045cc = ds_vw_cc;
sq_nomix_d0p30c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c2_050cc = ds_vw_cc;
sq_nomix_d0p30c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p30c2_055cc = ds_vw_cc;
sq_nomix_d0p30c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c1_005cc = ds_vw_cc;
sq_nomix_d0p35c1_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c1_010cc = ds_vw_cc;
sq_nomix_d0p35c1_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c1_015cc = ds_vw_cc;
sq_nomix_d0p35c1_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c1_020cc = ds_vw_cc;
sq_nomix_d0p35c1_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c1_025cc = ds_vw_cc;
sq_nomix_d0p35c1_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c1_030cc = ds_vw_cc;
sq_nomix_d0p35c1_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c1_035cc = ds_vw_cc;
sq_nomix_d0p35c1_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c1_040cc = ds_vw_cc;
sq_nomix_d0p35c1_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c1_045cc = ds_vw_cc;
sq_nomix_d0p35c1_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c1_050cc = ds_vw_cc;
sq_nomix_d0p35c1_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c1_055cc = ds_vw_cc;
sq_nomix_d0p35c1_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.05.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c2_005cc = ds_vw_cc;
sq_nomix_d0p35c2_005fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.10.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c2_010cc = ds_vw_cc;
sq_nomix_d0p35c2_010fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.15.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c2_015cc = ds_vw_cc;
sq_nomix_d0p35c2_015fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.20.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c2_020cc = ds_vw_cc;
sq_nomix_d0p35c2_020fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.25.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c2_025cc = ds_vw_cc;
sq_nomix_d0p35c2_025fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.30.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c2_030cc = ds_vw_cc;
sq_nomix_d0p35c2_030fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.35.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c2_035cc = ds_vw_cc;
sq_nomix_d0p35c2_035fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.40.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c2_040cc = ds_vw_cc;
sq_nomix_d0p35c2_040fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.45.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c2_045cc = ds_vw_cc;
sq_nomix_d0p35c2_045fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.50.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c2_050cc = ds_vw_cc;
sq_nomix_d0p35c2_050fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.55.mat','ds_vw_cc', 'ds_vw_fi');
sq_nomix_d0p35c2_055cc = ds_vw_cc;
sq_nomix_d0p35c2_055fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c1_sq0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c1_sq05cc = ds_vw_cc;
d0p5c1_sq05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c1_sq1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c1_sq10cc = ds_vw_cc;
d0p5c1_sq10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c1_sq1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c1_sq15cc = ds_vw_cc;
d0p5c1_sq15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c1_sq2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c1_sq20cc = ds_vw_cc;
d0p5c1_sq20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c1_sq2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c1_sq25cc = ds_vw_cc;
d0p5c1_sq25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c1_sq3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c1_sq30cc = ds_vw_cc;
d0p5c1_sq30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c2_sq0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c2_sq05cc = ds_vw_cc;
d0p5c2_sq05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c2_sq1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c2_sq10cc = ds_vw_cc;
d0p5c2_sq10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c2_sq1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c2_sq15cc = ds_vw_cc;
d0p5c2_sq15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c2_sq2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c2_sq20cc = ds_vw_cc;
d0p5c2_sq20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c2_sq2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c2_sq25cc = ds_vw_cc;
d0p5c2_sq25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c2_sq3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c2_sq30cc = ds_vw_cc;
d0p5c2_sq30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c1_sq0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c1_sq05cc = ds_vw_cc;
d0p10c1_sq05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c1_sq1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c1_sq10cc = ds_vw_cc;
d0p10c1_sq10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c1_sq1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c1_sq15cc = ds_vw_cc;
d0p10c1_sq15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c1_sq2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c1_sq20cc = ds_vw_cc;
d0p10c1_sq20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c1_sq2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c1_sq25cc = ds_vw_cc;
d0p10c1_sq25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c1_sq3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c1_sq30cc = ds_vw_cc;
d0p10c1_sq30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c2_sq0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c2_sq05cc = ds_vw_cc;
d0p10c2_sq05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c2_sq1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c2_sq10cc = ds_vw_cc;
d0p10c2_sq10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c2_sq1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c2_sq15cc = ds_vw_cc;
d0p10c2_sq15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c2_sq2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c2_sq20cc = ds_vw_cc;
d0p10c2_sq20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c2_sq2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c2_sq25cc = ds_vw_cc;
d0p10c2_sq25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c2_sq3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c2_sq30cc = ds_vw_cc;
d0p10c2_sq30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c1_sq0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c1_sq05cc = ds_vw_cc;
d0p15c1_sq05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c1_sq1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c1_sq10cc = ds_vw_cc;
d0p15c1_sq10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c1_sq1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c1_sq15cc = ds_vw_cc;
d0p15c1_sq15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c1_sq2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c1_sq20cc = ds_vw_cc;
d0p15c1_sq20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c1_sq2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c1_sq25cc = ds_vw_cc;
d0p15c1_sq25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c1_sq3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c1_sq30cc = ds_vw_cc;
d0p15c1_sq30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c2_sq0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c2_sq05cc = ds_vw_cc;
d0p15c2_sq05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c2_sq1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c2_sq10cc = ds_vw_cc;
d0p15c2_sq10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c2_sq1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c2_sq15cc = ds_vw_cc;
d0p15c2_sq15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c2_sq2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c2_sq20cc = ds_vw_cc;
d0p15c2_sq20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c2_sq2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c2_sq25cc = ds_vw_cc;
d0p15c2_sq25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c2_sq3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c2_sq30cc = ds_vw_cc;
d0p15c2_sq30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c1_sq0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c1_sq05cc = ds_vw_cc;
d0p20c1_sq05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c1_sq1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c1_sq10cc = ds_vw_cc;
d0p20c1_sq10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c1_sq1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c1_sq15cc = ds_vw_cc;
d0p20c1_sq15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c1_sq2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c1_sq20cc = ds_vw_cc;
d0p20c1_sq20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c1_sq2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c1_sq25cc = ds_vw_cc;
d0p20c1_sq25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c1_sq3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c1_sq30cc = ds_vw_cc;
d0p20c1_sq30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c2_sq0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c2_sq05cc = ds_vw_cc;
d0p20c2_sq05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c2_sq1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c2_sq10cc = ds_vw_cc;
d0p20c2_sq10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c2_sq1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c2_sq15cc = ds_vw_cc;
d0p20c2_sq15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c2_sq2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c2_sq20cc = ds_vw_cc;
d0p20c2_sq20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c2_sq2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c2_sq25cc = ds_vw_cc;
d0p20c2_sq25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c2_sq3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c2_sq30cc = ds_vw_cc;
d0p20c2_sq30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c1_sq0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c1_sq05cc = ds_vw_cc;
d0p25c1_sq05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c1_sq1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c1_sq10cc = ds_vw_cc;
d0p25c1_sq10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c1_sq1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c1_sq15cc = ds_vw_cc;
d0p25c1_sq15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c1_sq2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c1_sq20cc = ds_vw_cc;
d0p25c1_sq20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c1_sq2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c1_sq25cc = ds_vw_cc;
d0p25c1_sq25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c1_sq3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c1_sq30cc = ds_vw_cc;
d0p25c1_sq30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c2_sq0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c2_sq05cc = ds_vw_cc;
d0p25c2_sq05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c2_sq1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c2_sq10cc = ds_vw_cc;
d0p25c2_sq10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c2_sq1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c2_sq15cc = ds_vw_cc;
d0p25c2_sq15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c2_sq2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c2_sq20cc = ds_vw_cc;
d0p25c2_sq20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c2_sq2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c2_sq25cc = ds_vw_cc;
d0p25c2_sq25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c2_sq3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c2_sq30cc = ds_vw_cc;
d0p25c2_sq30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c1_sq0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c1_sq05cc = ds_vw_cc;
d0p30c1_sq05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c1_sq1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c1_sq10cc = ds_vw_cc;
d0p30c1_sq10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c1_sq1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c1_sq15cc = ds_vw_cc;
d0p30c1_sq15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c1_sq2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c1_sq20cc = ds_vw_cc;
d0p30c1_sq20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c1_sq2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c1_sq25cc = ds_vw_cc;
d0p30c1_sq25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c1_sq3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c1_sq30cc = ds_vw_cc;
d0p30c1_sq30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c2_sq0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c2_sq05cc = ds_vw_cc;
d0p30c2_sq05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c2_sq1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c2_sq10cc = ds_vw_cc;
d0p30c2_sq10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c2_sq1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c2_sq15cc = ds_vw_cc;
d0p30c2_sq15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c2_sq2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c2_sq20cc = ds_vw_cc;
d0p30c2_sq20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c2_sq2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c2_sq25cc = ds_vw_cc;
d0p30c2_sq25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c2_sq3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c2_sq30cc = ds_vw_cc;
d0p30c2_sq30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c1_sq0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c1_sq05cc = ds_vw_cc;
d0p35c1_sq05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c1_sq1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c1_sq10cc = ds_vw_cc;
d0p35c1_sq10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c1_sq1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c1_sq15cc = ds_vw_cc;
d0p35c1_sq15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c1_sq2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c1_sq20cc = ds_vw_cc;
d0p35c1_sq20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c1_sq2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c1_sq25cc = ds_vw_cc;
d0p35c1_sq25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c1_sq3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c1_sq30cc = ds_vw_cc;
d0p35c1_sq30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c2_sq0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c2_sq05cc = ds_vw_cc;
d0p35c2_sq05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c2_sq1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c2_sq10cc = ds_vw_cc;
d0p35c2_sq10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c2_sq1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c2_sq15cc = ds_vw_cc;
d0p35c2_sq15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c2_sq2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c2_sq20cc = ds_vw_cc;
d0p35c2_sq20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c2_sq2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c2_sq25cc = ds_vw_cc;
d0p35c2_sq25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c2_sq3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c2_sq30cc = ds_vw_cc;
d0p35c2_sq30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c1_abs0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c1_abs05cc = ds_vw_cc;
d0p5c1_abs05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c1_abs1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c1_abs10cc = ds_vw_cc;
d0p5c1_abs10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c1_abs1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c1_abs15cc = ds_vw_cc;
d0p5c1_abs15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c1_abs2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c1_abs20cc = ds_vw_cc;
d0p5c1_abs20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c1_abs2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c1_abs25cc = ds_vw_cc;
d0p5c1_abs25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c1_abs3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c1_abs30cc = ds_vw_cc;
d0p5c1_abs30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c2_abs0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c2_abs05cc = ds_vw_cc;
d0p5c2_abs05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c2_abs1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c2_abs10cc = ds_vw_cc;
d0p5c2_abs10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c2_abs1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c2_abs15cc = ds_vw_cc;
d0p5c2_abs15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c2_abs2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c2_abs20cc = ds_vw_cc;
d0p5c2_abs20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c2_abs2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c2_abs25cc = ds_vw_cc;
d0p5c2_abs25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c2_abs3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p5c2_abs30cc = ds_vw_cc;
d0p5c2_abs30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c1_abs0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c1_abs05cc = ds_vw_cc;
d0p10c1_abs05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c1_abs1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c1_abs10cc = ds_vw_cc;
d0p10c1_abs10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c1_abs1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c1_abs15cc = ds_vw_cc;
d0p10c1_abs15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c1_abs2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c1_abs20cc = ds_vw_cc;
d0p10c1_abs20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c1_abs2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c1_abs25cc = ds_vw_cc;
d0p10c1_abs25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c1_abs3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c1_abs30cc = ds_vw_cc;
d0p10c1_abs30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c2_abs0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c2_abs05cc = ds_vw_cc;
d0p10c2_abs05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c2_abs1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c2_abs10cc = ds_vw_cc;
d0p10c2_abs10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c2_abs1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c2_abs15cc = ds_vw_cc;
d0p10c2_abs15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c2_abs2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c2_abs20cc = ds_vw_cc;
d0p10c2_abs20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c2_abs2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c2_abs25cc = ds_vw_cc;
d0p10c2_abs25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c2_abs3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p10c2_abs30cc = ds_vw_cc;
d0p10c2_abs30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c1_abs0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c1_abs05cc = ds_vw_cc;
d0p15c1_abs05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c1_abs1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c1_abs10cc = ds_vw_cc;
d0p15c1_abs10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c1_abs1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c1_abs15cc = ds_vw_cc;
d0p15c1_abs15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c1_abs2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c1_abs20cc = ds_vw_cc;
d0p15c1_abs20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c1_abs2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c1_abs25cc = ds_vw_cc;
d0p15c1_abs25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c1_abs3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c1_abs30cc = ds_vw_cc;
d0p15c1_abs30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c2_abs0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c2_abs05cc = ds_vw_cc;
d0p15c2_abs05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c2_abs1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c2_abs10cc = ds_vw_cc;
d0p15c2_abs10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c2_abs1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c2_abs15cc = ds_vw_cc;
d0p15c2_abs15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c2_abs2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c2_abs20cc = ds_vw_cc;
d0p15c2_abs20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c2_abs2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c2_abs25cc = ds_vw_cc;
d0p15c2_abs25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c2_abs3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p15c2_abs30cc = ds_vw_cc;
d0p15c2_abs30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c1_abs0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c1_abs05cc = ds_vw_cc;
d0p20c1_abs05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c1_abs1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c1_abs10cc = ds_vw_cc;
d0p20c1_abs10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c1_abs1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c1_abs15cc = ds_vw_cc;
d0p20c1_abs15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c1_abs2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c1_abs20cc = ds_vw_cc;
d0p20c1_abs20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c1_abs2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c1_abs25cc = ds_vw_cc;
d0p20c1_abs25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c1_abs3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c1_abs30cc = ds_vw_cc;
d0p20c1_abs30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c2_abs0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c2_abs05cc = ds_vw_cc;
d0p20c2_abs05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c2_abs1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c2_abs10cc = ds_vw_cc;
d0p20c2_abs10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c2_abs1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c2_abs15cc = ds_vw_cc;
d0p20c2_abs15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c2_abs2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c2_abs20cc = ds_vw_cc;
d0p20c2_abs20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c2_abs2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c2_abs25cc = ds_vw_cc;
d0p20c2_abs25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c2_abs3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p20c2_abs30cc = ds_vw_cc;
d0p20c2_abs30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c1_abs0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c1_abs05cc = ds_vw_cc;
d0p25c1_abs05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c1_abs1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c1_abs10cc = ds_vw_cc;
d0p25c1_abs10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c1_abs1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c1_abs15cc = ds_vw_cc;
d0p25c1_abs15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c1_abs2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c1_abs20cc = ds_vw_cc;
d0p25c1_abs20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c1_abs2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c1_abs25cc = ds_vw_cc;
d0p25c1_abs25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c1_abs3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c1_abs30cc = ds_vw_cc;
d0p25c1_abs30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c2_abs0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c2_abs05cc = ds_vw_cc;
d0p25c2_abs05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c2_abs1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c2_abs10cc = ds_vw_cc;
d0p25c2_abs10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c2_abs1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c2_abs15cc = ds_vw_cc;
d0p25c2_abs15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c2_abs2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c2_abs20cc = ds_vw_cc;
d0p25c2_abs20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c2_abs2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c2_abs25cc = ds_vw_cc;
d0p25c2_abs25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c2_abs3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p25c2_abs30cc = ds_vw_cc;
d0p25c2_abs30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c1_abs0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c1_abs05cc = ds_vw_cc;
d0p30c1_abs05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c1_abs1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c1_abs10cc = ds_vw_cc;
d0p30c1_abs10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c1_abs1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c1_abs15cc = ds_vw_cc;
d0p30c1_abs15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c1_abs2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c1_abs20cc = ds_vw_cc;
d0p30c1_abs20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c1_abs2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c1_abs25cc = ds_vw_cc;
d0p30c1_abs25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c1_abs3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c1_abs30cc = ds_vw_cc;
d0p30c1_abs30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c2_abs0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c2_abs05cc = ds_vw_cc;
d0p30c2_abs05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c2_abs1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c2_abs10cc = ds_vw_cc;
d0p30c2_abs10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c2_abs1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c2_abs15cc = ds_vw_cc;
d0p30c2_abs15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c2_abs2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c2_abs20cc = ds_vw_cc;
d0p30c2_abs20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c2_abs2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c2_abs25cc = ds_vw_cc;
d0p30c2_abs25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c2_abs3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p30c2_abs30cc = ds_vw_cc;
d0p30c2_abs30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c1_abs0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c1_abs05cc = ds_vw_cc;
d0p35c1_abs05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c1_abs1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c1_abs10cc = ds_vw_cc;
d0p35c1_abs10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c1_abs1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c1_abs15cc = ds_vw_cc;
d0p35c1_abs15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c1_abs2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c1_abs20cc = ds_vw_cc;
d0p35c1_abs20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c1_abs2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c1_abs25cc = ds_vw_cc;
d0p35c1_abs25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c1_abs3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c1_abs30cc = ds_vw_cc;
d0p35c1_abs30fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c2_abs0.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c2_abs05cc = ds_vw_cc;
d0p35c2_abs05fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c2_abs1.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c2_abs10cc = ds_vw_cc;
d0p35c2_abs10fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c2_abs1.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c2_abs15cc = ds_vw_cc;
d0p35c2_abs15fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c2_abs2.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c2_abs20cc = ds_vw_cc;
d0p35c2_abs20fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c2_abs2.5.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c2_abs25cc = ds_vw_cc;
d0p35c2_abs25fi = ds_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c2_abs3.0.mat','ds_vw_cc', 'ds_vw_fi');
d0p35c2_abs30cc = ds_vw_cc;
d0p35c2_abs30fi = ds_vw_fi;

cc1_absmix005 = [abs_mix_d0p5c1_005cc; abs_mix_d0p10c1_005cc; abs_mix_d0p15c1_005cc; abs_mix_d0p20c1_005cc; abs_mix_d0p25c1_005cc;
abs_mix_d0p30c1_005cc; abs_mix_d0p35c1_005cc];
cc2_absmix005 = [abs_mix_d0p5c2_005cc; abs_mix_d0p10c2_005cc; abs_mix_d0p15c2_005cc; abs_mix_d0p20c2_005cc; abs_mix_d0p25c2_005cc;
abs_mix_d0p30c2_005cc; abs_mix_d0p35c2_005cc];

fi1_absmix005 = [abs_mix_d0p5c1_005fi; abs_mix_d0p10c1_005fi; abs_mix_d0p15c1_005fi; abs_mix_d0p20c1_005fi; abs_mix_d0p25c1_005fi;
abs_mix_d0p30c1_005fi; abs_mix_d0p35c1_005fi];
fi2_absmix005 = [abs_mix_d0p5c2_005fi; abs_mix_d0p10c2_005fi; abs_mix_d0p15c2_005fi; abs_mix_d0p20c2_005fi; abs_mix_d0p25c2_005fi;
abs_mix_d0p30c2_005fi; abs_mix_d0p35c2_005fi];

cc1_absmix010 = [abs_mix_d0p5c1_010cc; abs_mix_d0p10c1_010cc; abs_mix_d0p15c1_010cc; abs_mix_d0p20c1_010cc; abs_mix_d0p25c1_010cc;
abs_mix_d0p30c1_010cc; abs_mix_d0p35c1_010cc];
cc2_absmix010 = [abs_mix_d0p5c2_010cc; abs_mix_d0p10c2_010cc; abs_mix_d0p15c2_010cc; abs_mix_d0p20c2_010cc; abs_mix_d0p25c2_010cc;
abs_mix_d0p30c2_010cc; abs_mix_d0p35c2_010cc];

fi1_absmix010 = [abs_mix_d0p5c1_010fi; abs_mix_d0p10c1_010fi; abs_mix_d0p15c1_010fi; abs_mix_d0p20c1_010fi; abs_mix_d0p25c1_010fi;
abs_mix_d0p30c1_010fi; abs_mix_d0p35c1_010fi];
fi2_absmix010 = [abs_mix_d0p5c2_010fi; abs_mix_d0p10c2_010fi; abs_mix_d0p15c2_010fi; abs_mix_d0p20c2_010fi; abs_mix_d0p25c2_010fi;
abs_mix_d0p30c2_010fi; abs_mix_d0p35c2_010fi];

cc1_absmix015 = [abs_mix_d0p5c1_015cc; abs_mix_d0p10c1_015cc; abs_mix_d0p15c1_015cc; abs_mix_d0p20c1_015cc; abs_mix_d0p25c1_015cc;
abs_mix_d0p30c1_015cc; abs_mix_d0p35c1_015cc];
cc2_absmix015 = [abs_mix_d0p5c2_015cc; abs_mix_d0p10c2_015cc; abs_mix_d0p15c2_015cc; abs_mix_d0p20c2_015cc; abs_mix_d0p25c2_015cc;
abs_mix_d0p30c2_015cc; abs_mix_d0p35c2_015cc];

fi1_absmix015 = [abs_mix_d0p5c1_015fi; abs_mix_d0p10c1_015fi; abs_mix_d0p15c1_015fi; abs_mix_d0p20c1_015fi; abs_mix_d0p25c1_015fi;
abs_mix_d0p30c1_015fi; abs_mix_d0p35c1_015fi];
fi2_absmix015 = [abs_mix_d0p5c2_015fi; abs_mix_d0p10c2_015fi; abs_mix_d0p15c2_015fi; abs_mix_d0p20c2_015fi; abs_mix_d0p25c2_015fi;
abs_mix_d0p30c2_015fi; abs_mix_d0p35c2_015fi];

cc1_absmix020 = [abs_mix_d0p5c1_020cc; abs_mix_d0p10c1_020cc; abs_mix_d0p15c1_020cc; abs_mix_d0p20c1_020cc; abs_mix_d0p25c1_020cc;
abs_mix_d0p30c1_020cc; abs_mix_d0p35c1_020cc];
cc2_absmix020 = [abs_mix_d0p5c2_020cc; abs_mix_d0p10c2_020cc; abs_mix_d0p15c2_020cc; abs_mix_d0p20c2_020cc; abs_mix_d0p25c2_020cc;
abs_mix_d0p30c2_020cc; abs_mix_d0p35c2_020cc];

fi1_absmix020 = [abs_mix_d0p5c1_020fi; abs_mix_d0p10c1_020fi; abs_mix_d0p15c1_020fi; abs_mix_d0p20c1_020fi; abs_mix_d0p25c1_020fi;
abs_mix_d0p30c1_020fi; abs_mix_d0p35c1_020fi];
fi2_absmix020 = [abs_mix_d0p5c2_020fi; abs_mix_d0p10c2_020fi; abs_mix_d0p15c2_020fi; abs_mix_d0p20c2_020fi; abs_mix_d0p25c2_020fi;
abs_mix_d0p30c2_020fi; abs_mix_d0p35c2_020fi];

cc1_absmix025 = [abs_mix_d0p5c1_025cc; abs_mix_d0p10c1_025cc; abs_mix_d0p15c1_025cc; abs_mix_d0p20c1_025cc; abs_mix_d0p25c1_025cc;
abs_mix_d0p30c1_025cc; abs_mix_d0p35c1_025cc];
cc2_absmix025 = [abs_mix_d0p5c2_025cc; abs_mix_d0p10c2_025cc; abs_mix_d0p15c2_025cc; abs_mix_d0p20c2_025cc; abs_mix_d0p25c2_025cc;
abs_mix_d0p30c2_025cc; abs_mix_d0p35c2_025cc];

fi1_absmix025 = [abs_mix_d0p5c1_025fi; abs_mix_d0p10c1_025fi; abs_mix_d0p15c1_025fi; abs_mix_d0p20c1_025fi; abs_mix_d0p25c1_025fi;
abs_mix_d0p30c1_025fi; abs_mix_d0p35c1_025fi];
fi2_absmix025 = [abs_mix_d0p5c2_025fi; abs_mix_d0p10c2_025fi; abs_mix_d0p15c2_025fi; abs_mix_d0p20c2_025fi; abs_mix_d0p25c2_025fi;
abs_mix_d0p30c2_025fi; abs_mix_d0p35c2_025fi];

cc1_absmix030 = [abs_mix_d0p5c1_030cc; abs_mix_d0p10c1_030cc; abs_mix_d0p15c1_030cc; abs_mix_d0p20c1_030cc; abs_mix_d0p25c1_030cc;
abs_mix_d0p30c1_030cc; abs_mix_d0p35c1_030cc];
cc2_absmix030 = [abs_mix_d0p5c2_030cc; abs_mix_d0p10c2_030cc; abs_mix_d0p15c2_030cc; abs_mix_d0p20c2_030cc; abs_mix_d0p25c2_030cc;
abs_mix_d0p30c2_030cc; abs_mix_d0p35c2_030cc];

fi1_absmix030 = [abs_mix_d0p5c1_030fi; abs_mix_d0p10c1_030fi; abs_mix_d0p15c1_030fi; abs_mix_d0p20c1_030fi; abs_mix_d0p25c1_030fi;
abs_mix_d0p30c1_030fi; abs_mix_d0p35c1_030fi];
fi2_absmix030 = [abs_mix_d0p5c2_030fi; abs_mix_d0p10c2_030fi; abs_mix_d0p15c2_030fi; abs_mix_d0p20c2_030fi; abs_mix_d0p25c2_030fi;
abs_mix_d0p30c2_030fi; abs_mix_d0p35c2_030fi];

cc1_absmix035 = [abs_mix_d0p5c1_035cc; abs_mix_d0p10c1_035cc; abs_mix_d0p15c1_035cc; abs_mix_d0p20c1_035cc; abs_mix_d0p25c1_035cc;
abs_mix_d0p30c1_035cc; abs_mix_d0p35c1_035cc];
cc2_absmix035 = [abs_mix_d0p5c2_035cc; abs_mix_d0p10c2_035cc; abs_mix_d0p15c2_035cc; abs_mix_d0p20c2_035cc; abs_mix_d0p25c2_035cc;
abs_mix_d0p30c2_035cc; abs_mix_d0p35c2_035cc];

fi1_absmix035 = [abs_mix_d0p5c1_035fi; abs_mix_d0p10c1_035fi; abs_mix_d0p15c1_035fi; abs_mix_d0p20c1_035fi; abs_mix_d0p25c1_035fi;
abs_mix_d0p30c1_035fi; abs_mix_d0p35c1_035fi];
fi2_absmix035 = [abs_mix_d0p5c2_035fi; abs_mix_d0p10c2_035fi; abs_mix_d0p15c2_035fi; abs_mix_d0p20c2_035fi; abs_mix_d0p25c2_035fi;
abs_mix_d0p30c2_035fi; abs_mix_d0p35c2_035fi];

cc1_absmix040 = [abs_mix_d0p5c1_040cc; abs_mix_d0p10c1_040cc; abs_mix_d0p15c1_040cc; abs_mix_d0p20c1_040cc; abs_mix_d0p25c1_040cc;
abs_mix_d0p30c1_040cc; abs_mix_d0p35c1_040cc];
cc2_absmix040 = [abs_mix_d0p5c2_040cc; abs_mix_d0p10c2_040cc; abs_mix_d0p15c2_040cc; abs_mix_d0p20c2_040cc; abs_mix_d0p25c2_040cc;
abs_mix_d0p30c2_040cc; abs_mix_d0p35c2_040cc];

fi1_absmix040 = [abs_mix_d0p5c1_040fi; abs_mix_d0p10c1_040fi; abs_mix_d0p15c1_040fi; abs_mix_d0p20c1_040fi; abs_mix_d0p25c1_040fi;
abs_mix_d0p30c1_040fi; abs_mix_d0p35c1_040fi];
fi2_absmix040 = [abs_mix_d0p5c2_040fi; abs_mix_d0p10c2_040fi; abs_mix_d0p15c2_040fi; abs_mix_d0p20c2_040fi; abs_mix_d0p25c2_040fi;
abs_mix_d0p30c2_040fi; abs_mix_d0p35c2_040fi];

cc1_absmix045 = [abs_mix_d0p5c1_045cc; abs_mix_d0p10c1_045cc; abs_mix_d0p15c1_045cc; abs_mix_d0p20c1_045cc; abs_mix_d0p25c1_045cc;
abs_mix_d0p30c1_045cc; abs_mix_d0p35c1_045cc];
cc2_absmix045 = [abs_mix_d0p5c2_045cc; abs_mix_d0p10c2_045cc; abs_mix_d0p15c2_045cc; abs_mix_d0p20c2_045cc; abs_mix_d0p25c2_045cc;
abs_mix_d0p30c2_045cc; abs_mix_d0p35c2_045cc];

fi1_absmix045 = [abs_mix_d0p5c1_045fi; abs_mix_d0p10c1_045fi; abs_mix_d0p15c1_045fi; abs_mix_d0p20c1_045fi; abs_mix_d0p25c1_045fi;
abs_mix_d0p30c1_045fi; abs_mix_d0p35c1_045fi];
fi2_absmix045 = [abs_mix_d0p5c2_045fi; abs_mix_d0p10c2_045fi; abs_mix_d0p15c2_045fi; abs_mix_d0p20c2_045fi; abs_mix_d0p25c2_045fi;
abs_mix_d0p30c2_045fi; abs_mix_d0p35c2_045fi];

cc1_absmix050 = [abs_mix_d0p5c1_050cc; abs_mix_d0p10c1_050cc; abs_mix_d0p15c1_050cc; abs_mix_d0p20c1_050cc; abs_mix_d0p25c1_050cc;
abs_mix_d0p30c1_050cc; abs_mix_d0p35c1_050cc];
cc2_absmix050 = [abs_mix_d0p5c2_050cc; abs_mix_d0p10c2_050cc; abs_mix_d0p15c2_050cc; abs_mix_d0p20c2_050cc; abs_mix_d0p25c2_050cc;
abs_mix_d0p30c2_050cc; abs_mix_d0p35c2_050cc];

fi1_absmix050 = [abs_mix_d0p5c1_050fi; abs_mix_d0p10c1_050fi; abs_mix_d0p15c1_050fi; abs_mix_d0p20c1_050fi; abs_mix_d0p25c1_050fi;
abs_mix_d0p30c1_050fi; abs_mix_d0p35c1_050fi];
fi2_absmix050 = [abs_mix_d0p5c2_050fi; abs_mix_d0p10c2_050fi; abs_mix_d0p15c2_050fi; abs_mix_d0p20c2_050fi; abs_mix_d0p25c2_050fi;
abs_mix_d0p30c2_050fi; abs_mix_d0p35c2_050fi];

cc1_absmix055 = [abs_mix_d0p5c1_055cc; abs_mix_d0p10c1_055cc; abs_mix_d0p15c1_055cc; abs_mix_d0p20c1_055cc; abs_mix_d0p25c1_055cc;
abs_mix_d0p30c1_055cc; abs_mix_d0p35c1_055cc];
cc2_absmix055 = [abs_mix_d0p5c2_055cc; abs_mix_d0p10c2_055cc; abs_mix_d0p15c2_055cc; abs_mix_d0p20c2_055cc; abs_mix_d0p25c2_055cc;
abs_mix_d0p30c2_055cc; abs_mix_d0p35c2_055cc];

fi1_absmix055 = [abs_mix_d0p5c1_055fi; abs_mix_d0p10c1_055fi; abs_mix_d0p15c1_055fi; abs_mix_d0p20c1_055fi; abs_mix_d0p25c1_055fi;
abs_mix_d0p30c1_055fi; abs_mix_d0p35c1_055fi];
fi2_absmix055 = [abs_mix_d0p5c2_055fi; abs_mix_d0p10c2_055fi; abs_mix_d0p15c2_055fi; abs_mix_d0p20c2_055fi; abs_mix_d0p25c2_055fi;
abs_mix_d0p30c2_055fi; abs_mix_d0p35c2_055fi];

cc1_sqmix005 = [sq_mix_d0p5c1_005cc; sq_mix_d0p10c1_005cc; sq_mix_d0p15c1_005cc; sq_mix_d0p20c1_005cc; sq_mix_d0p25c1_005cc;
sq_mix_d0p30c1_005cc; sq_mix_d0p35c1_005cc];
cc2_sqmix005 = [sq_mix_d0p5c2_005cc; sq_mix_d0p10c2_005cc; sq_mix_d0p15c2_005cc; sq_mix_d0p20c2_005cc; sq_mix_d0p25c2_005cc;
sq_mix_d0p30c2_005cc; sq_mix_d0p35c2_005cc];

fi1_sqmix005 = [sq_mix_d0p5c1_005fi; sq_mix_d0p10c1_005fi; sq_mix_d0p15c1_005fi; sq_mix_d0p20c1_005fi; sq_mix_d0p25c1_005fi;
sq_mix_d0p30c1_005fi; sq_mix_d0p35c1_005fi];
fi2_sqmix005 = [sq_mix_d0p5c2_005fi; sq_mix_d0p10c2_005fi; sq_mix_d0p15c2_005fi; sq_mix_d0p20c2_005fi; sq_mix_d0p25c2_005fi;
sq_mix_d0p30c2_005fi; sq_mix_d0p35c2_005fi];

cc1_sqmix010 = [sq_mix_d0p5c1_010cc; sq_mix_d0p10c1_010cc; sq_mix_d0p15c1_010cc; sq_mix_d0p20c1_010cc; sq_mix_d0p25c1_010cc;
sq_mix_d0p30c1_010cc; sq_mix_d0p35c1_010cc];
cc2_sqmix010 = [sq_mix_d0p5c2_010cc; sq_mix_d0p10c2_010cc; sq_mix_d0p15c2_010cc; sq_mix_d0p20c2_010cc; sq_mix_d0p25c2_010cc;
sq_mix_d0p30c2_010cc; sq_mix_d0p35c2_010cc];

fi1_sqmix010 = [sq_mix_d0p5c1_010fi; sq_mix_d0p10c1_010fi; sq_mix_d0p15c1_010fi; sq_mix_d0p20c1_010fi; sq_mix_d0p25c1_010fi;
sq_mix_d0p30c1_010fi; sq_mix_d0p35c1_010fi];
fi2_sqmix010 = [sq_mix_d0p5c2_010fi; sq_mix_d0p10c2_010fi; sq_mix_d0p15c2_010fi; sq_mix_d0p20c2_010fi; sq_mix_d0p25c2_010fi;
sq_mix_d0p30c2_010fi; sq_mix_d0p35c2_010fi];

cc1_sqmix015 = [sq_mix_d0p5c1_015cc; sq_mix_d0p10c1_015cc; sq_mix_d0p15c1_015cc; sq_mix_d0p20c1_015cc; sq_mix_d0p25c1_015cc;
sq_mix_d0p30c1_015cc; sq_mix_d0p35c1_015cc];
cc2_sqmix015 = [sq_mix_d0p5c2_015cc; sq_mix_d0p10c2_015cc; sq_mix_d0p15c2_015cc; sq_mix_d0p20c2_015cc; sq_mix_d0p25c2_015cc;
sq_mix_d0p30c2_015cc; sq_mix_d0p35c2_015cc];

fi1_sqmix015 = [sq_mix_d0p5c1_015fi; sq_mix_d0p10c1_015fi; sq_mix_d0p15c1_015fi; sq_mix_d0p20c1_015fi; sq_mix_d0p25c1_015fi;
sq_mix_d0p30c1_015fi; sq_mix_d0p35c1_015fi];
fi2_sqmix015 = [sq_mix_d0p5c2_015fi; sq_mix_d0p10c2_015fi; sq_mix_d0p15c2_015fi; sq_mix_d0p20c2_015fi; sq_mix_d0p25c2_015fi;
sq_mix_d0p30c2_015fi; sq_mix_d0p35c2_015fi];

cc1_sqmix020 = [sq_mix_d0p5c1_020cc; sq_mix_d0p10c1_020cc; sq_mix_d0p15c1_020cc; sq_mix_d0p20c1_020cc; sq_mix_d0p25c1_020cc;
sq_mix_d0p30c1_020cc; sq_mix_d0p35c1_020cc];
cc2_sqmix020 = [sq_mix_d0p5c2_020cc; sq_mix_d0p10c2_020cc; sq_mix_d0p15c2_020cc; sq_mix_d0p20c2_020cc; sq_mix_d0p25c2_020cc;
sq_mix_d0p30c2_020cc; sq_mix_d0p35c2_020cc];

fi1_sqmix020 = [sq_mix_d0p5c1_020fi; sq_mix_d0p10c1_020fi; sq_mix_d0p15c1_020fi; sq_mix_d0p20c1_020fi; sq_mix_d0p25c1_020fi;
sq_mix_d0p30c1_020fi; sq_mix_d0p35c1_020fi];
fi2_sqmix020 = [sq_mix_d0p5c2_020fi; sq_mix_d0p10c2_020fi; sq_mix_d0p15c2_020fi; sq_mix_d0p20c2_020fi; sq_mix_d0p25c2_020fi;
sq_mix_d0p30c2_020fi; sq_mix_d0p35c2_020fi];

cc1_sqmix025 = [sq_mix_d0p5c1_025cc; sq_mix_d0p10c1_025cc; sq_mix_d0p15c1_025cc; sq_mix_d0p20c1_025cc; sq_mix_d0p25c1_025cc;
sq_mix_d0p30c1_025cc; sq_mix_d0p35c1_025cc];
cc2_sqmix025 = [sq_mix_d0p5c2_025cc; sq_mix_d0p10c2_025cc; sq_mix_d0p15c2_025cc; sq_mix_d0p20c2_025cc; sq_mix_d0p25c2_025cc;
sq_mix_d0p30c2_025cc; sq_mix_d0p35c2_025cc];

fi1_sqmix025 = [sq_mix_d0p5c1_025fi; sq_mix_d0p10c1_025fi; sq_mix_d0p15c1_025fi; sq_mix_d0p20c1_025fi; sq_mix_d0p25c1_025fi;
sq_mix_d0p30c1_025fi; sq_mix_d0p35c1_025fi];
fi2_sqmix025 = [sq_mix_d0p5c2_025fi; sq_mix_d0p10c2_025fi; sq_mix_d0p15c2_025fi; sq_mix_d0p20c2_025fi; sq_mix_d0p25c2_025fi;
sq_mix_d0p30c2_025fi; sq_mix_d0p35c2_025fi];

cc1_sqmix030 = [sq_mix_d0p5c1_030cc; sq_mix_d0p10c1_030cc; sq_mix_d0p15c1_030cc; sq_mix_d0p20c1_030cc; sq_mix_d0p25c1_030cc;
sq_mix_d0p30c1_030cc; sq_mix_d0p35c1_030cc];
cc2_sqmix030 = [sq_mix_d0p5c2_030cc; sq_mix_d0p10c2_030cc; sq_mix_d0p15c2_030cc; sq_mix_d0p20c2_030cc; sq_mix_d0p25c2_030cc;
sq_mix_d0p30c2_030cc; sq_mix_d0p35c2_030cc];

fi1_sqmix030 = [sq_mix_d0p5c1_030fi; sq_mix_d0p10c1_030fi; sq_mix_d0p15c1_030fi; sq_mix_d0p20c1_030fi; sq_mix_d0p25c1_030fi;
sq_mix_d0p30c1_030fi; sq_mix_d0p35c1_030fi];
fi2_sqmix030 = [sq_mix_d0p5c2_030fi; sq_mix_d0p10c2_030fi; sq_mix_d0p15c2_030fi; sq_mix_d0p20c2_030fi; sq_mix_d0p25c2_030fi;
sq_mix_d0p30c2_030fi; sq_mix_d0p35c2_030fi];

cc1_sqmix035 = [sq_mix_d0p5c1_035cc; sq_mix_d0p10c1_035cc; sq_mix_d0p15c1_035cc; sq_mix_d0p20c1_035cc; sq_mix_d0p25c1_035cc;
sq_mix_d0p30c1_035cc; sq_mix_d0p35c1_035cc];
cc2_sqmix035 = [sq_mix_d0p5c2_035cc; sq_mix_d0p10c2_035cc; sq_mix_d0p15c2_035cc; sq_mix_d0p20c2_035cc; sq_mix_d0p25c2_035cc;
sq_mix_d0p30c2_035cc; sq_mix_d0p35c2_035cc];

fi1_sqmix035 = [sq_mix_d0p5c1_035fi; sq_mix_d0p10c1_035fi; sq_mix_d0p15c1_035fi; sq_mix_d0p20c1_035fi; sq_mix_d0p25c1_035fi;
sq_mix_d0p30c1_035fi; sq_mix_d0p35c1_035fi];
fi2_sqmix035 = [sq_mix_d0p5c2_035fi; sq_mix_d0p10c2_035fi; sq_mix_d0p15c2_035fi; sq_mix_d0p20c2_035fi; sq_mix_d0p25c2_035fi;
sq_mix_d0p30c2_035fi; sq_mix_d0p35c2_035fi];

cc1_sqmix040 = [sq_mix_d0p5c1_040cc; sq_mix_d0p10c1_040cc; sq_mix_d0p15c1_040cc; sq_mix_d0p20c1_040cc; sq_mix_d0p25c1_040cc;
sq_mix_d0p30c1_040cc; sq_mix_d0p35c1_040cc];
cc2_sqmix040 = [sq_mix_d0p5c2_040cc; sq_mix_d0p10c2_040cc; sq_mix_d0p15c2_040cc; sq_mix_d0p20c2_040cc; sq_mix_d0p25c2_040cc;
sq_mix_d0p30c2_040cc; sq_mix_d0p35c2_040cc];

fi1_sqmix040 = [sq_mix_d0p5c1_040fi; sq_mix_d0p10c1_040fi; sq_mix_d0p15c1_040fi; sq_mix_d0p20c1_040fi; sq_mix_d0p25c1_040fi;
sq_mix_d0p30c1_040fi; sq_mix_d0p35c1_040fi];
fi2_sqmix040 = [sq_mix_d0p5c2_040fi; sq_mix_d0p10c2_040fi; sq_mix_d0p15c2_040fi; sq_mix_d0p20c2_040fi; sq_mix_d0p25c2_040fi;
sq_mix_d0p30c2_040fi; sq_mix_d0p35c2_040fi];

cc1_sqmix045 = [sq_mix_d0p5c1_045cc; sq_mix_d0p10c1_045cc; sq_mix_d0p15c1_045cc; sq_mix_d0p20c1_045cc; sq_mix_d0p25c1_045cc;
sq_mix_d0p30c1_045cc; sq_mix_d0p35c1_045cc];
cc2_sqmix045 = [sq_mix_d0p5c2_045cc; sq_mix_d0p10c2_045cc; sq_mix_d0p15c2_045cc; sq_mix_d0p20c2_045cc; sq_mix_d0p25c2_045cc;
sq_mix_d0p30c2_045cc; sq_mix_d0p35c2_045cc];

fi1_sqmix045 = [sq_mix_d0p5c1_045fi; sq_mix_d0p10c1_045fi; sq_mix_d0p15c1_045fi; sq_mix_d0p20c1_045fi; sq_mix_d0p25c1_045fi;
sq_mix_d0p30c1_045fi; sq_mix_d0p35c1_045fi];
fi2_sqmix045 = [sq_mix_d0p5c2_045fi; sq_mix_d0p10c2_045fi; sq_mix_d0p15c2_045fi; sq_mix_d0p20c2_045fi; sq_mix_d0p25c2_045fi;
sq_mix_d0p30c2_045fi; sq_mix_d0p35c2_045fi];

cc1_sqmix050 = [sq_mix_d0p5c1_050cc; sq_mix_d0p10c1_050cc; sq_mix_d0p15c1_050cc; sq_mix_d0p20c1_050cc; sq_mix_d0p25c1_050cc;
sq_mix_d0p30c1_050cc; sq_mix_d0p35c1_050cc];
cc2_sqmix050 = [sq_mix_d0p5c2_050cc; sq_mix_d0p10c2_050cc; sq_mix_d0p15c2_050cc; sq_mix_d0p20c2_050cc; sq_mix_d0p25c2_050cc;
sq_mix_d0p30c2_050cc; sq_mix_d0p35c2_050cc];

fi1_sqmix050 = [sq_mix_d0p5c1_050fi; sq_mix_d0p10c1_050fi; sq_mix_d0p15c1_050fi; sq_mix_d0p20c1_050fi; sq_mix_d0p25c1_050fi;
sq_mix_d0p30c1_050fi; sq_mix_d0p35c1_050fi];
fi2_sqmix050 = [sq_mix_d0p5c2_050fi; sq_mix_d0p10c2_050fi; sq_mix_d0p15c2_050fi; sq_mix_d0p20c2_050fi; sq_mix_d0p25c2_050fi;
sq_mix_d0p30c2_050fi; sq_mix_d0p35c2_050fi];

cc1_sqmix055 = [sq_mix_d0p5c1_055cc; sq_mix_d0p10c1_055cc; sq_mix_d0p15c1_055cc; sq_mix_d0p20c1_055cc; sq_mix_d0p25c1_055cc;
sq_mix_d0p30c1_055cc; sq_mix_d0p35c1_055cc];
cc2_sqmix055 = [sq_mix_d0p5c2_055cc; sq_mix_d0p10c2_055cc; sq_mix_d0p15c2_055cc; sq_mix_d0p20c2_055cc; sq_mix_d0p25c2_055cc;
sq_mix_d0p30c2_055cc; sq_mix_d0p35c2_055cc];

fi1_sqmix055 = [sq_mix_d0p5c1_055fi; sq_mix_d0p10c1_055fi; sq_mix_d0p15c1_055fi; sq_mix_d0p20c1_055fi; sq_mix_d0p25c1_055fi;
sq_mix_d0p30c1_055fi; sq_mix_d0p35c1_055fi];
fi2_sqmix055 = [sq_mix_d0p5c2_055fi; sq_mix_d0p10c2_055fi; sq_mix_d0p15c2_055fi; sq_mix_d0p20c2_055fi; sq_mix_d0p25c2_055fi;
sq_mix_d0p30c2_055fi; sq_mix_d0p35c2_055fi];

cc1_absnomix005 = [abs_nomix_d0p5c1_005cc; abs_nomix_d0p10c1_005cc; abs_nomix_d0p15c1_005cc; abs_nomix_d0p20c1_005cc; abs_nomix_d0p25c1_005cc;
abs_nomix_d0p30c1_005cc; abs_nomix_d0p35c1_005cc];
cc2_absnomix005 = [abs_nomix_d0p5c2_005cc; abs_nomix_d0p10c2_005cc; abs_nomix_d0p15c2_005cc; abs_nomix_d0p20c2_005cc; abs_nomix_d0p25c2_005cc;
abs_nomix_d0p30c2_005cc; abs_nomix_d0p35c2_005cc];

fi1_absnomix005 = [abs_nomix_d0p5c1_005fi; abs_nomix_d0p10c1_005fi; abs_nomix_d0p15c1_005fi; abs_nomix_d0p20c1_005fi; abs_nomix_d0p25c1_005fi;
abs_nomix_d0p30c1_005fi; abs_nomix_d0p35c1_005fi];
fi2_absnomix005 = [abs_nomix_d0p5c2_005fi; abs_nomix_d0p10c2_005fi; abs_nomix_d0p15c2_005fi; abs_nomix_d0p20c2_005fi; abs_nomix_d0p25c2_005fi;
abs_nomix_d0p30c2_005fi; abs_nomix_d0p35c2_005fi];

cc1_absnomix010 = [abs_nomix_d0p5c1_010cc; abs_nomix_d0p10c1_010cc; abs_nomix_d0p15c1_010cc; abs_nomix_d0p20c1_010cc; abs_nomix_d0p25c1_010cc;
abs_nomix_d0p30c1_010cc; abs_nomix_d0p35c1_010cc];
cc2_absnomix010 = [abs_nomix_d0p5c2_010cc; abs_nomix_d0p10c2_010cc; abs_nomix_d0p15c2_010cc; abs_nomix_d0p20c2_010cc; abs_nomix_d0p25c2_010cc;
abs_nomix_d0p30c2_010cc; abs_nomix_d0p35c2_010cc];

fi1_absnomix010 = [abs_nomix_d0p5c1_010fi; abs_nomix_d0p10c1_010fi; abs_nomix_d0p15c1_010fi; abs_nomix_d0p20c1_010fi; abs_nomix_d0p25c1_010fi;
abs_nomix_d0p30c1_010fi; abs_nomix_d0p35c1_010fi];
fi2_absnomix010 = [abs_nomix_d0p5c2_010fi; abs_nomix_d0p10c2_010fi; abs_nomix_d0p15c2_010fi; abs_nomix_d0p20c2_010fi; abs_nomix_d0p25c2_010fi;
abs_nomix_d0p30c2_010fi; abs_nomix_d0p35c2_010fi];

cc1_absnomix015 = [abs_nomix_d0p5c1_015cc; abs_nomix_d0p10c1_015cc; abs_nomix_d0p15c1_015cc; abs_nomix_d0p20c1_015cc; abs_nomix_d0p25c1_015cc;
abs_nomix_d0p30c1_015cc; abs_nomix_d0p35c1_015cc];
cc2_absnomix015 = [abs_nomix_d0p5c2_015cc; abs_nomix_d0p10c2_015cc; abs_nomix_d0p15c2_015cc; abs_nomix_d0p20c2_015cc; abs_nomix_d0p25c2_015cc;
abs_nomix_d0p30c2_015cc; abs_nomix_d0p35c2_015cc];

fi1_absnomix015 = [abs_nomix_d0p5c1_015fi; abs_nomix_d0p10c1_015fi; abs_nomix_d0p15c1_015fi; abs_nomix_d0p20c1_015fi; abs_nomix_d0p25c1_015fi;
abs_nomix_d0p30c1_015fi; abs_nomix_d0p35c1_015fi];
fi2_absnomix015 = [abs_nomix_d0p5c2_015fi; abs_nomix_d0p10c2_015fi; abs_nomix_d0p15c2_015fi; abs_nomix_d0p20c2_015fi; abs_nomix_d0p25c2_015fi;
abs_nomix_d0p30c2_015fi; abs_nomix_d0p35c2_015fi];

cc1_absnomix020 = [abs_nomix_d0p5c1_020cc; abs_nomix_d0p10c1_020cc; abs_nomix_d0p15c1_020cc; abs_nomix_d0p20c1_020cc; abs_nomix_d0p25c1_020cc;
abs_nomix_d0p30c1_020cc; abs_nomix_d0p35c1_020cc];
cc2_absnomix020 = [abs_nomix_d0p5c2_020cc; abs_nomix_d0p10c2_020cc; abs_nomix_d0p15c2_020cc; abs_nomix_d0p20c2_020cc; abs_nomix_d0p25c2_020cc;
abs_nomix_d0p30c2_020cc; abs_nomix_d0p35c2_020cc];

fi1_absnomix020 = [abs_nomix_d0p5c1_020fi; abs_nomix_d0p10c1_020fi; abs_nomix_d0p15c1_020fi; abs_nomix_d0p20c1_020fi; abs_nomix_d0p25c1_020fi;
abs_nomix_d0p30c1_020fi; abs_nomix_d0p35c1_020fi];
fi2_absnomix020 = [abs_nomix_d0p5c2_020fi; abs_nomix_d0p10c2_020fi; abs_nomix_d0p15c2_020fi; abs_nomix_d0p20c2_020fi; abs_nomix_d0p25c2_020fi;
abs_nomix_d0p30c2_020fi; abs_nomix_d0p35c2_020fi];

cc1_absnomix025 = [abs_nomix_d0p5c1_025cc; abs_nomix_d0p10c1_025cc; abs_nomix_d0p15c1_025cc; abs_nomix_d0p20c1_025cc; abs_nomix_d0p25c1_025cc;
abs_nomix_d0p30c1_025cc; abs_nomix_d0p35c1_025cc];
cc2_absnomix025 = [abs_nomix_d0p5c2_025cc; abs_nomix_d0p10c2_025cc; abs_nomix_d0p15c2_025cc; abs_nomix_d0p20c2_025cc; abs_nomix_d0p25c2_025cc;
abs_nomix_d0p30c2_025cc; abs_nomix_d0p35c2_025cc];

fi1_absnomix025 = [abs_nomix_d0p5c1_025fi; abs_nomix_d0p10c1_025fi; abs_nomix_d0p15c1_025fi; abs_nomix_d0p20c1_025fi; abs_nomix_d0p25c1_025fi;
abs_nomix_d0p30c1_025fi; abs_nomix_d0p35c1_025fi];
fi2_absnomix025 = [abs_nomix_d0p5c2_025fi; abs_nomix_d0p10c2_025fi; abs_nomix_d0p15c2_025fi; abs_nomix_d0p20c2_025fi; abs_nomix_d0p25c2_025fi;
abs_nomix_d0p30c2_025fi; abs_nomix_d0p35c2_025fi];

cc1_absnomix030 = [abs_nomix_d0p5c1_030cc; abs_nomix_d0p10c1_030cc; abs_nomix_d0p15c1_030cc; abs_nomix_d0p20c1_030cc; abs_nomix_d0p25c1_030cc;
abs_nomix_d0p30c1_030cc; abs_nomix_d0p35c1_030cc];
cc2_absnomix030 = [abs_nomix_d0p5c2_030cc; abs_nomix_d0p10c2_030cc; abs_nomix_d0p15c2_030cc; abs_nomix_d0p20c2_030cc; abs_nomix_d0p25c2_030cc;
abs_nomix_d0p30c2_030cc; abs_nomix_d0p35c2_030cc];

fi1_absnomix030 = [abs_nomix_d0p5c1_030fi; abs_nomix_d0p10c1_030fi; abs_nomix_d0p15c1_030fi; abs_nomix_d0p20c1_030fi; abs_nomix_d0p25c1_030fi;
abs_nomix_d0p30c1_030fi; abs_nomix_d0p35c1_030fi];
fi2_absnomix030 = [abs_nomix_d0p5c2_030fi; abs_nomix_d0p10c2_030fi; abs_nomix_d0p15c2_030fi; abs_nomix_d0p20c2_030fi; abs_nomix_d0p25c2_030fi;
abs_nomix_d0p30c2_030fi; abs_nomix_d0p35c2_030fi];

cc1_absnomix035 = [abs_nomix_d0p5c1_035cc; abs_nomix_d0p10c1_035cc; abs_nomix_d0p15c1_035cc; abs_nomix_d0p20c1_035cc; abs_nomix_d0p25c1_035cc;
abs_nomix_d0p30c1_035cc; abs_nomix_d0p35c1_035cc];
cc2_absnomix035 = [abs_nomix_d0p5c2_035cc; abs_nomix_d0p10c2_035cc; abs_nomix_d0p15c2_035cc; abs_nomix_d0p20c2_035cc; abs_nomix_d0p25c2_035cc;
abs_nomix_d0p30c2_035cc; abs_nomix_d0p35c2_035cc];

fi1_absnomix035 = [abs_nomix_d0p5c1_035fi; abs_nomix_d0p10c1_035fi; abs_nomix_d0p15c1_035fi; abs_nomix_d0p20c1_035fi; abs_nomix_d0p25c1_035fi;
abs_nomix_d0p30c1_035fi; abs_nomix_d0p35c1_035fi];
fi2_absnomix035 = [abs_nomix_d0p5c2_035fi; abs_nomix_d0p10c2_035fi; abs_nomix_d0p15c2_035fi; abs_nomix_d0p20c2_035fi; abs_nomix_d0p25c2_035fi;
abs_nomix_d0p30c2_035fi; abs_nomix_d0p35c2_035fi];

cc1_absnomix040 = [abs_nomix_d0p5c1_040cc; abs_nomix_d0p10c1_040cc; abs_nomix_d0p15c1_040cc; abs_nomix_d0p20c1_040cc; abs_nomix_d0p25c1_040cc;
abs_nomix_d0p30c1_040cc; abs_nomix_d0p35c1_040cc];
cc2_absnomix040 = [abs_nomix_d0p5c2_040cc; abs_nomix_d0p10c2_040cc; abs_nomix_d0p15c2_040cc; abs_nomix_d0p20c2_040cc; abs_nomix_d0p25c2_040cc;
abs_nomix_d0p30c2_040cc; abs_nomix_d0p35c2_040cc];

fi1_absnomix040 = [abs_nomix_d0p5c1_040fi; abs_nomix_d0p10c1_040fi; abs_nomix_d0p15c1_040fi; abs_nomix_d0p20c1_040fi; abs_nomix_d0p25c1_040fi;
abs_nomix_d0p30c1_040fi; abs_nomix_d0p35c1_040fi];
fi2_absnomix040 = [abs_nomix_d0p5c2_040fi; abs_nomix_d0p10c2_040fi; abs_nomix_d0p15c2_040fi; abs_nomix_d0p20c2_040fi; abs_nomix_d0p25c2_040fi;
abs_nomix_d0p30c2_040fi; abs_nomix_d0p35c2_040fi];

cc1_absnomix045 = [abs_nomix_d0p5c1_045cc; abs_nomix_d0p10c1_045cc; abs_nomix_d0p15c1_045cc; abs_nomix_d0p20c1_045cc; abs_nomix_d0p25c1_045cc;
abs_nomix_d0p30c1_045cc; abs_nomix_d0p35c1_045cc];
cc2_absnomix045 = [abs_nomix_d0p5c2_045cc; abs_nomix_d0p10c2_045cc; abs_nomix_d0p15c2_045cc; abs_nomix_d0p20c2_045cc; abs_nomix_d0p25c2_045cc;
abs_nomix_d0p30c2_045cc; abs_nomix_d0p35c2_045cc];

fi1_absnomix045 = [abs_nomix_d0p5c1_045fi; abs_nomix_d0p10c1_045fi; abs_nomix_d0p15c1_045fi; abs_nomix_d0p20c1_045fi; abs_nomix_d0p25c1_045fi;
abs_nomix_d0p30c1_045fi; abs_nomix_d0p35c1_045fi];
fi2_absnomix045 = [abs_nomix_d0p5c2_045fi; abs_nomix_d0p10c2_045fi; abs_nomix_d0p15c2_045fi; abs_nomix_d0p20c2_045fi; abs_nomix_d0p25c2_045fi;
abs_nomix_d0p30c2_045fi; abs_nomix_d0p35c2_045fi];

cc1_absnomix050 = [abs_nomix_d0p5c1_050cc; abs_nomix_d0p10c1_050cc; abs_nomix_d0p15c1_050cc; abs_nomix_d0p20c1_050cc; abs_nomix_d0p25c1_050cc;
abs_nomix_d0p30c1_050cc; abs_nomix_d0p35c1_050cc];
cc2_absnomix050 = [abs_nomix_d0p5c2_050cc; abs_nomix_d0p10c2_050cc; abs_nomix_d0p15c2_050cc; abs_nomix_d0p20c2_050cc; abs_nomix_d0p25c2_050cc;
abs_nomix_d0p30c2_050cc; abs_nomix_d0p35c2_050cc];

fi1_absnomix050 = [abs_nomix_d0p5c1_050fi; abs_nomix_d0p10c1_050fi; abs_nomix_d0p15c1_050fi; abs_nomix_d0p20c1_050fi; abs_nomix_d0p25c1_050fi;
abs_nomix_d0p30c1_050fi; abs_nomix_d0p35c1_050fi];
fi2_absnomix050 = [abs_nomix_d0p5c2_050fi; abs_nomix_d0p10c2_050fi; abs_nomix_d0p15c2_050fi; abs_nomix_d0p20c2_050fi; abs_nomix_d0p25c2_050fi;
abs_nomix_d0p30c2_050fi; abs_nomix_d0p35c2_050fi];

cc1_absnomix055 = [abs_nomix_d0p5c1_055cc; abs_nomix_d0p10c1_055cc; abs_nomix_d0p15c1_055cc; abs_nomix_d0p20c1_055cc; abs_nomix_d0p25c1_055cc;
abs_nomix_d0p30c1_055cc; abs_nomix_d0p35c1_055cc];
cc2_absnomix055 = [abs_nomix_d0p5c2_055cc; abs_nomix_d0p10c2_055cc; abs_nomix_d0p15c2_055cc; abs_nomix_d0p20c2_055cc; abs_nomix_d0p25c2_055cc;
abs_nomix_d0p30c2_055cc; abs_nomix_d0p35c2_055cc];

fi1_absnomix055 = [abs_nomix_d0p5c1_055fi; abs_nomix_d0p10c1_055fi; abs_nomix_d0p15c1_055fi; abs_nomix_d0p20c1_055fi; abs_nomix_d0p25c1_055fi;
abs_nomix_d0p30c1_055fi; abs_nomix_d0p35c1_055fi];
fi2_absnomix055 = [abs_nomix_d0p5c2_055fi; abs_nomix_d0p10c2_055fi; abs_nomix_d0p15c2_055fi; abs_nomix_d0p20c2_055fi; abs_nomix_d0p25c2_055fi;
abs_nomix_d0p30c2_055fi; abs_nomix_d0p35c2_055fi];

cc1_sqnomix005 = [sq_nomix_d0p5c1_005cc; sq_nomix_d0p10c1_005cc; sq_nomix_d0p15c1_005cc; sq_nomix_d0p20c1_005cc; sq_nomix_d0p25c1_005cc;
sq_nomix_d0p30c1_005cc; sq_nomix_d0p35c1_005cc];
cc2_sqnomix005 = [sq_nomix_d0p5c2_005cc; sq_nomix_d0p10c2_005cc; sq_nomix_d0p15c2_005cc; sq_nomix_d0p20c2_005cc; sq_nomix_d0p25c2_005cc;
sq_nomix_d0p30c2_005cc; sq_nomix_d0p35c2_005cc];

fi1_sqnomix005 = [sq_nomix_d0p5c1_005fi; sq_nomix_d0p10c1_005fi; sq_nomix_d0p15c1_005fi; sq_nomix_d0p20c1_005fi; sq_nomix_d0p25c1_005fi;
sq_nomix_d0p30c1_005fi; sq_nomix_d0p35c1_005fi];
fi2_sqnomix005 = [sq_nomix_d0p5c2_005fi; sq_nomix_d0p10c2_005fi; sq_nomix_d0p15c2_005fi; sq_nomix_d0p20c2_005fi; sq_nomix_d0p25c2_005fi;
sq_nomix_d0p30c2_005fi; sq_nomix_d0p35c2_005fi];

cc1_sqnomix010 = [sq_nomix_d0p5c1_010cc; sq_nomix_d0p10c1_010cc; sq_nomix_d0p15c1_010cc; sq_nomix_d0p20c1_010cc; sq_nomix_d0p25c1_010cc;
sq_nomix_d0p30c1_010cc; sq_nomix_d0p35c1_010cc];
cc2_sqnomix010 = [sq_nomix_d0p5c2_010cc; sq_nomix_d0p10c2_010cc; sq_nomix_d0p15c2_010cc; sq_nomix_d0p20c2_010cc; sq_nomix_d0p25c2_010cc;
sq_nomix_d0p30c2_010cc; sq_nomix_d0p35c2_010cc];

fi1_sqnomix010 = [sq_nomix_d0p5c1_010fi; sq_nomix_d0p10c1_010fi; sq_nomix_d0p15c1_010fi; sq_nomix_d0p20c1_010fi; sq_nomix_d0p25c1_010fi;
sq_nomix_d0p30c1_010fi; sq_nomix_d0p35c1_010fi];
fi2_sqnomix010 = [sq_nomix_d0p5c2_010fi; sq_nomix_d0p10c2_010fi; sq_nomix_d0p15c2_010fi; sq_nomix_d0p20c2_010fi; sq_nomix_d0p25c2_010fi;
sq_nomix_d0p30c2_010fi; sq_nomix_d0p35c2_010fi];

cc1_sqnomix015 = [sq_nomix_d0p5c1_015cc; sq_nomix_d0p10c1_015cc; sq_nomix_d0p15c1_015cc; sq_nomix_d0p20c1_015cc; sq_nomix_d0p25c1_015cc;
sq_nomix_d0p30c1_015cc; sq_nomix_d0p35c1_015cc];
cc2_sqnomix015 = [sq_nomix_d0p5c2_015cc; sq_nomix_d0p10c2_015cc; sq_nomix_d0p15c2_015cc; sq_nomix_d0p20c2_015cc; sq_nomix_d0p25c2_015cc;
sq_nomix_d0p30c2_015cc; sq_nomix_d0p35c2_015cc];

fi1_sqnomix015 = [sq_nomix_d0p5c1_015fi; sq_nomix_d0p10c1_015fi; sq_nomix_d0p15c1_015fi; sq_nomix_d0p20c1_015fi; sq_nomix_d0p25c1_015fi;
sq_nomix_d0p30c1_015fi; sq_nomix_d0p35c1_015fi];
fi2_sqnomix015 = [sq_nomix_d0p5c2_015fi; sq_nomix_d0p10c2_015fi; sq_nomix_d0p15c2_015fi; sq_nomix_d0p20c2_015fi; sq_nomix_d0p25c2_015fi;
sq_nomix_d0p30c2_015fi; sq_nomix_d0p35c2_015fi];

cc1_sqnomix020 = [sq_nomix_d0p5c1_020cc; sq_nomix_d0p10c1_020cc; sq_nomix_d0p15c1_020cc; sq_nomix_d0p20c1_020cc; sq_nomix_d0p25c1_020cc;
sq_nomix_d0p30c1_020cc; sq_nomix_d0p35c1_020cc];
cc2_sqnomix020 = [sq_nomix_d0p5c2_020cc; sq_nomix_d0p10c2_020cc; sq_nomix_d0p15c2_020cc; sq_nomix_d0p20c2_020cc; sq_nomix_d0p25c2_020cc;
sq_nomix_d0p30c2_020cc; sq_nomix_d0p35c2_020cc];

fi1_sqnomix020 = [sq_nomix_d0p5c1_020fi; sq_nomix_d0p10c1_020fi; sq_nomix_d0p15c1_020fi; sq_nomix_d0p20c1_020fi; sq_nomix_d0p25c1_020fi;
sq_nomix_d0p30c1_020fi; sq_nomix_d0p35c1_020fi];
fi2_sqnomix020 = [sq_nomix_d0p5c2_020fi; sq_nomix_d0p10c2_020fi; sq_nomix_d0p15c2_020fi; sq_nomix_d0p20c2_020fi; sq_nomix_d0p25c2_020fi;
sq_nomix_d0p30c2_020fi; sq_nomix_d0p35c2_020fi];

cc1_sqnomix025 = [sq_nomix_d0p5c1_025cc; sq_nomix_d0p10c1_025cc; sq_nomix_d0p15c1_025cc; sq_nomix_d0p20c1_025cc; sq_nomix_d0p25c1_025cc;
sq_nomix_d0p30c1_025cc; sq_nomix_d0p35c1_025cc];
cc2_sqnomix025 = [sq_nomix_d0p5c2_025cc; sq_nomix_d0p10c2_025cc; sq_nomix_d0p15c2_025cc; sq_nomix_d0p20c2_025cc; sq_nomix_d0p25c2_025cc;
sq_nomix_d0p30c2_025cc; sq_nomix_d0p35c2_025cc];

fi1_sqnomix025 = [sq_nomix_d0p5c1_025fi; sq_nomix_d0p10c1_025fi; sq_nomix_d0p15c1_025fi; sq_nomix_d0p20c1_025fi; sq_nomix_d0p25c1_025fi;
sq_nomix_d0p30c1_025fi; sq_nomix_d0p35c1_025fi];
fi2_sqnomix025 = [sq_nomix_d0p5c2_025fi; sq_nomix_d0p10c2_025fi; sq_nomix_d0p15c2_025fi; sq_nomix_d0p20c2_025fi; sq_nomix_d0p25c2_025fi;
sq_nomix_d0p30c2_025fi; sq_nomix_d0p35c2_025fi];

cc1_sqnomix030 = [sq_nomix_d0p5c1_030cc; sq_nomix_d0p10c1_030cc; sq_nomix_d0p15c1_030cc; sq_nomix_d0p20c1_030cc; sq_nomix_d0p25c1_030cc;
sq_nomix_d0p30c1_030cc; sq_nomix_d0p35c1_030cc];
cc2_sqnomix030 = [sq_nomix_d0p5c2_030cc; sq_nomix_d0p10c2_030cc; sq_nomix_d0p15c2_030cc; sq_nomix_d0p20c2_030cc; sq_nomix_d0p25c2_030cc;
sq_nomix_d0p30c2_030cc; sq_nomix_d0p35c2_030cc];

fi1_sqnomix030 = [sq_nomix_d0p5c1_030fi; sq_nomix_d0p10c1_030fi; sq_nomix_d0p15c1_030fi; sq_nomix_d0p20c1_030fi; sq_nomix_d0p25c1_030fi;
sq_nomix_d0p30c1_030fi; sq_nomix_d0p35c1_030fi];
fi2_sqnomix030 = [sq_nomix_d0p5c2_030fi; sq_nomix_d0p10c2_030fi; sq_nomix_d0p15c2_030fi; sq_nomix_d0p20c2_030fi; sq_nomix_d0p25c2_030fi;
sq_nomix_d0p30c2_030fi; sq_nomix_d0p35c2_030fi];

cc1_sqnomix035 = [sq_nomix_d0p5c1_035cc; sq_nomix_d0p10c1_035cc; sq_nomix_d0p15c1_035cc; sq_nomix_d0p20c1_035cc; sq_nomix_d0p25c1_035cc;
sq_nomix_d0p30c1_035cc; sq_nomix_d0p35c1_035cc];
cc2_sqnomix035 = [sq_nomix_d0p5c2_035cc; sq_nomix_d0p10c2_035cc; sq_nomix_d0p15c2_035cc; sq_nomix_d0p20c2_035cc; sq_nomix_d0p25c2_035cc;
sq_nomix_d0p30c2_035cc; sq_nomix_d0p35c2_035cc];

fi1_sqnomix035 = [sq_nomix_d0p5c1_035fi; sq_nomix_d0p10c1_035fi; sq_nomix_d0p15c1_035fi; sq_nomix_d0p20c1_035fi; sq_nomix_d0p25c1_035fi;
sq_nomix_d0p30c1_035fi; sq_nomix_d0p35c1_035fi];
fi2_sqnomix035 = [sq_nomix_d0p5c2_035fi; sq_nomix_d0p10c2_035fi; sq_nomix_d0p15c2_035fi; sq_nomix_d0p20c2_035fi; sq_nomix_d0p25c2_035fi;
sq_nomix_d0p30c2_035fi; sq_nomix_d0p35c2_035fi];

cc1_sqnomix040 = [sq_nomix_d0p5c1_040cc; sq_nomix_d0p10c1_040cc; sq_nomix_d0p15c1_040cc; sq_nomix_d0p20c1_040cc; sq_nomix_d0p25c1_040cc;
sq_nomix_d0p30c1_040cc; sq_nomix_d0p35c1_040cc];
cc2_sqnomix040 = [sq_nomix_d0p5c2_040cc; sq_nomix_d0p10c2_040cc; sq_nomix_d0p15c2_040cc; sq_nomix_d0p20c2_040cc; sq_nomix_d0p25c2_040cc;
sq_nomix_d0p30c2_040cc; sq_nomix_d0p35c2_040cc];

fi1_sqnomix040 = [sq_nomix_d0p5c1_040fi; sq_nomix_d0p10c1_040fi; sq_nomix_d0p15c1_040fi; sq_nomix_d0p20c1_040fi; sq_nomix_d0p25c1_040fi;
sq_nomix_d0p30c1_040fi; sq_nomix_d0p35c1_040fi];
fi2_sqnomix040 = [sq_nomix_d0p5c2_040fi; sq_nomix_d0p10c2_040fi; sq_nomix_d0p15c2_040fi; sq_nomix_d0p20c2_040fi; sq_nomix_d0p25c2_040fi;
sq_nomix_d0p30c2_040fi; sq_nomix_d0p35c2_040fi];

cc1_sqnomix045 = [sq_nomix_d0p5c1_045cc; sq_nomix_d0p10c1_045cc; sq_nomix_d0p15c1_045cc; sq_nomix_d0p20c1_045cc; sq_nomix_d0p25c1_045cc;
sq_nomix_d0p30c1_045cc; sq_nomix_d0p35c1_045cc];
cc2_sqnomix045 = [sq_nomix_d0p5c2_045cc; sq_nomix_d0p10c2_045cc; sq_nomix_d0p15c2_045cc; sq_nomix_d0p20c2_045cc; sq_nomix_d0p25c2_045cc;
sq_nomix_d0p30c2_045cc; sq_nomix_d0p35c2_045cc];

fi1_sqnomix045 = [sq_nomix_d0p5c1_045fi; sq_nomix_d0p10c1_045fi; sq_nomix_d0p15c1_045fi; sq_nomix_d0p20c1_045fi; sq_nomix_d0p25c1_045fi;
sq_nomix_d0p30c1_045fi; sq_nomix_d0p35c1_045fi];
fi2_sqnomix045 = [sq_nomix_d0p5c2_045fi; sq_nomix_d0p10c2_045fi; sq_nomix_d0p15c2_045fi; sq_nomix_d0p20c2_045fi; sq_nomix_d0p25c2_045fi;
sq_nomix_d0p30c2_045fi; sq_nomix_d0p35c2_045fi];

cc1_sqnomix050 = [sq_nomix_d0p5c1_050cc; sq_nomix_d0p10c1_050cc; sq_nomix_d0p15c1_050cc; sq_nomix_d0p20c1_050cc; sq_nomix_d0p25c1_050cc;
sq_nomix_d0p30c1_050cc; sq_nomix_d0p35c1_050cc];
cc2_sqnomix050 = [sq_nomix_d0p5c2_050cc; sq_nomix_d0p10c2_050cc; sq_nomix_d0p15c2_050cc; sq_nomix_d0p20c2_050cc; sq_nomix_d0p25c2_050cc;
sq_nomix_d0p30c2_050cc; sq_nomix_d0p35c2_050cc];

fi1_sqnomix050 = [sq_nomix_d0p5c1_050fi; sq_nomix_d0p10c1_050fi; sq_nomix_d0p15c1_050fi; sq_nomix_d0p20c1_050fi; sq_nomix_d0p25c1_050fi;
sq_nomix_d0p30c1_050fi; sq_nomix_d0p35c1_050fi];
fi2_sqnomix050 = [sq_nomix_d0p5c2_050fi; sq_nomix_d0p10c2_050fi; sq_nomix_d0p15c2_050fi; sq_nomix_d0p20c2_050fi; sq_nomix_d0p25c2_050fi;
sq_nomix_d0p30c2_050fi; sq_nomix_d0p35c2_050fi];

cc1_sqnomix055 = [sq_nomix_d0p5c1_055cc; sq_nomix_d0p10c1_055cc; sq_nomix_d0p15c1_055cc; sq_nomix_d0p20c1_055cc; sq_nomix_d0p25c1_055cc;
sq_nomix_d0p30c1_055cc; sq_nomix_d0p35c1_055cc];
cc2_sqnomix055 = [sq_nomix_d0p5c2_055cc; sq_nomix_d0p10c2_055cc; sq_nomix_d0p15c2_055cc; sq_nomix_d0p20c2_055cc; sq_nomix_d0p25c2_055cc;
sq_nomix_d0p30c2_055cc; sq_nomix_d0p35c2_055cc];

fi1_sqnomix055 = [sq_nomix_d0p5c1_055fi; sq_nomix_d0p10c1_055fi; sq_nomix_d0p15c1_055fi; sq_nomix_d0p20c1_055fi; sq_nomix_d0p25c1_055fi;
sq_nomix_d0p30c1_055fi; sq_nomix_d0p35c1_055fi];
fi2_sqnomix055 = [sq_nomix_d0p5c2_055fi; sq_nomix_d0p10c2_055fi; sq_nomix_d0p15c2_055fi; sq_nomix_d0p20c2_055fi; sq_nomix_d0p25c2_055fi;
sq_nomix_d0p30c2_055fi; sq_nomix_d0p35c2_055fi];

cc1_sq05 = [d0p5c1_sq05cc; d0p10c1_sq05cc; d0p15c1_sq05cc; d0p20c1_sq05cc; d0p25c1_sq05cc;
d0p30c1_sq05cc; d0p35c1_sq05cc];
cc2_sq05 = [d0p5c2_sq05cc; d0p10c2_sq05cc; d0p15c2_sq05cc; d0p20c2_sq05cc; d0p25c2_sq05cc;
d0p30c2_sq05cc; d0p35c2_sq05cc];

fi1_sq05 = [d0p5c1_sq05fi; d0p10c1_sq05fi; d0p15c1_sq05fi; d0p20c1_sq05fi; d0p25c1_sq05fi;
d0p30c1_sq05fi; d0p35c1_sq05fi];
fi2_sq05 = [d0p5c2_sq05fi; d0p10c2_sq05fi; d0p15c2_sq05fi; d0p20c2_sq05fi; d0p25c2_sq05fi;
d0p30c2_sq05fi; d0p35c2_sq05fi];

cc1_sq10 = [d0p5c1_sq10cc; d0p10c1_sq10cc; d0p15c1_sq10cc; d0p20c1_sq10cc; d0p25c1_sq10cc;
d0p30c1_sq10cc; d0p35c1_sq10cc];
cc2_sq10 = [d0p5c2_sq10cc; d0p10c2_sq10cc; d0p15c2_sq10cc; d0p20c2_sq10cc; d0p25c2_sq10cc;
d0p30c2_sq10cc; d0p35c2_sq10cc];

fi1_sq10 = [d0p5c1_sq10fi; d0p10c1_sq10fi; d0p15c1_sq10fi; d0p20c1_sq10fi; d0p25c1_sq10fi;
d0p30c1_sq10fi; d0p35c1_sq10fi];
fi2_sq10 = [d0p5c2_sq10fi; d0p10c2_sq10fi; d0p15c2_sq10fi; d0p20c2_sq10fi; d0p25c2_sq10fi;
d0p30c2_sq10fi; d0p35c2_sq10fi];

cc1_sq15 = [d0p5c1_sq15cc; d0p10c1_sq15cc; d0p15c1_sq15cc; d0p20c1_sq15cc; d0p25c1_sq15cc;
d0p30c1_sq15cc; d0p35c1_sq15cc];
cc2_sq15 = [d0p5c2_sq15cc; d0p10c2_sq15cc; d0p15c2_sq15cc; d0p20c2_sq15cc; d0p25c2_sq15cc;
d0p30c2_sq15cc; d0p35c2_sq15cc];

fi1_sq15 = [d0p5c1_sq15fi; d0p10c1_sq15fi; d0p15c1_sq15fi; d0p20c1_sq15fi; d0p25c1_sq15fi;
d0p30c1_sq15fi; d0p35c1_sq15fi];
fi2_sq15 = [d0p5c2_sq15fi; d0p10c2_sq15fi; d0p15c2_sq15fi; d0p20c2_sq15fi; d0p25c2_sq15fi;
d0p30c2_sq15fi; d0p35c2_sq15fi];

cc1_sq20 = [d0p5c1_sq20cc; d0p10c1_sq20cc; d0p15c1_sq20cc; d0p20c1_sq20cc; d0p25c1_sq20cc;
d0p30c1_sq20cc; d0p35c1_sq20cc];
cc2_sq20 = [d0p5c2_sq20cc; d0p10c2_sq20cc; d0p15c2_sq20cc; d0p20c2_sq20cc; d0p25c2_sq20cc;
d0p30c2_sq20cc; d0p35c2_sq20cc];

fi1_sq20 = [d0p5c1_sq20fi; d0p10c1_sq20fi; d0p15c1_sq20fi; d0p20c1_sq20fi; d0p25c1_sq20fi;
d0p30c1_sq20fi; d0p35c1_sq20fi];
fi2_sq20 = [d0p5c2_sq20fi; d0p10c2_sq20fi; d0p15c2_sq20fi; d0p20c2_sq20fi; d0p25c2_sq20fi;
d0p30c2_sq20fi; d0p35c2_sq20fi];

cc1_sq25 = [d0p5c1_sq25cc; d0p10c1_sq25cc; d0p15c1_sq25cc; d0p20c1_sq25cc; d0p25c1_sq25cc;
d0p30c1_sq25cc; d0p35c1_sq25cc];
cc2_sq25 = [d0p5c2_sq25cc; d0p10c2_sq25cc; d0p15c2_sq25cc; d0p20c2_sq25cc; d0p25c2_sq25cc;
d0p30c2_sq25cc; d0p35c2_sq25cc];

fi1_sq25 = [d0p5c1_sq25fi; d0p10c1_sq25fi; d0p15c1_sq25fi; d0p20c1_sq25fi; d0p25c1_sq25fi;
d0p30c1_sq25fi; d0p35c1_sq25fi];
fi2_sq25 = [d0p5c2_sq25fi; d0p10c2_sq25fi; d0p15c2_sq25fi; d0p20c2_sq25fi; d0p25c2_sq25fi;
d0p30c2_sq25fi; d0p35c2_sq25fi];

cc1_sq30 = [d0p5c1_sq30cc; d0p10c1_sq30cc; d0p15c1_sq30cc; d0p20c1_sq30cc; d0p25c1_sq30cc;
d0p30c1_sq30cc; d0p35c1_sq30cc];
cc2_sq30 = [d0p5c2_sq30cc; d0p10c2_sq30cc; d0p15c2_sq30cc; d0p20c2_sq30cc; d0p25c2_sq30cc;
d0p30c2_sq30cc; d0p35c2_sq30cc];

fi1_sq30 = [d0p5c1_sq30fi; d0p10c1_sq30fi; d0p15c1_sq30fi; d0p20c1_sq30fi; d0p25c1_sq30fi;
d0p30c1_sq30fi; d0p35c1_sq30fi];
fi2_sq30 = [d0p5c2_sq30fi; d0p10c2_sq30fi; d0p15c2_sq30fi; d0p20c2_sq30fi; d0p25c2_sq30fi;
d0p30c2_sq30fi; d0p35c2_sq30fi];

cc1_abs05 = [d0p5c1_abs05cc; d0p10c1_abs05cc; d0p15c1_abs05cc; d0p20c1_abs05cc; d0p25c1_abs05cc;
d0p30c1_abs05cc; d0p35c1_abs05cc];
cc2_abs05 = [d0p5c2_abs05cc; d0p10c2_abs05cc; d0p15c2_abs05cc; d0p20c2_abs05cc; d0p25c2_abs05cc;
d0p30c2_abs05cc; d0p35c2_abs05cc];

fi1_abs05 = [d0p5c1_abs05fi; d0p10c1_abs05fi; d0p15c1_abs05fi; d0p20c1_abs05fi; d0p25c1_abs05fi;
d0p30c1_abs05fi; d0p35c1_abs05fi];
fi2_abs05 = [d0p5c2_abs05fi; d0p10c2_abs05fi; d0p15c2_abs05fi; d0p20c2_abs05fi; d0p25c2_abs05fi;
d0p30c2_abs05fi; d0p35c2_abs05fi];

cc1_abs10 = [d0p5c1_abs10cc; d0p10c1_abs10cc; d0p15c1_abs10cc; d0p20c1_abs10cc; d0p25c1_abs10cc;
d0p30c1_abs10cc; d0p35c1_abs10cc];
cc2_abs10 = [d0p5c2_abs10cc; d0p10c2_abs10cc; d0p15c2_abs10cc; d0p20c2_abs10cc; d0p25c2_abs10cc;
d0p30c2_abs10cc; d0p35c2_abs10cc];

fi1_abs10 = [d0p5c1_abs10fi; d0p10c1_abs10fi; d0p15c1_abs10fi; d0p20c1_abs10fi; d0p25c1_abs10fi;
d0p30c1_abs10fi; d0p35c1_abs10fi];
fi2_abs10 = [d0p5c2_abs10fi; d0p10c2_abs10fi; d0p15c2_abs10fi; d0p20c2_abs10fi; d0p25c2_abs10fi;
d0p30c2_abs10fi; d0p35c2_abs10fi];

cc1_abs15 = [d0p5c1_abs15cc; d0p10c1_abs15cc; d0p15c1_abs15cc; d0p20c1_abs15cc; d0p25c1_abs15cc;
d0p30c1_abs15cc; d0p35c1_abs15cc];
cc2_abs15 = [d0p5c2_abs15cc; d0p10c2_abs15cc; d0p15c2_abs15cc; d0p20c2_abs15cc; d0p25c2_abs15cc;
d0p30c2_abs15cc; d0p35c2_abs15cc];

fi1_abs15 = [d0p5c1_abs15fi; d0p10c1_abs15fi; d0p15c1_abs15fi; d0p20c1_abs15fi; d0p25c1_abs15fi;
d0p30c1_abs15fi; d0p35c1_abs15fi];
fi2_abs15 = [d0p5c2_abs15fi; d0p10c2_abs15fi; d0p15c2_abs15fi; d0p20c2_abs15fi; d0p25c2_abs15fi;
d0p30c2_abs15fi; d0p35c2_abs15fi];

cc1_abs20 = [d0p5c1_abs20cc; d0p10c1_abs20cc; d0p15c1_abs20cc; d0p20c1_abs20cc; d0p25c1_abs20cc;
d0p30c1_abs20cc; d0p35c1_abs20cc];
cc2_abs20 = [d0p5c2_abs20cc; d0p10c2_abs20cc; d0p15c2_abs20cc; d0p20c2_abs20cc; d0p25c2_abs20cc;
d0p30c2_abs20cc; d0p35c2_abs20cc];

fi1_abs20 = [d0p5c1_abs20fi; d0p10c1_abs20fi; d0p15c1_abs20fi; d0p20c1_abs20fi; d0p25c1_abs20fi;
d0p30c1_abs20fi; d0p35c1_abs20fi];
fi2_abs20 = [d0p5c2_abs20fi; d0p10c2_abs20fi; d0p15c2_abs20fi; d0p20c2_abs20fi; d0p25c2_abs20fi;
d0p30c2_abs20fi; d0p35c2_abs20fi];

cc1_abs25 = [d0p5c1_abs25cc; d0p10c1_abs25cc; d0p15c1_abs25cc; d0p20c1_abs25cc; d0p25c1_abs25cc;
d0p30c1_abs25cc; d0p35c1_abs25cc];
cc2_abs25 = [d0p5c2_abs25cc; d0p10c2_abs25cc; d0p15c2_abs25cc; d0p20c2_abs25cc; d0p25c2_abs25cc;
d0p30c2_abs25cc; d0p35c2_abs25cc];

fi1_abs25 = [d0p5c1_abs25fi; d0p10c1_abs25fi; d0p15c1_abs25fi; d0p20c1_abs25fi; d0p25c1_abs25fi;
d0p30c1_abs25fi; d0p35c1_abs25fi];
fi2_abs25 = [d0p5c2_abs25fi; d0p10c2_abs25fi; d0p15c2_abs25fi; d0p20c2_abs25fi; d0p25c2_abs25fi;
d0p30c2_abs25fi; d0p35c2_abs25fi];

cc1_abs30 = [d0p5c1_abs30cc; d0p10c1_abs30cc; d0p15c1_abs30cc; d0p20c1_abs30cc; d0p25c1_abs30cc;
d0p30c1_abs30cc; d0p35c1_abs30cc];
cc2_abs30 = [d0p5c2_abs30cc; d0p10c2_abs30cc; d0p15c2_abs30cc; d0p20c2_abs30cc; d0p25c2_abs30cc;
d0p30c2_abs30cc; d0p35c2_abs30cc];

fi1_abs30 = [d0p5c1_abs30fi; d0p10c1_abs30fi; d0p15c1_abs30fi; d0p20c1_abs30fi; d0p25c1_abs30fi;
d0p30c1_abs30fi; d0p35c1_abs30fi];
fi2_abs30 = [d0p5c2_abs30fi; d0p10c2_abs30fi; d0p15c2_abs30fi; d0p20c2_abs30fi; d0p25c2_abs30fi;
d0p30c2_abs30fi; d0p35c2_abs30fi];


cc1_absmix = [cc1_absmix005 ;cc1_absmix010; cc1_absmix015 ;cc1_absmix020 ;cc1_absmix025 ;cc1_absmix030 ;cc1_absmix035 ;cc1_absmix040 ;cc1_absmix045 ;cc1_absmix050 ;cc1_absmix055];
cc2_absmix = [cc2_absmix005 ;cc2_absmix010 ;cc2_absmix015 ;cc2_absmix020 ;cc2_absmix025 ;cc2_absmix030 ;cc2_absmix035 ;cc2_absmix040 ;cc2_absmix045 ;cc2_absmix050 ;cc2_absmix055];

fi1_absmix = [fi1_absmix005 ;fi1_absmix010 ;fi1_absmix015 ;fi1_absmix020 ;fi1_absmix025 ;fi1_absmix030 ;fi1_absmix035 ;fi1_absmix040 ;fi1_absmix045 ;fi1_absmix050 ;fi1_absmix055];
fi2_absmix = [fi2_absmix005 ;fi2_absmix010 ;fi2_absmix015 ;fi2_absmix020 ;fi2_absmix025 ;fi2_absmix030 ;fi2_absmix035 ;fi2_absmix040 ;fi2_absmix045 ;fi2_absmix050 ;fi2_absmix055];

cc1_sqmix = [cc1_sqmix005 ;cc1_sqmix010 ;cc1_sqmix015 ;cc1_sqmix020 ;cc1_sqmix025 ;cc1_sqmix030 ;cc1_sqmix035 ;cc1_sqmix040 ;cc1_sqmix045 ;cc1_sqmix050 ;cc1_sqmix055];
cc2_sqmix = [cc2_sqmix005 ;cc2_sqmix010 ;cc2_sqmix015 ;cc2_sqmix020 ;cc2_sqmix025 ;cc2_sqmix030 ;cc2_sqmix035 ;cc2_sqmix040 ;cc2_sqmix045 ;cc2_sqmix050 ;cc2_sqmix055];

fi1_sqmix = [fi1_sqmix005 ;fi1_sqmix010 ;fi1_sqmix015 ;fi1_sqmix020 ;fi1_sqmix025 ;fi1_sqmix030 ;fi1_sqmix035 ;fi1_sqmix040 ;fi1_sqmix045 ;fi1_sqmix050 ;fi1_sqmix055];
fi2_sqmix = [fi2_sqmix005 ;fi2_sqmix010 ;fi2_sqmix015 ;fi2_sqmix020 ;fi2_sqmix025 ;fi2_sqmix030 ;fi2_sqmix035 ;fi2_sqmix040 ;fi2_sqmix045 ;fi2_sqmix050 ;fi2_sqmix055];

cc1_absnomix = [cc1_absnomix005 ;cc1_absnomix010 ;cc1_absnomix015 ;cc1_absnomix020 ;cc1_absnomix025 ;cc1_absnomix030 ;cc1_absnomix035 ;cc1_absnomix040 ;cc1_absnomix045 ;cc1_absnomix050 ;cc1_absnomix055];
cc2_absnomix = [cc2_absnomix005 ;cc2_absnomix010 ;cc2_absnomix015 ;cc2_absnomix020 ;cc2_absnomix025 ;cc2_absnomix030 ;cc2_absnomix035 ;cc2_absnomix040 ;cc2_absnomix045 ;cc2_absnomix050 ;cc2_absnomix055];

fi1_absnomix = [fi1_absnomix005 ;fi1_absnomix010 ;fi1_absnomix015 ;fi1_absnomix020 ;fi1_absnomix025 ;fi1_absnomix030 ;fi1_absnomix035 ;fi1_absnomix040 ;fi1_absnomix045 ;fi1_absnomix050 ;fi1_absnomix055];
fi2_absnomix = [fi2_absnomix005 ;fi2_absnomix010 ;fi2_absnomix015 ;fi2_absnomix020 ;fi2_absnomix025 ;fi2_absnomix030 ;fi2_absnomix035 ;fi2_absnomix040 ;fi2_absnomix045 ;fi2_absnomix050 ;fi2_absnomix055];

cc1_sqnomix = [cc1_sqnomix005 ;cc1_sqnomix010 ;cc1_sqnomix015 ;cc1_sqnomix020 ;cc1_sqnomix025 ;cc1_sqnomix030 ;cc1_sqnomix035 ;cc1_sqnomix040 ;cc1_sqnomix045 ;cc1_sqnomix050 ;cc1_sqnomix055];
cc2_sqnomix = [cc2_sqnomix005 ;cc2_sqnomix010 ;cc2_sqnomix015 ;cc2_sqnomix020 ;cc2_sqnomix025 ;cc2_sqnomix030 ;cc2_sqnomix035 ;cc2_sqnomix040 ;cc2_sqnomix045 ;cc2_sqnomix050 ;cc2_sqnomix055];

fi1_sqnomix = [fi1_sqnomix005 ;fi1_sqnomix010 ;fi1_sqnomix015 ;fi1_sqnomix020 ;fi1_sqnomix025 ;fi1_sqnomix030 ;fi1_sqnomix035 ;fi1_sqnomix040 ;fi1_sqnomix045 ;fi1_sqnomix050 ;fi1_sqnomix055];
fi2_sqnomix = [fi2_sqnomix005 ;fi2_sqnomix010 ;fi2_sqnomix015 ;fi2_sqnomix020 ;fi2_sqnomix025 ;fi2_sqnomix030 ;fi2_sqnomix035 ;fi2_sqnomix040 ;fi2_sqnomix045 ;fi2_sqnomix050 ;fi2_sqnomix055];

cc1_sq = [cc1_sq05 ;cc1_sq10 ;cc1_sq15 ;cc1_sq20 ;cc1_sq25 ;cc1_sq30]; 
cc2_sq = [cc2_sq05 ;cc2_sq10 ;cc2_sq15 ;cc2_sq20 ;cc2_sq25 ;cc2_sq30]; 

fi1_sq = [fi1_sq05 ;fi1_sq10 ;fi1_sq15 ;fi1_sq20 ;fi1_sq25 ;fi1_sq30]; 
fi2_sq = [fi2_sq05 ;fi2_sq10 ;fi2_sq15 ;fi2_sq20 ;fi2_sq25 ;fi2_sq30]; 

cc1_abs = [cc1_abs05 ;cc1_abs10 ;cc1_abs15 ;cc1_abs20 ;cc1_abs25 ;cc1_abs30]; 
cc2_abs = [cc2_abs05 ;cc2_abs10 ;cc2_abs15 ;cc2_abs20 ;cc2_abs25 ;cc2_abs30]; 

fi1_abs = [fi1_abs05 ;fi1_abs10 ;fi1_abs15 ;fi1_abs20 ;fi1_abs25 ;fi1_abs30];
fi2_abs = [fi2_abs05 ;fi2_abs10 ;fi2_abs15 ;fi2_abs20 ;fi2_abs25 ;fi2_abs30]; 

mean_cc1_absmix = cc1_absmix(:,1); mean_cc2_absmix = cc2_absmix(:,1); mean_fi1_absmix = fi1_absmix(:,1); mean_fi2_absmix = fi2_absmix(:,1); 

mean_cc1_sqmix = cc1_sqmix(:,1); mean_cc2_sqmix = cc2_sqmix(:,1); mean_fi1_sqmix = fi1_sqmix(:,1); mean_fi2_sqmix = fi2_sqmix(:,1); 

mean_cc1_absnomix = cc1_absnomix(:,1); mean_cc2_absnomix = cc2_absnomix(:,1); mean_fi1_absnomix = fi1_absnomix(:,1); mean_fi2_absnomix = fi2_absnomix(:,1);

mean_cc1_sqnomix = cc1_sqnomix(:,1); mean_cc2_sqnomix = cc2_sqnomix(:,1); mean_fi1_sqnomix = fi1_sqnomix(:,1); mean_fi2_sqnomix = fi2_sqnomix(:,1); 

mean_sq_cc1 = [cc1_sq(22,1); cc1_sq(23,1); cc1_sq(24,1); cc1_sq(25,1); cc1_sq(26,1); cc1_sq(27,1); cc1_sq(28,1)];
mean_sq_cc2 = [cc2_sq(22,1); cc2_sq(23,1); cc2_sq(24,1); cc2_sq(25,1); cc2_sq(26,1); cc2_sq(27,1); cc2_sq(28,1)];

mean_sq_fi1 = [fi1_sq(22,1); fi1_sq(23,1); fi1_sq(24,1); fi1_sq(25,1); fi1_sq(26,1); fi1_sq(27,1); fi1_sq(28,1)];
mean_sq_fi2 = [fi2_sq(22,1); fi2_sq(23,1); fi2_sq(24,1); fi2_sq(25,1); fi2_sq(26,1); fi2_sq(27,1); fi2_sq(28,1)];

mean_abs_cc1 = [cc1_abs(22,1); cc1_abs(23,1); cc1_abs(24,1); cc1_abs(25,1); cc1_abs(26,1); cc1_abs(27,1); cc1_abs(28,1)];
mean_abs_cc2 = [cc2_abs(22,1); cc2_abs(23,1); cc2_abs(24,1); cc2_abs(25,1); cc2_abs(26,1); cc2_abs(27,1); cc2_abs(28,1)];

mean_abs_fi1 = [fi1_abs(22,1); fi1_abs(23,1); fi1_abs(24,1); fi1_abs(25,1); fi1_abs(26,1); fi1_abs(27,1); fi1_abs(28,1)];
mean_abs_fi2 = [fi2_abs(22,1); fi2_abs(23,1); fi2_abs(24,1); fi2_abs(25,1); fi2_abs(26,1); fi2_abs(27,1); fi2_abs(28,1)];

sharpe_cc1_absmix = cc1_absmix(:,2); sharpe_cc2_absmix = cc2_absmix(:,2); sharpe_fi1_absmix = fi1_absmix(:,2); sharpe_fi2_absmix = fi2_absmix(:,2); 

sharpe_cc1_sqmix = cc1_sqmix(:,2); sharpe_cc2_sqmix = cc2_sqmix(:,2);

sharpe_fi1_sqmix = fi1_sqmix(:,2); sharpe_fi2_sqmix = fi2_sqmix(:,2); 

sharpe_cc1_absnomix = cc1_absnomix(:,2); sharpe_cc2_absnomix = cc2_absnomix(:,2); 

sharpe_fi1_absnomix = fi1_absnomix(:,2); sharpe_fi2_absnomix = fi2_absnomix(:,2); 

sharpe_cc1_sqnomix = cc1_sqnomix(:,2); sharpe_cc2_sqnomix = cc2_sqnomix(:,2); 

sharpe_fi1_sqnomix = fi1_sqnomix(:,2); sharpe_fi2_sqnomix = fi2_sqnomix(:,2); 

sharpe_sq_cc1 = [cc1_sq(22,2); cc1_sq(23,2); cc1_sq(24,2); cc1_sq(25,2); cc1_sq(26,2); cc1_sq(27,2); cc1_sq(28,2)];
sharpe_sq_cc2 = [cc2_sq(22,2); cc2_sq(23,2); cc2_sq(24,2); cc2_sq(25,2); cc2_sq(26,2); cc2_sq(27,2); cc2_sq(28,2)];

sharpe_sq_fi1 = [fi1_sq(22,2); fi1_sq(23,2); fi1_sq(24,2); fi1_sq(25,2); fi1_sq(26,2); fi1_sq(27,2); fi1_sq(28,2)];
sharpe_sq_fi2 = [fi2_sq(22,2); fi2_sq(23,2); fi2_sq(24,2); fi2_sq(25,2); fi2_sq(26,2); fi2_sq(27,2); fi2_sq(28,2)];

sharpe_abs_cc1 = [cc1_abs(22,2); cc1_abs(23,2); cc1_abs(24,2); cc1_abs(25,2); cc1_abs(26,2); cc1_abs(27,2); cc1_abs(28,2)];
sharpe_abs_cc2 = [cc2_abs(22,2); cc2_abs(23,2); cc2_abs(24,2); cc2_abs(25,2); cc2_abs(26,2); cc2_abs(27,2); cc2_abs(28,2)];

sharpe_abs_fi1 = [fi1_abs(22,2); fi1_abs(23,2); fi1_abs(24,2); fi1_abs(25,2); fi1_abs(26,2); fi1_abs(27,2); fi1_abs(28,2)];
sharpe_abs_fi2 = [fi2_abs(22,2); fi2_abs(23,2); fi2_abs(24,2); fi2_abs(25,2); fi2_abs(26,2); fi2_abs(27,2); fi2_abs(28,2)];

mean_cc1 = [mean_cc1_absmix mean_cc1_sqmix mean_cc1_absnomix mean_cc1_sqnomix];
mean_dist_cc1 = [mean_abs_cc1 mean_sq_cc1];

mean_cc2 = [mean_cc2_absmix mean_cc2_sqmix mean_cc2_absnomix mean_cc2_sqnomix];
mean_dist_cc2 = [mean_abs_cc2 mean_sq_cc2];

mean_fi1 = [mean_fi1_absmix mean_fi1_sqmix mean_fi1_absnomix mean_fi1_sqnomix ];
mean_dist_fi1 = [mean_abs_fi1 mean_sq_fi1];

mean_fi2 = [mean_fi2_absmix mean_fi2_sqmix mean_fi2_absnomix mean_fi2_sqnomix];
mean_dist_fi2 = [mean_abs_fi2 mean_sq_fi2];

% g1 = [zeros(1,11), ones(1,7)]; g2 = [zeros(1,7), ones(1,7)];

% figure(1)
% boxplot(mean_cc1)
% 
% figure(2)
% boxplot(mean_dist_cc1)
% 
% figure(3)
% boxplot(mean_cc2)
% 
% figure(4)
% boxplot(mean_dist_cc2)
% 
% figure(5)
% boxplot(mean_fi1)
% 
% figure(6)
% boxplot(mean_dist_fi1)
% 
% figure(7)
% boxplot(mean_fi2)
% 
% figure(8)
% boxplot(mean_dist_fi2)

sharpe_cc1 = [sharpe_cc1_absmix sharpe_cc1_sqmix sharpe_cc1_absnomix sharpe_cc1_sqnomix];
sharpe_dist_cc1 = [sharpe_sq_cc1 sharpe_abs_cc1];

sharpe_cc2 = [sharpe_cc2_absmix sharpe_cc2_sqmix sharpe_cc2_absnomix sharpe_cc2_sqnomix];
sharpe_dist_cc2 = [sharpe_sq_cc2 sharpe_abs_cc2];

sharpe_fi1 = [sharpe_fi1_absmix sharpe_fi1_sqmix sharpe_fi1_absnomix sharpe_fi1_sqnomix];
sharpe_dist_fi1 = [sharpe_sq_fi1 sharpe_abs_fi1];

sharpe_fi2 = [sharpe_fi2_absmix sharpe_fi2_sqmix sharpe_fi2_absnomix sharpe_fi2_sqnomix];
sharpe_dist_fi2 = [sharpe_sq_fi2 sharpe_abs_fi2];

% g1 = [zeros(1,11), ones(1,11)]; g2 = [zeros(1,7), ones(1,7)];

% figure(9)
% boxplot(sharpe_cc1)
% 
% figure(10)
% boxplot(sharpe_dist_cc1)
% 
% figure(11)
% boxplot(sharpe_cc2)
% 
% figure(12)
% boxplot(sharpe_dist_cc2)
% 
% figure(13)
% boxplot(sharpe_fi1)
% 
% figure(14)
% boxplot(sharpe_dist_fi1)
% 
% figure(15)
% boxplot(sharpe_fi2)
% 
% figure(16)
% boxplot(sharpe_dist_fi2)

% addpath('C:\Users\fsabino\Desktop\Fernando\Documents\MATLAB\matlab2tikz\src')

group = [repmat(0.05,7,1); repmat(0.10,7,1); repmat(0.15,7,1); repmat(0.20,7,1); repmat(0.25,7,1); repmat(0.30,7,1); repmat(0.35,7,1);
repmat(0.40,7,1); repmat(0.45,7,1); repmat(0.50,7,1); repmat(0.55,7,1); repmat(2.0,7,1)];

figure(17)
%h1= subplot(1,2,1);
%boxplot([mean_cc1(:,1); mean_dist_cc1(:,1)],group) % absmix
%set(gca,'FontName','Helvetica')
boxplot([mean_cc1(:,1); mean_dist_cc1(:,1)],'Labels',{'0.05','0.10','0.15','0.20','0.25','0.30','0.35','0.40','0.45','0.50','0.55','2\{sigma}'})
ylabel('Annualized Return (%)','FontSize', 24);
xlabel('Opening Threshold','FontSize', 24);
title('Sensitivity Analysis','FontSize', 24);
grid on

%h2= subplot(1,2,2);
figure(18)
boxplot([mean_cc1(:,2); mean_dist_cc1(:,2)],group) % sqmix
ylabel('Annualized Return (%)','FontSize', 24);
xlabel('Opening Threshold','FontSize', 24);
title('Sensitivity Analysis','FontSize', 24);
grid on

a=gcf;
set(a,'PaperOrientation','landscape');
set(a,'PaperUnits','normalized');
set(a,'PaperPosition', [0 0 1 1]);
set(findobj(gcf,'Type','text'),'FontSize',10)
print(gcf,'-dpdf','C:\Users\fsabino\Desktop\Fernando\papers\fig18.pdf')

% figure(1);
% plot(xData,cumprod(1+[hm(1:6173,1) hnm(1:6173,1) pm(1:6173,1) pnm(1:6173,1) hm(1:6173,3) hm(1:6173,5)])),
% legend('CC Mixed Copula-GARCH','CC Copula-GARCH', 'CC Distance (0.75\sigma)', 'CC Distance (2.0\sigma)', 'Location','Northwest');
% set(legend,'FontSize',8);
% set(gca,'XTick',xData2);
% datetick('x','yy','keepticks');
% ylabel('Cumulative Return');
% xlabel('Year');
% %title('Cumulative Monthly Return of top 5 pairs before costs from 1991 to 2015');
% ylabel('Sharpe Ratio');
% %title('Two Year Moving Average Sharpe Ratio before costs from 1991 to 2015');
% subplot(2,2,4);
% plot(xData,cumprod(1+[hm(1:6173,13) hnm(1:6173,13) hm(1:6173,15) hm(1:6173,17)])),
% title('(d) Wait one day, after costs');
% %legend('CC Mixed Copula-GARCH','CC Copula-GARCH', 'CC Distance (0.75\sigma)', 'CC Distance (2.0\sigma)', 'Location','Northwest');
% set(legend,'FontSize',8);
% set(gca,'XTick',xData2);
% datetick('x','yy','keepticks');
% ylabel('Cumulative Return');
% xlabel('Year');
% grid on
% a=gcf;
% set(a,'PaperOrientation','landscape');
% set(a,'PaperUnits','normalized');
% set(a,'PaperPosition', [0 0 1 1]);
% print(gcf,'-dpdf','C:\Users\Fernando\Dropbox\output_fz\Figures\fig9p5fi');
% subplot(3,2,2);
% plot(xData,[cumprod(1+Rp_fi) cumprod(1+Rp_fiv) cumprod(1+Rp_fig)]),
% legend('Copula-GARCH' , 'Distance (0.75\sigma)', 'Distance (2.0\sigma)');
% set(legend,'FontSize',6);
% legend boxoff;
% set(gca,'XTick',xData2);
% datetick('x','yy','keepticks');
% ylabel('Cumulative Excess Return');
% xlabel('Year');
% title('(a) Top 5 pairs, Fully Invested, No waiting, before costs');
% grid on
% figure(1);
% subplot(2,2,1);
% p1=bar([smar(2,5) smar(2,6) smar(2,7) smar(2,8);...
%     smar(2,9) smar(2,10) smar(2,11) smar(2,12);...
%      smar(2,13) smar(2,14) smar(2,15) smar(2,16);...
%     smar(2,17) smar(2,18) smar(2,19) smar(2,20)]);
% set(gca,'ygrid','on'), ylabel('Mean Excess Return'), xlabel('Period'),
% title('(a) No waiting, before costs');
% % legend('Distance (2.0\sigma)', 'Distance (0.75\sigma)','Copula-HEAVY','Copula-GARCH','Location','northwest');
% % legend boxoff;
% set(gca,'XTick',[1 2 3 4],'XTickLabel',{'01-02' '03-07/1' '07/2-09/1' '09/2-16/1'})
% set(legend,'FontSize',6);
% l = legend([p1,p2,p3,p4],{'Distance (2.0\sigma)', 'Distance (0.75\sigma)','Copula-HEAVY','Copula-GARCH'}...
%     ,'Orientation','horizontal');
% 
% % Programatically move the Legend
% newPosition = [0.340775991995887 0.00431256419924021 0.401171295656813 0.0337941620939521];
% newUnits = 'normalized';
% set(l,'Position', newPosition,'Units', newUnits,'FontSize',9);
% 
% a=gcf;
% set(a,'PaperOrientation','landscape');
% set(a,'PaperUnits','normalized');
% set(a,'PaperPosition', [0 0 1 1]);
% print(gcf,'-dpdf','C:\Users\Fernando\Desktop\paper_pairs_trading_realized\fig3_MR_sub_nw')

figure(19)
boxplot([mean_cc1(:,3); mean_dist_cc1(:,1)],group) % absnomix

figure(20)
boxplot([mean_cc1(:,4); mean_dist_cc1(:,2)],group) % sqnomix

figure(21)
boxplot([mean_cc2(:,1); mean_dist_cc2(:,1)],group) % absmix

figure(22)
boxplot([mean_cc2(:,2); mean_dist_cc2(:,2)],group) % sqmix

figure(23)
boxplot([mean_cc2(:,3); mean_dist_cc2(:,1)],group) % absnomix

figure(24)
boxplot([mean_cc2(:,4); mean_dist_cc2(:,2)],group) % sqnomix

figure(25)
%h1= subplot(1,2,1);
boxplot([mean_fi1(:,1); mean_dist_fi1(:,1)],group) % absmix
ylabel('Annualized Return (%)','FontSize', 24);
xlabel('Opening Threshold','FontSize', 24);
title('Sensitivity Analysis','FontSize', 24);
grid on

%addpath('C:\Users\fsabino\Desktop\Fernando\papers\matlab2tikz-matlab2tikz-816f875\src');
addpath('C:\Users\fsabino\Desktop\Fernando\papers')
addpath('C:\Users\fsabino\Documents\MATLAB\matlab2tikz\src') % Call matlab2tikz
addpath('C:\Users\fsabino\Documents\MATLAB\scripts') % Call pgfplots

load boxs_Rp % It contains all data

figure(1)
h1= subplot(1,2,1);
boxplot([mean_cc1(:,2); mean_dist_cc1(:,2)],group,'labels',{'0.05','0.1','0.15','0.2','0.25','0.3','0.35',...
    '0.4','0.45','0.5','0.55','2\sigma'}) % sqmix
h = findobj(gca, 'type', 'text');
%set(gca,'fontsize',11) % Fontsize axis
set(h, 'Interpreter', 'tex','FontSize',10);
ylabel('Annualized Return (%)','FontSize', 17);
xlabel('Opening Threshold','FontSize', 17);
title('Sensitivity Analysis on Committed Capital','FontSize', 14);
grid on

h2= subplot(1,2,2);
%figure(26)
boxplot([mean_fi1(:,2); mean_dist_fi1(:,2)],group,'labels',{'0.05','0.1','0.15','0.2','0.25','0.3','0.35',...
    '0.4','0.45','0.5','0.55','2\sigma'}) % sqmix
h = findobj(gca, 'type', 'text');
%set(gca,'fontsize',11)
set(h, 'Interpreter', 'tex','FontSize',10);
ylabel('Annualized Return (%)','FontSize', 17);
xlabel('Opening Threshold','FontSize', 17);
title('Sensitivity Analysis on Fully Invested Capital','FontSize', 14);
grid on

%print2eps Figure1b

% matlab2tikz('C:\Users\fsabino\Dropbox\Pairs_Trading_Distance_and_Mixed_Copula\paper_elsevier\Figure1.eps');
% Readme: Save using matlab

a=gcf;
set(a,'PaperOrientation','landscape');
set(a,'PaperUnits','normalized');
set(a,'PaperPosition', [0 0 1 1]);
set(findobj(gcf,'Type','text'),'FontSize',10)
print(gcf,'-dpdf','C:\Users\fsabino\Dropbox\Pairs_Trading_Distance_and_Mixed_Copula\paper_elsevier\Figure1.pdf')

% figure(25)
% boxplot([mean_fi1(:,1); mean_dist_fi1(:,1)],group) % absmix
% 
% figure(26)
% boxplot([mean_fi1(:,2); mean_dist_fi1(:,2)],group) % sqmix

figure(27)
boxplot([mean_fi1(:,3); mean_dist_fi1(:,1)],group) % absnomix

figure(28)
boxplot([mean_fi1(:,4); mean_dist_fi1(:,2)],group) % sqnomix

figure(29)
boxplot([mean_fi2(:,1); mean_dist_fi2(:,1)],group) % absmix

figure(30)
boxplot([mean_fi2(:,2); mean_dist_fi2(:,2)],group) % sqmix

figure(31)
boxplot([mean_fi2(:,3); mean_dist_fi2(:,1)],group) % absnomix

figure(32)
boxplot([mean_fi2(:,4); mean_dist_fi2(:,2)],group) % sqnomix

figure(33)
%h1= subplot(1,2,1);
boxplot([sharpe_cc1(:,1); sharpe_dist_cc1(:,1)],group) % absmix
ylabel('Sharpe Ratio (%)','FontSize', 24);
xlabel('Opening Threshold','FontSize', 24);
title('Sensitivity Analysis','FontSize', 24);
grid on

%h2= subplot(1,2,2);
figure(34)
boxplot([sharpe_cc1(:,2); sharpe_dist_cc1(:,2)],group) % sqmix
ylabel('Sharpe Ratio (%)','FontSize', 24);
xlabel('Opening Threshold','FontSize', 24);
title('Sensitivity Analysis','FontSize', 24);
grid on

a=gcf;
set(a,'PaperOrientation','landscape');
set(a,'PaperUnits','normalized');
set(a,'PaperPosition', [0 0 1 1]);
set(findobj(gcf,'Type','text'),'FontSize',10)
print(gcf,'-dpdf','C:\Users\Fernando\Documents\images\Google Drive\paper1\paper3\Apresentação\Apresentação\fig34.pdf')

figure(33)
boxplot([sharpe_cc1(:,1); sharpe_dist_cc1(:,1)],group) % absmix

figure(34)
boxplot([sharpe_cc1(:,2); sharpe_dist_cc1(:,2)],group) % sqmix

figure(35)
boxplot([sharpe_cc1(:,3); sharpe_dist_cc1(:,1)],group) % absnomix

figure(36)
boxplot([sharpe_cc1(:,4); sharpe_dist_cc1(:,2)],group) % sqnomix

figure(37)
boxplot([sharpe_cc2(:,1); sharpe_dist_cc2(:,1)],group) % absmix

figure(38)
boxplot([sharpe_cc2(:,2); sharpe_dist_cc2(:,2)],group) % sqmix

figure(39)
boxplot([sharpe_cc2(:,3); sharpe_dist_cc2(:,1)],group) % absnomix

figure(40)
boxplot([sharpe_cc2(:,4); sharpe_dist_cc2(:,2)],group) % sqnomix

figure(41)
%h1= subplot(1,2,1);
boxplot([sharpe_fi1(:,1); sharpe_dist_fi1(:,1)],group) % absmix
ylabel('Sharpe Ratio (%)','FontSize', 12);
xlabel('Opening Threshold','FontSize', 12);
title('Sensitivity Analysis','FontSize', 12);
grid on

figure(2)
h1= subplot(1,2,1);
boxplot([sharpe_cc1(:,2); sharpe_dist_cc1(:,2)],group,'labels',{'0.05','0.1','0.15','0.2','0.25','0.3','0.35',...
    '0.4','0.45','0.5','0.55','2\sigma'}) % sqmix
h = findobj(gca, 'type', 'text');
set(h, 'Interpreter', 'tex','FontSize',10);
ylabel('Sharpe Ratio (%)','FontSize', 17);
xlabel('Opening Threshold','FontSize', 17);
title('Sensitivity Analysis on Committed Capital','FontSize', 14);
grid on

h2= subplot(1,2,2);
%figure(42)
boxplot([sharpe_fi1(:,2); sharpe_dist_fi1(:,2)],group,'labels',{'0.05','0.1','0.15','0.2','0.25','0.3','0.35',...
    '0.4','0.45','0.5','0.55','2\sigma'})
h = findobj(gca, 'type', 'text');
set(h, 'Interpreter', 'tex','FontSize',10);
ylabel('Sharpe Ratio (%)','FontSize', 17);
xlabel('Opening Threshold','FontSize', 17);
title('Sensitivity Analysis on Fully Invested Capital','FontSize', 14);
grid on

%print2eps Figure2b

a=gcf;
set(a,'PaperOrientation','landscape');
set(a,'PaperUnits','normalized');
set(a,'PaperPosition', [0 0 1 1]);
set(findobj(gcf,'Type','text'),'FontSize',10)
print(gcf,'-dpdf','C:\Users\fsabino\Dropbox\Pairs_Trading_Distance_and_Mixed_Copula\paper_elsevier\Figure2.pdf')

figure(41)
boxplot([sharpe_fi1(:,1); sharpe_dist_fi1(:,1)],group) % absmix

figure(42)
boxplot([sharpe_fi1(:,2); sharpe_dist_fi1(:,2)],group) % sqmix

figure(43)
boxplot([sharpe_fi1(:,3); sharpe_dist_fi1(:,1)],group) % absnomix

figure(44)
boxplot([sharpe_fi1(:,4); sharpe_dist_fi1(:,2)],group) % sqnomix

figure(45)
boxplot([sharpe_fi2(:,1); sharpe_dist_fi2(:,1)],group) % absmix

figure(46)
boxplot([sharpe_fi2(:,2); sharpe_dist_fi2(:,2)],group) % sqmix

figure(47)
boxplot([sharpe_fi2(:,3); sharpe_dist_fi2(:,1)],group) % absnomix

figure(48)
boxplot([sharpe_fi2(:,4); sharpe_dist_fi2(:,2)],group) % sqnomix

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c1_005cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c1_010cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c1_015cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c1_020cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c1_025cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c1_030cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c1_035cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c1_040cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c1_045cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c1_050cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c1_055cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c2_005cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c2_010cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c2_015cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c2_020cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c2_025cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c2_030cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c2_035cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c2_040cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c2_045cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c2_050cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p5c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p5c2_055cc_Rp =  Rp_vw_cc;
abs_mix_d0p5c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c1_005cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c1_010cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c1_015cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c1_020cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c1_025cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c1_030cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c1_035cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c1_040cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c1_045cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c1_050cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c1_055cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c2_005cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c2_010cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c2_015cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c2_020cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c2_025cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c2_030cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c2_035cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c2_040cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c2_045cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c2_050cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p10c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p10c2_055cc_Rp =  Rp_vw_cc;
abs_mix_d0p10c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c1_005cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c1_010cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c1_015cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c1_020cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c1_025cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c1_030cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c1_035cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c1_040cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c1_045cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c1_050cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c1_055cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c2_005cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c2_010cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c2_015cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c2_020cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c2_025cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c2_030cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c2_035cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c2_040cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c2_045cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c2_050cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p15c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p15c2_055cc_Rp =  Rp_vw_cc;
abs_mix_d0p15c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c1_005cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c1_010cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c1_015cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c1_020cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c1_025cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c1_030cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c1_035cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c1_040cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c1_045cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c1_050cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c1_055cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c2_005cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c2_010cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c2_015cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c2_020cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c2_025cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c2_030cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c2_035cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c2_040cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c2_045cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c2_050cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p20c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p20c2_055cc_Rp =  Rp_vw_cc;
abs_mix_d0p20c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c1_005cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c1_010cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c1_015cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c1_020cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c1_025cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c1_030cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c1_035cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c1_040cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c1_045cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c1_050cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c1_055cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c2_005cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c2_010cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c2_015cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c2_020cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c2_025cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c2_030cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c2_035cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c2_040cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c2_045cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c2_050cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p25c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p25c2_055cc_Rp =  Rp_vw_cc;
abs_mix_d0p25c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c1_005cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c1_010cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c1_015cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c1_020cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c1_025cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c1_030cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c1_035cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c1_040cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c1_045cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c1_050cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c1_055cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c2_005cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c2_010cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c2_015cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c2_020cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c2_025cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c2_030cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c2_035cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c2_040cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c2_045cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c2_050cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p30c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p30c2_055cc_Rp =  Rp_vw_cc;
abs_mix_d0p30c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c1_005cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c1_010cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c1_015cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c1_020cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c1_025cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c1_030cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c1_035cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c1_040cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c1_045cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c1_050cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c1_055cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c2_005cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c2_010cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c2_015cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c2_020cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c2_025cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c2_030cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c2_035cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c2_040cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c2_045cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c2_050cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\abs_mix_d0p35c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_mix_d0p35c2_055cc_Rp =  Rp_vw_cc;
abs_mix_d0p35c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c1_005cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c1_010cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c1_015cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c1_020cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c1_025cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c1_030cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c1_035cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c1_040cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c1_045cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c1_050cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c1_055cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c2_005cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c2_010cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c2_015cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c2_020cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c2_025cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c2_030cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c2_035cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c2_040cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c2_045cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c2_050cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p5c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p5c2_055cc_Rp =  Rp_vw_cc;
sq_mix_d0p5c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c1_005cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c1_010cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c1_015cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c1_020cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c1_025cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c1_030cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c1_035cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c1_040cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c1_045cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c1_050cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c1_055cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c2_005cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c2_010cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c2_015cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c2_020cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c2_025cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c2_030cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c2_035cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c2_040cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c2_045cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c2_050cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p10c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p10c2_055cc_Rp =  Rp_vw_cc;
sq_mix_d0p10c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c1_005cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c1_010cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c1_015cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c1_020cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c1_025cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c1_030cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c1_035cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c1_040cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c1_045cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c1_050cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c1_055cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c2_005cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c2_010cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c2_015cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c2_020cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c2_025cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c2_030cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c2_035cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c2_040cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c2_045cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c2_050cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p15c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p15c2_055cc_Rp =  Rp_vw_cc;
sq_mix_d0p15c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c1_005cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c1_010cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c1_015cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c1_020cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c1_025cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c1_030cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c1_035cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c1_040cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c1_045cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c1_050cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c1_055cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c2_005cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c2_010cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c2_015cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c2_020cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c2_025cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c2_030cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c2_035cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c2_040cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c2_045cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c2_050cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p20c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p20c2_055cc_Rp =  Rp_vw_cc;
sq_mix_d0p20c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c1_005cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c1_010cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c1_015cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c1_020cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c1_025cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c1_030cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c1_035cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c1_040cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c1_045cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c1_050cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c1_055cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c2_005cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c2_010cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c2_015cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c2_020cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c2_025cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c2_030cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c2_035cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c2_040cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c2_045cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c2_050cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p25c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p25c2_055cc_Rp =  Rp_vw_cc;
sq_mix_d0p25c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c1_005cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c1_010cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c1_015cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c1_020cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c1_025cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c1_030cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c1_035cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c1_040cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c1_045cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c1_050cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c1_055cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c2_005cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c2_010cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c2_015cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c2_020cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c2_025cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c2_030cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c2_035cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c2_040cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c2_045cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c2_050cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p30c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p30c2_055cc_Rp =  Rp_vw_cc;
sq_mix_d0p30c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c1_005cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c1_010cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c1_015cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c1_020cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c1_025cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c1_030cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c1_035cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c1_040cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c1_045cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c1_050cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c1_055cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c2_005cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c2_010cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c2_015cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c2_020cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c2_025cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c2_030cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c2_035cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c2_040cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c2_045cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c2_050cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_mix\sq_mix_d0p35c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_mix_d0p35c2_055cc_Rp =  Rp_vw_cc;
sq_mix_d0p35c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c1_005cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c1_010cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c1_015cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c1_020cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c1_025cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c1_030cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c1_035cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c1_040cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c1_045cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c1_050cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c1_055cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c2_005cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c2_010cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c2_015cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c2_020cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c2_025cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c2_030cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c2_035cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c2_040cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c2_045cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c2_050cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p5c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p5c2_055cc_Rp =  Rp_vw_cc;
abs_nomix_d0p5c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c1_005cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c1_010cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c1_015cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c1_020cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c1_025cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c1_030cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c1_035cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c1_040cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c1_045cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c1_050cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c1_055cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c2_005cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c2_010cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c2_015cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c2_020cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c2_025cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c2_030cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c2_035cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c2_040cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c2_045cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c2_050cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p10c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p10c2_055cc_Rp =  Rp_vw_cc;
abs_nomix_d0p10c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c1_005cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c1_010cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c1_015cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c1_020cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c1_025cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c1_030cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c1_035cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c1_040cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c1_045cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c1_050cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c1_055cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c2_005cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c2_010cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c2_015cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c2_020cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c2_025cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c2_030cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c2_035cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c2_040cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c2_045cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c2_050cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p15c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p15c2_055cc_Rp =  Rp_vw_cc;
abs_nomix_d0p15c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c1_005cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c1_010cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c1_015cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c1_020cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c1_025cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c1_030cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c1_035cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c1_040cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c1_045cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c1_050cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c1_055cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c2_005cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c2_010cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c2_015cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c2_020cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c2_025cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c2_030cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c2_035cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c2_040cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c2_045cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c2_050cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p20c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p20c2_055cc_Rp =  Rp_vw_cc;
abs_nomix_d0p20c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c1_005cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c1_010cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c1_015cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c1_020cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c1_025cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c1_030cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c1_035cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c1_040cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c1_045cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c1_050cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c1_055cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c2_005cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c2_010cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c2_015cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c2_020cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c2_025cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c2_030cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c2_035cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c2_040cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c2_045cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c2_050cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p25c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p25c2_055cc_Rp =  Rp_vw_cc;
abs_nomix_d0p25c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c1_005cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c1_010cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c1_015cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c1_020cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c1_025cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c1_030cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c1_035cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c1_040cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c1_045cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c1_050cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c1_055cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c2_005cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c2_010cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c2_015cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c2_020cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c2_025cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c2_030cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c2_035cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c2_040cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c2_045cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c2_050cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p30c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p30c2_055cc_Rp =  Rp_vw_cc;
abs_nomix_d0p30c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c1_005cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c1_010cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c1_015cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c1_020cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c1_025cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c1_030cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c1_035cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c1_040cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c1_045cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c1_050cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c1_055cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c2_005cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c2_010cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c2_015cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c2_020cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c2_025cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c2_030cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c2_035cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c2_040cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c2_045cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c2_050cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\abs_nomix_d0p35c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
abs_nomix_d0p35c2_055cc_Rp =  Rp_vw_cc;
abs_nomix_d0p35c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c1_005cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c1_010cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c1_015cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c1_020cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c1_025cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c1_030cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c1_035cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c1_040cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c1_045cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c1_050cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c1_055cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c2_005cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c2_010cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c2_015cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c2_020cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c2_025cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c2_030cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c2_035cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c2_040cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c2_045cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c2_050cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p5c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p5c2_055cc_Rp =  Rp_vw_cc;
sq_nomix_d0p5c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c1_005cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c1_010cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c1_015cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c1_020cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c1_025cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c1_030cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c1_035cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c1_040cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c1_045cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c1_050cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c1_055cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c2_005cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c2_010cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c2_015cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c2_020cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c2_025cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c2_030cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c2_035cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c2_040cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c2_045cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c2_050cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p10c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p10c2_055cc_Rp =  Rp_vw_cc;
sq_nomix_d0p10c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c1_005cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c1_010cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c1_015cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c1_020cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c1_025cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c1_030cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c1_035cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c1_040cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c1_045cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c1_050cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c1_055cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c2_005cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c2_010cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c2_015cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c2_020cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c2_025cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c2_030cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c2_035cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c2_040cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c2_045cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c2_050cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p15c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p15c2_055cc_Rp =  Rp_vw_cc;
sq_nomix_d0p15c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c1_005cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c1_010cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c1_015cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c1_020cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c1_025cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c1_030cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c1_035cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c1_040cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c1_045cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c1_050cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c1_055cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c2_005cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c2_010cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c2_015cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c2_020cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c2_025cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c2_030cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c2_035cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c2_040cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c2_045cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c2_050cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p20c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p20c2_055cc_Rp =  Rp_vw_cc;
sq_nomix_d0p20c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c1_005cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c1_010cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c1_015cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c1_020cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c1_025cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c1_030cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c1_035cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c1_040cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c1_045cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c1_050cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c1_055cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c2_005cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c2_010cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c2_015cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c2_020cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c2_025cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c2_030cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c2_035cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c2_040cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c2_045cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c2_050cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p25c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p25c2_055cc_Rp =  Rp_vw_cc;
sq_nomix_d0p25c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c1_005cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c1_010cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c1_015cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c1_020cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c1_025cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c1_030cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c1_035cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c1_040cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c1_045cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c1_050cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c1_055cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c2_005cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c2_010cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c2_015cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c2_020cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c2_025cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c2_030cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c2_035cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c2_040cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c2_045cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c2_050cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p30c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p30c2_055cc_Rp =  Rp_vw_cc;
sq_nomix_d0p30c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c1_005cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c1_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c1_010cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c1_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c1_015cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c1_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c1_020cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c1_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c1_025cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c1_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c1_030cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c1_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c1_035cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c1_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c1_040cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c1_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c1_045cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c1_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c1_050cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c1_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c1_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c1_055cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c1_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.05.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c2_005cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c2_005fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.10.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c2_010cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c2_010fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.15.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c2_015cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c2_015fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.20.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c2_020cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c2_020fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.25.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c2_025cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c2_025fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.30.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c2_030cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c2_030fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.35.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c2_035cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c2_035fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.40.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c2_040cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c2_040fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.45.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c2_045cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c2_045fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.50.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c2_050cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c2_050fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\abs_sq_nomix\sqp_nomix_d0p35c2_0.55.mat','Rp_vw_cc', 'Rp_vw_fi');
sq_nomix_d0p35c2_055cc_Rp =  Rp_vw_cc;
sq_nomix_d0p35c2_055fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c1_sq0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c1_sq05cc_Rp =  Rp_vw_cc;
d0p5c1_sq05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c1_sq1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c1_sq10cc_Rp =  Rp_vw_cc;
d0p5c1_sq10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c1_sq1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c1_sq15cc_Rp =  Rp_vw_cc;
d0p5c1_sq15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c1_sq2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c1_sq20cc_Rp =  Rp_vw_cc;
d0p5c1_sq20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c1_sq2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c1_sq25cc_Rp =  Rp_vw_cc;
d0p5c1_sq25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c1_sq3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c1_sq30cc_Rp =  Rp_vw_cc;
d0p5c1_sq30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c2_sq0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c2_sq05cc_Rp =  Rp_vw_cc;
d0p5c2_sq05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c2_sq1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c2_sq10cc_Rp =  Rp_vw_cc;
d0p5c2_sq10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c2_sq1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c2_sq15cc_Rp =  Rp_vw_cc;
d0p5c2_sq15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c2_sq2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c2_sq20cc_Rp =  Rp_vw_cc;
d0p5c2_sq20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c2_sq2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c2_sq25cc_Rp =  Rp_vw_cc;
d0p5c2_sq25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p5c2_sq3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c2_sq30cc_Rp =  Rp_vw_cc;
d0p5c2_sq30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c1_sq0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c1_sq05cc_Rp =  Rp_vw_cc;
d0p10c1_sq05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c1_sq1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c1_sq10cc_Rp =  Rp_vw_cc;
d0p10c1_sq10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c1_sq1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c1_sq15cc_Rp =  Rp_vw_cc;
d0p10c1_sq15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c1_sq2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c1_sq20cc_Rp =  Rp_vw_cc;
d0p10c1_sq20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c1_sq2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c1_sq25cc_Rp =  Rp_vw_cc;
d0p10c1_sq25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c1_sq3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c1_sq30cc_Rp =  Rp_vw_cc;
d0p10c1_sq30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c2_sq0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c2_sq05cc_Rp =  Rp_vw_cc;
d0p10c2_sq05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c2_sq1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c2_sq10cc_Rp =  Rp_vw_cc;
d0p10c2_sq10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c2_sq1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c2_sq15cc_Rp =  Rp_vw_cc;
d0p10c2_sq15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c2_sq2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c2_sq20cc_Rp =  Rp_vw_cc;
d0p10c2_sq20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c2_sq2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c2_sq25cc_Rp =  Rp_vw_cc;
d0p10c2_sq25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p10c2_sq3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c2_sq30cc_Rp =  Rp_vw_cc;
d0p10c2_sq30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c1_sq0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c1_sq05cc_Rp =  Rp_vw_cc;
d0p15c1_sq05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c1_sq1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c1_sq10cc_Rp =  Rp_vw_cc;
d0p15c1_sq10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c1_sq1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c1_sq15cc_Rp =  Rp_vw_cc;
d0p15c1_sq15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c1_sq2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c1_sq20cc_Rp =  Rp_vw_cc;
d0p15c1_sq20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c1_sq2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c1_sq25cc_Rp =  Rp_vw_cc;
d0p15c1_sq25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c1_sq3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c1_sq30cc_Rp =  Rp_vw_cc;
d0p15c1_sq30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c2_sq0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c2_sq05cc_Rp =  Rp_vw_cc;
d0p15c2_sq05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c2_sq1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c2_sq10cc_Rp =  Rp_vw_cc;
d0p15c2_sq10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c2_sq1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c2_sq15cc_Rp =  Rp_vw_cc;
d0p15c2_sq15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c2_sq2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c2_sq20cc_Rp =  Rp_vw_cc;
d0p15c2_sq20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c2_sq2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c2_sq25cc_Rp =  Rp_vw_cc;
d0p15c2_sq25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p15c2_sq3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c2_sq30cc_Rp =  Rp_vw_cc;
d0p15c2_sq30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c1_sq0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c1_sq05cc_Rp =  Rp_vw_cc;
d0p20c1_sq05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c1_sq1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c1_sq10cc_Rp =  Rp_vw_cc;
d0p20c1_sq10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c1_sq1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c1_sq15cc_Rp =  Rp_vw_cc;
d0p20c1_sq15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c1_sq2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c1_sq20cc_Rp =  Rp_vw_cc;
d0p20c1_sq20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c1_sq2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c1_sq25cc_Rp =  Rp_vw_cc;
d0p20c1_sq25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c1_sq3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c1_sq30cc_Rp =  Rp_vw_cc;
d0p20c1_sq30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c2_sq0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c2_sq05cc_Rp =  Rp_vw_cc;
d0p20c2_sq05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c2_sq1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c2_sq10cc_Rp =  Rp_vw_cc;
d0p20c2_sq10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c2_sq1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c2_sq15cc_Rp =  Rp_vw_cc;
d0p20c2_sq15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c2_sq2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c2_sq20cc_Rp =  Rp_vw_cc;
d0p20c2_sq20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c2_sq2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c2_sq25cc_Rp =  Rp_vw_cc;
d0p20c2_sq25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p20c2_sq3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c2_sq30cc_Rp =  Rp_vw_cc;
d0p20c2_sq30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c1_sq0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c1_sq05cc_Rp =  Rp_vw_cc;
d0p25c1_sq05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c1_sq1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c1_sq10cc_Rp =  Rp_vw_cc;
d0p25c1_sq10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c1_sq1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c1_sq15cc_Rp =  Rp_vw_cc;
d0p25c1_sq15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c1_sq2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c1_sq20cc_Rp =  Rp_vw_cc;
d0p25c1_sq20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c1_sq2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c1_sq25cc_Rp =  Rp_vw_cc;
d0p25c1_sq25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c1_sq3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c1_sq30cc_Rp =  Rp_vw_cc;
d0p25c1_sq30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c2_sq0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c2_sq05cc_Rp =  Rp_vw_cc;
d0p25c2_sq05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c2_sq1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c2_sq10cc_Rp =  Rp_vw_cc;
d0p25c2_sq10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c2_sq1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c2_sq15cc_Rp =  Rp_vw_cc;
d0p25c2_sq15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c2_sq2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c2_sq20cc_Rp =  Rp_vw_cc;
d0p25c2_sq20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c2_sq2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c2_sq25cc_Rp =  Rp_vw_cc;
d0p25c2_sq25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p25c2_sq3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c2_sq30cc_Rp =  Rp_vw_cc;
d0p25c2_sq30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c1_sq0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c1_sq05cc_Rp =  Rp_vw_cc;
d0p30c1_sq05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c1_sq1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c1_sq10cc_Rp =  Rp_vw_cc;
d0p30c1_sq10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c1_sq1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c1_sq15cc_Rp =  Rp_vw_cc;
d0p30c1_sq15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c1_sq2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c1_sq20cc_Rp =  Rp_vw_cc;
d0p30c1_sq20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c1_sq2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c1_sq25cc_Rp =  Rp_vw_cc;
d0p30c1_sq25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c1_sq3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c1_sq30cc_Rp =  Rp_vw_cc;
d0p30c1_sq30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c2_sq0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c2_sq05cc_Rp =  Rp_vw_cc;
d0p30c2_sq05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c2_sq1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c2_sq10cc_Rp =  Rp_vw_cc;
d0p30c2_sq10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c2_sq1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c2_sq15cc_Rp =  Rp_vw_cc;
d0p30c2_sq15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c2_sq2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c2_sq20cc_Rp =  Rp_vw_cc;
d0p30c2_sq20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c2_sq2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c2_sq25cc_Rp =  Rp_vw_cc;
d0p30c2_sq25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p30c2_sq3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c2_sq30cc_Rp =  Rp_vw_cc;
d0p30c2_sq30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c1_sq0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c1_sq05cc_Rp =  Rp_vw_cc;
d0p35c1_sq05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c1_sq1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c1_sq10cc_Rp =  Rp_vw_cc;
d0p35c1_sq10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c1_sq1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c1_sq15cc_Rp =  Rp_vw_cc;
d0p35c1_sq15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c1_sq2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c1_sq20cc_Rp =  Rp_vw_cc;
d0p35c1_sq20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c1_sq2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c1_sq25cc_Rp =  Rp_vw_cc;
d0p35c1_sq25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c1_sq3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c1_sq30cc_Rp =  Rp_vw_cc;
d0p35c1_sq30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c2_sq0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c2_sq05cc_Rp =  Rp_vw_cc;
d0p35c2_sq05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c2_sq1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c2_sq10cc_Rp =  Rp_vw_cc;
d0p35c2_sq10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c2_sq1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c2_sq15cc_Rp =  Rp_vw_cc;
d0p35c2_sq15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c2_sq2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c2_sq20cc_Rp =  Rp_vw_cc;
d0p35c2_sq20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c2_sq2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c2_sq25cc_Rp =  Rp_vw_cc;
d0p35c2_sq25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_sq\d0p35c2_sq3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c2_sq30cc_Rp =  Rp_vw_cc;
d0p35c2_sq30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c1_abs0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c1_abs05cc_Rp =  Rp_vw_cc;
d0p5c1_abs05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c1_abs1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c1_abs10cc_Rp =  Rp_vw_cc;
d0p5c1_abs10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c1_abs1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c1_abs15cc_Rp =  Rp_vw_cc;
d0p5c1_abs15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c1_abs2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c1_abs20cc_Rp =  Rp_vw_cc;
d0p5c1_abs20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c1_abs2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c1_abs25cc_Rp =  Rp_vw_cc;
d0p5c1_abs25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c1_abs3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c1_abs30cc_Rp =  Rp_vw_cc;
d0p5c1_abs30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c2_abs0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c2_abs05cc_Rp =  Rp_vw_cc;
d0p5c2_abs05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c2_abs1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c2_abs10cc_Rp =  Rp_vw_cc;
d0p5c2_abs10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c2_abs1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c2_abs15cc_Rp =  Rp_vw_cc;
d0p5c2_abs15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c2_abs2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c2_abs20cc_Rp =  Rp_vw_cc;
d0p5c2_abs20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c2_abs2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c2_abs25cc_Rp =  Rp_vw_cc;
d0p5c2_abs25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p5c2_abs3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p5c2_abs30cc_Rp =  Rp_vw_cc;
d0p5c2_abs30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c1_abs0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c1_abs05cc_Rp =  Rp_vw_cc;
d0p10c1_abs05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c1_abs1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c1_abs10cc_Rp =  Rp_vw_cc;
d0p10c1_abs10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c1_abs1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c1_abs15cc_Rp =  Rp_vw_cc;
d0p10c1_abs15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c1_abs2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c1_abs20cc_Rp =  Rp_vw_cc;
d0p10c1_abs20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c1_abs2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c1_abs25cc_Rp =  Rp_vw_cc;
d0p10c1_abs25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c1_abs3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c1_abs30cc_Rp =  Rp_vw_cc;
d0p10c1_abs30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c2_abs0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c2_abs05cc_Rp =  Rp_vw_cc;
d0p10c2_abs05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c2_abs1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c2_abs10cc_Rp =  Rp_vw_cc;
d0p10c2_abs10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c2_abs1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c2_abs15cc_Rp =  Rp_vw_cc;
d0p10c2_abs15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c2_abs2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c2_abs20cc_Rp =  Rp_vw_cc;
d0p10c2_abs20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c2_abs2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c2_abs25cc_Rp =  Rp_vw_cc;
d0p10c2_abs25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p10c2_abs3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p10c2_abs30cc_Rp =  Rp_vw_cc;
d0p10c2_abs30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c1_abs0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c1_abs05cc_Rp =  Rp_vw_cc;
d0p15c1_abs05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c1_abs1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c1_abs10cc_Rp =  Rp_vw_cc;
d0p15c1_abs10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c1_abs1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c1_abs15cc_Rp =  Rp_vw_cc;
d0p15c1_abs15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c1_abs2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c1_abs20cc_Rp =  Rp_vw_cc;
d0p15c1_abs20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c1_abs2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c1_abs25cc_Rp =  Rp_vw_cc;
d0p15c1_abs25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c1_abs3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c1_abs30cc_Rp =  Rp_vw_cc;
d0p15c1_abs30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c2_abs0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c2_abs05cc_Rp =  Rp_vw_cc;
d0p15c2_abs05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c2_abs1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c2_abs10cc_Rp =  Rp_vw_cc;
d0p15c2_abs10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c2_abs1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c2_abs15cc_Rp =  Rp_vw_cc;
d0p15c2_abs15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c2_abs2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c2_abs20cc_Rp =  Rp_vw_cc;
d0p15c2_abs20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c2_abs2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c2_abs25cc_Rp =  Rp_vw_cc;
d0p15c2_abs25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p15c2_abs3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p15c2_abs30cc_Rp =  Rp_vw_cc;
d0p15c2_abs30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c1_abs0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c1_abs05cc_Rp =  Rp_vw_cc;
d0p20c1_abs05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c1_abs1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c1_abs10cc_Rp =  Rp_vw_cc;
d0p20c1_abs10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c1_abs1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c1_abs15cc_Rp =  Rp_vw_cc;
d0p20c1_abs15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c1_abs2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c1_abs20cc_Rp =  Rp_vw_cc;
d0p20c1_abs20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c1_abs2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c1_abs25cc_Rp =  Rp_vw_cc;
d0p20c1_abs25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c1_abs3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c1_abs30cc_Rp =  Rp_vw_cc;
d0p20c1_abs30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c2_abs0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c2_abs05cc_Rp =  Rp_vw_cc;
d0p20c2_abs05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c2_abs1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c2_abs10cc_Rp =  Rp_vw_cc;
d0p20c2_abs10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c2_abs1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c2_abs15cc_Rp =  Rp_vw_cc;
d0p20c2_abs15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c2_abs2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c2_abs20cc_Rp =  Rp_vw_cc;
d0p20c2_abs20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c2_abs2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c2_abs25cc_Rp =  Rp_vw_cc;
d0p20c2_abs25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p20c2_abs3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p20c2_abs30cc_Rp =  Rp_vw_cc;
d0p20c2_abs30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c1_abs0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c1_abs05cc_Rp =  Rp_vw_cc;
d0p25c1_abs05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c1_abs1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c1_abs10cc_Rp =  Rp_vw_cc;
d0p25c1_abs10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c1_abs1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c1_abs15cc_Rp =  Rp_vw_cc;
d0p25c1_abs15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c1_abs2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c1_abs20cc_Rp =  Rp_vw_cc;
d0p25c1_abs20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c1_abs2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c1_abs25cc_Rp =  Rp_vw_cc;
d0p25c1_abs25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c1_abs3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c1_abs30cc_Rp =  Rp_vw_cc;
d0p25c1_abs30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c2_abs0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c2_abs05cc_Rp =  Rp_vw_cc;
d0p25c2_abs05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c2_abs1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c2_abs10cc_Rp =  Rp_vw_cc;
d0p25c2_abs10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c2_abs1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c2_abs15cc_Rp =  Rp_vw_cc;
d0p25c2_abs15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c2_abs2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c2_abs20cc_Rp =  Rp_vw_cc;
d0p25c2_abs20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c2_abs2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c2_abs25cc_Rp =  Rp_vw_cc;
d0p25c2_abs25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p25c2_abs3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p25c2_abs30cc_Rp =  Rp_vw_cc;
d0p25c2_abs30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c1_abs0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c1_abs05cc_Rp =  Rp_vw_cc;
d0p30c1_abs05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c1_abs1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c1_abs10cc_Rp =  Rp_vw_cc;
d0p30c1_abs10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c1_abs1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c1_abs15cc_Rp =  Rp_vw_cc;
d0p30c1_abs15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c1_abs2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c1_abs20cc_Rp =  Rp_vw_cc;
d0p30c1_abs20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c1_abs2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c1_abs25cc_Rp =  Rp_vw_cc;
d0p30c1_abs25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c1_abs3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c1_abs30cc_Rp =  Rp_vw_cc;
d0p30c1_abs30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c2_abs0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c2_abs05cc_Rp =  Rp_vw_cc;
d0p30c2_abs05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c2_abs1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c2_abs10cc_Rp =  Rp_vw_cc;
d0p30c2_abs10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c2_abs1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c2_abs15cc_Rp =  Rp_vw_cc;
d0p30c2_abs15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c2_abs2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c2_abs20cc_Rp =  Rp_vw_cc;
d0p30c2_abs20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c2_abs2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c2_abs25cc_Rp =  Rp_vw_cc;
d0p30c2_abs25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p30c2_abs3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p30c2_abs30cc_Rp =  Rp_vw_cc;
d0p30c2_abs30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c1_abs0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c1_abs05cc_Rp =  Rp_vw_cc;
d0p35c1_abs05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c1_abs1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c1_abs10cc_Rp =  Rp_vw_cc;
d0p35c1_abs10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c1_abs1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c1_abs15cc_Rp =  Rp_vw_cc;
d0p35c1_abs15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c1_abs2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c1_abs20cc_Rp =  Rp_vw_cc;
d0p35c1_abs20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c1_abs2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c1_abs25cc_Rp =  Rp_vw_cc;
d0p35c1_abs25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c1_abs3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c1_abs30cc_Rp =  Rp_vw_cc;
d0p35c1_abs30fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c2_abs0.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c2_abs05cc_Rp =  Rp_vw_cc;
d0p35c2_abs05fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c2_abs1.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c2_abs10cc_Rp =  Rp_vw_cc;
d0p35c2_abs10fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c2_abs1.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c2_abs15cc_Rp =  Rp_vw_cc;
d0p35c2_abs15fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c2_abs2.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c2_abs20cc_Rp =  Rp_vw_cc;
d0p35c2_abs20fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c2_abs2.5.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c2_abs25cc_Rp =  Rp_vw_cc;
d0p35c2_abs25fi_Rp =  Rp_vw_fi;

load('C:\Users\Fernando\Desktop\paper1\rev_1806\dist_abs\d0p35c2_abs3.0.mat','Rp_vw_cc', 'Rp_vw_fi');
d0p35c2_abs30cc_Rp =  Rp_vw_cc;
d0p35c2_abs30fi_Rp =  Rp_vw_fi;

L=6425; T=252;

endDate=datenum('1-02-2016');
startDate=datenum('7/2/1991');
startDate=endDate-8948;
xData = linspace(startDate,endDate,L-T);
xData2 = linspace(startDate,endDate,13);

%cumprod(1+abs_mix_d0p5c1_020cc_Rp) cumprod(1+d0p5c1_abs20cc_Rp)
%legend('Mixed Copula (SSE)' , 'Mixed Copula (LAD)','Distance (SSE)', 'Distance (LAD)','Location','northwest');


figure(3);
subplot(3,2,1);
p1= plot(xData,cumprod(1+sq_mix_d0p5c1_020cc_Rp),'-.',xData,cumprod(1+d0p5c1_sq20cc_Rp));
ylim([0.5 3])
%legend('Mixed Copula', 'Distance','Location','northwest');
set(legend,'FontSize',7);
%legend boxoff;
set(gca,'XTick',xData2, 'FontSize', 8);
datetick('x','yy','keepticks');
ylabel('Cumulative Excess Return', 'FontSize', 8);
xlabel('Year');
title('(a) Top 5 pairs, Committed Capital, after costs','FontSize', 5);
grid on

% h = findobj(gca, 'type', 'text');
% %set(gca,'fontsize',11) % Fontsize axis
% set(h, 'Interpreter', 'tex','FontSize',10);
% ylabel('Annualized Return (%)','FontSize', 17);
% xlabel('Opening Threshold','FontSize', 17);
% title('Sensitivity Analysis on Committed Capital','FontSize', 14);

subplot(3,2,2);
p2= plot(xData,cumprod(1+sq_mix_d0p5c1_020fi_Rp),'-.',xData,cumprod(1+d0p5c1_sq20fi_Rp));
ylim([0 20])
%legend('Mixed Copula', 'Distance','Location','northwest');
set(legend,'FontSize',7);
%legend boxoff;
set(gca,'XTick',xData2, 'FontSize', 8);
datetick('x','yy','keepticks');
ylabel('Cumulative Excess Return', 'FontSize', 8);
xlabel('Year');
title('(a) Top 5 pairs, Fully Invested, after costs','FontSize', 5);
grid on

subplot(3,2,3);
p3= plot(xData,cumprod(1+sq_mix_d0p20c1_020cc_Rp),'-.',xData,cumprod(1+d0p20c1_sq20cc_Rp));
ylim([0.5 2.5])
%legend('Mixed Copula', 'Distance','Location','northwest');
set(legend,'FontSize',7);
%legend boxoff;
set(gca,'XTick',xData2, 'FontSize', 8);
datetick('x','yy','keepticks');
ylabel('Cumulative Excess Return', 'FontSize', 8);
xlabel('Year');
title('(a) Top 20 pairs, Committed Capital, after costs','FontSize', 5);
grid on

subplot(3,2,4);
p4= plot(xData,cumprod(1+sq_mix_d0p20c1_020fi_Rp),'-.',xData,cumprod(1+d0p20c1_sq20fi_Rp));
ylim([0 20])
%legend('Mixed Copula', 'Distance','Location','northwest');
set(legend,'FontSize',7);
%legend boxoff;
set(gca,'XTick',xData2, 'FontSize', 8);
datetick('x','yy','keepticks');
ylabel('Cumulative Excess Return', 'FontSize', 8);
xlabel('Year');
title('(a) Top 20 pairs, Fully Invested, after costs', 'FontSize', 5);
grid on

subplot(3,2,5);
p5= plot(xData,cumprod(1+sq_mix_d0p35c1_020cc_Rp),'-.',xData,cumprod(1+d0p35c1_sq20cc_Rp));
ylim([0.5 2.5])
%legend('Mixed Copula', 'Distance','Location','northwest');
set(legend,'FontSize',7);
%legend boxoff;
set(gca,'XTick',xData2, 'FontSize', 8);
datetick('x','yy','keepticks');
ylabel('Cumulative Excess Return', 'FontSize', 8);
xlabel('Year');
title('(a) Top 35 pairs, Committed Capital, after costs', 'FontSize', 5);
grid on

subplot(3,2,6);
p6= plot(xData,cumprod(1+sq_mix_d0p35c1_020fi_Rp),'-.',xData,cumprod(1+d0p35c1_sq20fi_Rp));
ylim([0 25])
legend('Mixed Copula', 'Distance','Location','northwest');
set(legend,'FontSize',7);
%legend boxoff;
set(gca,'XTick',xData2, 'FontSize', 8);
datetick('x','yy','keepticks');
ylabel('Cumulative Excess Return', 'FontSize', 8);
xlabel('Year');
title('(a) Top 35 pairs, Fully Invested, after costs', 'FontSize', 5);
grid on

legend1 = legend(p6,'Mixed Copula','Distance');
set(legend1,'Orientation','horizontal',...
    'Position',[0.361904761904761 0.0341269841269841 0.335119047619048 0.0428571428571429],...
    'FontSize',9);

a=gcf;
set(a,'PaperOrientation','landscape');
set(a,'PaperUnits','normalized');
set(a,'PaperPosition', [0 0 1 1]);
set(findobj(gcf,'Type','text'),'FontSize',10)
print(gcf,'-dpdf','C:\Users\fsabino\Dropbox\Pairs_Trading_Distance_and_Mixed_Copula\paper_elsevier\Figure3.pdf')

%matlab2tikz('C:\Users\fsabino\Dropbox\Pairs_Trading_Distance_and_Mixed_Copula\paper_elsevier\fig3.tex');

startDate=datenum('7/2/1996');
endDate=datenum('1/2/2016');
xData = linspace(startDate,endDate,L-T-1260);
xData2 = linspace(startDate,endDate,12);

sq_mix_d0p5c1_020cc_SR = zeros(6173-1260,1); abs_mix_d0p5c1_020cc_SR = zeros(6173-1260,1);
d0p5c1_sq20cc_SR = zeros(6173-1260,1); d0p5c1_abs20cc_SR = zeros(6173-1260,1);
sq_mix_d0p5c1_020fi_SR = zeros(6173-1260,1); abs_mix_d0p5c1_020fi_SR = zeros(6173-1260,1);
d0p5c1_sq20fi_SR = zeros(6173-1260,1); d0p5c1_abs20fi_SR = zeros(6173-1260,1);
sq_mix_d0p20c1_020cc_SR = zeros(6173-1260,1); abs_mix_d0p20c1_020cc_SR = zeros(6173-1260,1);
d0p20c1_sq20cc_SR = zeros(6173-1260,1); d0p20c1_abs20cc_SR = zeros(6173-1260,1);
sq_mix_d0p20c1_020fi_SR = zeros(6173-1260,1); abs_mix_d0p20c1_020fi_SR = zeros(6173-1260,1);
d0p20c1_sq20fi_SR = zeros(6173-1260,1); d0p20c1_abs20fi_SR = zeros(6173-1260,1);
sq_mix_d0p35c1_020cc_SR = zeros(6173-1260,1); abs_mix_d0p35c1_020cc_SR = zeros(6173-1260,1);
d0p35c1_sq20cc_SR = zeros(6173-1260,1); d0p35c1_abs20cc_SR = zeros(6173-1260,1);
sq_mix_d0p35c1_020fi_SR = zeros(6173-1260,1); abs_mix_d0p35c1_020fi_SR = zeros(6173-1260,1);
d0p35c1_sq20fi_SR = zeros(6173-1260,1); d0p35c1_abs20fi_SR = zeros(6173-1260,1);

j=1;
    for i = 1:(6173-1260)
        
    sq_mix_d0p5c1_020cc_SR(i,j) = (((mean(1+sq_mix_d0p5c1_020cc_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(sq_mix_d0p5c1_020cc_Rp(i:1260+i,j)));
    abs_mix_d0p5c1_020cc_SR(i,j) = (((mean(1+abs_mix_d0p5c1_020cc_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(abs_mix_d0p5c1_020cc_Rp(i:1260+i,j)));
    d0p5c1_sq20cc_SR(i,j) = (((mean(1+d0p5c1_sq20cc_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(d0p5c1_sq20cc_Rp(i:1260+i,j)));
    d0p5c1_abs20cc_SR(i,j) = (((mean(1+d0p5c1_abs20cc_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(d0p5c1_abs20cc_Rp(i:1260+i,j)));
    sq_mix_d0p5c1_020fi_SR(i,j) = (((mean(1+sq_mix_d0p5c1_020fi_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(sq_mix_d0p5c1_020fi_Rp(i:1260+i,j)));
    abs_mix_d0p5c1_020fi_SR(i,j) = (((mean(1+abs_mix_d0p5c1_020fi_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(abs_mix_d0p5c1_020fi_Rp(i:1260+i,j)));
    d0p5c1_sq20fi_SR(i,j) = (((mean(1+d0p5c1_sq20fi_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(d0p5c1_sq20fi_Rp(i:1260+i,j)));
    d0p5c1_abs20fi_SR(i,j) = (((mean(1+d0p5c1_abs20fi_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(d0p5c1_abs20fi_Rp(i:1260+i,j)));
    sq_mix_d0p20c1_020cc_SR(i,j) = (((mean(1+sq_mix_d0p20c1_020cc_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(sq_mix_d0p20c1_020cc_Rp(i:1260+i,j)));
    abs_mix_d0p20c1_020cc_SR(i,j) = (((mean(1+abs_mix_d0p20c1_020cc_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(abs_mix_d0p20c1_020cc_Rp(i:1260+i,j)));
    d0p20c1_sq20cc_SR(i,j) = (((mean(1+d0p20c1_sq20cc_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(d0p20c1_sq20cc_Rp(i:1260+i,j)));
    d0p20c1_abs20cc_SR(i,j) = (((mean(1+d0p20c1_abs20cc_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(d0p20c1_abs20cc_Rp(i:1260+i,j)));
    sq_mix_d0p20c1_020fi_SR(i,j) = (((mean(1+sq_mix_d0p20c1_020fi_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(sq_mix_d0p20c1_020fi_Rp(i:1260+i,j)));
    abs_mix_d0p20c1_020fi_SR(i,j) = (((mean(1+abs_mix_d0p20c1_020fi_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(abs_mix_d0p20c1_020fi_Rp(i:1260+i,j)));
    d0p20c1_sq20fi_SR(i,j) = (((mean(1+d0p20c1_sq20fi_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(d0p20c1_sq20fi_Rp(i:1260+i,j)));
    d0p20c1_abs20fi_SR(i,j) = (((mean(1+d0p20c1_abs20fi_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(d0p20c1_abs20fi_Rp(i:1260+i,j)));
    sq_mix_d0p35c1_020cc_SR(i,j) = (((mean(1+sq_mix_d0p35c1_020cc_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(sq_mix_d0p35c1_020cc_Rp(i:1260+i,j)));
    abs_mix_d0p35c1_020cc_SR(i,j) = (((mean(1+abs_mix_d0p35c1_020cc_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(abs_mix_d0p35c1_020cc_Rp(i:1260+i,j)));
    d0p35c1_sq20cc_SR(i,j) = (((mean(1+d0p35c1_sq20cc_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(d0p35c1_sq20cc_Rp(i:1260+i,j)));
    d0p35c1_abs20cc_SR(i,j) = (((mean(1+d0p35c1_abs20cc_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(d0p35c1_abs20cc_Rp(i:1260+i,j)));
    sq_mix_d0p35c1_020fi_SR(i,j) = (((mean(1+sq_mix_d0p35c1_020fi_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(sq_mix_d0p35c1_020fi_Rp(i:1260+i,j)));
    abs_mix_d0p35c1_020fi_SR(i,j) = (((mean(1+abs_mix_d0p35c1_020fi_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(abs_mix_d0p35c1_020fi_Rp(i:1260+i,j)));
    d0p35c1_sq20fi_SR(i,j) = (((mean(1+d0p35c1_sq20fi_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(d0p35c1_sq20fi_Rp(i:1260+i,j)));
    d0p35c1_abs20fi_SR(i,j) = (((mean(1+d0p35c1_abs20fi_Rp(i:1260+i,j)))^252)-1)/(sqrt(252)*std(d0p35c1_abs20fi_Rp(i:1260+i,j)));
    
    end

figure(4);
subplot(3,2,1);
p1=plot(xData,sq_mix_d0p5c1_020cc_SR,'-.',xData,d0p5c1_sq20cc_SR);
ylim([-0.5 1.5])
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',xData2, 'FontSize', 8);
datetick('x','yy','keepticks');
ylabel('Sharpe Ratio','FontSize', 8);
xlabel('Year','FontSize', 8);
title('(a) Top 5 pairs, Committed Capital, after costs', 'FontSize', 5);
grid on


subplot(3,2,2);
p2=plot(xData,sq_mix_d0p5c1_020fi_SR,'-.',xData,d0p5c1_sq20fi_SR);
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
ylim([-0.5 2])
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',xData2, 'FontSize', 8);
datetick('x','yy','keepticks');
ylabel('Sharpe Ratio','FontSize', 8);
xlabel('Year','FontSize', 8);
title('(a) Top 5 pairs, Fully Invested, after costs', 'FontSize', 5);
grid on

subplot(3,2,3);
p3=plot(xData,sq_mix_d0p20c1_020cc_SR,'-.',xData,d0p20c1_sq20cc_SR);
ylim([-0.5 2])
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',xData2, 'FontSize', 8);
datetick('x','yy','keepticks');
ylabel('Sharpe Ratio','FontSize', 8);
xlabel('Year','FontSize', 8);
title('(a) Top 20 pairs, Committed Capital, after costs', 'FontSize', 5);
grid on

subplot(3,2,4);
p4=plot(xData,sq_mix_d0p20c1_020fi_SR,'-.',xData,d0p20c1_sq20fi_SR);
ylim([-0.5 2])
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',xData2, 'FontSize', 8);
datetick('x','yy','keepticks');
ylabel('Sharpe Ratio','FontSize', 8);
xlabel('Year','FontSize', 8);
title('(a) Top 20 pairs, Fully Invested, after costs', 'FontSize', 5);
grid on

subplot(3,2,5);
p5=plot(xData,sq_mix_d0p35c1_020cc_SR,'-.',xData,d0p35c1_sq20cc_SR);
ylim([-0.5 2.5])
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',xData2, 'FontSize', 8);
datetick('x','yy','keepticks');
ylabel('Sharpe Ratio','FontSize', 8);
xlabel('Year','FontSize', 8);
title('(a) Top 35 pairs, Committed Capital, after costs', 'FontSize', 5);
grid on

subplot(3,2,6);
p6=plot(xData,sq_mix_d0p35c1_020fi_SR,'-.',xData,d0p35c1_sq20fi_SR);
ylim([-0.5 2.5])
legend('Mixed Copula','Distance','Orientation','horizontal');
set(legend,'FontSize',6);
%legend boxoff;
set(gca,'XTick',xData2, 'FontSize', 8);
datetick('x','yy','keepticks');
ylabel('Sharpe Ratio','FontSize', 8);
xlabel('Year','FontSize', 8);
title('(a) Top 35 pairs, Fully Invested, after costs', 'FontSize', 5);
grid on

legend1 = legend(p6,'Mixed Copula','Distance');
set(legend1,'Orientation','horizontal',...
    'Position',[0.361904761904761 0.0341269841269841 0.335119047619048 0.0428571428571429],...
    'FontSize',8);

a=gcf;
set(a,'PaperOrientation','landscape');
set(a,'PaperUnits','normalized');
set(a,'PaperPosition', [0 0 1 1]);
set(findobj(gcf,'Type','text'),'FontSize',10)
print(gcf,'-dpdf','C:\Users\fsabino\Dropbox\Pairs_Trading_Distance_and_Mixed_Copula\paper_elsevier\Figure4.pdf')




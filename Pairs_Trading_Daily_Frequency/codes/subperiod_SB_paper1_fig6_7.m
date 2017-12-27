addpath('C:\Users\fsabino\Desktop\Fernando\papers');
addpath('C:\Users\fsabino\Dropbox\paper1\PDS\Códigos\cvx\functions');
addpath('C:\Users\fsabino\Dropbox\paper1\PDS\Códigos\cvx\lib');
addpath('C:\Users\fsabino\Dropbox\codes');
% load boxs_Rp
% load SP500_p1
load sub_p1

% (1)1-1137; (2)1138-2400; (3)2401-3656; (4)3657-4915; (5) 4916-6173.
%%
mix5cc = sq_mix_d0p5c1_020cc_Rp;
mix5fi = sq_mix_d0p5c1_020fi_Rp;
mix20cc = sq_mix_d0p20c1_020cc_Rp;
mix20fi = sq_mix_d0p20c1_020fi_Rp;
mix35cc = sq_mix_d0p35c1_020cc_Rp;
mix35fi = sq_mix_d0p35c1_020fi_Rp;
dist5cc = d0p5c1_sq20cc_Rp;
dist5fi = d0p5c1_sq20fi_Rp;
dist20cc = d0p20c1_sq20cc_Rp;
dist20fi = d0p20c1_sq20fi_Rp;
dist35cc = d0p35c1_sq20cc_Rp;
dist35fi = d0p35c1_sq20fi_Rp;

mix5cc_Rp = stat2(1+mix5cc,1,3,0);
mix5fi_Rp = stat2(1+mix5fi,1,3,0);
mix20cc_Rp = stat2(1+mix20cc,1,3,0);
mix20fi_Rp = stat2(1+mix20fi,1,3,0);
mix35cc_Rp =  stat2(1+mix35cc,1,3,0);
mix35fi_Rp =  stat2(1+mix35fi,1,3,0);
dist5cc_Rp =  stat2(1+dist5cc,1,3,0);
dist5fi_Rp =  stat2(1+dist5fi,1,3,0);
dist20cc_Rp =  stat2(1+dist20cc,1,3,0);
dist20fi_Rp =  stat2(1+dist20fi,1,3,0);
dist35cc_Rp =  stat2(1+dist35cc,1,3,0);
dist35fi_Rp =  stat2(1+dist35fi,1,3,0);

RmRf_Rp = stat2(1+RmRf,1,3,0);

mix5cc_mr = (1+mix5cc_Rp(1,1))^252-1;
mix5fi_mr = (1+mix5fi_Rp(1,1))^252-1;
mix20cc_mr = (1+mix20cc_Rp(1,1))^252-1;
mix20fi_mr = (1+mix20fi_Rp(1,1))^252-1;
mix35cc_mr =  (1+mix35cc_Rp(1,1))^252-1;
mix35fi_mr =  (1+mix35fi_Rp(1,1))^252-1;
dist5cc_mr =  (1+dist5cc_Rp(1,1))^252-1;
dist5fi_mr =  (1+dist5fi_Rp(1,1))^252-1;
dist20cc_mr =  (1+dist20cc_Rp(1,1))^252-1;
dist20fi_mr =  (1+dist20fi_Rp(1,1))^252-1;
dist35cc_mr =  (1+dist35cc_Rp(1,1))^252-1;
dist35fi_mr =  (1+dist35fi_Rp(1,1))^252-1;

RmRf_mr = (1+RmRf_Rp(1,1))^252-1;


mix5cc_SR = sqrt(252)*mix5cc_Rp(1,1)./mix5cc_Rp(2,1);
mix5fi_SR = sqrt(252)*mix5fi_Rp(1,1)./mix5fi_Rp(2,1);
mix20cc_SR = sqrt(252)*mix20cc_Rp(1,1)./mix20cc_Rp(2,1);
mix20fi_SR = sqrt(252)*mix20fi_Rp(1,1)./mix20fi_Rp(2,1);
mix35cc_SR =  sqrt(252)*mix35cc_Rp(1,1)./mix35cc_Rp(2,1);
mix35fi_SR =  sqrt(252)*mix35fi_Rp(1,1)./mix35fi_Rp(2,1);
dist5cc_SR =  sqrt(252)*dist5cc_Rp(1,1)./dist5cc_Rp(2,1);
dist5fi_SR =  sqrt(252)*dist5fi_Rp(1,1)./dist5fi_Rp(2,1);
dist20cc_SR =  sqrt(252)*dist20cc_Rp(1,1)./dist20cc_Rp(2,1);
dist20fi_SR =  sqrt(252)*dist20fi_Rp(1,1)./dist20fi_Rp(2,1);
dist35cc_SR =  sqrt(252)*dist35cc_Rp(1,1)./dist35cc_Rp(2,1);
dist35fi_SR =  sqrt(252)*dist35fi_Rp(1,1)./dist35fi_Rp(2,1);

RmRf_SR =  sqrt(252)*RmRf_Rp(1,1)./RmRf_Rp(2,1);

%%
mix5cc_Rp1 = stat2(1+mix5cc(1:1137,1),1,3,0);
mix5fi_Rp1 = stat2(1+mix5fi(1:1137,1),1,3,0);
mix20cc_Rp1 = stat2(1+mix20cc(1:1137,1),1,3,0);
mix20fi_Rp1 = stat2(1+mix20fi(1:1137,1),1,3,0);
mix35cc_Rp1 =  stat2(1+mix35cc(1:1137,1),1,3,0);
mix35fi_Rp1 =  stat2(1+mix35fi(1:1137,1),1,3,0);
dist5cc_Rp1 =  stat2(1+dist5cc(1:1137,1),1,3,0);
dist5fi_Rp1 =  stat2(1+dist5fi(1:1137,1),1,3,0);
dist20cc_Rp1 =  stat2(1+dist20cc(1:1137,1),1,3,0);
dist20fi_Rp1 =  stat2(1+dist20fi(1:1137,1),1,3,0);
dist35cc_Rp1 =  stat2(1+dist35cc(1:1137,1),1,3,0);
dist35fi_Rp1 =  stat2(1+dist35fi(1:1137,1),1,3,0);

RmRf_Rp1 =  stat2(1+RmRf(1:1137,1),1,3,0);

mix5cc_mr1 = (1+mix5cc_Rp1(1,1))^252-1;
mix5fi_mr1 = (1+mix5fi_Rp1(1,1))^252-1;
mix20cc_mr1 = (1+mix20cc_Rp1(1,1))^252-1;
mix20fi_mr1 = (1+mix20fi_Rp1(1,1))^252-1;
mix35cc_mr1 =  (1+mix35cc_Rp1(1,1))^252-1;
mix35fi_mr1 =  (1+mix35fi_Rp1(1,1))^252-1;
dist5cc_mr1 =  (1+dist5cc_Rp1(1,1))^252-1;
dist5fi_mr1 =  (1+dist5fi_Rp1(1,1))^252-1;
dist20cc_mr1 =  (1+dist20cc_Rp1(1,1))^252-1;
dist20fi_mr1 =  (1+dist20fi_Rp1(1,1))^252-1;
dist35cc_mr1 =  (1+dist35cc_Rp1(1,1))^252-1;
dist35fi_mr1 =  (1+dist35fi_Rp1(1,1))^252-1;

RmRf_mr1 =  (1+RmRf_Rp1(1,1))^252-1;

mix5cc_SR1 = sqrt(252)*mix5cc_Rp1(1,1)./mix5cc_Rp1(2,1);
mix5fi_SR1 = sqrt(252)*mix5fi_Rp1(1,1)./mix5fi_Rp1(2,1);
mix20cc_SR1 = sqrt(252)*mix20cc_Rp1(1,1)./mix20cc_Rp1(2,1);
mix20fi_SR1 = sqrt(252)*mix20fi_Rp1(1,1)./mix20fi_Rp1(2,1);
mix35cc_SR1 =  sqrt(252)*mix35cc_Rp1(1,1)./mix35cc_Rp1(2,1);
mix35fi_SR1 =  sqrt(252)*mix35fi_Rp1(1,1)./mix35fi_Rp1(2,1);
dist5cc_SR1 =  sqrt(252)*dist5cc_Rp1(1,1)./dist5cc_Rp1(2,1);
dist5fi_SR1 =  sqrt(252)*dist5fi_Rp1(1,1)./dist5fi_Rp1(2,1);
dist20cc_SR1 =  sqrt(252)*dist20cc_Rp1(1,1)./dist20cc_Rp1(2,1);
dist20fi_SR1 =  sqrt(252)*dist20fi_Rp1(1,1)./dist20fi_Rp1(2,1);
dist35cc_SR1 =  sqrt(252)*dist35cc_Rp1(1,1)./dist35cc_Rp1(2,1);
dist35fi_SR1 =  sqrt(252)*dist35fi_Rp1(1,1)./dist35fi_Rp1(2,1);

RmRf_SR1 =  sqrt(252)*RmRf_Rp1(1,1)./RmRf_Rp1(2,1);
%%
mix5cc_Rp2 = stat2(1+mix5cc(1138:2400,1),1,3,0);
mix5fi_Rp2 = stat2(1+mix5fi(1138:2400,1),1,3,0);
mix20cc_Rp2 = stat2(1+mix20cc(1138:2400,1),1,3,0);
mix20fi_Rp2 = stat2(1+mix20fi(1138:2400,1),1,3,0);
mix35cc_Rp2 =  stat2(1+mix35cc(1138:2400,1),1,3,0);
mix35fi_Rp2 =  stat2(1+mix35fi(1138:2400,1),1,3,0);
dist5cc_Rp2 =  stat2(1+dist5cc(1138:2400,1),1,3,0);
dist5fi_Rp2 =  stat2(1+dist5fi(1138:2400,1),1,3,0);
dist20cc_Rp2 =  stat2(1+dist20cc(1138:2400,1),1,3,0);
dist20fi_Rp2 =  stat2(1+dist20fi(1138:2400,1),1,3,0);
dist35cc_Rp2 =  stat2(1+dist35cc(1138:2400,1),1,3,0);
dist35fi_Rp2 =  stat2(1+dist35fi(1138:2400,1),1,3,0);

RmRf_Rp2 =  stat2(1+RmRf(1138:2400,1),1,3,0);

mix5cc_mr2 = (1+mix5cc_Rp2(1,1))^252-1;
mix5fi_mr2 = (1+mix5fi_Rp2(1,1))^252-1;
mix20cc_mr2 = (1+mix20cc_Rp2(1,1))^252-1;
mix20fi_mr2 = (1+mix20fi_Rp2(1,1))^252-1;
mix35cc_mr2 =  (1+mix35cc_Rp2(1,1))^252-1;
mix35fi_mr2 =  (1+mix35fi_Rp2(1,1))^252-1;
dist5cc_mr2 =  (1+dist5cc_Rp2(1,1))^252-1;
dist5fi_mr2 =  (1+dist5fi_Rp2(1,1))^252-1;
dist20cc_mr2 =  (1+dist20cc_Rp2(1,1))^252-1;
dist20fi_mr2 =  (1+dist20fi_Rp2(1,1))^252-1;
dist35cc_mr2 =  (1+dist35cc_Rp2(1,1))^252-1;
dist35fi_mr2 =  (1+dist35fi_Rp2(1,1))^252-1;

RmRf_mr2 =  (1+RmRf_Rp2(1,1))^252-1;


mix5cc_SR2 = sqrt(252)*mix5cc_Rp2(1,1)./mix5cc_Rp2(2,1);
mix5fi_SR2 = sqrt(252)*mix5fi_Rp2(1,1)./mix5fi_Rp2(2,1);
mix20cc_SR2 = sqrt(252)*mix20cc_Rp2(1,1)./mix20cc_Rp2(2,1);
mix20fi_SR2 = sqrt(252)*mix20fi_Rp2(1,1)./mix20fi_Rp2(2,1);
mix35cc_SR2 =  sqrt(252)*mix35cc_Rp2(1,1)./mix35cc_Rp2(2,1);
mix35fi_SR2 =  sqrt(252)*mix35fi_Rp2(1,1)./mix35fi_Rp2(2,1);
dist5cc_SR2 =  sqrt(252)*dist5cc_Rp2(1,1)./dist5cc_Rp2(2,1);
dist5fi_SR2 =  sqrt(252)*dist5fi_Rp2(1,1)./dist5fi_Rp2(2,1);
dist20cc_SR2 =  sqrt(252)*dist20cc_Rp2(1,1)./dist20cc_Rp2(2,1);
dist20fi_SR2 =  sqrt(252)*dist20fi_Rp2(1,1)./dist20fi_Rp2(2,1);
dist35cc_SR2 =  sqrt(252)*dist35cc_Rp2(1,1)./dist35cc_Rp2(2,1);
dist35fi_SR2 =  sqrt(252)*dist35fi_Rp2(1,1)./dist35fi_Rp2(2,1);

RmRf_SR2 =  sqrt(252)*RmRf_Rp2(1,1)./RmRf_Rp2(2,1);
%%
mix5cc_Rp3 = stat2(1+mix5cc(2401:3656,1),1,3,0);
mix5fi_Rp3 = stat2(1+mix5fi(2401:3656,1),1,3,0);
mix20cc_Rp3 = stat2(1+mix20cc(2401:3656,1),1,3,0);
mix20fi_Rp3 = stat2(1+mix20fi(2401:3656,1),1,3,0);
mix35cc_Rp3 =  stat2(1+mix35cc(2401:3656,1),1,3,0);
mix35fi_Rp3 =  stat2(1+mix35fi(2401:3656,1),1,3,0);
dist5cc_Rp3 =  stat2(1+dist5cc(2401:3656,1),1,3,0);
dist5fi_Rp3 =  stat2(1+dist5fi(2401:3656,1),1,3,0);
dist20cc_Rp3 =  stat2(1+dist20cc(2401:3656,1),1,3,0);
dist20fi_Rp3 =  stat2(1+dist20fi(2401:3656,1),1,3,0);
dist35cc_Rp3 =  stat2(1+dist35cc(2401:3656,1),1,3,0);
dist35fi_Rp3 =  stat2(1+dist35fi(2401:3656,1),1,3,0);

mix5cc_mr3 = (1+mix5cc_Rp3(1,1))^252-1;
mix5fi_mr3 = (1+mix5fi_Rp3(1,1))^252-1;
mix20cc_mr3 = (1+mix20cc_Rp3(1,1))^252-1;
mix20fi_mr3 = (1+mix20fi_Rp3(1,1))^252-1;
mix35cc_mr3 =  (1+mix35cc_Rp3(1,1))^252-1;
mix35fi_mr3 =  (1+mix35fi_Rp3(1,1))^252-1;
dist5cc_mr3 =  (1+dist5cc_Rp3(1,1))^252-1;
dist5fi_mr3 =  (1+dist5fi_Rp3(1,1))^252-1;
dist20cc_mr3 =  (1+dist20cc_Rp3(1,1))^252-1;
dist20fi_mr3 =  (1+dist20fi_Rp3(1,1))^252-1;
dist35cc_mr3 =  (1+dist35cc_Rp3(1,1))^252-1;
dist35fi_mr3 =  (1+dist35fi_Rp3(1,1))^252-1;


mix5cc_SR3 = sqrt(252)*mix5cc_Rp3(1,1)./mix5cc_Rp3(2,1);
mix5fi_SR3 = sqrt(252)*mix5fi_Rp3(1,1)./mix5fi_Rp3(2,1);
mix20cc_SR3 = sqrt(252)*mix20cc_Rp3(1,1)./mix20cc_Rp3(2,1);
mix20fi_SR3 = sqrt(252)*mix20fi_Rp3(1,1)./mix20fi_Rp3(2,1);
mix35cc_SR3 =  sqrt(252)*mix35cc_Rp3(1,1)./mix35cc_Rp3(2,1);
mix35fi_SR3 =  sqrt(252)*mix35fi_Rp3(1,1)./mix35fi_Rp3(2,1);
dist5cc_SR3 =  sqrt(252)*dist5cc_Rp3(1,1)./dist5cc_Rp3(2,1);
dist5fi_SR3 =  sqrt(252)*dist5fi_Rp3(1,1)./dist5fi_Rp3(2,1);
dist20cc_SR3 =  sqrt(252)*dist20cc_Rp3(1,1)./dist20cc_Rp3(2,1);
dist20fi_SR3 =  sqrt(252)*dist20fi_Rp3(1,1)./dist20fi_Rp3(2,1);
dist35cc_SR3 =  sqrt(252)*dist35cc_Rp3(1,1)./dist35cc_Rp3(2,1);
dist35fi_SR3 =  sqrt(252)*dist35fi_Rp3(1,1)./dist35fi_Rp3(2,1);

RmRf_Rp3 =  stat2(1+RmRf(2401:3656,1),1,3,0);
RmRf_SR3 =  sqrt(252)*RmRf_Rp3(1,1)./RmRf_Rp3(2,1);
RmRf_mr3 =  (1+RmRf_Rp3(1,1))^252-1;
%%
mix5cc_Rp4 = stat2(1+mix5cc(3657:4915,1),1,3,0);
mix5fi_Rp4 = stat2(1+mix5fi(3657:4915,1),1,3,0);
mix20cc_Rp4 = stat2(1+mix20cc(3657:4915,1),1,3,0);
mix20fi_Rp4 = stat2(1+mix20fi(3657:4915,1),1,3,0);
mix35cc_Rp4 =  stat2(1+mix35cc(3657:4915,1),1,3,0);
mix35fi_Rp4 =  stat2(1+mix35fi(3657:4915,1),1,3,0);
dist5cc_Rp4 =  stat2(1+dist5cc(3657:4915,1),1,3,0);
dist5fi_Rp4 =  stat2(1+dist5fi(3657:4915,1),1,3,0);
dist20cc_Rp4 =  stat2(1+dist20cc(3657:4915,1),1,3,0);
dist20fi_Rp4 =  stat2(1+dist20fi(3657:4915,1),1,3,0);
dist35cc_Rp4 =  stat2(1+dist35cc(3657:4915,1),1,3,0);
dist35fi_Rp4 =  stat2(1+dist35fi(3657:4915,1),1,3,0);

mix5cc_mr4 = (1+mix5cc_Rp4(1,1))^252-1;
mix5fi_mr4 = (1+mix5fi_Rp4(1,1))^252-1;
mix20cc_mr4 = (1+mix20cc_Rp4(1,1))^252-1;
mix20fi_mr4 = (1+mix20fi_Rp4(1,1))^252-1;
mix35cc_mr4 =  (1+mix35cc_Rp4(1,1))^252-1;
mix35fi_mr4 =  (1+mix35fi_Rp4(1,1))^252-1;
dist5cc_mr4 =  (1+dist5cc_Rp4(1,1))^252-1;
dist5fi_mr4 =  (1+dist5fi_Rp4(1,1))^252-1;
dist20cc_mr4 =  (1+dist20cc_Rp4(1,1))^252-1;
dist20fi_mr4 =  (1+dist20fi_Rp4(1,1))^252-1;
dist35cc_mr4 =  (1+dist35cc_Rp4(1,1))^252-1;
dist35fi_mr4 =  (1+dist35fi_Rp4(1,1))^252-1;


mix5cc_SR4 = sqrt(252)*mix5cc_Rp4(1,1)./mix5cc_Rp4(2,1);
mix5fi_SR4 = sqrt(252)*mix5fi_Rp4(1,1)./mix5fi_Rp4(2,1);
mix20cc_SR4 = sqrt(252)*mix20cc_Rp4(1,1)./mix20cc_Rp4(2,1);
mix20fi_SR4 = sqrt(252)*mix20fi_Rp4(1,1)./mix20fi_Rp4(2,1);
mix35cc_SR4 =  sqrt(252)*mix35cc_Rp4(1,1)./mix35cc_Rp4(2,1);
mix35fi_SR4 =  sqrt(252)*mix35fi_Rp4(1,1)./mix35fi_Rp4(2,1);
dist5cc_SR4 =  sqrt(252)*dist5cc_Rp4(1,1)./dist5cc_Rp4(2,1);
dist5fi_SR4 =  sqrt(252)*dist5fi_Rp4(1,1)./dist5fi_Rp4(2,1);
dist20cc_SR4 =  sqrt(252)*dist20cc_Rp4(1,1)./dist20cc_Rp4(2,1);
dist20fi_SR4 =  sqrt(252)*dist20fi_Rp4(1,1)./dist20fi_Rp4(2,1);
dist35cc_SR4 =  sqrt(252)*dist35cc_Rp4(1,1)./dist35cc_Rp4(2,1);
dist35fi_SR4 =  sqrt(252)*dist35fi_Rp4(1,1)./dist35fi_Rp4(2,1);

RmRf_Rp4 =  stat2(1+RmRf(3657:4915,1),1,3,0);
RmRf_SR4 =  sqrt(252)*RmRf_Rp4(1,1)./RmRf_Rp4(2,1);
RmRf_mr4 =  (1+RmRf_Rp4(1,1))^252-1;
%%
mix5cc_Rp5 = stat2(1+mix5cc(4916:6173,1),1,3,0);
mix5fi_Rp5 = stat2(1+mix5fi(4916:6173,1),1,3,0);
mix20cc_Rp5 = stat2(1+mix20cc(4916:6173,1),1,3,0);
mix20fi_Rp5 = stat2(1+mix20fi(4916:6173,1),1,3,0);
mix35cc_Rp5 =  stat2(1+mix35cc(4916:6173,1),1,3,0);
mix35fi_Rp5 =  stat2(1+mix35fi(4916:6173,1),1,3,0);
dist5cc_Rp5 =  stat2(1+dist5cc(4916:6173,1),1,3,0);
dist5fi_Rp5 =  stat2(1+dist5fi(4916:6173,1),1,3,0);
dist20cc_Rp5 =  stat2(1+dist20cc(4916:6173,1),1,3,0);
dist20fi_Rp5 =  stat2(1+dist20fi(4916:6173,1),1,3,0);
dist35cc_Rp5 =  stat2(1+dist35cc(4916:6173,1),1,3,0);
dist35fi_Rp5 =  stat2(1+dist35fi(4916:6173,1),1,3,0);

mix5cc_mr5 = (1+mix5cc_Rp5(1,1))^252-1;
mix5fi_mr5 = (1+mix5fi_Rp5(1,1))^252-1;
mix20cc_mr5 = (1+mix20cc_Rp5(1,1))^252-1;
mix20fi_mr5 = (1+mix20fi_Rp5(1,1))^252-1;
mix35cc_mr5 =  (1+mix35cc_Rp5(1,1))^252-1;
mix35fi_mr5 =  (1+mix35fi_Rp5(1,1))^252-1;
dist5cc_mr5 =  (1+dist5cc_Rp5(1,1))^252-1;
dist5fi_mr5 =  (1+dist5fi_Rp5(1,1))^252-1;
dist20cc_mr5 =  (1+dist20cc_Rp5(1,1))^252-1;
dist20fi_mr5 =  (1+dist20fi_Rp5(1,1))^252-1;
dist35cc_mr5 =  (1+dist35cc_Rp5(1,1))^252-1;
dist35fi_mr5 =  (1+dist35fi_Rp5(1,1))^252-1;


mix5cc_SR5 = sqrt(252)*mix5cc_Rp5(1,1)./mix5cc_Rp5(2,1);
mix5fi_SR5 = sqrt(252)*mix5fi_Rp5(1,1)./mix5fi_Rp5(2,1);
mix20cc_SR5 = sqrt(252)*mix20cc_Rp5(1,1)./mix20cc_Rp5(2,1);
mix20fi_SR5 = sqrt(252)*mix20fi_Rp5(1,1)./mix20fi_Rp5(2,1);
mix35cc_SR5 =  sqrt(252)*mix35cc_Rp5(1,1)./mix35cc_Rp5(2,1);
mix35fi_SR5 =  sqrt(252)*mix35fi_Rp5(1,1)./mix35fi_Rp5(2,1);
dist5cc_SR5 =  sqrt(252)*dist5cc_Rp5(1,1)./dist5cc_Rp5(2,1);
dist5fi_SR5 =  sqrt(252)*dist5fi_Rp5(1,1)./dist5fi_Rp5(2,1);
dist20cc_SR5 =  sqrt(252)*dist20cc_Rp5(1,1)./dist20cc_Rp5(2,1);
dist20fi_SR5 =  sqrt(252)*dist20fi_Rp5(1,1)./dist20fi_Rp5(2,1);
dist35cc_SR5 =  sqrt(252)*dist35cc_Rp5(1,1)./dist35cc_Rp5(2,1);
dist35fi_SR5 =  sqrt(252)*dist35fi_Rp5(1,1)./dist35fi_Rp5(2,1);

RmRf_Rp5 =  stat2(1+RmRf(4916:6173,1),1,3,0);
RmRf_SR5 =  sqrt(252)*RmRf_Rp5(1,1)./RmRf_Rp5(2,1);
RmRf_mr5 =  (1+RmRf_Rp5(1,1))^252-1;
%%
figure(6);
subplot(3,2,1);
p1=bar([100*mix5cc_mr1  100*dist5cc_mr1;...
        100*mix5cc_mr2  100*dist5cc_mr2;...
        100*mix5cc_mr3  100*dist5cc_mr3;...
        100*mix5cc_mr4  100*dist5cc_mr4;...
        100*mix5cc_mr5  100*dist5cc_mr5]);
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
ylim([-2 8])
LineArray={'--','-'};
for k=1:2
  set(p1(k),'LineStyle',LineArray{k})
end
set(gca,'ygrid','on'), ylabel('Mean Excess Return (%)'), xlabel('Year'),
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',[1 2 3 4 5],'XTickLabel',{'91-95' '96-00' '01-05' '06-10' '11-15'})
title('(a) Top 5 pairs, Committed Capital, after costs');

subplot(3,2,2);
p2=bar([100*mix5fi_mr1  100*dist5fi_mr1;...
        100*mix5fi_mr2  100*dist5fi_mr2;...
        100*mix5fi_mr3  100*dist5fi_mr3;...
        100*mix5fi_mr4  100*dist5fi_mr4;...
        100*mix5fi_mr5  100*dist5fi_mr5]);
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
ylim([-5 20])
LineArray={'--','-'};
for k=1:2
  set(p2(k),'LineStyle',LineArray{k})
end
set(gca,'ygrid','on'), ylabel('Mean Excess Return (%)'), xlabel('Year'),
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',[1 2 3 4 5],'XTickLabel',{'91-95' '96-00' '01-05' '06-10' '11-15'})
title('(b) Top 5 pairs, Fully Invested, after costs');

subplot(3,2,3);
p3=bar([100*mix20cc_mr1  100*dist20cc_mr1;...
        100*mix20cc_mr2  100*dist20cc_mr2;...
        100*mix20cc_mr3  100*dist20cc_mr3;...
        100*mix20cc_mr4  100*dist20cc_mr4;...
        100*mix20cc_mr5  100*dist20cc_mr5]);
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
ylim([0 8])
LineArray={'--','-'};
for k=1:2
  set(p3(k),'LineStyle',LineArray{k})
end
set(gca,'ygrid','on'), ylabel('Mean Excess Return (%)'), xlabel('Year'),
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',[1 2 3 4 5],'XTickLabel',{'91-95' '96-00' '01-05' '06-10' '11-15'})
title('(c) Top 20 pairs, Committed Capital, after costs');

subplot(3,2,4);
p4=bar([100*mix20fi_mr1  100*dist20fi_mr1;...
        100*mix20fi_mr2  100*dist20fi_mr2;...
        100*mix20fi_mr3  100*dist20fi_mr3;...
        100*mix20fi_mr4  100*dist20fi_mr4;...
        100*mix20fi_mr5  100*dist20fi_mr5]);
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
ylim([-5 25])
LineArray={'--','-'};
for k=1:2
  set(p4(k),'LineStyle',LineArray{k})
end
set(gca,'ygrid','on'), ylabel('Mean Excess Return (%)'), xlabel('Year'),
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',[1 2 3 4 5],'XTickLabel',{'91-95' '96-00' '01-05' '06-10' '11-15'})
title('(d) Top 20 pairs, Fully Invested, after costs');

subplot(3,2,5);
p5=bar([100*mix35cc_mr1  100*dist35cc_mr1;...
        100*mix35cc_mr2  100*dist35cc_mr2;...
        100*mix35cc_mr3  100*dist35cc_mr3;...
        100*mix35cc_mr4  100*dist35cc_mr4;...
        100*mix35cc_mr5  100*dist35cc_mr5]);
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
ylim([0 10])
LineArray={'--','-'};
for k=1:2
  set(p5(k),'LineStyle',LineArray{k})
end
set(gca,'ygrid','on'), ylabel('Mean Excess Return (%)'), xlabel('Year'),
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',[1 2 3 4 5],'XTickLabel',{'91-95' '96-00' '01-05' '06-10' '11-15'})
title('(e) Top 35 pairs, Committed Capital, after costs');

subplot(3,2,6);
p6=bar([100*mix35fi_mr1  100*dist35fi_mr1;...
        100*mix35fi_mr2  100*dist35fi_mr2;...
        100*mix35fi_mr3  100*dist35fi_mr3;...
        100*mix35fi_mr4  100*dist35fi_mr4;...
        100*mix35fi_mr5  100*dist35fi_mr5]);
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
ylim([-5 25])
LineArray={'--','-'};
for k=1:2
  set(p6(k),'LineStyle',LineArray{k})
end
set(gca,'ygrid','on'), ylabel('Mean Excess Return (%)'), xlabel('Year'),
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',[1 2 3 4 5],'XTickLabel',{'91-95' '96-00' '01-05' '06-10' '11-15'})
title('(f) Top 35 pairs, Fully Invested, after costs');

l = legend([p1,p2,p3,p4,p5,p6],{'Mixed Copula','Distance'}...
    ,'Orientation','horizontal');

% Programatically move the Legend
newPosition = [0.340775991995887 0.00431256419924021 0.401171295656813 0.0337941620939521];
newUnits = 'normalized';
set(l,'Position', newPosition,'Units', newUnits,'FontSize',9);

a=gcf;
set(a,'PaperOrientation','landscape');
set(a,'PaperUnits','normalized');
set(a,'PaperPosition', [0 0 1 1]);
print(gcf,'-dpdf','C:\Users\fsabino\Dropbox\Pairs_Trading_Distance_and_Mixed_Copula\paper_elsevier\Figure6.pdf')
%%
figure(7);
subplot(3,2,1);
p1=bar([mix5cc_SR1  dist5cc_SR1;...
        mix5cc_SR2  dist5cc_SR2;...
        mix5cc_SR3  dist5cc_SR3;...
        mix5cc_SR4  dist5cc_SR4;...
        mix5cc_SR5  dist5cc_SR5]);
ylim([-0.5 1.5])
LineArray={'--','-'};
for k=1:2
  set(p1(k),'LineStyle',LineArray{k})
end
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
set(gca,'ygrid','on'), ylabel('Sharpe Ratio'), xlabel('Year'),
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',[1 2 3 4 5],'XTickLabel',{'91-95' '96-00' '01-05' '06-10' '11-15'})
title('(a) Top 5 pairs, Committed Capital, after costs');

subplot(3,2,2);
p2=bar([mix5fi_SR1  dist5fi_SR1;...
        mix5fi_SR2  dist5fi_SR2;...
        mix5fi_SR3  dist5fi_SR3;...
        mix5fi_SR4  dist5fi_SR4;...
        mix5fi_SR5  dist5fi_SR5]);
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
ylim([-0.5 1.5])
LineArray={'--','-'};
for k=1:2
  set(p2(k),'LineStyle',LineArray{k})
end
set(gca,'ygrid','on'), ylabel('Sharpe Ratio'), xlabel('Year'),
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',[1 2 3 4 5],'XTickLabel',{'91-95' '96-00' '01-05' '06-10' '11-15'})
title('(b) Top 5 pairs, Fully Invested, after costs');

subplot(3,2,3);
p3=bar([mix20cc_SR1  dist20cc_SR1;...
        mix20cc_SR2  dist20cc_SR2;...
        mix20cc_SR3  dist20cc_SR3;...
        mix20cc_SR4  dist20cc_SR4;...
        mix20cc_SR5  dist20cc_SR5]);
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
ylim([0 1.5])
LineArray={'--','-'};
for k=1:2
  set(p3(k),'LineStyle',LineArray{k})
end
set(gca,'ygrid','on'), ylabel('Sharpe Ratio'), xlabel('Year'),
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',[1 2 3 4 5],'XTickLabel',{'91-95' '96-00' '01-05' '06-10' '11-15'})
title('(c) Top 20 pairs, Committed Capital, after costs');

subplot(3,2,4);
p4=bar([mix20fi_SR1  dist20fi_SR1;...
        mix20fi_SR2  dist20fi_SR2;...
        mix20fi_SR3  dist20fi_SR3;...
        mix20fi_SR4  dist20fi_SR4;...
        mix20fi_SR5  dist20fi_SR5]);
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
ylim([-0.5 1.5])
LineArray={'--','-'};
for k=1:2
  set(p4(k),'LineStyle',LineArray{k})
end
set(gca,'ygrid','on'), ylabel('Sharpe Ratio'), xlabel('Year'),
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',[1 2 3 4 5],'XTickLabel',{'91-95' '96-00' '01-05' '06-10' '11-15'})
title('(d) Top 20 pairs, Fully Invested, after costs');

subplot(3,2,5);
p5=bar([mix35cc_SR1  dist35cc_SR1;...
        mix35cc_SR2  dist35cc_SR2;...
        mix35cc_SR3  dist35cc_SR3;...
        mix35cc_SR4  dist35cc_SR4;...
        mix35cc_SR5  dist35cc_SR5]);
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
ylim([0 2])
LineArray={'--','-'};
for k=1:2
  set(p5(k),'LineStyle',LineArray{k})
end
set(gca,'ygrid','on'), ylabel('Sharpe Ratio'), xlabel('Year'),
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',[1 2 3 4 5],'XTickLabel',{'91-95' '96-00' '01-05' '06-10' '11-15'})
title('(e) Top 35 pairs, Committed Capital, after costs');

subplot(3,2,6);
p6=bar([mix35fi_SR1  dist35fi_SR1;...
        mix35fi_SR2  dist35fi_SR2;...
        mix35fi_SR3  dist35fi_SR3;...
        mix35fi_SR4  dist35fi_SR4;...
        mix35fi_SR5  dist35fi_SR5]);
%legend('Mixed Copula','Distance','Location','southoutside','Orientation','horizontal');
ylim([-0.5 2.0])
LineArray={'--','-'};
for k=1:2
  set(p6(k),'LineStyle',LineArray{k})
end
set(gca,'ygrid','on'), ylabel('Sharpe Ratio'), xlabel('Year'),
set(legend,'FontSize',6);
legend boxoff;
set(gca,'XTick',[1 2 3 4 5],'XTickLabel',{'91-95' '96-00' '01-05' '06-10' '11-15'})
title('(f) Top 35 pairs, Fully Invested, after costs');

l = legend([p1,p2,p3,p4,p5,p6],{'Mixed Copula','Distance'}...
    ,'Orientation','horizontal');

% Programatically move the Legend
newPosition = [0.340775991995887 0.00431256419924021 0.401171295656813 0.0337941620939521];
newUnits = 'normalized';
set(l,'Position', newPosition,'Units', newUnits,'FontSize',9);

a=gcf;
set(a,'PaperOrientation','landscape');
set(a,'PaperUnits','normalized');
set(a,'PaperPosition', [0 0 1 1]);
print(gcf,'-dpdf','C:\Users\fsabino\Dropbox\Pairs_Trading_Distance_and_Mixed_Copula\paper_elsevier\Figure7.pdf')
%%
Bstar = opt_block_length([mix5cc, RmRf]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([mix5fi, RmRf]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([mix20cc, RmRf]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([mix20fi, RmRf]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([mix35cc, RmRf]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([mix35fi, RmRf]);
SBstar6 = Bstar6(1,:);

[pSR_mix5cc, pmean_mix5cc] = dgnu_StatisticsPolitisRomano_v5(mix5cc, RmRf,max(mean(SBstar),1));
[pSR_mix5fi, pmean_mix5fi] = dgnu_StatisticsPolitisRomano_v5(mix5fi, RmRf,max(mean(SBstar2),1));
[pSR_mix20cc, pmean_mix20cc] = dgnu_StatisticsPolitisRomano_v5(mix20cc, RmRf,max(mean(SBstar3),1));
[pSR_mix20fi, pmean_mix20fi] = dgnu_StatisticsPolitisRomano_v5(mix20fi, RmRf,max(mean(SBstar4),1));
[pSR_mix35cc, pmean_mix35cc] = dgnu_StatisticsPolitisRomano_v5(mix35cc, RmRf,max(mean(SBstar5),1));
[pSR_mix35fi, pmean_mix35fi] = dgnu_StatisticsPolitisRomano_v5(mix35fi, RmRf,max(mean(SBstar6),1));

Bstar = opt_block_length([dist5cc, RmRf]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([dist5fi, RmRf]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([dist20cc, RmRf]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([dist20fi, RmRf]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([dist35cc, RmRf]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([dist35fi, RmRf]);
SBstar6 = Bstar6(1,:);

[pSR_dist5cc, pmean_dist5cc] = dgnu_StatisticsPolitisRomano_v5(dist5cc, RmRf,max(mean(SBstar),1));
[pSR_dist5fi, pmean_dist5fi] = dgnu_StatisticsPolitisRomano_v5(dist5fi, RmRf,max(mean(SBstar2),1));
[pSR_dist20cc, pmean_dist20cc] = dgnu_StatisticsPolitisRomano_v5(dist20cc, RmRf,max(mean(SBstar3),1));
[pSR_dist20fi, pmean_dist20fi] = dgnu_StatisticsPolitisRomano_v5(dist20fi, RmRf,max(mean(SBstar4),1));
[pSR_dist35cc, pmean_dist35cc] = dgnu_StatisticsPolitisRomano_v5(dist35cc, RmRf,max(mean(SBstar5),1));
[pSR_dist35fi, pmean_dist35fi] = dgnu_StatisticsPolitisRomano_v5(dist35fi, RmRf,max(mean(SBstar6),1));

Bstar = opt_block_length([dist5cc, mix5cc]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([dist5fi, mix5fi]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([dist20cc, mix20cc]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([dist20fi, mix20fi]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([dist35cc, mix35cc]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([dist35fi, mix35fi]);
SBstar6 = Bstar6(1,:);

[pSR_5cc, pmean_5cc] = dgnu_StatisticsPolitisRomano_v5(dist5cc, mix5cc ,max(mean(SBstar),1));
[pSR_5fi, pmean_5fi] = dgnu_StatisticsPolitisRomano_v5(dist5fi, mix5fi ,max(mean(SBstar2),1));
[pSR_20cc, pmean_20cc] = dgnu_StatisticsPolitisRomano_v5(dist20cc, mix20cc ,max(mean(SBstar3),1));
[pSR_20fi, pmean_20fi] = dgnu_StatisticsPolitisRomano_v5(dist20fi, mix20fi ,max(mean(SBstar4),1));
[pSR_35cc, pmean_35cc] = dgnu_StatisticsPolitisRomano_v5(dist35cc, mix35cc ,max(mean(SBstar5),1));
[pSR_35fi, pmean_35fi] = dgnu_StatisticsPolitisRomano_v5(dist35fi, mix35fi ,max(mean(SBstar6),1));
%%
Bstar = opt_block_length([mix5cc(1:1137,1), RmRf(1:1137,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([mix5fi(1:1137,1), RmRf(1:1137,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([mix20cc(1:1137,1), RmRf(1:1137,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([mix20fi(1:1137,1), RmRf(1:1137,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([mix35cc(1:1137,1), RmRf(1:1137,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([mix35fi(1:1137,1), RmRf(1:1137,1)]);
SBstar6 = Bstar6(1,:);

[pSR_mix5cc1, pmean_mix5cc1] = dgnu_StatisticsPolitisRomano_v5(mix5cc(1:1137,1), RmRf(1:1137,1),max(mean(SBstar),1));
[pSR_mix5fi1, pmean_mix5fi1] = dgnu_StatisticsPolitisRomano_v5(mix5fi(1:1137,1), RmRf(1:1137,1),max(mean(SBstar2),1));
[pSR_mix20cc1, pmean_mix20cc1] = dgnu_StatisticsPolitisRomano_v5(mix20cc(1:1137,1), RmRf(1:1137,1),max(mean(SBstar3),1));
[pSR_mix20fi1, pmean_mix20fi1] = dgnu_StatisticsPolitisRomano_v5(mix20fi(1:1137,1), RmRf(1:1137,1),max(mean(SBstar4),1));
[pSR_mix35cc1, pmean_mix35cc1] = dgnu_StatisticsPolitisRomano_v5(mix35cc(1:1137,1), RmRf(1:1137,1),max(mean(SBstar5),1));
[pSR_mix35fi1, pmean_mix35fi1] = dgnu_StatisticsPolitisRomano_v5(mix35fi(1:1137,1), RmRf(1:1137,1),max(mean(SBstar6),1));

Bstar = opt_block_length([dist5cc(1:1137,1), RmRf(1:1137,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([dist5fi(1:1137,1), RmRf(1:1137,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([dist20cc(1:1137,1), RmRf(1:1137,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([dist20fi(1:1137,1), RmRf(1:1137,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([dist35cc(1:1137,1), RmRf(1:1137,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([dist35fi(1:1137,1), RmRf(1:1137,1)]);
SBstar6 = Bstar6(1,:);

[pSR_dist5cc1, pmean_dist5cc1] = dgnu_StatisticsPolitisRomano_v5(dist5cc(1:1137,1), RmRf(1:1137,1),max(mean(SBstar),1));
[pSR_dist5fi1, pmean_dist5fi1] = dgnu_StatisticsPolitisRomano_v5(dist5fi(1:1137,1), RmRf(1:1137,1),max(mean(SBstar2),1));
[pSR_dist20cc1, pmean_dist20cc1] = dgnu_StatisticsPolitisRomano_v5(dist20cc(1:1137,1), RmRf(1:1137,1),max(mean(SBstar3),1));
[pSR_dist20fi1, pmean_dist20fi1] = dgnu_StatisticsPolitisRomano_v5(dist20fi(1:1137,1), RmRf(1:1137,1),max(mean(SBstar4),1));
[pSR_dist35cc1, pmean_dist35cc1] = dgnu_StatisticsPolitisRomano_v5(dist35cc(1:1137,1), RmRf(1:1137,1),max(mean(SBstar5),1));
[pSR_dist35fi1, pmean_dist35fi1] = dgnu_StatisticsPolitisRomano_v5(dist35fi(1:1137,1), RmRf(1:1137,1),max(mean(SBstar6),1));

Bstar = opt_block_length([dist5cc(1:1137,1), mix5cc(1:1137,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([dist5fi(1:1137,1), mix5fi(1:1137,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([dist20cc(1:1137,1), mix20cc(1:1137,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([dist20fi(1:1137,1), mix20fi(1:1137,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([dist35cc(1:1137,1), mix35cc(1:1137,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([dist35fi(1:1137,1), mix35fi(1:1137,1)]);
SBstar6 = Bstar6(1,:);

[pSR_5cc1, pmean_5cc1] = dgnu_StatisticsPolitisRomano_v5(dist5cc(1:1137,1), mix5cc(1:1137,1) ,max(mean(SBstar),1));
[pSR_5fi1, pmean_5fi1] = dgnu_StatisticsPolitisRomano_v5(dist5fi(1:1137,1), mix5fi(1:1137,1) ,max(mean(SBstar2),1));
[pSR_20cc1, pmean_20cc1] = dgnu_StatisticsPolitisRomano_v5(dist20cc(1:1137,1), mix20cc(1:1137,1) ,max(mean(SBstar3),1));
[pSR_20fi1, pmean_20fi1] = dgnu_StatisticsPolitisRomano_v5(dist20fi(1:1137,1), mix20fi(1:1137,1) ,max(mean(SBstar4),1));
[pSR_35cc1, pmean_35cc1] = dgnu_StatisticsPolitisRomano_v5(dist35cc(1:1137,1), mix35cc(1:1137,1) ,max(mean(SBstar5),1));
[pSR_35fi1, pmean_35fi1] = dgnu_StatisticsPolitisRomano_v5(dist35fi(1:1137,1), mix35fi(1:1137,1) ,max(mean(SBstar6),1));
%%
Bstar = opt_block_length([mix5cc(1138:2400,1), RmRf(1138:2400,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([mix5fi(1138:2400,1), RmRf(1138:2400,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([mix20cc(1138:2400,1), RmRf(1138:2400,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([mix20fi(1138:2400,1), RmRf(1138:2400,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([mix35cc(1138:2400,1), RmRf(1138:2400,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([mix35fi(1138:2400,1), RmRf(1138:2400,1)]);
SBstar6 = Bstar6(1,:);

[pSR_mix5cc2, pmean_mix5cc2] = dgnu_StatisticsPolitisRomano_v5(mix5cc(1138:2400,1), RmRf(1138:2400,1),max(mean(SBstar),1));
[pSR_mix5fi2, pmean_mix5fi2] = dgnu_StatisticsPolitisRomano_v5(mix5fi(1138:2400,1), RmRf(1138:2400,1),max(mean(SBstar2),1));
[pSR_mix20cc2, pmean_mix20cc2] = dgnu_StatisticsPolitisRomano_v5(mix20cc(1138:2400,1), RmRf(1138:2400,1),max(mean(SBstar3),1));
[pSR_mix20fi2, pmean_mix20fi2] = dgnu_StatisticsPolitisRomano_v5(mix20fi(1138:2400,1), RmRf(1138:2400,1),max(mean(SBstar4),1));
[pSR_mix35cc2, pmean_mix35cc2] = dgnu_StatisticsPolitisRomano_v5(mix35cc(1138:2400,1), RmRf(1138:2400,1),max(mean(SBstar5),1));
[pSR_mix35fi2, pmean_mix35fi2] = dgnu_StatisticsPolitisRomano_v5(mix35fi(1138:2400,1), RmRf(1138:2400,1),max(mean(SBstar6),1));

Bstar = opt_block_length([dist5cc(1138:2400,1), RmRf(1138:2400,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([dist5fi(1138:2400,1), RmRf(1138:2400,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([dist20cc(1138:2400,1), RmRf(1138:2400,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([dist20fi(1138:2400,1), RmRf(1138:2400,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([dist35cc(1138:2400,1), RmRf(1138:2400,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([dist35fi(1138:2400,1), RmRf(1138:2400,1)]);
SBstar6 = Bstar6(1,:);

[pSR_dist5cc2, pmean_dist5cc2] = dgnu_StatisticsPolitisRomano_v5(dist5cc(1138:2400,1), RmRf(1138:2400,1),max(mean(SBstar),1));
[pSR_dist5fi2, pmean_dist5fi2] = dgnu_StatisticsPolitisRomano_v5(dist5fi(1138:2400,1), RmRf(1138:2400,1),max(mean(SBstar2),1));
[pSR_dist20cc2, pmean_dist20cc2] = dgnu_StatisticsPolitisRomano_v5(dist20cc(1138:2400,1), RmRf(1138:2400,1),max(mean(SBstar3),1));
[pSR_dist20fi2, pmean_dist20fi2] = dgnu_StatisticsPolitisRomano_v5(dist20fi(1138:2400,1), RmRf(1138:2400,1),max(mean(SBstar4),1));
[pSR_dist35cc2, pmean_dist35cc2] = dgnu_StatisticsPolitisRomano_v5(dist35cc(1138:2400,1), RmRf(1138:2400,1),max(mean(SBstar5),1));
[pSR_dist35fi2, pmean_dist35fi2] = dgnu_StatisticsPolitisRomano_v5(dist35fi(1138:2400,1), RmRf(1138:2400,1),max(mean(SBstar6),1));

Bstar = opt_block_length([dist5cc(1138:2400,1), mix5cc(1138:2400,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([dist5fi(1138:2400,1), mix5fi(1138:2400,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([dist20cc(1138:2400,1), mix20cc(1138:2400,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([dist20fi(1138:2400,1), mix20fi(1138:2400,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([dist35cc(1138:2400,1), mix35cc(1138:2400,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([dist35fi(1138:2400,1), mix35fi(1138:2400,1)]);
SBstar6 = Bstar6(1,:);

[pSR_5cc2, pmean_5cc2] = dgnu_StatisticsPolitisRomano_v5(dist5cc(1138:2400,1), mix5cc(1138:2400,1) ,max(mean(SBstar),1));
[pSR_5fi2, pmean_5fi2] = dgnu_StatisticsPolitisRomano_v5(dist5fi(1138:2400,1), mix5fi(1138:2400,1) ,max(mean(SBstar2),1));
[pSR_20cc2, pmean_20cc2] = dgnu_StatisticsPolitisRomano_v5(dist20cc(1138:2400,1), mix20cc(1138:2400,1) ,max(mean(SBstar3),1));
[pSR_20fi2, pmean_20fi2] = dgnu_StatisticsPolitisRomano_v5(dist20fi(1138:2400,1), mix20fi(1138:2400,1) ,max(mean(SBstar4),1));
[pSR_35cc2, pmean_35cc2] = dgnu_StatisticsPolitisRomano_v5(dist35cc(1138:2400,1), mix35cc(1138:2400,1) ,max(mean(SBstar5),1));
[pSR_35fi2, pmean_35fi2] = dgnu_StatisticsPolitisRomano_v5(dist35fi(1138:2400,1), mix35fi(1138:2400,1) ,max(mean(SBstar6),1));
%%
Bstar = opt_block_length([mix5cc(2401:3656,1), RmRf(2401:3656,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([mix5fi(2401:3656,1), RmRf(2401:3656,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([mix20cc(2401:3656,1), RmRf(2401:3656,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([mix20fi(2401:3656,1), RmRf(2401:3656,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([mix35cc(2401:3656,1), RmRf(2401:3656,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([mix35fi(2401:3656,1), RmRf(2401:3656,1)]);
SBstar6 = Bstar6(1,:);

[pSR_mix5cc3, pmean_mix5cc3] = dgnu_StatisticsPolitisRomano_v5(mix5cc(2401:3656,1), RmRf(2401:3656,1),max(mean(SBstar),1));
[pSR_mix5fi3, pmean_mix5fi3] = dgnu_StatisticsPolitisRomano_v5(mix5fi(2401:3656,1), RmRf(2401:3656,1),max(mean(SBstar2),1));
[pSR_mix20cc3, pmean_mix20cc3] = dgnu_StatisticsPolitisRomano_v5(mix20cc(2401:3656,1), RmRf(2401:3656,1),max(mean(SBstar3),1));
[pSR_mix20fi3, pmean_mix20fi3] = dgnu_StatisticsPolitisRomano_v5(mix20fi(2401:3656,1), RmRf(2401:3656,1),max(mean(SBstar4),1));
[pSR_mix35cc3, pmean_mix35cc3] = dgnu_StatisticsPolitisRomano_v5(mix35cc(2401:3656,1), RmRf(2401:3656,1),max(mean(SBstar5),1));
[pSR_mix35fi3, pmean_mix35fi3] = dgnu_StatisticsPolitisRomano_v5(mix35fi(2401:3656,1), RmRf(2401:3656,1),max(mean(SBstar6),1));

Bstar = opt_block_length([dist5cc(2401:3656,1), RmRf(2401:3656,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([dist5fi(2401:3656,1), RmRf(2401:3656,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([dist20cc(2401:3656,1), RmRf(2401:3656,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([dist20fi(2401:3656,1), RmRf(2401:3656,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([dist35cc(2401:3656,1), RmRf(2401:3656,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([dist35fi(2401:3656,1), RmRf(2401:3656,1)]);
SBstar6 = Bstar6(1,:);

[pSR_dist5cc3, pmean_dist5cc3] = dgnu_StatisticsPolitisRomano_v5(dist5cc(2401:3656,1), RmRf(2401:3656,1),max(mean(SBstar),1));
[pSR_dist5fi3, pmean_dist5fi3] = dgnu_StatisticsPolitisRomano_v5(dist5fi(2401:3656,1), RmRf(2401:3656,1),max(mean(SBstar2),1));
[pSR_dist20cc3, pmean_dist20cc3] = dgnu_StatisticsPolitisRomano_v5(dist20cc(2401:3656,1), RmRf(2401:3656,1),max(mean(SBstar3),1));
[pSR_dist20fi3, pmean_dist20fi3] = dgnu_StatisticsPolitisRomano_v5(dist20fi(2401:3656,1), RmRf(2401:3656,1),max(mean(SBstar4),1));
[pSR_dist35cc3, pmean_dist35cc3] = dgnu_StatisticsPolitisRomano_v5(dist35cc(2401:3656,1), RmRf(2401:3656,1),max(mean(SBstar5),1));
[pSR_dist35fi3, pmean_dist35fi3] = dgnu_StatisticsPolitisRomano_v5(dist35fi(2401:3656,1), RmRf(2401:3656,1),max(mean(SBstar6),1));

Bstar = opt_block_length([dist5cc(2401:3656,1), mix5cc(2401:3656,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([dist5fi(2401:3656,1), mix5fi(2401:3656,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([dist20cc(2401:3656,1), mix20cc(2401:3656,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([dist20fi(2401:3656,1), mix20fi(2401:3656,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([dist35cc(2401:3656,1), mix35cc(2401:3656,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([dist35fi(2401:3656,1), mix35fi(2401:3656,1)]);
SBstar6 = Bstar6(1,:);

[pSR_5cc3, pmean_5cc3] = dgnu_StatisticsPolitisRomano_v5(dist5cc(2401:3656,1), mix5cc(2401:3656,1) ,max(mean(SBstar),1));
[pSR_5fi3, pmean_5fi3] = dgnu_StatisticsPolitisRomano_v5(dist5fi(2401:3656,1), mix5fi(2401:3656,1) ,max(mean(SBstar2),1));
[pSR_20cc3, pmean_20cc3] = dgnu_StatisticsPolitisRomano_v5(dist20cc(2401:3656,1), mix20cc(2401:3656,1) ,max(mean(SBstar3),1));
[pSR_20fi3, pmean_20fi3] = dgnu_StatisticsPolitisRomano_v5(dist20fi(2401:3656,1), mix20fi(2401:3656,1) ,max(mean(SBstar4),1));
[pSR_35cc3, pmean_35cc3] = dgnu_StatisticsPolitisRomano_v5(dist35cc(2401:3656,1), mix35cc(2401:3656,1) ,max(mean(SBstar5),1));
[pSR_35fi3, pmean_35fi3] = dgnu_StatisticsPolitisRomano_v5(dist35fi(2401:3656,1), mix35fi(2401:3656,1) ,max(mean(SBstar6),1));
%%
Bstar = opt_block_length([mix5cc(3657:4915,1), RmRf(3657:4915,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([mix5fi(3657:4915,1), RmRf(3657:4915,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([mix20cc(3657:4915,1), RmRf(3657:4915,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([mix20fi(3657:4915,1), RmRf(3657:4915,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([mix35cc(3657:4915,1), RmRf(3657:4915,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([mix35fi(3657:4915,1), RmRf(3657:4915,1)]);
SBstar6 = Bstar6(1,:);

[pSR_mix5cc4, pmean_mix5cc4] = dgnu_StatisticsPolitisRomano_v5(mix5cc(3657:4915,1), RmRf(3657:4915,1),max(mean(SBstar),1));
[pSR_mix5fi4, pmean_mix5fi4] = dgnu_StatisticsPolitisRomano_v5(mix5fi(3657:4915,1), RmRf(3657:4915,1),max(mean(SBstar2),1));
[pSR_mix20cc4, pmean_mix20cc4] = dgnu_StatisticsPolitisRomano_v5(mix20cc(3657:4915,1), RmRf(3657:4915,1),max(mean(SBstar3),1));
[pSR_mix20fi4, pmean_mix20fi4] = dgnu_StatisticsPolitisRomano_v5(mix20fi(3657:4915,1), RmRf(3657:4915,1),max(mean(SBstar4),1));
[pSR_mix35cc4, pmean_mix35cc4] = dgnu_StatisticsPolitisRomano_v5(mix35cc(3657:4915,1), RmRf(3657:4915,1),max(mean(SBstar5),1));
[pSR_mix35fi4, pmean_mix35fi4] = dgnu_StatisticsPolitisRomano_v5(mix35fi(3657:4915,1), RmRf(3657:4915,1),max(mean(SBstar6),1));

Bstar = opt_block_length([dist5cc(3657:4915,1), RmRf(3657:4915,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([dist5fi(3657:4915,1), RmRf(3657:4915,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([dist20cc(3657:4915,1), RmRf(3657:4915,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([dist20fi(3657:4915,1), RmRf(3657:4915,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([dist35cc(3657:4915,1), RmRf(3657:4915,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([dist35fi(3657:4915,1), RmRf(3657:4915,1)]);
SBstar6 = Bstar6(1,:);

[pSR_dist5cc4, pmean_dist5cc4] = dgnu_StatisticsPolitisRomano_v5(dist5cc(3657:4915,1), RmRf(3657:4915,1),max(mean(SBstar),1));
[pSR_dist5fi4, pmean_dist5fi4] = dgnu_StatisticsPolitisRomano_v5(dist5fi(3657:4915,1), RmRf(3657:4915,1),max(mean(SBstar2),1));
[pSR_dist20cc4, pmean_dist20cc4] = dgnu_StatisticsPolitisRomano_v5(dist20cc(3657:4915,1), RmRf(3657:4915,1),max(mean(SBstar3),1));
[pSR_dist20fi4, pmean_dist20fi4] = dgnu_StatisticsPolitisRomano_v5(dist20fi(3657:4915,1), RmRf(3657:4915,1),max(mean(SBstar4),1));
[pSR_dist35cc4, pmean_dist35cc4] = dgnu_StatisticsPolitisRomano_v5(dist35cc(3657:4915,1), RmRf(3657:4915,1),max(mean(SBstar5),1));
[pSR_dist35fi4, pmean_dist35fi4] = dgnu_StatisticsPolitisRomano_v5(dist35fi(3657:4915,1), RmRf(3657:4915,1),max(mean(SBstar6),1));

Bstar = opt_block_length([dist5cc(3657:4915,1), mix5cc(3657:4915,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([dist5fi(3657:4915,1), mix5fi(3657:4915,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([dist20cc(3657:4915,1), mix20cc(3657:4915,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([dist20fi(3657:4915,1), mix20fi(3657:4915,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([dist35cc(3657:4915,1), mix35cc(3657:4915,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([dist35fi(3657:4915,1), mix35fi(3657:4915,1)]);
SBstar6 = Bstar6(1,:);

[pSR_5cc4, pmean_5cc4] = dgnu_StatisticsPolitisRomano_v5(dist5cc(3657:4915,1), mix5cc(3657:4915,1) ,max(mean(SBstar),1));
[pSR_5fi4, pmean_5fi4] = dgnu_StatisticsPolitisRomano_v5(dist5fi(3657:4915,1), mix5fi(3657:4915,1) ,max(mean(SBstar2),1));
[pSR_20cc4, pmean_20cc4] = dgnu_StatisticsPolitisRomano_v5(dist20cc(3657:4915,1), mix20cc(3657:4915,1) ,max(mean(SBstar3),1));
[pSR_20fi4, pmean_20fi4] = dgnu_StatisticsPolitisRomano_v5(dist20fi(3657:4915,1), mix20fi(3657:4915,1) ,max(mean(SBstar4),1));
[pSR_35cc4, pmean_35cc4] = dgnu_StatisticsPolitisRomano_v5(dist35cc(3657:4915,1), mix35cc(3657:4915,1) ,max(mean(SBstar5),1));
[pSR_35fi4, pmean_35fi4] = dgnu_StatisticsPolitisRomano_v5(dist35fi(3657:4915,1), mix35fi(3657:4915,1) ,max(mean(SBstar6),1));
%%
Bstar = opt_block_length([mix5cc(4916:6173,1), RmRf(4916:6173,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([mix5fi(4916:6173,1), RmRf(4916:6173,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([mix20cc(4916:6173,1), RmRf(4916:6173,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([mix20fi(4916:6173,1), RmRf(4916:6173,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([mix35cc(4916:6173,1), RmRf(4916:6173,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([mix35fi(4916:6173,1), RmRf(4916:6173,1)]);
SBstar6 = Bstar6(1,:);

[pSR_mix5cc5, pmean_mix5cc5] = dgnu_StatisticsPolitisRomano_v5(mix5cc(4916:6173,1), RmRf(4916:6173,1),max(mean(SBstar),1));
[pSR_mix5fi5, pmean_mix5fi5] = dgnu_StatisticsPolitisRomano_v5(mix5fi(4916:6173,1), RmRf(4916:6173,1),max(mean(SBstar2),1));
[pSR_mix20cc5, pmean_mix20cc5] = dgnu_StatisticsPolitisRomano_v5(mix20cc(4916:6173,1), RmRf(4916:6173,1),max(mean(SBstar3),1));
[pSR_mix20fi5, pmean_mix20fi5] = dgnu_StatisticsPolitisRomano_v5(mix20fi(4916:6173,1), RmRf(4916:6173,1),max(mean(SBstar4),1));
[pSR_mix35cc5, pmean_mix35cc5] = dgnu_StatisticsPolitisRomano_v5(mix35cc(4916:6173,1), RmRf(4916:6173,1),max(mean(SBstar5),1));
[pSR_mix35fi5, pmean_mix35fi5] = dgnu_StatisticsPolitisRomano_v5(mix35fi(4916:6173,1), RmRf(4916:6173,1),max(mean(SBstar6),1));

Bstar = opt_block_length([dist5cc(4916:6173,1), RmRf(4916:6173,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([dist5fi(4916:6173,1), RmRf(4916:6173,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([dist20cc(4916:6173,1), RmRf(4916:6173,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([dist20fi(4916:6173,1), RmRf(4916:6173,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([dist35cc(4916:6173,1), RmRf(4916:6173,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([dist35fi(4916:6173,1), RmRf(4916:6173,1)]);
SBstar6 = Bstar6(1,:);

[pSR_dist5cc5, pmean_dist5cc5] = dgnu_StatisticsPolitisRomano_v5(dist5cc(4916:6173,1), RmRf(4916:6173,1),max(mean(SBstar),1));
[pSR_dist5fi5, pmean_dist5fi5] = dgnu_StatisticsPolitisRomano_v5(dist5fi(4916:6173,1), RmRf(4916:6173,1),max(mean(SBstar2),1));
[pSR_dist20cc5, pmean_dist20cc5] = dgnu_StatisticsPolitisRomano_v5(dist20cc(4916:6173,1), RmRf(4916:6173,1),max(mean(SBstar3),1));
[pSR_dist20fi5, pmean_dist20fi5] = dgnu_StatisticsPolitisRomano_v5(dist20fi(4916:6173,1), RmRf(4916:6173,1),max(mean(SBstar4),1));
[pSR_dist35cc5, pmean_dist35cc5] = dgnu_StatisticsPolitisRomano_v5(dist35cc(4916:6173,1), RmRf(4916:6173,1),max(mean(SBstar5),1));
[pSR_dist35fi5, pmean_dist35fi5] = dgnu_StatisticsPolitisRomano_v5(dist35fi(4916:6173,1), RmRf(4916:6173,1),max(mean(SBstar6),1));

Bstar = opt_block_length([dist5cc(4916:6173,1), mix5cc(4916:6173,1)]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([dist5fi(4916:6173,1), mix5fi(4916:6173,1)]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([dist20cc(4916:6173,1), mix20cc(4916:6173,1)]);
SBstar3 = Bstar3(1,:);
Bstar4 = opt_block_length([dist20fi(4916:6173,1), mix20fi(4916:6173,1)]);
SBstar4= Bstar4(1,:);
Bstar5 = opt_block_length([dist35cc(4916:6173,1), mix35cc(4916:6173,1)]);
SBstar5 = Bstar5(1,:);
Bstar6 = opt_block_length([dist35fi(4916:6173,1), mix35fi(4916:6173,1)]);
SBstar6 = Bstar6(1,:);

[pSR_5cc5, pmean_5cc5] = dgnu_StatisticsPolitisRomano_v5(dist5cc(4916:6173,1), mix5cc(4916:6173,1) ,max(mean(SBstar),1));
[pSR_5fi5, pmean_5fi5] = dgnu_StatisticsPolitisRomano_v5(dist5fi(4916:6173,1), mix5fi(4916:6173,1) ,max(mean(SBstar2),1));
[pSR_20cc5, pmean_20cc5] = dgnu_StatisticsPolitisRomano_v5(dist20cc(4916:6173,1), mix20cc(4916:6173,1) ,max(mean(SBstar3),1));
[pSR_20fi5, pmean_20fi5] = dgnu_StatisticsPolitisRomano_v5(dist20fi(4916:6173,1), mix20fi(4916:6173,1) ,max(mean(SBstar4),1));
[pSR_35cc5, pmean_35cc5] = dgnu_StatisticsPolitisRomano_v5(dist35cc(4916:6173,1), mix35cc(4916:6173,1) ,max(mean(SBstar5),1));
[pSR_35fi5, pmean_35fi5] = dgnu_StatisticsPolitisRomano_v5(dist35fi(4916:6173,1), mix35fi(4916:6173,1) ,max(mean(SBstar6),1));











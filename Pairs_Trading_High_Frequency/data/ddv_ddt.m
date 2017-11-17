clear all; close all; clc; 

addpath('C:\Users\fsabino\Dropbox\paper1\PDS\cvx\kevinsheppard_multivariate\multivariate');
addpath('C:\Users\fsabino\Dropbox\paper1\PDS\cvx\utility ');
addpath('C:\Users\fsabino\Dropbox\paper1\PDS\cvx');
addpath('C:\Users\fsabino\Dropbox\Fernando\MFE');
addpath('C:\Users\fsabino\Dropbox\Fernando\PTCop'); 
addpath('C:\Program Files\MATLAB\R2013b\toolbox\stats');
addpath('C:\Users\fsabino\Dropbox\Fernando\PTCop\Patton_copula_toolbox');
addpath('C:\Users\fsabino\Dropbox\Fernando\PTCop\ARMAX_GARCH_K_Toolbox');
addpath('C:\Users\fsabino\Dropbox\Fernando\MFE\MFEToolbox\univariate');
addpath('C:\Users\fsabino\Dropbox\Fernando\MFE\MFEToolbox\distributions');
addpath('C:\Users\fsabino\Dropbox\Fernando\MFE\MFEToolbox\mex_source');
addpath('C:\Users\fsabino\Dropbox\Fernando\PairsTrading_FEX\PairsTrading_FEX\m_Files');
addpath('C:\Users\fsabino\Dropbox\Fernando\MFE\Matlab5\TOOLBOX\MATLAB\OMAT');
addpath('C:\Users\fsabino\Dropbox\Fernando\__MACOSX\PDS\códigos');
addpath('C:\Users\fsabino\Dropbox\Fernando\Garch');
addpath('C:\Users\fsabino\Desktop\Fernando\dist_sq');
addpath('C:\Users\fsabino\Desktop\Fernando\sq_mix');
addpath('C:\Users\fsabino\Dropbox\paper_pairs_trading_realized\fillts\paper3');
addpath('C:\Users\fsabino\Desktop\Fernando\Codes Matlab');
addpath('C:\Users\fsabino\Dropbox\pairs_trading_hf\dados');
addpath('C:\Users\fsabino\Dropbox\pairs_trading_hf\dados\fatores_risco');

% We use partially scripts from Broussard and Vaihekoski (2012), 
% Patton copula toolbox and MFE Toolbox from Kevin Sheppard.

%- Deletes all previously obtained results in an older run
% ----------------------------------------------------
% Load in data
% ----------------------------------------------------
load data_hf % This .mat file contains 12 variables.

% ----------------------------------------------------
% Set default values
% ----------------------------------------------------

[~,N]= size(Rt); % T = number of periods (days)

Years = 7;
no_pairs = 100;


ddv_t = zeros(373,no_pairs*(Years * 2 -2));  ddu_t = zeros(373,no_pairs*(Years * 2 -2));
ddv_tn = zeros(373,no_pairs*(Years * 2 -2));  ddu_tn = zeros(373,no_pairs*(Years * 2 -2));
ddv_tc = zeros(373,no_pairs*(Years * 2 -2));  ddu_tc = zeros(373,no_pairs*(Years * 2 -2));
ddv_tf = zeros(373,no_pairs*(Years * 2 -2));  ddu_tf = zeros(373,no_pairs*(Years * 2 -2));
ddv_tg = zeros(373,no_pairs*(Years * 2 -2));  ddu_tg = zeros(373,no_pairs*(Years * 2 -2));
ddv_tt = zeros(373,no_pairs*(Years * 2 -2));  ddu_tt = zeros(373,no_pairs*(Years * 2 -2));
ddv_tm = zeros(373,no_pairs*(Years * 2 -2));  ddu_tm = zeros(373,no_pairs*(Years * 2 -2));
ddv_tmt = zeros(373,no_pairs*(Years * 2 -2));  ddu_tmt = zeros(373,no_pairs*(Years * 2 -2));
opt_cop = zeros(Years * 2 -2,no_pairs);

% ----------------------------------------------------
% Start of Main Loop - Creating Price Index
% ----------------------------------------------------
% Main part of the program starts here
% ----------------------------------------------------
big_loop = 1;

i = 1;

while big_loop <= (Years * 2 -2); % big loop starts here; take 6 month steps
      Twe_mo = Periods(big_loop,4); % picks up # of days in 12 months
      Six_mo = Periods(big_loop+2,1); % picks up # of days in following 6 months
% ----------------------------------------------------
% Create price index IPt by setting first Pt>0 to 1
% ----------------------------------------------------
IPt = zeros(Twe_mo+Six_mo,N); % IPt = Indexed Price at time t
% Preallocate a zeros matrix with the size of the Formation + Trading period
% IPt = Indexed Price at time t

for j=1:N
    m = 0;
    for i2=1:(Twe_mo+Six_mo)
        if Pt(i+i2-1,j)>0 && m == 0
            IPt(i2,j) = 1; m=1;
     elseif Pt(i+i2-1,j)>0 && m == 1
            IPt(i2,j) = IPt(i2-1,j) * (1 + Rt(i+i2-1,j));
        end
    end
end

listed1 = IPt(1,:) > 0; % listed at the beginning (1xN vector of 0/1s)
listed2 = IPt(Twe_mo+Six_mo,:)>0;
listed = listed1 .* listed2; % listed throughout the 12+6 month period (1xN vector of 0/1s)

no_listed = sum(listed);
index_listed = find(listed>0); % find columns that should be included

% [D,ia,ib]=union(ticker2(:,big_loop),ticker2(:,big_loop+1));
% [ic,id]= ismember(D,ticker2(:,big_loop+2));
% [ie,ig]= ismember(D(ic),tickerb);
% index_listed2= ig';
% no_listed2 = sum(ie);

no_listed2 = no_listed; 
index_listed2 = index_listed;
% Lines 91-95 are used in Performance of Pairs Trading on the S&P 500:
% Distance and Mixed Copula models

% ----------------------------------------------------
% Add filters (if needed)
% ----------------------------------------------------
% e.g. remove if liquidity below value X, the second listed stock series etc.
% ----------------------------------------------------
% Desc stat of the price series
% ----------------------------------------------------
no_comp = sum((IPt > 0)')';

disp(['Period ',num2str(big_loop)]);
disp(['Time series mean no of stock series ',num2str(mean(no_comp))]);
disp(['Max number of stock series ',num2str(max(no_comp))]);
disp(['Min number of stock series ',num2str(min(no_comp))]);

SSE = zeros(no_listed2,no_listed2);
    for j=1:(no_listed2-1) % calculate SSE for all pairs
        for k=(j+1):no_listed2 % can prob. be speeded up by better programming
            SSE(index_listed2(j),index_listed2(k)) = sum(( IPt(1:Twe_mo,index_listed2(j))-...
                IPt(1:Twe_mo,index_listed2(k)) ).^2);
            %sum(abs( IPt(1:Twe_mo,index_listed2(j))- IPt(1:Twe_mo,index_listed2(k)) ));
        end
    end

% ----------------------------------------------------
% Find min SSEs
% ----------------------------------------------------
max_SSE = max(max(SSE)) + 1;
min_SSE = zeros(no_pairs,1);
min_SSE_ro = zeros(1,no_pairs);
min_SSE_co = zeros(1,no_pairs);

    for ii=1:no_pairs % find no_pairs minimum SSEs
        t_SSE = max_SSE; % temp_SSE
           
        for j=1:(no_listed2-1)
                for k=(j+1):no_listed2
                    if SSE(j,k) > 0 && SSE(j,k) < t_SSE
                        t_SSE = SSE(j,k); % a new minimum is found
                    end
                end
        end
        
        if t_SSE == max_SSE
            disp('ERROR---------------');
        end
[ro,co] = find(SSE == t_SSE);   % row and column of the minimum
                                % If there is a risk that the same asset is twice
                                % in the database, add ro=ro(1) and co=co(1)
ro=ro(1); co=co(1);

min_SSE(ii,1) = SSE(ro,co);
min_SSE_ro(ii) = ro; % column of the 1st stock in a pair
min_SSE_co(ii) = co; % column of the 2nd stock in a pair
SSE(ro,co) = max_SSE; % prevent re-selection
    end % of ii

disp([min_SSE_ro;min_SSE_co]);

window= cumsum(Periods(1:end,1)); % estimation window
% 
int_w = [0;window];
    
% Fit ARMA(p,q) models. To identify the best lags, fit several models with
% different lag choices. Here we fit all combinations of p and q= 0, 1, 2,
% 3 (a total of 16 models). Store the log likelihood objective function and
% the number of coefficients for each fitted model.
 
[~,k1] = size(min_SSE_ro); [~,k2] = size(min_SSE_co);
% 
mbest_r = cell(1,k1); minaic_r = zeros(1,k1); pbest_r = zeros(1,k1);
qbest_r = zeros(1,k1);
% % 
mbest_c = cell(1,k2); minaic_c = zeros(1,k2); pbest_c = zeros(1,k2);
qbest_c = zeros(1,k2);
% % 
 
for ib = 1:k1
    pvec = [0,1,2];
    qvec = [0,1,2];
    [mbest_r{ib},minaic_r(ib),pbest_r(ib),qbest_r(ib)] = armabat(Rt(int_w(big_loop)+1:int_w(big_loop+2),min_SSE_ro(ib)),pvec,qvec);
    [mbest_c{ib},minaic_c(ib),pbest_c(ib),qbest_c(ib)] = armabat(Rt(int_w(big_loop)+1:int_w(big_loop+2),min_SSE_co(ib)),pvec,qvec);
end

% script armabat can be found here http://www.stat.unc.edu/faculty/hurd/stat185Data/progdoc.html
%  
muhat_r = zeros(Twe_mo,k1); resids_r = zeros(Twe_mo,k1);
muhat_r_t = zeros(Twe_mo + Six_mo,k1); resids_r_t = zeros(Twe_mo+Six_mo,k1);
%  
muhat_c = zeros(Twe_mo,k2); resids_c = zeros(Twe_mo,k2);
muhat_c_t = zeros(Twe_mo + Six_mo,k2); resids_c_t = zeros(Twe_mo+Six_mo,k2);
%  
% % Function to return the conditional mean from an ARMA(p,q) model
% %  INPUTS:  theta, a kx1 vector = [phi0,phi1,...,phip,theta1,...,thetaq]
% %           p, a scalar, the order of the AR part
% %           q, a scalar, the order of the MA part
% %           data, a Tx1 vector of data
% %
% %  OUTPUS:  muhat, a Tx1 vector of the conditional mean
%  
for im = 1:k1
    [muhat_r(:,im)] = ARMA_mean([mbest_r{1,im}.a, mbest_r{1,im}.c(2:end)],pbest_r(im),qbest_r(im)...
    ,Rt(int_w(big_loop)+1:int_w(big_loop+2),min_SSE_ro(im)));
    resids_r(:,im) = Rt(int_w(big_loop)+1:int_w(big_loop+2),min_SSE_ro(im))-muhat_r(:,im);
    [muhat_c(:,im)] = ARMA_mean([mbest_c{1,im}.a, mbest_c{1,im}.c(2:end)],pbest_c(im),qbest_c(im)...
    ,Rt(int_w(big_loop)+1:int_w(big_loop+2),min_SSE_co(im)));
    resids_c(:,im) = Rt(int_w(big_loop)+1:int_w(big_loop+2),min_SSE_co(im))-muhat_c(:,im);
end
%  
for ia = 1:k1
    [muhat_r_t(:,ia)] = ARMA_mean([mbest_r{1,ia}.a, mbest_r{1,ia}.c(2:end)],pbest_r(ia),qbest_r(ia)...
    ,Rt(int_w(big_loop)+1:int_w(big_loop+2)+Six_mo,min_SSE_ro(ia)));
    resids_r_t(:,ia) = Rt(int_w(big_loop)+1:int_w(big_loop+2)+Six_mo,min_SSE_ro(ia))-muhat_r_t(:,ia);
    [muhat_c_t(:,ia)] = ARMA_mean([mbest_c{1,ia}.a, mbest_c{1,ia}.c(2:end)],pbest_c(ia),qbest_c(ia)...
    ,Rt(int_w(big_loop)+1:int_w(big_loop+2)+Six_mo,min_SSE_co(ia)));
    resids_c_t(:,ia) = Rt(int_w(big_loop)+1:int_w(big_loop+2)+Six_mo,min_SSE_co(ia))-muhat_c_t(:,ia);
end
% 
resids_r_t(isnan(resids_r_t)) = 0 ;
resids_c_t(isnan(resids_c_t)) = 0 ;
   
LL1_r = zeros(1,k1); ht1_r = zeros(Twe_mo,k1); LL2_r = zeros(1,k1); ht2_r = zeros(Twe_mo,k1);

LL1_c = zeros(1,k2); ht1_c = zeros(Twe_mo,k2); LL2_c = zeros(1,k2); ht2_c = zeros(Twe_mo,k2);
  
ht1_r_t = zeros(Twe_mo+Six_mo,k1); ht2_r_t = zeros(Twe_mo+Six_mo,k1); 
 
ht1_c_t = zeros(Twe_mo+Six_mo,k1); ht2_c_t = zeros(Twe_mo+Six_mo,k1); 

par1_r = cell(1,k1); par1_c = cell(1,k2); par2_r = cell(1,k1); par2_c = cell(1,k2); 

% Standard HEAVY model
p = [0 1;0 1];
q = eye(2);
% data = [r rm];
ht1_ro = cell(1,k1); ht1_ro_t = cell(1,k1);
ht1_co = cell(1,k1); ht1_co_t = cell(1,k1);

for ip = 1:k1
%   [par1_r{ip},LL1_r(ip),ht1_r(:,ip)]=heavy(resids_r(:,ip),1,1);
   [par1_r{ip},LL1_r(ip),ht1_ro{ip}] = heavy([resids_r(:,ip)...
   rv5(int_w(big_loop)+1:int_w(big_loop+2),min_SSE_ro(ip))],p,q);
end
  
for it = 1:k1
%  [~,~,ht1_r_t(:,it)]=heavy(resids_r_t(:,it),1,1);
  [~,~,ht1_ro_t{it}] = heavy([resids_r_t(:,it)...
  rv5(int_w(big_loop)+1:int_w(big_loop+2)+Six_mo,min_SSE_ro(it))],p,q);
end 

for ip2 = 1:k2
%   [par1_c{ip2},LL1_c(ip2),ht1_c(:,ip2)] = heavy(resids_c(:,ip2),1,1);
   [~,~,ht1_co{ip2}] = heavy([resids_c(:,ip2)...
   rv5(int_w(big_loop)+1:int_w(big_loop+2),min_SSE_co(ip2))],p,q);
end
 
for it2 = 1:k2
%  [~,~,ht1_c_t(:,it2)] = heavy(resids_c_t(:,it2),1,1);
   [~,~,ht1_co_t{it2}] = heavy([resids_c_t(:,it2)...
   rv5(int_w(big_loop)+1:int_w(big_loop+2)+Six_mo,min_SSE_co(it2))],p,q);
end
 
logl_r = LL1_r; logl_c = LL1_c; params_r = par1_r; params_c = par1_c;

stdresids_r = zeros(Twe_mo,k1); stdresids_c = zeros(Twe_mo,k2);
stdresids_r_t = zeros(Twe_mo+Six_mo,k1); stdresids_c_t = zeros(Twe_mo+Six_mo,k2);
 
for is = 1:k1
%         stdresids_r(:,is) = resids_r(:,is)./sqrt(ht1_r(:,is));
%         stdresids_r_t(:,is) = resids_r_t(:,is)./sqrt(ht1_r_t(:,is));
        stdresids_r(:,is) = resids_r(:,is)./sqrt(ht1_ro{1,is}(1:end,1));
        stdresids_r_t(:,is) = resids_r_t(:,is)./sqrt(ht1_ro_t{1,is}(1:end,1));
end
 
for ir = 1:k2
%         stdresids_c(:,ir) = resids_c(:,ir)./sqrt(ht1_c(:,ir));
%         stdresids_c_t(:,ir) = resids_c_t(:,ir)./sqrt(ht1_c_t(:,ir));
        stdresids_c(:,ir) = resids_c(:,ir)./sqrt(ht1_co{1,ir}(1:end,1));
        stdresids_c_t(:,ir) = resids_c_t(:,is)./sqrt(ht1_co_t{1,ir}(1:end,1));
end
 
ecdf_r = zeros(Twe_mo,k1); ecdf_c = zeros(Twe_mo,k2);
 
ecdf_r_t = zeros(Twe_mo+Six_mo,k1); ecdf_c_t = zeros(Twe_mo+Six_mo,k2);
 
for ie = 1:k1
    ecdf_r(:,ie) = empiricalCDF(stdresids_r(:,ie));
    ecdf_c(:,ie) = empiricalCDF(stdresids_c(:,ie));
    ecdf_r_t(:,ie) = empiricalCDF(stdresids_r_t(:,ie));
    ecdf_c_t(:,ie) = empiricalCDF(stdresids_c_t(:,ie));
end
 
u1 = ecdf_r; v1 = ecdf_c; u1_t = ecdf_r_t; v1_t = ecdf_c_t;

options = optimset('Algorithm','interior-point','Display','off','MaxFunEvals',1000);
options = optimset(options,'FinDiffType','central','MaxIter',1500,'TolCon',10^-12,'TolFun',10^-5,'TolX',10^-5);

% 1. Normal Copula
 
kappa1_ecdf = zeros(1,k1); LL1_ecdf = zeros(1,k1);
 
for in = 1:k1
    kappa1_ecdf(in) = corrcoef12(norminv(u1(:,in)),norminv(v1(:,in)));
    LL1_ecdf(in) = NormalCopula_CL(kappa1_ecdf(in),[u1(:,in),v1(:,in)]);
end
 
% 2. Clayton's copula
lower = 0.0001; theta0 = 1;
kappa2_ecdf = zeros(1,k1); LL2_ecdf = zeros(1,k1);
 
for ic = 1:k1
 
[kappa2_ecdf(ic), LL2_ecdf(ic)] = fmincon('claytonCL',theta0,[],[],[],[],lower,[],[],options,[u1(:,ic),v1(:,ic)]);
end
 
% 5. Frank copula
theta0 = 1; kappa5_ecdf = zeros(1,k1); LL5_ecdf = zeros(1,k1);
 
for ik = 1:k1
 
[ kappa5_ecdf(ik), LL5_ecdf(ik)] = fmincon('frankCL',theta0,[],[],[],[],lower,[],[],options,[u1(:,ik),v1(:,ik)]);
end
 
% 6. Gumbel copula
lower = 1.1; theta0 = 2; kappa6_ecdf = zeros(1,k1); LL6_ecdf = zeros(1,k1);
 
for ig = 1:k1
 
[ kappa6_ecdf(ig), LL6_ecdf(ig)] = fmincon('gumbelCL',theta0,[],[],[],[],lower,[],[],options,[u1(:,ig),v1(:,ig)]);
end
 
% 8. Student's t copula                                      
lower = [-0.9 , 2.1 ];
upper = [ 0.9 , 100 ];
 
theta0 = zeros(2,k1); kappa8_ecdf = zeros(2,k1); LL8_ecdf = zeros(1,k1);

for ist = 1:k1
theta0(:,ist) = [kappa1_ecdf(1,ist);10];

[ kappa8_ecdf(:,ist), LL8_ecdf(1,ist)] = fmincon('tcopulaCL',theta0(:,ist)',[],[],[],[],lower,upper,[],options,[u1(:,ist),v1(:,ist)]);
end

% Specify the lower and upper bdds
lower = [0, 0, 0, 0, 0, 1]; upper = [1, 1, 1, Inf, Inf, Inf];

% Specify the initial condition
p0 = [1/3; 1/3; 1/3; 1; 1; 2]; % Give some initial guess for the probabilities and thetas
% 
A = [1 1 1 0 0 0];
b = 1;
% 
% Solve the optimization problem using fmincon
% 
LLCFG_ecdf = zeros(1,k1);
% 
for im = 1:k1
[x(:,im), LLCFG_ecdf(1,im)] = fmincon('LLCFG', p0, A, b, [], [], lower, upper,[], options, [u1(:,im), v1(:,im)]);
end

% Specify the lower and upper bdds
lower = [0, 0, 0, eps, -1+eps, 2+eps,1]; upper = [1, 1, 1, Inf, 1-eps, Inf,Inf];
% % 
% Specify the initial condition
p0 = [1/3; 1/3; 1/3; 1; 0; 10; 2]; % Give some initial guess for the probabilities and thetas
% 
A = [1 1 1 0 0 0 0];
b = 1;
% 
% Solve the optimization problem using fmincon
% 
LLCTG_ecdf = zeros(1,k1);
% 
for im = 1:k1
[xt(:,im), LLCTG_ecdf(1,im)] = fmincon('LLCTG', p0, A, b, [], [], lower, upper,[], options, [u1(:,im), v1(:,im)]);
end
% %  
LL_ecdf = [LL1_ecdf; LL2_ecdf; LL5_ecdf; LL6_ecdf; LL8_ecdf; LLCFG_ecdf; LLCTG_ecdf];
% 
% optimal copula (in terms of log-likelihood) is one with lowest likelihood
% (since we minimise the *negative* LL, rather than maximize the positive LL) 
%  
opt_cop = zeros(1,k1);
for ill=1:k1
opt_cop(ill) = find(LL_ecdf(:,ill)==min(LL_ecdf(:,ill)));
end
  
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% %% Conditional Probabilities %%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% %% partial derivatives d/dv and d/du %%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  
% 
for id = 1:no_pairs
        ddv_tn(1:length(u1_t),id + no_pairs*(big_loop-1)) = normUgivenV(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa1_ecdf(1,id));
        ddu_tn(1:length(u1_t),id + no_pairs*(big_loop-1)) = normVgivenU(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa1_ecdf(1,id));
        ddv_tc(1:length(u1_t),id + no_pairs*(big_loop-1))= ClaytonUgivenV(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa2_ecdf(1,id));
        ddu_tc(1:length(u1_t),id + no_pairs*(big_loop-1))= ClaytonVgivenU(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa2_ecdf(1,id));
        ddv_tf(1:length(u1_t),id + no_pairs*(big_loop-1))= FrankUgivenV(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa5_ecdf(1,id));
        ddu_tf(1:length(u1_t),id + no_pairs*(big_loop-1))= FrankVgivenU(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa5_ecdf(1,id));
        ddv_tg(1:length(u1_t),id + no_pairs*(big_loop-1))= GumbelUgivenV(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa6_ecdf(1,id));
        ddu_tg(1:length(u1_t),id + no_pairs*(big_loop-1))= GumbelVgivenU(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa6_ecdf(1,id));
        ddv_tt(1:length(u1_t),id + no_pairs*(big_loop-1))= tUgivenV(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa8_ecdf(2,id),kappa8_ecdf(1,id));
        ddu_tt(1:length(u1_t),id + no_pairs*(big_loop-1))= tVgivenU(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa8_ecdf(2,id),kappa8_ecdf(1,id));
        ddv_tm(1:length(u1_t),id + no_pairs*(big_loop-1))= x(1,id).*ClaytonUgivenV(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa2_ecdf(1,id))+...
                     x(2,id).*FrankUgivenV(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa5_ecdf(1,id))+...
                     (1-x(1,id)-x(2,id)).*GumbelUgivenV(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa6_ecdf(1,id));
        ddu_tm(1:length(u1_t),id + no_pairs*(big_loop-1))= x(1,id).*ClaytonVgivenU(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa2_ecdf(1,id))+...
                    x(2,id).*FrankVgivenU(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa5_ecdf(1,id))+...
                    (1-x(1,id)-x(2,id)).*GumbelVgivenU(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa6_ecdf(1,id));
        ddv_tmt(1:length(u1_t),id + no_pairs*(big_loop-1))= x(1,id).*ClaytonUgivenV(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa2_ecdf(1,id))+...
                     x(2,id).*tUgivenV(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa8_ecdf(2,id),kappa8_ecdf(1,id))+...
                     (1-x(1,id)-x(2,id)).*GumbelUgivenV(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa6_ecdf(1,id));
        ddu_tmt(1:length(u1_t),id + no_pairs*(big_loop-1))= x(1,id).*ClaytonVgivenU(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa2_ecdf(1,id))+...
                    x(2,id).*tVgivenU(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa8_ecdf(2,id),kappa8_ecdf(1,id))+...
                    (1-x(1,id)-x(2,id)).*GumbelVgivenU(u1_t(1:length(u1_t),id),v1_t(1:length(u1_t),id),kappa6_ecdf(1,id));
end
% 
for id = 1:no_pairs
    if opt_cop(id)== 1;
        ddv_t(1:length(u1_t),id + no_pairs*(big_loop-1)) = ddv_tn(1:length(u1_t),id + no_pairs*(big_loop-1));
        ddu_t(1:length(u1_t),id + no_pairs*(big_loop-1)) = ddu_tn(1:length(u1_t),id + no_pairs*(big_loop-1));
   elseif opt_cop(id)== 2;
        ddv_t(1:length(u1_t),id + no_pairs*(big_loop-1))= ddv_tc(1:length(u1_t),id + no_pairs*(big_loop-1));
        ddu_t(1:length(u1_t),id + no_pairs*(big_loop-1))= ddu_tc(1:length(u1_t),id + no_pairs*(big_loop-1));
    elseif opt_cop(id)== 3;
        ddv_t(1:length(u1_t),id + no_pairs*(big_loop-1))= ddv_tf(1:length(u1_t),id + no_pairs*(big_loop-1));
        ddu_t(1:length(u1_t),id + no_pairs*(big_loop-1))= ddu_tf(1:length(u1_t),id + no_pairs*(big_loop-1));
    elseif opt_cop(id)== 4;
        ddv_t(1:length(u1_t),id + no_pairs*(big_loop-1))= ddv_tg(1:length(u1_t),id + no_pairs*(big_loop-1));
        ddu_t(1:length(u1_t),id + no_pairs*(big_loop-1))= ddu_tg(1:length(u1_t),id + no_pairs*(big_loop-1));
    elseif opt_cop(id)== 5;
        ddv_t(1:length(u1_t),id + no_pairs*(big_loop-1))= ddv_tt(1:length(u1_t),id + no_pairs*(big_loop-1));
        ddu_t(1:length(u1_t),id + no_pairs*(big_loop-1))= ddu_tt(1:length(u1_t),id + no_pairs*(big_loop-1));
    elseif opt_cop(id)== 6;
        ddv_t(1:length(u1_t),id + no_pairs*(big_loop-1))= ddv_tm(1:length(u1_t),id + no_pairs*(big_loop-1));
        ddu_t(1:length(u1_t),id + no_pairs*(big_loop-1))= ddu_tm(1:length(u1_t),id + no_pairs*(big_loop-1));
    elseif opt_cop(id)== 7;
        ddv_t(1:length(u1_t),id + no_pairs*(big_loop-1))= ddv_tmt(1:length(u1_t),id + no_pairs*(big_loop-1));
        ddu_t(1:length(u1_t),id + no_pairs*(big_loop-1))= ddu_tmt(1:length(u1_t),id + no_pairs*(big_loop-1));
    end
end
% 
i = i + Periods(big_loop,1);

big_loop = big_loop + 1;

end

ddu_tn = ddu_tn - 0.5; ddu_tc = ddu_tc - 0.5; ddu_tf = ddu_tf - 0.5; ddu_tg = ddu_tg - 0.5;
ddu_tt = ddu_tt - 0.5; ddu_tm = ddu_tm - 0.5; ddu_tmt = ddu_tmt - 0.5;
ddv_tn = ddv_tn - 0.5; ddv_tc = ddv_tc - 0.5; ddv_tf = ddv_tf - 0.5; ddv_tg = ddv_tg - 0.5;
ddv_tt = ddv_tt - 0.5; ddv_tm = ddv_tm - 0.5; ddv_tmt = ddv_tmt - 0.5;
ddv_t = ddv_t - 0.5; ddu_t = ddu_t - 0.5; 

save('C:\Users\fsabino\Dropbox\pairs_trading_hf\dados\dduv_t.mat');


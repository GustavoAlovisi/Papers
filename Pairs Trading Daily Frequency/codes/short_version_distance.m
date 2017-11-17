%% Top 5, C = 0

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
addpath('C:\Users\fsabino\Desktop\Fernando\papers');


% ----------------------------------------------------
% Load in data
% ----------------------------------------------------
testing = 0;

load SP500_p1
% ----------------------------------------------------
% Set default values
% ----------------------------------------------------

[T,N]= size(Rt); % T = number of periods (days)
% N = number of assets in the whole period
daylag = 0;    % set whether (1, default) or not (0) signals take one day to go into effect (cf. Table 1A vs. 1B)
wi_update = 1; % set whether (1, default) or not (0) intra-pair weights are updated when pair is open; 
               % if not: weights stay at 50-50%
Years = 2015 - 1990 + 0.5;
 
no_pairs = 5;
trading_cost = 0; % works just with one day lag
C = 0; % buy/sell (percentage cost for opening and closing pairs)
trade_req = 0; % set whether (0) or not (2) positive trading volume is required for opening/closing a pair
Stop_loss = -Inf ; %disp(['Stop_loss = ', num2str(Stop_loss)]);%Choose how much loss we are willing to accept on a given pair, compared to 1, i.e 0.93 = 7% stop loss
Stop_gain = Inf;  %disp(['Stop_loss = ', num2str(Stop_gain)]); %Choose how much gain we are willing to accept on a given pair, compared to 1, i.e 1.10 = 10% stop gain
s1218 = 1; % listing req. (look ahead): 12+6 months (=1)

% ----------------------------------------------------
% Reset several variables used for desc statistics
% ----------------------------------------------------
Av_price_dev = zeros(T-sum(Periods(1:2,1)),no_pairs*2); % 12 months are w/o price deviations
% The first 12 months are formation period
Rpair = zeros(sum(Periods(end-1,4)),no_pairs); % Keeps track of the return of each pair

MDDpairs = zeros(length(Periods)-1,no_pairs); % Pre allocate MDD matrix for each pair out of sample;
MDDw = zeros(length(Periods)-1,5); %- Preallocate MDD matrix out of sample for 4 weighting schemes + Rm + (Rm-Rf).
STNpairs = zeros(length(Periods)-2,no_pairs);
STNw = zeros(length(Periods)-2,5);

periods_with_open_pair = 0; % number of periods with pairs opened
periods_without_openpa = 0; % number of periods without pairs opened
pairs_number = 0; pair_open = 0; %
days_open = zeros(no_pairs*10000,1); % measures number of days each pair open; bad programming, but we do not know how many pairs we get
no_pairs_opened = zeros(Years*2-2,no_pairs); % measures number of times pairs opened in each pair per 6 month period

counter = 1; % Keeps track of the days in the main loop
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
listed2 = IPt(Twe_mo+Six_mo*(s1218==1),:)>0; % listed at the end: 12/18 months from now (1xN vector of 0/1s)
listed = listed1 .* listed2; % listed throughout the 12+6 month period (1xN vector of 0/1s)

no_listed = sum(listed);
index_listed = find(listed>0); % find columns that should be included

% [D,ia,ib]=intersect(ticker2(:,big_loop),ticker2(:,big_loop+1));
% [ic,id]= ismember(D,ticker2(:,big_loop+2));
% [ie,ig]= ismember(D(ic),tickerb);
% index_listed2= intersect(index_listed,ig');
% no_listed2 = size(index_listed2,2);

[D,ia,ib]=union(ticker2(:,big_loop),ticker2(:,big_loop+1));
[ic,id]= ismember(D,ticker2(:,big_loop+2));
[ie,ig]= ismember(D(ic),tickerb);
index_listed2= ig';
no_listed2 = sum(ie);


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
% ----------------------------------------------------
% Calc SSEs
% ----------------------------------------------------

SSE = zeros(no_listed2,no_listed2);
    for j=1:(no_listed2-1) % calculate SSE for all pairs
        for k=(j+1):no_listed2 % can prob. be speeded up by better programming
            % SSE(index_listed2(j),index_listed2(k)) = sum(abs( IPt(1:Twe_mo,index_listed2(j))- IPt(1:Twe_mo,index_listed2(k)) ));
           SSE(index_listed2(j),index_listed2(k)) = sum(( IPt(1:Twe_mo,index_listed2(j))-...
                IPt(1:Twe_mo,index_listed2(k)) ).^2);
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

% ----------------------------------------------------
% Calculate returns during the 6 month period
% ----------------------------------------------------
count_temp = counter;

for p=1:no_pairs
    counter = count_temp; pairs_opened = 0; new_pairs_opened = 0; lag = 0;
    std_limit = std(IPt(1:Twe_mo,min_SSE_ro(p))-IPt(1:+Twe_mo,min_SSE_co(p)));
% Fixed volatility estimated in the 12 months period. Doing the calculation one pair at a time 
Rcum = zeros(Twe_mo,1); counter_ret = 1; Rcum_ret = 1; % Presets all variables for each pair
        
for j=(i+Twe_mo):(i+Twe_mo+Six_mo-1) % portfolio period
% Defining the period as from the first day of the twe_month to the 
% last day of the twe_month

if daylag == 0 % w/o one day delay
        if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
                              % If a sign to open has been given, then calcule the returns
           Rpair(counter,p) = +Rt(j,min_SSE_ro(p)) .* wi(1)- Rt(j,min_SSE_co(p)) .* wi(2);
           % Rpair is the return of each pair.
           Rcum(counter_ret,1) = Rpair(counter,p); 
           counter_ret = counter_ret + 1;
           Rcum_ret = cumprod(1+Rcum);  
           lag = lag + 1; %used for paying tc    

		if wi_update == 1 % The weight of each asset in the pair is updated. 
                        wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                        wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
               Rpair(counter,p) = -Rt(j,min_SSE_ro(p)) .* wi(1) + Rt(j,min_SSE_co(p)) .* wi(2);
               Rcum(counter_ret,1) = Rpair(counter,p); 
               counter_ret = counter_ret + 1;
               Rcum_ret = cumprod(1+Rcum);
               lag = lag + 1;
                
		if wi_update == 1
                   wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                   wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        else
               Rpair(counter,p) = 0; % closed (this code not necessary)
        end
            
            if ((pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <= 0)...
               || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain) ...
 	           || (pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0))...
               && ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)...

                pairs_opened = 0; % close pairs: prices cross
		        lag = 0; % when pair is closed reset lag (it serves for paying tc)
                Av_price_dev(counter,no_pairs+p) = 1; % add a marker for closing; 
                                                      % used to calc length of the "open-period"
                Rpair(counter,p) = Rpair(counter,p) - C; %Includes trading cost in the last day of trading, due to closing position                                      
            elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
            if pairs_opened == 0 % record dev (and time) at open
                Rcum = zeros(Six_mo,1);
		        counter_ret = 1;
                Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
                                          /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
            end
            
            pairs_opened = 1; % open pairs
	        lag = lag + 1;  %- Lag was 0. On the next loop C will be paid
            wi = ones(1,2);
            
            elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)

        if pairs_opened == 0 % record dev (and time) at open
	       Rcum = zeros(Six_mo,1);
           counter_ret = 1;
           Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))...
                                    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
        end
        
        pairs_opened = -1; % open pairs
 	    lag = lag + 1;
        wi = ones(1,2);
            
         end
            
        counter = counter + 1; % This is done for the first day, now update 
                               % counter so it is done for the 2nd day        
        elseif daylag == 1 % w/one day delay
            
if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
    Rpair(counter,p) = (+Rt(j,min_SSE_ro(p)) * wi(1) - Rt(j,min_SSE_co(p))* wi(2)) - (lag==2)*trading_cost;
    Rcum (counter_ret,1) = Rpair(counter,p); 
    counter_ret = counter_ret + 1;
    Rcum_ret = cumprod(1+Rcum);
if wi_update == 1
    wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
    wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
end

elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
        Rpair(counter,p) = (-Rt(j,min_SSE_ro(p)) * wi(1)+ Rt(j,min_SSE_co(p)) * wi(2)) - (lag==2)*trading_cost;
    	Rcum (counter_ret,1) = Rpair(counter,p); 
        counter_ret = counter_ret + 1;
        Rcum_ret = cumprod(1+Rcum);
        if wi_update == 1
            wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
            wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
else
    Rpair(counter,p) = 0; % closed (this code not necessary)
end

    pairs_opened = new_pairs_opened;

if (pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <=  0 ...
   || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain)...   
   || pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0)...
   &&((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
    
    new_pairs_opened = 0; % close prices: prices cross
    % If the pairs are open and the spread is smaller than the
    % threshold, close the position 
    lag = 0;
    Av_price_dev(counter+1,no_pairs+p) = 1; % see above, marker

    if wi_update == 1
        Rpair(counter,p) = Rpair(counter,p) - trading_cost - C;
    end
    
elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = 1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 1st, long 2nd) 
        lag = lag + 1;
        if  pairs_opened == 0
            Rcum = zeros(Six_mo,1);
            counter_ret = 1;
        end         
        
elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = -1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 2nd, long 1st)       
        lag = lag + 1;
        if pairs_opened == 0 % - If the pair was closed, reset accumulated return matrix and counter
           Rcum = zeros(Six_mo,1);
           counter_ret = 1;
        end
end

if new_pairs_opened == +1 && lag == 1
    Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);

elseif new_pairs_opened == -1 && lag == 1
    
Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))/(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);
end
    counter = counter + 1;
end % endif of one day lag (0/1)
end % end for pairs-period days (j)

% if a pair open at the end, add a sign that closed
% otherwise no additional steps necessary, as closing just gets last day's return

if pairs_opened ~= 0
    Rpair(counter-1,p) = Rpair(counter-1,p) - trading_cost - C; %Includes trading cost in the last day of trading, due to closing position
    Av_price_dev(counter-1,no_pairs+p) = 1;
end

end % end for portfolio (p)
%% Using 2 Weighting Schemes - Fully Invested and Committed Capital
% ------------------------------------------------------------
% Calculate portfolio returns (ew, vw) out of percentage Rpair
% ------------------------------------------------------------
Rpair_temp = Rpair(counter-Six_mo:counter-1,:);
%
% eq-weighted average on committed cap.; weights reset to "one" (or any equal weight) after each day
%
Ret_acum_pairs(counter-Six_mo:counter-1,:) = (cumprod(1+(Rpair_temp)));
[MaxDD,~] = maxdrawdown(ret2tick(Rpair_temp));
MDDpairs(big_loop,:)= MaxDD;  
STN = sortinoratio(Rpair_temp,0);
STNpairs(big_loop,:) = STN;

%
wi = ones(1,no_pairs);
wi = [wi;cumprod(1+Rpair_temp)];
wi = wi(1:Six_mo,:);
%
% vw-weighted, committed cap.; weights "restart" every 6 month period; 
% (each portfolio gets 1 dollar at the beginning)
Rp_vw_cc(counter-Six_mo:counter-1,:) = (sum((wi .* Rpair_temp)'))' ./ sum(wi')';
%
% vw-weighted, fully invested; weights "restart" from 1 every time a new pair is opened;
% Capital divided between open portfolios.
Ret_acum(counter-Six_mo:counter-1,2) = (cumprod(1+(Rp_vw_cc(counter-Six_mo:counter-1,:))));
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_cc(counter-Six_mo:counter-1,:)));
MDDw(big_loop,2) = MaxDD;
STN = sortinoratio(Rp_vw_cc(counter-Six_mo:counter-1,:),0);
STNw(big_loop,2) = STN;
%
pa_open = zeros(Six_mo,no_pairs); % indicator for days when pairs open

    for i2=1:no_pairs
        pa_opened_temp = 0;temp_lag = 0;
    for i1=1:Six_mo
        if  pa_opened_temp == 1 && daylag == 0 % opening period not included, closing included
            pa_open(i1,i2) = 1;
            days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end
        if   pa_opened_temp == 1 && daylag == 1 && temp_lag == 1
             pa_open(i1,i2) = 1;
             days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end

        if  pa_opened_temp == 1 && daylag == 1 && temp_lag == 0
            temp_lag = 1;
        end

        if  Av_price_dev(counter-1-Six_mo+i1,i2) ~= 0
            pa_opened_temp = 1;
            pairs_number = pairs_number + 1;
        end

         if  Av_price_dev(counter-1-Six_mo+i1,no_pairs+i2) ~= 0
             pa_opened_temp = 0;
             temp_lag = 0;
         end
    end
    end

wi2 = wi .* pa_open;

for i2=1:Six_mo % takes care in a situation where no pairs are open
    if  sum(pa_open(i2,:)') == 0
        wi2(i2,1:no_pairs) = 0.2 * ones(1,no_pairs);
        pa_open(i2,1:no_pairs) = ones(1,no_pairs);
    end
end

Rp_vw_fi(counter-Six_mo:counter-1,:) = (sum((wi2 .* Rpair_temp)'))' ./ sum(wi2')';

Ret_acum(counter-Six_mo:counter-1,3) = (cumprod(1+(Rp_vw_fi(counter-Six_mo:counter-1,:))));
%
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_fi(counter-Six_mo:counter-1,:)));
MDDw(big_loop,4) = MaxDD;
STN = sortinoratio(Rp_vw_fi(counter-Six_mo:counter-1,:),0);
STNw(big_loop,4) = STN;
%
%
RmRf(counter-Six_mo:counter-1,:) = Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:);
Ret_acum(i:i+Six_mo-1,6) = (cumprod(1+(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:))));
[MDD,MDDIndex] = maxdrawdown(ret2tick(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:)));
MDDw(big_loop,5) = MaxDD;
STN = sortinoratio(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:),0);
STNw(big_loop,5) = STN;

    for i2=1:no_pairs
        if  sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0) ~= 0
            periods_with_open_pair = periods_with_open_pair + 1;
            no_pairs_opened(big_loop,i2) = no_pairs_opened(big_loop,p)+ sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0);
        else

        periods_without_openpa = periods_without_openpa + 1;
        end
    end

i = i + Periods(big_loop,1);

big_loop = big_loop + 1;

end % end main loop
% ----------------------------------------------------
% ************* Analysis of the results **************
% ----------------------------------------------------
T_Rp = size(Rp_vw_cc,1); T_Rm = size(Rm,1);
Rm = Rm((1+T_Rm-T_Rp):T_Rm,1); % market
Rf = Rf((1+T_Rm-T_Rp):T_Rm,1); % risk-free rate
RmRf = Rm - Rf; % excess market

MktRf2 = MktRf2((1+T_Rm-T_Rp):T_Rm,1); SMB = SMB((1+T_Rm-T_Rp):T_Rm,1);
HML = HML((1+T_Rm-T_Rp):T_Rm,1); Mom = Mom((1+T_Rm-T_Rp):T_Rm,1);
LT_Rev = LT_Rev((1+T_Rm-T_Rp):T_Rm,1); CMA = CMA((1+T_Rm-T_Rp):T_Rm,1);
RMW = RMW((1+T_Rm-T_Rp):T_Rm,1);

Ret_vw = [Rp_vw_cc, Rp_vw_fi, Rm, Rf, RmRf];

T_Rp

desc2a= stat2(1+Rp_vw_cc,1,3,0); desc2b= stat2(1+Rp_vw_fi,1,3,0);
desc2= [desc2a desc2b]; desc3= stat2([1+Rm 1+Rf 1+RmRf],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

[~,t_vw_cc] = alpha_factor_model(Rp_vw_cc,ones(size(Rp_vw_cc,1),1),0,6);
[~,t_vw_fi] = alpha_factor_model(Rp_vw_fi,ones(size(Rp_vw_fi,1),1),0,6);
[~,t_bench] = alpha_factor_model(RmRf,ones(size(RmRf,1),1),0,6);

ff7_g = [MktRf2,SMB,HML,RMW,CMA,Mom,LT_Rev]; ff7_vw_cc_g = [Rp_vw_cc, ff7_g];

vw_ff7_g = ff7_vw_cc_g(:,2:8);

[beta_vw_cc_ff7_g,se_vw_cc_ff7_g,t_vw_cc_ff7_g] = beta_factor_model(Rp_vw_cc,vw_ff7_g,6);
[beta_vw_fi_ff7_g,se_vw_fi_ff7_g,t_vw_fi_ff7_g] = beta_factor_model(Rp_vw_fi,vw_ff7_g,6);

fit_vw_ccff7g = fitlm(vw_ff7_g,Rp_vw_cc); fit_vw_fiff7g = fitlm(vw_ff7_g,Rp_vw_fi);

ff7g_vw_cc = [beta_vw_cc_ff7_g(1).*100,t_vw_cc_ff7_g(1),beta_vw_cc_ff7_g(2).*100,t_vw_cc_ff7_g(2),...
             beta_vw_cc_ff7_g(3).*100,t_vw_cc_ff7_g(3),beta_vw_cc_ff7_g(4).*100,t_vw_cc_ff7_g(4),...
             beta_vw_cc_ff7_g(5).*100,t_vw_cc_ff7_g(5),beta_vw_cc_ff7_g(6).*100,t_vw_cc_ff7_g(6),...
             beta_vw_cc_ff7_g(7).*100,t_vw_cc_ff7_g(7),beta_vw_cc_ff7_g(8).*100,t_vw_cc_ff7_g(8),...
             fit_vw_ccff7g.Rsquared.Ordinary,fit_vw_ccff7g.Rsquared.Adjusted];
ff7g_vw_fi = [beta_vw_fi_ff7_g(1).*100,t_vw_fi_ff7_g(1),beta_vw_fi_ff7_g(2).*100,t_vw_fi_ff7_g(2),...
             beta_vw_fi_ff7_g(3).*100,t_vw_fi_ff7_g(3),beta_vw_fi_ff7_g(4).*100,t_vw_fi_ff7_g(4),...
             beta_vw_fi_ff7_g(5).*100,t_vw_fi_ff7_g(5),beta_vw_fi_ff7_g(6).*100,t_vw_fi_ff7_g(6),...
             beta_vw_fi_ff7_g(7).*100,t_vw_fi_ff7_g(7),beta_vw_fi_ff7_g(8).*100,t_vw_fi_ff7_g(8),...
             fit_vw_fiff7g.Rsquared.Ordinary,fit_vw_fiff7g.Rsquared.Adjusted];
    
disp(' ');
VariableNames3 = {'VW_CC','VW_FI'};
RowNames3 = {'Intercept';'t_alpha';'Market';'t_beta';'SMB';'t_SMB';'HML';'t_HML';...
    'RMW';'t_RMW';'CMA';'t_CMA';'Mom';'t_Mom';'LT_Rev';'t_LT_Rev';'R2';'R2adj'};
table3 = table(ff7g_vw_cc',ff7g_vw_fi',...
         'VariableNames',VariableNames3,'RowNames',RowNames3);

     
for j=1:6172
MaxDD2_vw_cc(j)= (1+Rp_vw_cc(j,:))*(1+Rp_vw_cc(j+1,:));
MaxDD2_vw_fi(j)= (1+Rp_vw_fi(j,:))*(1+Rp_vw_fi(j+1,:));
MaxDD2_Rm_Rf(j)= (1+RmRf(j,:))*(1+RmRf(j+1,:));
end

MDD2_vw_cc= min(MaxDD2_vw_cc); MDD2_vw_fi= min(MaxDD2_vw_fi);
MDD2_Rm_Rf= min(MaxDD2_Rm_Rf);

[c1_mixcopG2,c2_mixcopG2]= min(MaxDD2_vw_cc);
[c1f2,c2f2]= min(MaxDD2_vw_fi);
[c1r2,c2r2]= min(MaxDD2_Rm_Rf);

for i=1:6047
    MaxDD_vw_cc(i,:)= cumprod(1+Rp_vw_cc(i:i+126-1,:));
    MaxDD_vw_fi(i,:)= cumprod(1+Rp_vw_fi(i:i+126-1,:));
    MaxDD_Rm_Rf(i,:)= cumprod(1+RmRf(i:i+126-1,:));
end

[c1_mixcopG,c2_mixcopG]= min(min(MaxDD_vw_cc));
[c1f,c2f]= min(min(MaxDD_vw_fi));
[c1r,c2r]= min(min(MaxDD_Rm_Rf));

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc,0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi,0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf,0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
     t_vw_cc,100*(sum([Rp_vw_cc]<0)/size(Rp_vw_cc,1)), 100*(1-MDD2_vw_cc),...
     100*(1-min(min(MaxDD_vw_cc))), desc2(2,1), desc2(3,1), desc2(4,1),...
     min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
     t_vw_fi,100*(sum(Rp_vw_fi<0)/size(Rp_vw_fi,1)),100*(1-MDD2_vw_fi),...
     100*(1-min(min(MaxDD_vw_fi))), desc2(2,2), desc2(3,2), desc2(4,2),...
     min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
     t_bench,100*(sum(RmRf<0)/size(RmRf,1)),100*(1-MDD2_Rm_Rf),...
     100*(1-min(min(MaxDD_Rm_Rf))), desc3(2,3), desc3(3,3), desc3(4,3),...
     min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames1 = {'VW_CC','VW_FI','Benchmark'};
RowNames1 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';'t-statistic';...
    'Share of negative excess returns';'MDD1';'MDD2'; 'Std Dev'; 'Skewness';...
    'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table1 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames1,'RowNames',RowNames1);

no_pairs_open = sum(sum(no_pairs_opened)'); x = sum(abs(Av_price_dev(:,1:no_pairs)) > 0);
days_open = days_open(1:no_pairs_open,1);

VariableNames2 = {'Trading_Statistics'};
RowNames2 = {'Av_Price_Dev_trigger_openpa';'Total_number_of_pairs_opened';...
    'Average_number_of_pairs_opened_per_six-month_period'; ...
    'Average_number_of_round-trip_trades_per_pair_in_months'; 'Standard_Dev';'Average_time_pairs_are_open_in_days';...
    'Standard_Deviation';'Median_time_pairs_are_open_in_days'};

trading_stat=[sum(sum(abs(Av_price_dev(:,1:no_pairs)))')./sum((sum(abs(Av_price_dev(:,1:no_pairs)) >.0))'),...
    no_pairs_open,no_pairs_open/(big_loop-1),...
    mean(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),...
    std(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),mean(days_open),std(days_open),median(days_open)];
table2 = table(trading_stat',...
    'VariableNames',VariableNames2,'RowNames',RowNames2);
 
writetable(table1,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table2,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table3,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',3);
    
    desc2a = stat2(1+Rp_vw_cc(1:1138,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1:1138,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1:1138,1) 1+Rf(1:1138,1) 1+RmRf(1:1138,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1:1138,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1:1138,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1:1138,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames4 = {'VW_CC','VW_FI','Benchmark'};
RowNames4 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table4 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames4,'RowNames',RowNames4);

writetable(table4,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',4);
    
desc2a = stat2(1+Rp_vw_cc(1139:2401,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1139:2401,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1139:2401,1) 1+Rf(1139:2401,1) 1+RmRf(1139:2401,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1139:2401,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1139:2401,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1139:2401,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames5 = {'VW_CC','VW_FI','Benchmark'};
RowNames5 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table5 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames5,'RowNames',RowNames5);

writetable(table5,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',5);
    
    desc2a = stat2(1+Rp_vw_cc(2402:3657,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(2402:3657,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(2402:3657,1) 1+Rf(2402:3657,1) 1+RmRf(2402:3657,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(2402:3657,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(2402:3657,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(2402:3657,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames6 = {'VW_CC','VW_FI','Benchmark'};
RowNames6 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table6 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames6,'RowNames',RowNames6);

writetable(table6,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',6);
    
    desc2a = stat2(1+Rp_vw_cc(3657:4916,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(3657:4916,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(3657:4916,1) 1+Rf(3657:4916,1) 1+RmRf(3657:4916,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(3657:4916,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(3657:4916,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(3657:4916,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames7 = {'VW_CC','VW_FI','Benchmark'};
RowNames7 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table7 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames7,'RowNames',RowNames7);

writetable(table7,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',7);
    
    desc2a = stat2(1+Rp_vw_cc(4917:6173,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(4917:6173,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(4917:6173,1) 1+Rf(4917:6173,1) 1+RmRf(4917:6173,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(4917:6173,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(4917:6173,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(4917:6173,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames8 = {'VW_CC','VW_FI','Benchmark'};
RowNames8 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table8 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames8,'RowNames',RowNames8);

writetable(table8,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',8);
    
save('C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c0_sq2.0.mat');
    
    %% Top 5, C = 0.001
    
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
addpath('C:\Users\fsabino\Desktop\Fernando\papers')';


% ----------------------------------------------------
% Load in data
% ----------------------------------------------------
testing = 0;

load SP500_p1
% ----------------------------------------------------
% Set default values
% ----------------------------------------------------

[T,N]= size(Rt); % T = number of periods (days)
% N = number of assets in the whole period
daylag = 0;    % set whether (1, default) or not (0) signals take one day to go into effect (cf. Table 1A vs. 1B)
wi_update = 1; % set whether (1, default) or not (0) intra-pair weights are updated when pair is open; 
               % if not: weights stay at 50-50%
Years = 2015 - 1990 + 0.5;
 
no_pairs = 5;
trading_cost = 0; % works just with one day lag
C = 0.001; % buy/sell (percentage cost for opening and closing pairs)
trade_req = 0; % set whether (0) or not (2) positive trading volume is required for opening/closing a pair
Stop_loss = -Inf ; %disp(['Stop_loss = ', num2str(Stop_loss)]);%Choose how much loss we are willing to accept on a given pair, compared to 1, i.e 0.93 = 7% stop loss
Stop_gain = Inf;  %disp(['Stop_loss = ', num2str(Stop_gain)]); %Choose how much gain we are willing to accept on a given pair, compared to 1, i.e 1.10 = 10% stop gain
s1218 = 1; % listing req. (look ahead): 12+6 months (=1)

% ----------------------------------------------------
% Reset several variables used for desc statistics
% ----------------------------------------------------
Av_price_dev = zeros(T-sum(Periods(1:2,1)),no_pairs*2); % 12 months are w/o price deviations
% The first 12 months are formation period
Rpair = zeros(sum(Periods(end-1,4)),no_pairs); % Keeps track of the return of each pair

MDDpairs = zeros(length(Periods)-1,no_pairs); % Pre allocate MDD matrix for each pair out of sample;
MDDw = zeros(length(Periods)-1,5); %- Preallocate MDD matrix out of sample for 4 weighting schemes + Rm + (Rm-Rf).
STNpairs = zeros(length(Periods)-2,no_pairs);
STNw = zeros(length(Periods)-2,5);

periods_with_open_pair = 0; % number of periods with pairs opened
periods_without_openpa = 0; % number of periods without pairs opened
pairs_number = 0; pair_open = 0; %
days_open = zeros(no_pairs*10000,1); % measures number of days each pair open; bad programming, but we do not know how many pairs we get
no_pairs_opened = zeros(Years*2-2,no_pairs); % measures number of times pairs opened in each pair per 6 month period

counter = 1; % Keeps track of the days in the main loop
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
listed2 = IPt(Twe_mo+Six_mo*(s1218==1),:)>0; % listed at the end: 12/18 months from now (1xN vector of 0/1s)
listed = listed1 .* listed2; % listed throughout the 12+6 month period (1xN vector of 0/1s)

no_listed = sum(listed);
index_listed = find(listed>0); % find columns that should be included

% [D,ia,ib]=intersect(ticker2(:,big_loop),ticker2(:,big_loop+1));
% [ic,id]= ismember(D,ticker2(:,big_loop+2));
% [ie,ig]= ismember(D(ic),tickerb);
% index_listed2= intersect(index_listed,ig');
% no_listed2 = size(index_listed2,2);

[D,ia,ib]=union(ticker2(:,big_loop),ticker2(:,big_loop+1));
[ic,id]= ismember(D,ticker2(:,big_loop+2));
[ie,ig]= ismember(D(ic),tickerb);
index_listed2= ig';
no_listed2 = sum(ie);


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
% ----------------------------------------------------
% Calc SSEs
% ----------------------------------------------------

SSE = zeros(no_listed2,no_listed2);
    for j=1:(no_listed2-1) % calculate SSE for all pairs
        for k=(j+1):no_listed2 % can prob. be speeded up by better programming
            % SSE(index_listed2(j),index_listed2(k)) = sum(abs( IPt(1:Twe_mo,index_listed2(j))- IPt(1:Twe_mo,index_listed2(k)) ));
           SSE(index_listed2(j),index_listed2(k)) = sum(( IPt(1:Twe_mo,index_listed2(j))-...
                IPt(1:Twe_mo,index_listed2(k)) ).^2);
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

% ----------------------------------------------------
% Calculate returns during the 6 month period
% ----------------------------------------------------
count_temp = counter;

for p=1:no_pairs
    counter = count_temp; pairs_opened = 0; new_pairs_opened = 0; lag = 0;
    std_limit = std(IPt(1:Twe_mo,min_SSE_ro(p))-IPt(1:+Twe_mo,min_SSE_co(p)));
% Fixed volatility estimated in the 12 months period. Doing the calculation one pair at a time 
Rcum = zeros(Twe_mo,1); counter_ret = 1; Rcum_ret = 1; % Presets all variables for each pair
        
for j=(i+Twe_mo):(i+Twe_mo+Six_mo-1) % portfolio period
% Defining the period as from the first day of the twe_month to the 
% last day of the twe_month

if daylag == 0 % w/o one day delay
        if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
                              % If a sign to open has been given, then calcule the returns
           Rpair(counter,p) = +Rt(j,min_SSE_ro(p)) .* wi(1)- Rt(j,min_SSE_co(p)) .* wi(2);
           % Rpair is the return of each pair.
           Rcum(counter_ret,1) = Rpair(counter,p); 
           counter_ret = counter_ret + 1;
           Rcum_ret = cumprod(1+Rcum);  
           lag = lag + 1; %used for paying tc    

		if wi_update == 1 % The weight of each asset in the pair is updated. 
                        wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                        wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
               Rpair(counter,p) = -Rt(j,min_SSE_ro(p)) .* wi(1) + Rt(j,min_SSE_co(p)) .* wi(2);
               Rcum(counter_ret,1) = Rpair(counter,p); 
               counter_ret = counter_ret + 1;
               Rcum_ret = cumprod(1+Rcum);
               lag = lag + 1;
                
		if wi_update == 1
                   wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                   wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        else
               Rpair(counter,p) = 0; % closed (this code not necessary)
        end
            
            if ((pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <= 0)...
               || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain) ...
 	           || (pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0))...
               && ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)...

                pairs_opened = 0; % close pairs: prices cross
		        lag = 0; % when pair is closed reset lag (it serves for paying tc)
                Av_price_dev(counter,no_pairs+p) = 1; % add a marker for closing; 
                                                      % used to calc length of the "open-period"
                Rpair(counter,p) = Rpair(counter,p) - C; %Includes trading cost in the last day of trading, due to closing position                                      
            elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
            if pairs_opened == 0 % record dev (and time) at open
                Rcum = zeros(Six_mo,1);
		        counter_ret = 1;
                Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
                                          /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
            end
            
            pairs_opened = 1; % open pairs
	        lag = lag + 1;  %- Lag was 0. On the next loop C will be paid
            wi = ones(1,2);
            
            elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)

        if pairs_opened == 0 % record dev (and time) at open
	       Rcum = zeros(Six_mo,1);
           counter_ret = 1;
           Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))...
                                    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
        end
        
        pairs_opened = -1; % open pairs
 	    lag = lag + 1;
        wi = ones(1,2);
            
         end
            
        counter = counter + 1; % This is done for the first day, now update 
                               % counter so it is done for the 2nd day        
        elseif daylag == 1 % w/one day delay
            
if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
    Rpair(counter,p) = (+Rt(j,min_SSE_ro(p)) * wi(1) - Rt(j,min_SSE_co(p))* wi(2)) - (lag==2)*trading_cost;
    Rcum (counter_ret,1) = Rpair(counter,p); 
    counter_ret = counter_ret + 1;
    Rcum_ret = cumprod(1+Rcum);
if wi_update == 1
    wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
    wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
end

elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
        Rpair(counter,p) = (-Rt(j,min_SSE_ro(p)) * wi(1)+ Rt(j,min_SSE_co(p)) * wi(2)) - (lag==2)*trading_cost;
    	Rcum (counter_ret,1) = Rpair(counter,p); 
        counter_ret = counter_ret + 1;
        Rcum_ret = cumprod(1+Rcum);
        if wi_update == 1
            wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
            wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
else
    Rpair(counter,p) = 0; % closed (this code not necessary)
end

    pairs_opened = new_pairs_opened;

if (pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <=  0 ...
   || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain)...   
   || pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0)...
   &&((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
    
    new_pairs_opened = 0; % close prices: prices cross
    % If the pairs are open and the spread is smaller than the
    % threshold, close the position 
    lag = 0;
    Av_price_dev(counter+1,no_pairs+p) = 1; % see above, marker

    if wi_update == 1
        Rpair(counter,p) = Rpair(counter,p) - trading_cost - C;
    end
    
elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = 1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 1st, long 2nd) 
        lag = lag + 1;
        if  pairs_opened == 0
            Rcum = zeros(Six_mo,1);
            counter_ret = 1;
        end         
        
elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = -1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 2nd, long 1st)       
        lag = lag + 1;
        if pairs_opened == 0 % - If the pair was closed, reset accumulated return matrix and counter
           Rcum = zeros(Six_mo,1);
           counter_ret = 1;
        end
end

if new_pairs_opened == +1 && lag == 1
    Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);

elseif new_pairs_opened == -1 && lag == 1
    
Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))/(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);
end
    counter = counter + 1;
end % endif of one day lag (0/1)
end % end for pairs-period days (j)

% if a pair open at the end, add a sign that closed
% otherwise no additional steps necessary, as closing just gets last day's return

if pairs_opened ~= 0
    Rpair(counter-1,p) = Rpair(counter-1,p) - trading_cost - C; %Includes trading cost in the last day of trading, due to closing position
    Av_price_dev(counter-1,no_pairs+p) = 1;
end

end % end for portfolio (p)
%% Using 2 Weighting Schemes - Fully Invested and Committed Capital
% ------------------------------------------------------------
% Calculate portfolio returns (ew, vw) out of percentage Rpair
% ------------------------------------------------------------
Rpair_temp = Rpair(counter-Six_mo:counter-1,:);
%
% eq-weighted average on committed cap.; weights reset to "one" (or any equal weight) after each day
%
Ret_acum_pairs(counter-Six_mo:counter-1,:) = (cumprod(1+(Rpair_temp)));
[MaxDD,~] = maxdrawdown(ret2tick(Rpair_temp));
MDDpairs(big_loop,:)= MaxDD;  
STN = sortinoratio(Rpair_temp,0);
STNpairs(big_loop,:) = STN;

%
wi = ones(1,no_pairs);
wi = [wi;cumprod(1+Rpair_temp)];
wi = wi(1:Six_mo,:);
%
% vw-weighted, committed cap.; weights "restart" every 6 month period; 
% (each portfolio gets 1 dollar at the beginning)
Rp_vw_cc(counter-Six_mo:counter-1,:) = (sum((wi .* Rpair_temp)'))' ./ sum(wi')';
%
% vw-weighted, fully invested; weights "restart" from 1 every time a new pair is opened;
% Capital divided between open portfolios.
Ret_acum(counter-Six_mo:counter-1,2) = (cumprod(1+(Rp_vw_cc(counter-Six_mo:counter-1,:))));
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_cc(counter-Six_mo:counter-1,:)));
MDDw(big_loop,2) = MaxDD;
STN = sortinoratio(Rp_vw_cc(counter-Six_mo:counter-1,:),0);
STNw(big_loop,2) = STN;
%
pa_open = zeros(Six_mo,no_pairs); % indicator for days when pairs open

    for i2=1:no_pairs
        pa_opened_temp = 0;temp_lag = 0;
    for i1=1:Six_mo
        if  pa_opened_temp == 1 && daylag == 0 % opening period not included, closing included
            pa_open(i1,i2) = 1;
            days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end
        if   pa_opened_temp == 1 && daylag == 1 && temp_lag == 1
             pa_open(i1,i2) = 1;
             days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end

        if  pa_opened_temp == 1 && daylag == 1 && temp_lag == 0
            temp_lag = 1;
        end

        if  Av_price_dev(counter-1-Six_mo+i1,i2) ~= 0
            pa_opened_temp = 1;
            pairs_number = pairs_number + 1;
        end

         if  Av_price_dev(counter-1-Six_mo+i1,no_pairs+i2) ~= 0
             pa_opened_temp = 0;
             temp_lag = 0;
         end
    end
    end

wi2 = wi .* pa_open;

for i2=1:Six_mo % takes care in a situation where no pairs are open
    if  sum(pa_open(i2,:)') == 0
        wi2(i2,1:no_pairs) = 0.2 * ones(1,no_pairs);
        pa_open(i2,1:no_pairs) = ones(1,no_pairs);
    end
end

Rp_vw_fi(counter-Six_mo:counter-1,:) = (sum((wi2 .* Rpair_temp)'))' ./ sum(wi2')';

Ret_acum(counter-Six_mo:counter-1,3) = (cumprod(1+(Rp_vw_fi(counter-Six_mo:counter-1,:))));
%
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_fi(counter-Six_mo:counter-1,:)));
MDDw(big_loop,4) = MaxDD;
STN = sortinoratio(Rp_vw_fi(counter-Six_mo:counter-1,:),0);
STNw(big_loop,4) = STN;
%
%
RmRf(counter-Six_mo:counter-1,:) = Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:);
Ret_acum(i:i+Six_mo-1,6) = (cumprod(1+(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:))));
[MDD,MDDIndex] = maxdrawdown(ret2tick(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:)));
MDDw(big_loop,5) = MaxDD;
STN = sortinoratio(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:),0);
STNw(big_loop,5) = STN;

    for i2=1:no_pairs
        if  sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0) ~= 0
            periods_with_open_pair = periods_with_open_pair + 1;
            no_pairs_opened(big_loop,i2) = no_pairs_opened(big_loop,p)+ sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0);
        else

        periods_without_openpa = periods_without_openpa + 1;
        end
    end

i = i + Periods(big_loop,1);

big_loop = big_loop + 1;

end % end main loop
% ----------------------------------------------------
% ************* Analysis of the results **************
% ----------------------------------------------------
T_Rp = size(Rp_vw_cc,1); T_Rm = size(Rm,1);
Rm = Rm((1+T_Rm-T_Rp):T_Rm,1); % market
Rf = Rf((1+T_Rm-T_Rp):T_Rm,1); % risk-free rate
RmRf = Rm - Rf; % excess market

MktRf2 = MktRf2((1+T_Rm-T_Rp):T_Rm,1); SMB = SMB((1+T_Rm-T_Rp):T_Rm,1);
HML = HML((1+T_Rm-T_Rp):T_Rm,1); Mom = Mom((1+T_Rm-T_Rp):T_Rm,1);
LT_Rev = LT_Rev((1+T_Rm-T_Rp):T_Rm,1); CMA = CMA((1+T_Rm-T_Rp):T_Rm,1);
RMW = RMW((1+T_Rm-T_Rp):T_Rm,1);

Ret_vw = [Rp_vw_cc, Rp_vw_fi, Rm, Rf, RmRf];

T_Rp

desc2a= stat2(1+Rp_vw_cc,1,3,0); desc2b= stat2(1+Rp_vw_fi,1,3,0);
desc2= [desc2a desc2b]; desc3= stat2([1+Rm 1+Rf 1+RmRf],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

[~,t_vw_cc] = alpha_factor_model(Rp_vw_cc,ones(size(Rp_vw_cc,1),1),0,6);
[~,t_vw_fi] = alpha_factor_model(Rp_vw_fi,ones(size(Rp_vw_fi,1),1),0,6);
[~,t_bench] = alpha_factor_model(RmRf,ones(size(RmRf,1),1),0,6);

ff7_g = [MktRf2,SMB,HML,RMW,CMA,Mom,LT_Rev]; ff7_vw_cc_g = [Rp_vw_cc, ff7_g];

vw_ff7_g = ff7_vw_cc_g(:,2:8);

[beta_vw_cc_ff7_g,se_vw_cc_ff7_g,t_vw_cc_ff7_g] = beta_factor_model(Rp_vw_cc,vw_ff7_g,6);
[beta_vw_fi_ff7_g,se_vw_fi_ff7_g,t_vw_fi_ff7_g] = beta_factor_model(Rp_vw_fi,vw_ff7_g,6);

fit_vw_ccff7g = fitlm(vw_ff7_g,Rp_vw_cc); fit_vw_fiff7g = fitlm(vw_ff7_g,Rp_vw_fi);

ff7g_vw_cc = [beta_vw_cc_ff7_g(1).*100,t_vw_cc_ff7_g(1),beta_vw_cc_ff7_g(2).*100,t_vw_cc_ff7_g(2),...
             beta_vw_cc_ff7_g(3).*100,t_vw_cc_ff7_g(3),beta_vw_cc_ff7_g(4).*100,t_vw_cc_ff7_g(4),...
             beta_vw_cc_ff7_g(5).*100,t_vw_cc_ff7_g(5),beta_vw_cc_ff7_g(6).*100,t_vw_cc_ff7_g(6),...
             beta_vw_cc_ff7_g(7).*100,t_vw_cc_ff7_g(7),beta_vw_cc_ff7_g(8).*100,t_vw_cc_ff7_g(8),...
             fit_vw_ccff7g.Rsquared.Ordinary,fit_vw_ccff7g.Rsquared.Adjusted];
ff7g_vw_fi = [beta_vw_fi_ff7_g(1).*100,t_vw_fi_ff7_g(1),beta_vw_fi_ff7_g(2).*100,t_vw_fi_ff7_g(2),...
             beta_vw_fi_ff7_g(3).*100,t_vw_fi_ff7_g(3),beta_vw_fi_ff7_g(4).*100,t_vw_fi_ff7_g(4),...
             beta_vw_fi_ff7_g(5).*100,t_vw_fi_ff7_g(5),beta_vw_fi_ff7_g(6).*100,t_vw_fi_ff7_g(6),...
             beta_vw_fi_ff7_g(7).*100,t_vw_fi_ff7_g(7),beta_vw_fi_ff7_g(8).*100,t_vw_fi_ff7_g(8),...
             fit_vw_fiff7g.Rsquared.Ordinary,fit_vw_fiff7g.Rsquared.Adjusted];
    
disp(' ');
VariableNames3 = {'VW_CC','VW_FI'};
RowNames3 = {'Intercept';'t_alpha';'Market';'t_beta';'SMB';'t_SMB';'HML';'t_HML';...
    'RMW';'t_RMW';'CMA';'t_CMA';'Mom';'t_Mom';'LT_Rev';'t_LT_Rev';'R2';'R2adj'};
table3 = table(ff7g_vw_cc',ff7g_vw_fi',...
         'VariableNames',VariableNames3,'RowNames',RowNames3);

     
for j=1:6172
MaxDD2_vw_cc(j)= (1+Rp_vw_cc(j,:))*(1+Rp_vw_cc(j+1,:));
MaxDD2_vw_fi(j)= (1+Rp_vw_fi(j,:))*(1+Rp_vw_fi(j+1,:));
MaxDD2_Rm_Rf(j)= (1+RmRf(j,:))*(1+RmRf(j+1,:));
end

MDD2_vw_cc= min(MaxDD2_vw_cc); MDD2_vw_fi= min(MaxDD2_vw_fi);
MDD2_Rm_Rf= min(MaxDD2_Rm_Rf);

[c1_mixcopG2,c2_mixcopG2]= min(MaxDD2_vw_cc);
[c1f2,c2f2]= min(MaxDD2_vw_fi);
[c1r2,c2r2]= min(MaxDD2_Rm_Rf);

for i=1:6047
    MaxDD_vw_cc(i,:)= cumprod(1+Rp_vw_cc(i:i+126-1,:));
    MaxDD_vw_fi(i,:)= cumprod(1+Rp_vw_fi(i:i+126-1,:));
    MaxDD_Rm_Rf(i,:)= cumprod(1+RmRf(i:i+126-1,:));
end

[c1_mixcopG,c2_mixcopG]= min(min(MaxDD_vw_cc));
[c1f,c2f]= min(min(MaxDD_vw_fi));
[c1r,c2r]= min(min(MaxDD_Rm_Rf));

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc,0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi,0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf,0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
     t_vw_cc,100*(sum([Rp_vw_cc]<0)/size(Rp_vw_cc,1)), 100*(1-MDD2_vw_cc),...
     100*(1-min(min(MaxDD_vw_cc))), desc2(2,1), desc2(3,1), desc2(4,1),...
     min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
     t_vw_fi,100*(sum(Rp_vw_fi<0)/size(Rp_vw_fi,1)),100*(1-MDD2_vw_fi),...
     100*(1-min(min(MaxDD_vw_fi))), desc2(2,2), desc2(3,2), desc2(4,2),...
     min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
     t_bench,100*(sum(RmRf<0)/size(RmRf,1)),100*(1-MDD2_Rm_Rf),...
     100*(1-min(min(MaxDD_Rm_Rf))), desc3(2,3), desc3(3,3), desc3(4,3),...
     min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames1 = {'VW_CC','VW_FI','Benchmark'};
RowNames1 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';'t-statistic';...
    'Share of negative excess returns';'MDD1';'MDD2'; 'Std Dev'; 'Skewness';...
    'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table1 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames1,'RowNames',RowNames1);

no_pairs_open = sum(sum(no_pairs_opened)'); x = sum(abs(Av_price_dev(:,1:no_pairs)) > 0);
days_open = days_open(1:no_pairs_open,1);

VariableNames2 = {'Trading_Statistics'};
RowNames2 = {'Av_Price_Dev_trigger_openpa';'Total_number_of_pairs_opened';...
    'Average_number_of_pairs_opened_per_six-month_period'; ...
    'Average_number_of_round-trip_trades_per_pair_in_months'; 'Standard_Dev';'Average_time_pairs_are_open_in_days';...
    'Standard_Deviation';'Median_time_pairs_are_open_in_days'};

trading_stat=[sum(sum(abs(Av_price_dev(:,1:no_pairs)))')./sum((sum(abs(Av_price_dev(:,1:no_pairs)) >.0))'),...
    no_pairs_open,no_pairs_open/(big_loop-1),...
    mean(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),...
    std(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),mean(days_open),std(days_open),median(days_open)];
table2 = table(trading_stat',...
    'VariableNames',VariableNames2,'RowNames',RowNames2);
 
writetable(table1,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table2,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table3,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',3);
    
    desc2a = stat2(1+Rp_vw_cc(1:1138,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1:1138,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1:1138,1) 1+Rf(1:1138,1) 1+RmRf(1:1138,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1:1138,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1:1138,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1:1138,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames4 = {'VW_CC','VW_FI','Benchmark'};
RowNames4 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table4 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames4,'RowNames',RowNames4);

writetable(table4,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',4);
    
desc2a = stat2(1+Rp_vw_cc(1139:2401,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1139:2401,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1139:2401,1) 1+Rf(1139:2401,1) 1+RmRf(1139:2401,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1139:2401,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1139:2401,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1139:2401,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames5 = {'VW_CC','VW_FI','Benchmark'};
RowNames5 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table5 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames5,'RowNames',RowNames5);

writetable(table5,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',5);
    
    desc2a = stat2(1+Rp_vw_cc(2402:3657,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(2402:3657,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(2402:3657,1) 1+Rf(2402:3657,1) 1+RmRf(2402:3657,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(2402:3657,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(2402:3657,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(2402:3657,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames6 = {'VW_CC','VW_FI','Benchmark'};
RowNames6 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table6 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames6,'RowNames',RowNames6);

writetable(table6,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',6);
    
    desc2a = stat2(1+Rp_vw_cc(3657:4916,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(3657:4916,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(3657:4916,1) 1+Rf(3657:4916,1) 1+RmRf(3657:4916,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(3657:4916,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(3657:4916,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(3657:4916,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames7 = {'VW_CC','VW_FI','Benchmark'};
RowNames7 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table7 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames7,'RowNames',RowNames7);

writetable(table7,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',7);
    
    desc2a = stat2(1+Rp_vw_cc(4917:6173,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(4917:6173,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(4917:6173,1) 1+Rf(4917:6173,1) 1+RmRf(4917:6173,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(4917:6173,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(4917:6173,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(4917:6173,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames8 = {'VW_CC','VW_FI','Benchmark'};
RowNames8 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table8 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames8,'RowNames',RowNames8);

writetable(table8,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',8);
    
 save('C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c1_sq2.0.mat');
    
    %% Top 5, C = 0.002
    
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
addpath('C:\Users\fsabino\Desktop\Fernando\papers')';


% ----------------------------------------------------
% Load in data
% ----------------------------------------------------
testing = 0;

load SP500_p1
% ----------------------------------------------------
% Set default values
% ----------------------------------------------------

[T,N]= size(Rt); % T = number of periods (days)
% N = number of assets in the whole period
daylag = 0;    % set whether (1, default) or not (0) signals take one day to go into effect (cf. Table 1A vs. 1B)
wi_update = 1; % set whether (1, default) or not (0) intra-pair weights are updated when pair is open; 
               % if not: weights stay at 50-50%
Years = 2015 - 1990 + 0.5;
 
no_pairs = 5;
trading_cost = 0; % works just with one day lag
C = 0.002; % buy/sell (percentage cost for opening and closing pairs)
trade_req = 0; % set whether (0) or not (2) positive trading volume is required for opening/closing a pair
Stop_loss = -Inf ; %disp(['Stop_loss = ', num2str(Stop_loss)]);%Choose how much loss we are willing to accept on a given pair, compared to 1, i.e 0.93 = 7% stop loss
Stop_gain = Inf;  %disp(['Stop_loss = ', num2str(Stop_gain)]); %Choose how much gain we are willing to accept on a given pair, compared to 1, i.e 1.10 = 10% stop gain
s1218 = 1; % listing req. (look ahead): 12+6 months (=1)

% ----------------------------------------------------
% Reset several variables used for desc statistics
% ----------------------------------------------------
Av_price_dev = zeros(T-sum(Periods(1:2,1)),no_pairs*2); % 12 months are w/o price deviations
% The first 12 months are formation period
Rpair = zeros(sum(Periods(end-1,4)),no_pairs); % Keeps track of the return of each pair

MDDpairs = zeros(length(Periods)-1,no_pairs); % Pre allocate MDD matrix for each pair out of sample;
MDDw = zeros(length(Periods)-1,5); %- Preallocate MDD matrix out of sample for 4 weighting schemes + Rm + (Rm-Rf).
STNpairs = zeros(length(Periods)-2,no_pairs);
STNw = zeros(length(Periods)-2,5);

periods_with_open_pair = 0; % number of periods with pairs opened
periods_without_openpa = 0; % number of periods without pairs opened
pairs_number = 0; pair_open = 0; %
days_open = zeros(no_pairs*10000,1); % measures number of days each pair open; bad programming, but we do not know how many pairs we get
no_pairs_opened = zeros(Years*2-2,no_pairs); % measures number of times pairs opened in each pair per 6 month period

counter = 1; % Keeps track of the days in the main loop
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
listed2 = IPt(Twe_mo+Six_mo*(s1218==1),:)>0; % listed at the end: 12/18 months from now (1xN vector of 0/1s)
listed = listed1 .* listed2; % listed throughout the 12+6 month period (1xN vector of 0/1s)

no_listed = sum(listed);
index_listed = find(listed>0); % find columns that should be included

% [D,ia,ib]=intersect(ticker2(:,big_loop),ticker2(:,big_loop+1));
% [ic,id]= ismember(D,ticker2(:,big_loop+2));
% [ie,ig]= ismember(D(ic),tickerb);
% index_listed2= intersect(index_listed,ig');
% no_listed2 = size(index_listed2,2);

[D,ia,ib]=union(ticker2(:,big_loop),ticker2(:,big_loop+1));
[ic,id]= ismember(D,ticker2(:,big_loop+2));
[ie,ig]= ismember(D(ic),tickerb);
index_listed2= ig';
no_listed2 = sum(ie);


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
% ----------------------------------------------------
% Calc SSEs
% ----------------------------------------------------

SSE = zeros(no_listed2,no_listed2);
    for j=1:(no_listed2-1) % calculate SSE for all pairs
        for k=(j+1):no_listed2 % can prob. be speeded up by better programming
            % SSE(index_listed2(j),index_listed2(k)) = sum(abs( IPt(1:Twe_mo,index_listed2(j))- IPt(1:Twe_mo,index_listed2(k)) ));
           SSE(index_listed2(j),index_listed2(k)) = sum(( IPt(1:Twe_mo,index_listed2(j))-...
                IPt(1:Twe_mo,index_listed2(k)) ).^2);
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

% ----------------------------------------------------
% Calculate returns during the 6 month period
% ----------------------------------------------------
count_temp = counter;

for p=1:no_pairs
    counter = count_temp; pairs_opened = 0; new_pairs_opened = 0; lag = 0;
    std_limit = std(IPt(1:Twe_mo,min_SSE_ro(p))-IPt(1:+Twe_mo,min_SSE_co(p)));
% Fixed volatility estimated in the 12 months period. Doing the calculation one pair at a time 
Rcum = zeros(Twe_mo,1); counter_ret = 1; Rcum_ret = 1; % Presets all variables for each pair
        
for j=(i+Twe_mo):(i+Twe_mo+Six_mo-1) % portfolio period
% Defining the period as from the first day of the twe_month to the 
% last day of the twe_month

if daylag == 0 % w/o one day delay
        if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
                              % If a sign to open has been given, then calcule the returns
           Rpair(counter,p) = +Rt(j,min_SSE_ro(p)) .* wi(1)- Rt(j,min_SSE_co(p)) .* wi(2);
           % Rpair is the return of each pair.
           Rcum(counter_ret,1) = Rpair(counter,p); 
           counter_ret = counter_ret + 1;
           Rcum_ret = cumprod(1+Rcum);  
           lag = lag + 1; %used for paying tc    

		if wi_update == 1 % The weight of each asset in the pair is updated. 
                        wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                        wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
               Rpair(counter,p) = -Rt(j,min_SSE_ro(p)) .* wi(1) + Rt(j,min_SSE_co(p)) .* wi(2);
               Rcum(counter_ret,1) = Rpair(counter,p); 
               counter_ret = counter_ret + 1;
               Rcum_ret = cumprod(1+Rcum);
               lag = lag + 1;
                
		if wi_update == 1
                   wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                   wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        else
               Rpair(counter,p) = 0; % closed (this code not necessary)
        end
            
            if ((pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <= 0)...
               || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain) ...
 	           || (pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0))...
               && ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)...

                pairs_opened = 0; % close pairs: prices cross
		        lag = 0; % when pair is closed reset lag (it serves for paying tc)
                Av_price_dev(counter,no_pairs+p) = 1; % add a marker for closing; 
                                                      % used to calc length of the "open-period"
                Rpair(counter,p) = Rpair(counter,p) - C; %Includes trading cost in the last day of trading, due to closing position                                      
            elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
            if pairs_opened == 0 % record dev (and time) at open
                Rcum = zeros(Six_mo,1);
		        counter_ret = 1;
                Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
                                          /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
            end
            
            pairs_opened = 1; % open pairs
	        lag = lag + 1;  %- Lag was 0. On the next loop C will be paid
            wi = ones(1,2);
            
            elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)

        if pairs_opened == 0 % record dev (and time) at open
	       Rcum = zeros(Six_mo,1);
           counter_ret = 1;
           Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))...
                                    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
        end
        
        pairs_opened = -1; % open pairs
 	    lag = lag + 1;
        wi = ones(1,2);
            
         end
            
        counter = counter + 1; % This is done for the first day, now update 
                               % counter so it is done for the 2nd day        
        elseif daylag == 1 % w/one day delay
            
if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
    Rpair(counter,p) = (+Rt(j,min_SSE_ro(p)) * wi(1) - Rt(j,min_SSE_co(p))* wi(2)) - (lag==2)*trading_cost;
    Rcum (counter_ret,1) = Rpair(counter,p); 
    counter_ret = counter_ret + 1;
    Rcum_ret = cumprod(1+Rcum);
if wi_update == 1
    wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
    wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
end

elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
        Rpair(counter,p) = (-Rt(j,min_SSE_ro(p)) * wi(1)+ Rt(j,min_SSE_co(p)) * wi(2)) - (lag==2)*trading_cost;
    	Rcum (counter_ret,1) = Rpair(counter,p); 
        counter_ret = counter_ret + 1;
        Rcum_ret = cumprod(1+Rcum);
        if wi_update == 1
            wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
            wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
else
    Rpair(counter,p) = 0; % closed (this code not necessary)
end

    pairs_opened = new_pairs_opened;

if (pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <=  0 ...
   || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain)...   
   || pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0)...
   &&((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
    
    new_pairs_opened = 0; % close prices: prices cross
    % If the pairs are open and the spread is smaller than the
    % threshold, close the position 
    lag = 0;
    Av_price_dev(counter+1,no_pairs+p) = 1; % see above, marker

    if wi_update == 1
        Rpair(counter,p) = Rpair(counter,p) - trading_cost - C;
    end
    
elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = 1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 1st, long 2nd) 
        lag = lag + 1;
        if  pairs_opened == 0
            Rcum = zeros(Six_mo,1);
            counter_ret = 1;
        end         
        
elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = -1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 2nd, long 1st)       
        lag = lag + 1;
        if pairs_opened == 0 % - If the pair was closed, reset accumulated return matrix and counter
           Rcum = zeros(Six_mo,1);
           counter_ret = 1;
        end
end

if new_pairs_opened == +1 && lag == 1
    Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);

elseif new_pairs_opened == -1 && lag == 1
    
Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))/(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);
end
    counter = counter + 1;
end % endif of one day lag (0/1)
end % end for pairs-period days (j)

% if a pair open at the end, add a sign that closed
% otherwise no additional steps necessary, as closing just gets last day's return

if pairs_opened ~= 0
    Rpair(counter-1,p) = Rpair(counter-1,p) - trading_cost - C; %Includes trading cost in the last day of trading, due to closing position
    Av_price_dev(counter-1,no_pairs+p) = 1;
end

end % end for portfolio (p)
%% Using 2 Weighting Schemes - Fully Invested and Committed Capital
% ------------------------------------------------------------
% Calculate portfolio returns (ew, vw) out of percentage Rpair
% ------------------------------------------------------------
Rpair_temp = Rpair(counter-Six_mo:counter-1,:);
%
% eq-weighted average on committed cap.; weights reset to "one" (or any equal weight) after each day
%
Ret_acum_pairs(counter-Six_mo:counter-1,:) = (cumprod(1+(Rpair_temp)));
[MaxDD,~] = maxdrawdown(ret2tick(Rpair_temp));
MDDpairs(big_loop,:)= MaxDD;  
STN = sortinoratio(Rpair_temp,0);
STNpairs(big_loop,:) = STN;

%
wi = ones(1,no_pairs);
wi = [wi;cumprod(1+Rpair_temp)];
wi = wi(1:Six_mo,:);
%
% vw-weighted, committed cap.; weights "restart" every 6 month period; 
% (each portfolio gets 1 dollar at the beginning)
Rp_vw_cc(counter-Six_mo:counter-1,:) = (sum((wi .* Rpair_temp)'))' ./ sum(wi')';
%
% vw-weighted, fully invested; weights "restart" from 1 every time a new pair is opened;
% Capital divided between open portfolios.
Ret_acum(counter-Six_mo:counter-1,2) = (cumprod(1+(Rp_vw_cc(counter-Six_mo:counter-1,:))));
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_cc(counter-Six_mo:counter-1,:)));
MDDw(big_loop,2) = MaxDD;
STN = sortinoratio(Rp_vw_cc(counter-Six_mo:counter-1,:),0);
STNw(big_loop,2) = STN;
%
pa_open = zeros(Six_mo,no_pairs); % indicator for days when pairs open

    for i2=1:no_pairs
        pa_opened_temp = 0;temp_lag = 0;
    for i1=1:Six_mo
        if  pa_opened_temp == 1 && daylag == 0 % opening period not included, closing included
            pa_open(i1,i2) = 1;
            days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end
        if   pa_opened_temp == 1 && daylag == 1 && temp_lag == 1
             pa_open(i1,i2) = 1;
             days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end

        if  pa_opened_temp == 1 && daylag == 1 && temp_lag == 0
            temp_lag = 1;
        end

        if  Av_price_dev(counter-1-Six_mo+i1,i2) ~= 0
            pa_opened_temp = 1;
            pairs_number = pairs_number + 1;
        end

         if  Av_price_dev(counter-1-Six_mo+i1,no_pairs+i2) ~= 0
             pa_opened_temp = 0;
             temp_lag = 0;
         end
    end
    end

wi2 = wi .* pa_open;

for i2=1:Six_mo % takes care in a situation where no pairs are open
    if  sum(pa_open(i2,:)') == 0
        wi2(i2,1:no_pairs) = 0.2 * ones(1,no_pairs);
        pa_open(i2,1:no_pairs) = ones(1,no_pairs);
    end
end

Rp_vw_fi(counter-Six_mo:counter-1,:) = (sum((wi2 .* Rpair_temp)'))' ./ sum(wi2')';

Ret_acum(counter-Six_mo:counter-1,3) = (cumprod(1+(Rp_vw_fi(counter-Six_mo:counter-1,:))));
%
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_fi(counter-Six_mo:counter-1,:)));
MDDw(big_loop,4) = MaxDD;
STN = sortinoratio(Rp_vw_fi(counter-Six_mo:counter-1,:),0);
STNw(big_loop,4) = STN;
%
%
RmRf(counter-Six_mo:counter-1,:) = Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:);
Ret_acum(i:i+Six_mo-1,6) = (cumprod(1+(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:))));
[MDD,MDDIndex] = maxdrawdown(ret2tick(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:)));
MDDw(big_loop,5) = MaxDD;
STN = sortinoratio(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:),0);
STNw(big_loop,5) = STN;

    for i2=1:no_pairs
        if  sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0) ~= 0
            periods_with_open_pair = periods_with_open_pair + 1;
            no_pairs_opened(big_loop,i2) = no_pairs_opened(big_loop,p)+ sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0);
        else

        periods_without_openpa = periods_without_openpa + 1;
        end
    end

i = i + Periods(big_loop,1);

big_loop = big_loop + 1;

end % end main loop
% ----------------------------------------------------
% ************* Analysis of the results **************
% ----------------------------------------------------
T_Rp = size(Rp_vw_cc,1); T_Rm = size(Rm,1);
Rm = Rm((1+T_Rm-T_Rp):T_Rm,1); % market
Rf = Rf((1+T_Rm-T_Rp):T_Rm,1); % risk-free rate
RmRf = Rm - Rf; % excess market

MktRf2 = MktRf2((1+T_Rm-T_Rp):T_Rm,1); SMB = SMB((1+T_Rm-T_Rp):T_Rm,1);
HML = HML((1+T_Rm-T_Rp):T_Rm,1); Mom = Mom((1+T_Rm-T_Rp):T_Rm,1);
LT_Rev = LT_Rev((1+T_Rm-T_Rp):T_Rm,1); CMA = CMA((1+T_Rm-T_Rp):T_Rm,1);
RMW = RMW((1+T_Rm-T_Rp):T_Rm,1);

Ret_vw = [Rp_vw_cc, Rp_vw_fi, Rm, Rf, RmRf];

T_Rp

desc2a= stat2(1+Rp_vw_cc,1,3,0); desc2b= stat2(1+Rp_vw_fi,1,3,0);
desc2= [desc2a desc2b]; desc3= stat2([1+Rm 1+Rf 1+RmRf],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

[~,t_vw_cc] = alpha_factor_model(Rp_vw_cc,ones(size(Rp_vw_cc,1),1),0,6);
[~,t_vw_fi] = alpha_factor_model(Rp_vw_fi,ones(size(Rp_vw_fi,1),1),0,6);
[~,t_bench] = alpha_factor_model(RmRf,ones(size(RmRf,1),1),0,6);

ff7_g = [MktRf2,SMB,HML,RMW,CMA,Mom,LT_Rev]; ff7_vw_cc_g = [Rp_vw_cc, ff7_g];

vw_ff7_g = ff7_vw_cc_g(:,2:8);

[beta_vw_cc_ff7_g,se_vw_cc_ff7_g,t_vw_cc_ff7_g] = beta_factor_model(Rp_vw_cc,vw_ff7_g,6);
[beta_vw_fi_ff7_g,se_vw_fi_ff7_g,t_vw_fi_ff7_g] = beta_factor_model(Rp_vw_fi,vw_ff7_g,6);

fit_vw_ccff7g = fitlm(vw_ff7_g,Rp_vw_cc); fit_vw_fiff7g = fitlm(vw_ff7_g,Rp_vw_fi);

ff7g_vw_cc = [beta_vw_cc_ff7_g(1).*100,t_vw_cc_ff7_g(1),beta_vw_cc_ff7_g(2).*100,t_vw_cc_ff7_g(2),...
             beta_vw_cc_ff7_g(3).*100,t_vw_cc_ff7_g(3),beta_vw_cc_ff7_g(4).*100,t_vw_cc_ff7_g(4),...
             beta_vw_cc_ff7_g(5).*100,t_vw_cc_ff7_g(5),beta_vw_cc_ff7_g(6).*100,t_vw_cc_ff7_g(6),...
             beta_vw_cc_ff7_g(7).*100,t_vw_cc_ff7_g(7),beta_vw_cc_ff7_g(8).*100,t_vw_cc_ff7_g(8),...
             fit_vw_ccff7g.Rsquared.Ordinary,fit_vw_ccff7g.Rsquared.Adjusted];
ff7g_vw_fi = [beta_vw_fi_ff7_g(1).*100,t_vw_fi_ff7_g(1),beta_vw_fi_ff7_g(2).*100,t_vw_fi_ff7_g(2),...
             beta_vw_fi_ff7_g(3).*100,t_vw_fi_ff7_g(3),beta_vw_fi_ff7_g(4).*100,t_vw_fi_ff7_g(4),...
             beta_vw_fi_ff7_g(5).*100,t_vw_fi_ff7_g(5),beta_vw_fi_ff7_g(6).*100,t_vw_fi_ff7_g(6),...
             beta_vw_fi_ff7_g(7).*100,t_vw_fi_ff7_g(7),beta_vw_fi_ff7_g(8).*100,t_vw_fi_ff7_g(8),...
             fit_vw_fiff7g.Rsquared.Ordinary,fit_vw_fiff7g.Rsquared.Adjusted];
    
disp(' ');
VariableNames3 = {'VW_CC','VW_FI'};
RowNames3 = {'Intercept';'t_alpha';'Market';'t_beta';'SMB';'t_SMB';'HML';'t_HML';...
    'RMW';'t_RMW';'CMA';'t_CMA';'Mom';'t_Mom';'LT_Rev';'t_LT_Rev';'R2';'R2adj'};
table3 = table(ff7g_vw_cc',ff7g_vw_fi',...
         'VariableNames',VariableNames3,'RowNames',RowNames3);

     
for j=1:6172
MaxDD2_vw_cc(j)= (1+Rp_vw_cc(j,:))*(1+Rp_vw_cc(j+1,:));
MaxDD2_vw_fi(j)= (1+Rp_vw_fi(j,:))*(1+Rp_vw_fi(j+1,:));
MaxDD2_Rm_Rf(j)= (1+RmRf(j,:))*(1+RmRf(j+1,:));
end

MDD2_vw_cc= min(MaxDD2_vw_cc); MDD2_vw_fi= min(MaxDD2_vw_fi);
MDD2_Rm_Rf= min(MaxDD2_Rm_Rf);

[c1_mixcopG2,c2_mixcopG2]= min(MaxDD2_vw_cc);
[c1f2,c2f2]= min(MaxDD2_vw_fi);
[c1r2,c2r2]= min(MaxDD2_Rm_Rf);

for i=1:6047
    MaxDD_vw_cc(i,:)= cumprod(1+Rp_vw_cc(i:i+126-1,:));
    MaxDD_vw_fi(i,:)= cumprod(1+Rp_vw_fi(i:i+126-1,:));
    MaxDD_Rm_Rf(i,:)= cumprod(1+RmRf(i:i+126-1,:));
end

[c1_mixcopG,c2_mixcopG]= min(min(MaxDD_vw_cc));
[c1f,c2f]= min(min(MaxDD_vw_fi));
[c1r,c2r]= min(min(MaxDD_Rm_Rf));

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc,0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi,0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf,0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
     t_vw_cc,100*(sum([Rp_vw_cc]<0)/size(Rp_vw_cc,1)), 100*(1-MDD2_vw_cc),...
     100*(1-min(min(MaxDD_vw_cc))), desc2(2,1), desc2(3,1), desc2(4,1),...
     min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
     t_vw_fi,100*(sum(Rp_vw_fi<0)/size(Rp_vw_fi,1)),100*(1-MDD2_vw_fi),...
     100*(1-min(min(MaxDD_vw_fi))), desc2(2,2), desc2(3,2), desc2(4,2),...
     min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
     t_bench,100*(sum(RmRf<0)/size(RmRf,1)),100*(1-MDD2_Rm_Rf),...
     100*(1-min(min(MaxDD_Rm_Rf))), desc3(2,3), desc3(3,3), desc3(4,3),...
     min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames1 = {'VW_CC','VW_FI','Benchmark'};
RowNames1 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';'t-statistic';...
    'Share of negative excess returns';'MDD1';'MDD2'; 'Std Dev'; 'Skewness';...
    'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table1 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames1,'RowNames',RowNames1);

no_pairs_open = sum(sum(no_pairs_opened)'); x = sum(abs(Av_price_dev(:,1:no_pairs)) > 0);
days_open = days_open(1:no_pairs_open,1);

VariableNames2 = {'Trading_Statistics'};
RowNames2 = {'Av_Price_Dev_trigger_openpa';'Total_number_of_pairs_opened';...
    'Average_number_of_pairs_opened_per_six-month_period'; ...
    'Average_number_of_round-trip_trades_per_pair_in_months'; 'Standard_Dev';'Average_time_pairs_are_open_in_days';...
    'Standard_Deviation';'Median_time_pairs_are_open_in_days'};

trading_stat=[sum(sum(abs(Av_price_dev(:,1:no_pairs)))')./sum((sum(abs(Av_price_dev(:,1:no_pairs)) >.0))'),...
    no_pairs_open,no_pairs_open/(big_loop-1),...
    mean(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),...
    std(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),mean(days_open),std(days_open),median(days_open)];
table2 = table(trading_stat',...
    'VariableNames',VariableNames2,'RowNames',RowNames2);
 
writetable(table1,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table2,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table3,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',3);
    
    desc2a = stat2(1+Rp_vw_cc(1:1138,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1:1138,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1:1138,1) 1+Rf(1:1138,1) 1+RmRf(1:1138,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1:1138,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1:1138,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1:1138,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames4 = {'VW_CC','VW_FI','Benchmark'};
RowNames4 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table4 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames4,'RowNames',RowNames4);

writetable(table4,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',4);
    
desc2a = stat2(1+Rp_vw_cc(1139:2401,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1139:2401,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1139:2401,1) 1+Rf(1139:2401,1) 1+RmRf(1139:2401,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1139:2401,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1139:2401,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1139:2401,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames5 = {'VW_CC','VW_FI','Benchmark'};
RowNames5 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table5 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames5,'RowNames',RowNames5);

writetable(table5,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',5);
    
    desc2a = stat2(1+Rp_vw_cc(2402:3657,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(2402:3657,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(2402:3657,1) 1+Rf(2402:3657,1) 1+RmRf(2402:3657,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(2402:3657,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(2402:3657,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(2402:3657,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames6 = {'VW_CC','VW_FI','Benchmark'};
RowNames6 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table6 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames6,'RowNames',RowNames6);

writetable(table6,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',6);
    
    desc2a = stat2(1+Rp_vw_cc(3657:4916,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(3657:4916,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(3657:4916,1) 1+Rf(3657:4916,1) 1+RmRf(3657:4916,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(3657:4916,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(3657:4916,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(3657:4916,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames7 = {'VW_CC','VW_FI','Benchmark'};
RowNames7 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table7 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames7,'RowNames',RowNames7);

writetable(table7,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',7);
    
    desc2a = stat2(1+Rp_vw_cc(4917:6173,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(4917:6173,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(4917:6173,1) 1+Rf(4917:6173,1) 1+RmRf(4917:6173,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(4917:6173,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(4917:6173,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(4917:6173,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames8 = {'VW_CC','VW_FI','Benchmark'};
RowNames8 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table8 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames8,'RowNames',RowNames8);

writetable(table8,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',8);
    
save('C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p5c2_sq2.0.mat');
    
    %% Top 20, C = 0

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
addpath('C:\Users\fsabino\Desktop\Fernando\papers')';


% ----------------------------------------------------
% Load in data
% ----------------------------------------------------
testing = 0;

load SP500_p1
% ----------------------------------------------------
% Set default values
% ----------------------------------------------------

[T,N]= size(Rt); % T = number of periods (days)
% N = number of assets in the whole period
daylag = 0;    % set whether (1, default) or not (0) signals take one day to go into effect (cf. Table 1A vs. 1B)
wi_update = 1; % set whether (1, default) or not (0) intra-pair weights are updated when pair is open; 
               % if not: weights stay at 50-50%
Years = 2015 - 1990 + 0.5;
 
no_pairs = 20;
trading_cost = 0; % works just with one day lag
C = 0; % buy/sell (percentage cost for opening and closing pairs)
trade_req = 0; % set whether (0) or not (2) positive trading volume is required for opening/closing a pair
Stop_loss = -Inf ; %disp(['Stop_loss = ', num2str(Stop_loss)]);%Choose how much loss we are willing to accept on a given pair, compared to 1, i.e 0.93 = 7% stop loss
Stop_gain = Inf;  %disp(['Stop_loss = ', num2str(Stop_gain)]); %Choose how much gain we are willing to accept on a given pair, compared to 1, i.e 1.10 = 10% stop gain
s1218 = 1; % listing req. (look ahead): 12+6 months (=1)

% ----------------------------------------------------
% Reset several variables used for desc statistics
% ----------------------------------------------------
Av_price_dev = zeros(T-sum(Periods(1:2,1)),no_pairs*2); % 12 months are w/o price deviations
% The first 12 months are formation period
Rpair = zeros(sum(Periods(end-1,4)),no_pairs); % Keeps track of the return of each pair

MDDpairs = zeros(length(Periods)-1,no_pairs); % Pre allocate MDD matrix for each pair out of sample;
MDDw = zeros(length(Periods)-1,5); %- Preallocate MDD matrix out of sample for 4 weighting schemes + Rm + (Rm-Rf).
STNpairs = zeros(length(Periods)-2,no_pairs);
STNw = zeros(length(Periods)-2,5);

periods_with_open_pair = 0; % number of periods with pairs opened
periods_without_openpa = 0; % number of periods without pairs opened
pairs_number = 0; pair_open = 0; %
days_open = zeros(no_pairs*10000,1); % measures number of days each pair open; bad programming, but we do not know how many pairs we get
no_pairs_opened = zeros(Years*2-2,no_pairs); % measures number of times pairs opened in each pair per 6 month period

counter = 1; % Keeps track of the days in the main loop
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
listed2 = IPt(Twe_mo+Six_mo*(s1218==1),:)>0; % listed at the end: 12/18 months from now (1xN vector of 0/1s)
listed = listed1 .* listed2; % listed throughout the 12+6 month period (1xN vector of 0/1s)

no_listed = sum(listed);
index_listed = find(listed>0); % find columns that should be included

% [D,ia,ib]=intersect(ticker2(:,big_loop),ticker2(:,big_loop+1));
% [ic,id]= ismember(D,ticker2(:,big_loop+2));
% [ie,ig]= ismember(D(ic),tickerb);
% index_listed2= intersect(index_listed,ig');
% no_listed2 = size(index_listed2,2);

[D,ia,ib]=union(ticker2(:,big_loop),ticker2(:,big_loop+1));
[ic,id]= ismember(D,ticker2(:,big_loop+2));
[ie,ig]= ismember(D(ic),tickerb);
index_listed2= ig';
no_listed2 = sum(ie);


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
% ----------------------------------------------------
% Calc SSEs
% ----------------------------------------------------

SSE = zeros(no_listed2,no_listed2);
    for j=1:(no_listed2-1) % calculate SSE for all pairs
        for k=(j+1):no_listed2 % can prob. be speeded up by better programming
            % SSE(index_listed2(j),index_listed2(k)) = sum(abs( IPt(1:Twe_mo,index_listed2(j))- IPt(1:Twe_mo,index_listed2(k)) ));
           SSE(index_listed2(j),index_listed2(k)) = sum(( IPt(1:Twe_mo,index_listed2(j))-...
                IPt(1:Twe_mo,index_listed2(k)) ).^2);
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

% ----------------------------------------------------
% Calculate returns during the 6 month period
% ----------------------------------------------------
count_temp = counter;

for p=1:no_pairs
    counter = count_temp; pairs_opened = 0; new_pairs_opened = 0; lag = 0;
    std_limit = std(IPt(1:Twe_mo,min_SSE_ro(p))-IPt(1:+Twe_mo,min_SSE_co(p)));
% Fixed volatility estimated in the 12 months period. Doing the calculation one pair at a time 
Rcum = zeros(Twe_mo,1); counter_ret = 1; Rcum_ret = 1; % Presets all variables for each pair
        
for j=(i+Twe_mo):(i+Twe_mo+Six_mo-1) % portfolio period
% Defining the period as from the first day of the twe_month to the 
% last day of the twe_month

if daylag == 0 % w/o one day delay
        if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
                              % If a sign to open has been given, then calcule the returns
           Rpair(counter,p) = +Rt(j,min_SSE_ro(p)) .* wi(1)- Rt(j,min_SSE_co(p)) .* wi(2);
           % Rpair is the return of each pair.
           Rcum(counter_ret,1) = Rpair(counter,p); 
           counter_ret = counter_ret + 1;
           Rcum_ret = cumprod(1+Rcum);  
           lag = lag + 1; %used for paying tc    

		if wi_update == 1 % The weight of each asset in the pair is updated. 
                        wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                        wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
               Rpair(counter,p) = -Rt(j,min_SSE_ro(p)) .* wi(1) + Rt(j,min_SSE_co(p)) .* wi(2);
               Rcum(counter_ret,1) = Rpair(counter,p); 
               counter_ret = counter_ret + 1;
               Rcum_ret = cumprod(1+Rcum);
               lag = lag + 1;
                
		if wi_update == 1
                   wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                   wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        else
               Rpair(counter,p) = 0; % closed (this code not necessary)
        end
            
            if ((pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <= 0)...
               || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain) ...
 	           || (pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0))...
               && ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)...

                pairs_opened = 0; % close pairs: prices cross
		        lag = 0; % when pair is closed reset lag (it serves for paying tc)
                Av_price_dev(counter,no_pairs+p) = 1; % add a marker for closing; 
                                                      % used to calc length of the "open-period"
                Rpair(counter,p) = Rpair(counter,p) - C; %Includes trading cost in the last day of trading, due to closing position                                      
            elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
            if pairs_opened == 0 % record dev (and time) at open
                Rcum = zeros(Six_mo,1);
		        counter_ret = 1;
                Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
                                          /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
            end
            
            pairs_opened = 1; % open pairs
	        lag = lag + 1;  %- Lag was 0. On the next loop C will be paid
            wi = ones(1,2);
            
            elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)

        if pairs_opened == 0 % record dev (and time) at open
	       Rcum = zeros(Six_mo,1);
           counter_ret = 1;
           Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))...
                                    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
        end
        
        pairs_opened = -1; % open pairs
 	    lag = lag + 1;
        wi = ones(1,2);
            
         end
            
        counter = counter + 1; % This is done for the first day, now update 
                               % counter so it is done for the 2nd day        
        elseif daylag == 1 % w/one day delay
            
if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
    Rpair(counter,p) = (+Rt(j,min_SSE_ro(p)) * wi(1) - Rt(j,min_SSE_co(p))* wi(2)) - (lag==2)*trading_cost;
    Rcum (counter_ret,1) = Rpair(counter,p); 
    counter_ret = counter_ret + 1;
    Rcum_ret = cumprod(1+Rcum);
if wi_update == 1
    wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
    wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
end

elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
        Rpair(counter,p) = (-Rt(j,min_SSE_ro(p)) * wi(1)+ Rt(j,min_SSE_co(p)) * wi(2)) - (lag==2)*trading_cost;
    	Rcum (counter_ret,1) = Rpair(counter,p); 
        counter_ret = counter_ret + 1;
        Rcum_ret = cumprod(1+Rcum);
        if wi_update == 1
            wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
            wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
else
    Rpair(counter,p) = 0; % closed (this code not necessary)
end

    pairs_opened = new_pairs_opened;

if (pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <=  0 ...
   || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain)...   
   || pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0)...
   &&((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
    
    new_pairs_opened = 0; % close prices: prices cross
    % If the pairs are open and the spread is smaller than the
    % threshold, close the position 
    lag = 0;
    Av_price_dev(counter+1,no_pairs+p) = 1; % see above, marker

    if wi_update == 1
        Rpair(counter,p) = Rpair(counter,p) - trading_cost - C;
    end
    
elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = 1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 1st, long 2nd) 
        lag = lag + 1;
        if  pairs_opened == 0
            Rcum = zeros(Six_mo,1);
            counter_ret = 1;
        end         
        
elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = -1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 2nd, long 1st)       
        lag = lag + 1;
        if pairs_opened == 0 % - If the pair was closed, reset accumulated return matrix and counter
           Rcum = zeros(Six_mo,1);
           counter_ret = 1;
        end
end

if new_pairs_opened == +1 && lag == 1
    Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);

elseif new_pairs_opened == -1 && lag == 1
    
Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))/(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);
end
    counter = counter + 1;
end % endif of one day lag (0/1)
end % end for pairs-period days (j)

% if a pair open at the end, add a sign that closed
% otherwise no additional steps necessary, as closing just gets last day's return

if pairs_opened ~= 0
    Rpair(counter-1,p) = Rpair(counter-1,p) - trading_cost - C; %Includes trading cost in the last day of trading, due to closing position
    Av_price_dev(counter-1,no_pairs+p) = 1;
end

end % end for portfolio (p)
%% Using 2 Weighting Schemes - Fully Invested and Committed Capital
% ------------------------------------------------------------
% Calculate portfolio returns (ew, vw) out of percentage Rpair
% ------------------------------------------------------------
Rpair_temp = Rpair(counter-Six_mo:counter-1,:);
%
% eq-weighted average on committed cap.; weights reset to "one" (or any equal weight) after each day
%
Ret_acum_pairs(counter-Six_mo:counter-1,:) = (cumprod(1+(Rpair_temp)));
[MaxDD,~] = maxdrawdown(ret2tick(Rpair_temp));
MDDpairs(big_loop,:)= MaxDD;  
STN = sortinoratio(Rpair_temp,0);
STNpairs(big_loop,:) = STN;

%
wi = ones(1,no_pairs);
wi = [wi;cumprod(1+Rpair_temp)];
wi = wi(1:Six_mo,:);
%
% vw-weighted, committed cap.; weights "restart" every 6 month period; 
% (each portfolio gets 1 dollar at the beginning)
Rp_vw_cc(counter-Six_mo:counter-1,:) = (sum((wi .* Rpair_temp)'))' ./ sum(wi')';
%
% vw-weighted, fully invested; weights "restart" from 1 every time a new pair is opened;
% Capital divided between open portfolios.
Ret_acum(counter-Six_mo:counter-1,2) = (cumprod(1+(Rp_vw_cc(counter-Six_mo:counter-1,:))));
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_cc(counter-Six_mo:counter-1,:)));
MDDw(big_loop,2) = MaxDD;
STN = sortinoratio(Rp_vw_cc(counter-Six_mo:counter-1,:),0);
STNw(big_loop,2) = STN;
%
pa_open = zeros(Six_mo,no_pairs); % indicator for days when pairs open

    for i2=1:no_pairs
        pa_opened_temp = 0;temp_lag = 0;
    for i1=1:Six_mo
        if  pa_opened_temp == 1 && daylag == 0 % opening period not included, closing included
            pa_open(i1,i2) = 1;
            days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end
        if   pa_opened_temp == 1 && daylag == 1 && temp_lag == 1
             pa_open(i1,i2) = 1;
             days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end

        if  pa_opened_temp == 1 && daylag == 1 && temp_lag == 0
            temp_lag = 1;
        end

        if  Av_price_dev(counter-1-Six_mo+i1,i2) ~= 0
            pa_opened_temp = 1;
            pairs_number = pairs_number + 1;
        end

         if  Av_price_dev(counter-1-Six_mo+i1,no_pairs+i2) ~= 0
             pa_opened_temp = 0;
             temp_lag = 0;
         end
    end
    end

wi2 = wi .* pa_open;

for i2=1:Six_mo % takes care in a situation where no pairs are open
    if  sum(pa_open(i2,:)') == 0
        wi2(i2,1:no_pairs) = 0.2 * ones(1,no_pairs);
        pa_open(i2,1:no_pairs) = ones(1,no_pairs);
    end
end

Rp_vw_fi(counter-Six_mo:counter-1,:) = (sum((wi2 .* Rpair_temp)'))' ./ sum(wi2')';

Ret_acum(counter-Six_mo:counter-1,3) = (cumprod(1+(Rp_vw_fi(counter-Six_mo:counter-1,:))));
%
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_fi(counter-Six_mo:counter-1,:)));
MDDw(big_loop,4) = MaxDD;
STN = sortinoratio(Rp_vw_fi(counter-Six_mo:counter-1,:),0);
STNw(big_loop,4) = STN;
%
%
RmRf(counter-Six_mo:counter-1,:) = Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:);
Ret_acum(i:i+Six_mo-1,6) = (cumprod(1+(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:))));
[MDD,MDDIndex] = maxdrawdown(ret2tick(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:)));
MDDw(big_loop,5) = MaxDD;
STN = sortinoratio(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:),0);
STNw(big_loop,5) = STN;

    for i2=1:no_pairs
        if  sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0) ~= 0
            periods_with_open_pair = periods_with_open_pair + 1;
            no_pairs_opened(big_loop,i2) = no_pairs_opened(big_loop,p)+ sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0);
        else

        periods_without_openpa = periods_without_openpa + 1;
        end
    end

i = i + Periods(big_loop,1);

big_loop = big_loop + 1;

end % end main loop
% ----------------------------------------------------
% ************* Analysis of the results **************
% ----------------------------------------------------
T_Rp = size(Rp_vw_cc,1); T_Rm = size(Rm,1);
Rm = Rm((1+T_Rm-T_Rp):T_Rm,1); % market
Rf = Rf((1+T_Rm-T_Rp):T_Rm,1); % risk-free rate
RmRf = Rm - Rf; % excess market

MktRf2 = MktRf2((1+T_Rm-T_Rp):T_Rm,1); SMB = SMB((1+T_Rm-T_Rp):T_Rm,1);
HML = HML((1+T_Rm-T_Rp):T_Rm,1); Mom = Mom((1+T_Rm-T_Rp):T_Rm,1);
LT_Rev = LT_Rev((1+T_Rm-T_Rp):T_Rm,1); CMA = CMA((1+T_Rm-T_Rp):T_Rm,1);
RMW = RMW((1+T_Rm-T_Rp):T_Rm,1);

Ret_vw = [Rp_vw_cc, Rp_vw_fi, Rm, Rf, RmRf];

T_Rp

desc2a= stat2(1+Rp_vw_cc,1,3,0); desc2b= stat2(1+Rp_vw_fi,1,3,0);
desc2= [desc2a desc2b]; desc3= stat2([1+Rm 1+Rf 1+RmRf],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

[~,t_vw_cc] = alpha_factor_model(Rp_vw_cc,ones(size(Rp_vw_cc,1),1),0,6);
[~,t_vw_fi] = alpha_factor_model(Rp_vw_fi,ones(size(Rp_vw_fi,1),1),0,6);
[~,t_bench] = alpha_factor_model(RmRf,ones(size(RmRf,1),1),0,6);

ff7_g = [MktRf2,SMB,HML,RMW,CMA,Mom,LT_Rev]; ff7_vw_cc_g = [Rp_vw_cc, ff7_g];

vw_ff7_g = ff7_vw_cc_g(:,2:8);

[beta_vw_cc_ff7_g,se_vw_cc_ff7_g,t_vw_cc_ff7_g] = beta_factor_model(Rp_vw_cc,vw_ff7_g,6);
[beta_vw_fi_ff7_g,se_vw_fi_ff7_g,t_vw_fi_ff7_g] = beta_factor_model(Rp_vw_fi,vw_ff7_g,6);

fit_vw_ccff7g = fitlm(vw_ff7_g,Rp_vw_cc); fit_vw_fiff7g = fitlm(vw_ff7_g,Rp_vw_fi);

ff7g_vw_cc = [beta_vw_cc_ff7_g(1).*100,t_vw_cc_ff7_g(1),beta_vw_cc_ff7_g(2).*100,t_vw_cc_ff7_g(2),...
             beta_vw_cc_ff7_g(3).*100,t_vw_cc_ff7_g(3),beta_vw_cc_ff7_g(4).*100,t_vw_cc_ff7_g(4),...
             beta_vw_cc_ff7_g(5).*100,t_vw_cc_ff7_g(5),beta_vw_cc_ff7_g(6).*100,t_vw_cc_ff7_g(6),...
             beta_vw_cc_ff7_g(7).*100,t_vw_cc_ff7_g(7),beta_vw_cc_ff7_g(8).*100,t_vw_cc_ff7_g(8),...
             fit_vw_ccff7g.Rsquared.Ordinary,fit_vw_ccff7g.Rsquared.Adjusted];
ff7g_vw_fi = [beta_vw_fi_ff7_g(1).*100,t_vw_fi_ff7_g(1),beta_vw_fi_ff7_g(2).*100,t_vw_fi_ff7_g(2),...
             beta_vw_fi_ff7_g(3).*100,t_vw_fi_ff7_g(3),beta_vw_fi_ff7_g(4).*100,t_vw_fi_ff7_g(4),...
             beta_vw_fi_ff7_g(5).*100,t_vw_fi_ff7_g(5),beta_vw_fi_ff7_g(6).*100,t_vw_fi_ff7_g(6),...
             beta_vw_fi_ff7_g(7).*100,t_vw_fi_ff7_g(7),beta_vw_fi_ff7_g(8).*100,t_vw_fi_ff7_g(8),...
             fit_vw_fiff7g.Rsquared.Ordinary,fit_vw_fiff7g.Rsquared.Adjusted];
    
disp(' ');
VariableNames3 = {'VW_CC','VW_FI'};
RowNames3 = {'Intercept';'t_alpha';'Market';'t_beta';'SMB';'t_SMB';'HML';'t_HML';...
    'RMW';'t_RMW';'CMA';'t_CMA';'Mom';'t_Mom';'LT_Rev';'t_LT_Rev';'R2';'R2adj'};
table3 = table(ff7g_vw_cc',ff7g_vw_fi',...
         'VariableNames',VariableNames3,'RowNames',RowNames3);

     
for j=1:6172
MaxDD2_vw_cc(j)= (1+Rp_vw_cc(j,:))*(1+Rp_vw_cc(j+1,:));
MaxDD2_vw_fi(j)= (1+Rp_vw_fi(j,:))*(1+Rp_vw_fi(j+1,:));
MaxDD2_Rm_Rf(j)= (1+RmRf(j,:))*(1+RmRf(j+1,:));
end

MDD2_vw_cc= min(MaxDD2_vw_cc); MDD2_vw_fi= min(MaxDD2_vw_fi);
MDD2_Rm_Rf= min(MaxDD2_Rm_Rf);

[c1_mixcopG2,c2_mixcopG2]= min(MaxDD2_vw_cc);
[c1f2,c2f2]= min(MaxDD2_vw_fi);
[c1r2,c2r2]= min(MaxDD2_Rm_Rf);

for i=1:6047
    MaxDD_vw_cc(i,:)= cumprod(1+Rp_vw_cc(i:i+126-1,:));
    MaxDD_vw_fi(i,:)= cumprod(1+Rp_vw_fi(i:i+126-1,:));
    MaxDD_Rm_Rf(i,:)= cumprod(1+RmRf(i:i+126-1,:));
end

[c1_mixcopG,c2_mixcopG]= min(min(MaxDD_vw_cc));
[c1f,c2f]= min(min(MaxDD_vw_fi));
[c1r,c2r]= min(min(MaxDD_Rm_Rf));

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc,0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi,0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf,0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
     t_vw_cc,100*(sum([Rp_vw_cc]<0)/size(Rp_vw_cc,1)), 100*(1-MDD2_vw_cc),...
     100*(1-min(min(MaxDD_vw_cc))), desc2(2,1), desc2(3,1), desc2(4,1),...
     min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
     t_vw_fi,100*(sum(Rp_vw_fi<0)/size(Rp_vw_fi,1)),100*(1-MDD2_vw_fi),...
     100*(1-min(min(MaxDD_vw_fi))), desc2(2,2), desc2(3,2), desc2(4,2),...
     min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
     t_bench,100*(sum(RmRf<0)/size(RmRf,1)),100*(1-MDD2_Rm_Rf),...
     100*(1-min(min(MaxDD_Rm_Rf))), desc3(2,3), desc3(3,3), desc3(4,3),...
     min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames1 = {'VW_CC','VW_FI','Benchmark'};
RowNames1 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';'t-statistic';...
    'Share of negative excess returns';'MDD1';'MDD2'; 'Std Dev'; 'Skewness';...
    'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table1 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames1,'RowNames',RowNames1);

no_pairs_open = sum(sum(no_pairs_opened)'); x = sum(abs(Av_price_dev(:,1:no_pairs)) > 0);
days_open = days_open(1:no_pairs_open,1);

VariableNames2 = {'Trading_Statistics'};
RowNames2 = {'Av_Price_Dev_trigger_openpa';'Total_number_of_pairs_opened';...
    'Average_number_of_pairs_opened_per_six-month_period'; ...
    'Average_number_of_round-trip_trades_per_pair_in_months'; 'Standard_Dev';'Average_time_pairs_are_open_in_days';...
    'Standard_Deviation';'Median_time_pairs_are_open_in_days'};

trading_stat=[sum(sum(abs(Av_price_dev(:,1:no_pairs)))')./sum((sum(abs(Av_price_dev(:,1:no_pairs)) >.0))'),...
    no_pairs_open,no_pairs_open/(big_loop-1),...
    mean(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),...
    std(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),mean(days_open),std(days_open),median(days_open)];
table2 = table(trading_stat',...
    'VariableNames',VariableNames2,'RowNames',RowNames2);
 
writetable(table1,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table2,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table3,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',3);
    
    desc2a = stat2(1+Rp_vw_cc(1:1138,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1:1138,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1:1138,1) 1+Rf(1:1138,1) 1+RmRf(1:1138,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1:1138,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1:1138,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1:1138,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames4 = {'VW_CC','VW_FI','Benchmark'};
RowNames4 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table4 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames4,'RowNames',RowNames4);

writetable(table4,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',4);
    
desc2a = stat2(1+Rp_vw_cc(1139:2401,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1139:2401,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1139:2401,1) 1+Rf(1139:2401,1) 1+RmRf(1139:2401,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1139:2401,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1139:2401,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1139:2401,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames5 = {'VW_CC','VW_FI','Benchmark'};
RowNames5 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table5 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames5,'RowNames',RowNames5);

writetable(table5,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',5);
    
    desc2a = stat2(1+Rp_vw_cc(2402:3657,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(2402:3657,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(2402:3657,1) 1+Rf(2402:3657,1) 1+RmRf(2402:3657,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(2402:3657,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(2402:3657,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(2402:3657,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames6 = {'VW_CC','VW_FI','Benchmark'};
RowNames6 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table6 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames6,'RowNames',RowNames6);

writetable(table6,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',6);
    
    desc2a = stat2(1+Rp_vw_cc(3657:4916,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(3657:4916,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(3657:4916,1) 1+Rf(3657:4916,1) 1+RmRf(3657:4916,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(3657:4916,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(3657:4916,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(3657:4916,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames7 = {'VW_CC','VW_FI','Benchmark'};
RowNames7 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table7 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames7,'RowNames',RowNames7);

writetable(table7,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',7);
    
    desc2a = stat2(1+Rp_vw_cc(4917:6173,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(4917:6173,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(4917:6173,1) 1+Rf(4917:6173,1) 1+RmRf(4917:6173,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(4917:6173,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(4917:6173,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(4917:6173,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames8 = {'VW_CC','VW_FI','Benchmark'};
RowNames8 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table8 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames8,'RowNames',RowNames8);

writetable(table8,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',8);
    
save('C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c0_sq2.0.mat');
    
    %% Top 20, C = 0.001
    
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
addpath('C:\Users\fsabino\Desktop\Fernando\papers')';


% ----------------------------------------------------
% Load in data
% ----------------------------------------------------
testing = 0;

load SP500_p1
% ----------------------------------------------------
% Set default values
% ----------------------------------------------------

[T,N]= size(Rt); % T = number of periods (days)
% N = number of assets in the whole period
daylag = 0;    % set whether (1, default) or not (0) signals take one day to go into effect (cf. Table 1A vs. 1B)
wi_update = 1; % set whether (1, default) or not (0) intra-pair weights are updated when pair is open; 
               % if not: weights stay at 50-50%
Years = 2015 - 1990 + 0.5;
 
no_pairs = 20;
trading_cost = 0; % works just with one day lag
C = 0.001; % buy/sell (percentage cost for opening and closing pairs)
trade_req = 0; % set whether (0) or not (2) positive trading volume is required for opening/closing a pair
Stop_loss = -Inf ; %disp(['Stop_loss = ', num2str(Stop_loss)]);%Choose how much loss we are willing to accept on a given pair, compared to 1, i.e 0.93 = 7% stop loss
Stop_gain = Inf;  %disp(['Stop_loss = ', num2str(Stop_gain)]); %Choose how much gain we are willing to accept on a given pair, compared to 1, i.e 1.10 = 10% stop gain
s1218 = 1; % listing req. (look ahead): 12+6 months (=1)

% ----------------------------------------------------
% Reset several variables used for desc statistics
% ----------------------------------------------------
Av_price_dev = zeros(T-sum(Periods(1:2,1)),no_pairs*2); % 12 months are w/o price deviations
% The first 12 months are formation period
Rpair = zeros(sum(Periods(end-1,4)),no_pairs); % Keeps track of the return of each pair

MDDpairs = zeros(length(Periods)-1,no_pairs); % Pre allocate MDD matrix for each pair out of sample;
MDDw = zeros(length(Periods)-1,5); %- Preallocate MDD matrix out of sample for 4 weighting schemes + Rm + (Rm-Rf).
STNpairs = zeros(length(Periods)-2,no_pairs);
STNw = zeros(length(Periods)-2,5);

periods_with_open_pair = 0; % number of periods with pairs opened
periods_without_openpa = 0; % number of periods without pairs opened
pairs_number = 0; pair_open = 0; %
days_open = zeros(no_pairs*10000,1); % measures number of days each pair open; bad programming, but we do not know how many pairs we get
no_pairs_opened = zeros(Years*2-2,no_pairs); % measures number of times pairs opened in each pair per 6 month period

counter = 1; % Keeps track of the days in the main loop
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
listed2 = IPt(Twe_mo+Six_mo*(s1218==1),:)>0; % listed at the end: 12/18 months from now (1xN vector of 0/1s)
listed = listed1 .* listed2; % listed throughout the 12+6 month period (1xN vector of 0/1s)

no_listed = sum(listed);
index_listed = find(listed>0); % find columns that should be included

% [D,ia,ib]=intersect(ticker2(:,big_loop),ticker2(:,big_loop+1));
% [ic,id]= ismember(D,ticker2(:,big_loop+2));
% [ie,ig]= ismember(D(ic),tickerb);
% index_listed2= intersect(index_listed,ig');
% no_listed2 = size(index_listed2,2);

[D,ia,ib]=union(ticker2(:,big_loop),ticker2(:,big_loop+1));
[ic,id]= ismember(D,ticker2(:,big_loop+2));
[ie,ig]= ismember(D(ic),tickerb);
index_listed2= ig';
no_listed2 = sum(ie);


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
% ----------------------------------------------------
% Calc SSEs
% ----------------------------------------------------

SSE = zeros(no_listed2,no_listed2);
    for j=1:(no_listed2-1) % calculate SSE for all pairs
        for k=(j+1):no_listed2 % can prob. be speeded up by better programming
            % SSE(index_listed2(j),index_listed2(k)) = sum(abs( IPt(1:Twe_mo,index_listed2(j))- IPt(1:Twe_mo,index_listed2(k)) ));
           SSE(index_listed2(j),index_listed2(k)) = sum(( IPt(1:Twe_mo,index_listed2(j))-...
                IPt(1:Twe_mo,index_listed2(k)) ).^2);
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

% ----------------------------------------------------
% Calculate returns during the 6 month period
% ----------------------------------------------------
count_temp = counter;

for p=1:no_pairs
    counter = count_temp; pairs_opened = 0; new_pairs_opened = 0; lag = 0;
    std_limit = std(IPt(1:Twe_mo,min_SSE_ro(p))-IPt(1:+Twe_mo,min_SSE_co(p)));
% Fixed volatility estimated in the 12 months period. Doing the calculation one pair at a time 
Rcum = zeros(Twe_mo,1); counter_ret = 1; Rcum_ret = 1; % Presets all variables for each pair
        
for j=(i+Twe_mo):(i+Twe_mo+Six_mo-1) % portfolio period
% Defining the period as from the first day of the twe_month to the 
% last day of the twe_month

if daylag == 0 % w/o one day delay
        if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
                              % If a sign to open has been given, then calcule the returns
           Rpair(counter,p) = +Rt(j,min_SSE_ro(p)) .* wi(1)- Rt(j,min_SSE_co(p)) .* wi(2);
           % Rpair is the return of each pair.
           Rcum(counter_ret,1) = Rpair(counter,p); 
           counter_ret = counter_ret + 1;
           Rcum_ret = cumprod(1+Rcum);  
           lag = lag + 1; %used for paying tc    

		if wi_update == 1 % The weight of each asset in the pair is updated. 
                        wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                        wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
               Rpair(counter,p) = -Rt(j,min_SSE_ro(p)) .* wi(1) + Rt(j,min_SSE_co(p)) .* wi(2);
               Rcum(counter_ret,1) = Rpair(counter,p); 
               counter_ret = counter_ret + 1;
               Rcum_ret = cumprod(1+Rcum);
               lag = lag + 1;
                
		if wi_update == 1
                   wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                   wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        else
               Rpair(counter,p) = 0; % closed (this code not necessary)
        end
            
            if ((pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <= 0)...
               || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain) ...
 	           || (pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0))...
               && ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)...

                pairs_opened = 0; % close pairs: prices cross
		        lag = 0; % when pair is closed reset lag (it serves for paying tc)
                Av_price_dev(counter,no_pairs+p) = 1; % add a marker for closing; 
                                                      % used to calc length of the "open-period"
                Rpair(counter,p) = Rpair(counter,p) - C; %Includes trading cost in the last day of trading, due to closing position                                      
            elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
            if pairs_opened == 0 % record dev (and time) at open
                Rcum = zeros(Six_mo,1);
		        counter_ret = 1;
                Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
                                          /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
            end
            
            pairs_opened = 1; % open pairs
	        lag = lag + 1;  %- Lag was 0. On the next loop C will be paid
            wi = ones(1,2);
            
            elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)

        if pairs_opened == 0 % record dev (and time) at open
	       Rcum = zeros(Six_mo,1);
           counter_ret = 1;
           Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))...
                                    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
        end
        
        pairs_opened = -1; % open pairs
 	    lag = lag + 1;
        wi = ones(1,2);
            
         end
            
        counter = counter + 1; % This is done for the first day, now update 
                               % counter so it is done for the 2nd day        
        elseif daylag == 1 % w/one day delay
            
if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
    Rpair(counter,p) = (+Rt(j,min_SSE_ro(p)) * wi(1) - Rt(j,min_SSE_co(p))* wi(2)) - (lag==2)*trading_cost;
    Rcum (counter_ret,1) = Rpair(counter,p); 
    counter_ret = counter_ret + 1;
    Rcum_ret = cumprod(1+Rcum);
if wi_update == 1
    wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
    wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
end

elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
        Rpair(counter,p) = (-Rt(j,min_SSE_ro(p)) * wi(1)+ Rt(j,min_SSE_co(p)) * wi(2)) - (lag==2)*trading_cost;
    	Rcum (counter_ret,1) = Rpair(counter,p); 
        counter_ret = counter_ret + 1;
        Rcum_ret = cumprod(1+Rcum);
        if wi_update == 1
            wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
            wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
else
    Rpair(counter,p) = 0; % closed (this code not necessary)
end

    pairs_opened = new_pairs_opened;

if (pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <=  0 ...
   || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain)...   
   || pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0)...
   &&((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
    
    new_pairs_opened = 0; % close prices: prices cross
    % If the pairs are open and the spread is smaller than the
    % threshold, close the position 
    lag = 0;
    Av_price_dev(counter+1,no_pairs+p) = 1; % see above, marker

    if wi_update == 1
        Rpair(counter,p) = Rpair(counter,p) - trading_cost - C;
    end
    
elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = 1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 1st, long 2nd) 
        lag = lag + 1;
        if  pairs_opened == 0
            Rcum = zeros(Six_mo,1);
            counter_ret = 1;
        end         
        
elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = -1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 2nd, long 1st)       
        lag = lag + 1;
        if pairs_opened == 0 % - If the pair was closed, reset accumulated return matrix and counter
           Rcum = zeros(Six_mo,1);
           counter_ret = 1;
        end
end

if new_pairs_opened == +1 && lag == 1
    Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);

elseif new_pairs_opened == -1 && lag == 1
    
Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))/(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);
end
    counter = counter + 1;
end % endif of one day lag (0/1)
end % end for pairs-period days (j)

% if a pair open at the end, add a sign that closed
% otherwise no additional steps necessary, as closing just gets last day's return

if pairs_opened ~= 0
    Rpair(counter-1,p) = Rpair(counter-1,p) - trading_cost - C; %Includes trading cost in the last day of trading, due to closing position
    Av_price_dev(counter-1,no_pairs+p) = 1;
end

end % end for portfolio (p)
%% Using 2 Weighting Schemes - Fully Invested and Committed Capital
% ------------------------------------------------------------
% Calculate portfolio returns (ew, vw) out of percentage Rpair
% ------------------------------------------------------------
Rpair_temp = Rpair(counter-Six_mo:counter-1,:);
%
% eq-weighted average on committed cap.; weights reset to "one" (or any equal weight) after each day
%
Ret_acum_pairs(counter-Six_mo:counter-1,:) = (cumprod(1+(Rpair_temp)));
[MaxDD,~] = maxdrawdown(ret2tick(Rpair_temp));
MDDpairs(big_loop,:)= MaxDD;  
STN = sortinoratio(Rpair_temp,0);
STNpairs(big_loop,:) = STN;

%
wi = ones(1,no_pairs);
wi = [wi;cumprod(1+Rpair_temp)];
wi = wi(1:Six_mo,:);
%
% vw-weighted, committed cap.; weights "restart" every 6 month period; 
% (each portfolio gets 1 dollar at the beginning)
Rp_vw_cc(counter-Six_mo:counter-1,:) = (sum((wi .* Rpair_temp)'))' ./ sum(wi')';
%
% vw-weighted, fully invested; weights "restart" from 1 every time a new pair is opened;
% Capital divided between open portfolios.
Ret_acum(counter-Six_mo:counter-1,2) = (cumprod(1+(Rp_vw_cc(counter-Six_mo:counter-1,:))));
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_cc(counter-Six_mo:counter-1,:)));
MDDw(big_loop,2) = MaxDD;
STN = sortinoratio(Rp_vw_cc(counter-Six_mo:counter-1,:),0);
STNw(big_loop,2) = STN;
%
pa_open = zeros(Six_mo,no_pairs); % indicator for days when pairs open

    for i2=1:no_pairs
        pa_opened_temp = 0;temp_lag = 0;
    for i1=1:Six_mo
        if  pa_opened_temp == 1 && daylag == 0 % opening period not included, closing included
            pa_open(i1,i2) = 1;
            days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end
        if   pa_opened_temp == 1 && daylag == 1 && temp_lag == 1
             pa_open(i1,i2) = 1;
             days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end

        if  pa_opened_temp == 1 && daylag == 1 && temp_lag == 0
            temp_lag = 1;
        end

        if  Av_price_dev(counter-1-Six_mo+i1,i2) ~= 0
            pa_opened_temp = 1;
            pairs_number = pairs_number + 1;
        end

         if  Av_price_dev(counter-1-Six_mo+i1,no_pairs+i2) ~= 0
             pa_opened_temp = 0;
             temp_lag = 0;
         end
    end
    end

wi2 = wi .* pa_open;

for i2=1:Six_mo % takes care in a situation where no pairs are open
    if  sum(pa_open(i2,:)') == 0
        wi2(i2,1:no_pairs) = 0.2 * ones(1,no_pairs);
        pa_open(i2,1:no_pairs) = ones(1,no_pairs);
    end
end

Rp_vw_fi(counter-Six_mo:counter-1,:) = (sum((wi2 .* Rpair_temp)'))' ./ sum(wi2')';

Ret_acum(counter-Six_mo:counter-1,3) = (cumprod(1+(Rp_vw_fi(counter-Six_mo:counter-1,:))));
%
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_fi(counter-Six_mo:counter-1,:)));
MDDw(big_loop,4) = MaxDD;
STN = sortinoratio(Rp_vw_fi(counter-Six_mo:counter-1,:),0);
STNw(big_loop,4) = STN;
%
%
RmRf(counter-Six_mo:counter-1,:) = Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:);
Ret_acum(i:i+Six_mo-1,6) = (cumprod(1+(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:))));
[MDD,MDDIndex] = maxdrawdown(ret2tick(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:)));
MDDw(big_loop,5) = MaxDD;
STN = sortinoratio(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:),0);
STNw(big_loop,5) = STN;

    for i2=1:no_pairs
        if  sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0) ~= 0
            periods_with_open_pair = periods_with_open_pair + 1;
            no_pairs_opened(big_loop,i2) = no_pairs_opened(big_loop,p)+ sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0);
        else

        periods_without_openpa = periods_without_openpa + 1;
        end
    end

i = i + Periods(big_loop,1);

big_loop = big_loop + 1;

end % end main loop
% ----------------------------------------------------
% ************* Analysis of the results **************
% ----------------------------------------------------
T_Rp = size(Rp_vw_cc,1); T_Rm = size(Rm,1);
Rm = Rm((1+T_Rm-T_Rp):T_Rm,1); % market
Rf = Rf((1+T_Rm-T_Rp):T_Rm,1); % risk-free rate
RmRf = Rm - Rf; % excess market

MktRf2 = MktRf2((1+T_Rm-T_Rp):T_Rm,1); SMB = SMB((1+T_Rm-T_Rp):T_Rm,1);
HML = HML((1+T_Rm-T_Rp):T_Rm,1); Mom = Mom((1+T_Rm-T_Rp):T_Rm,1);
LT_Rev = LT_Rev((1+T_Rm-T_Rp):T_Rm,1); CMA = CMA((1+T_Rm-T_Rp):T_Rm,1);
RMW = RMW((1+T_Rm-T_Rp):T_Rm,1);

Ret_vw = [Rp_vw_cc, Rp_vw_fi, Rm, Rf, RmRf];

T_Rp

desc2a= stat2(1+Rp_vw_cc,1,3,0); desc2b= stat2(1+Rp_vw_fi,1,3,0);
desc2= [desc2a desc2b]; desc3= stat2([1+Rm 1+Rf 1+RmRf],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

[~,t_vw_cc] = alpha_factor_model(Rp_vw_cc,ones(size(Rp_vw_cc,1),1),0,6);
[~,t_vw_fi] = alpha_factor_model(Rp_vw_fi,ones(size(Rp_vw_fi,1),1),0,6);
[~,t_bench] = alpha_factor_model(RmRf,ones(size(RmRf,1),1),0,6);

ff7_g = [MktRf2,SMB,HML,RMW,CMA,Mom,LT_Rev]; ff7_vw_cc_g = [Rp_vw_cc, ff7_g];

vw_ff7_g = ff7_vw_cc_g(:,2:8);

[beta_vw_cc_ff7_g,se_vw_cc_ff7_g,t_vw_cc_ff7_g] = beta_factor_model(Rp_vw_cc,vw_ff7_g,6);
[beta_vw_fi_ff7_g,se_vw_fi_ff7_g,t_vw_fi_ff7_g] = beta_factor_model(Rp_vw_fi,vw_ff7_g,6);

fit_vw_ccff7g = fitlm(vw_ff7_g,Rp_vw_cc); fit_vw_fiff7g = fitlm(vw_ff7_g,Rp_vw_fi);

ff7g_vw_cc = [beta_vw_cc_ff7_g(1).*100,t_vw_cc_ff7_g(1),beta_vw_cc_ff7_g(2).*100,t_vw_cc_ff7_g(2),...
             beta_vw_cc_ff7_g(3).*100,t_vw_cc_ff7_g(3),beta_vw_cc_ff7_g(4).*100,t_vw_cc_ff7_g(4),...
             beta_vw_cc_ff7_g(5).*100,t_vw_cc_ff7_g(5),beta_vw_cc_ff7_g(6).*100,t_vw_cc_ff7_g(6),...
             beta_vw_cc_ff7_g(7).*100,t_vw_cc_ff7_g(7),beta_vw_cc_ff7_g(8).*100,t_vw_cc_ff7_g(8),...
             fit_vw_ccff7g.Rsquared.Ordinary,fit_vw_ccff7g.Rsquared.Adjusted];
ff7g_vw_fi = [beta_vw_fi_ff7_g(1).*100,t_vw_fi_ff7_g(1),beta_vw_fi_ff7_g(2).*100,t_vw_fi_ff7_g(2),...
             beta_vw_fi_ff7_g(3).*100,t_vw_fi_ff7_g(3),beta_vw_fi_ff7_g(4).*100,t_vw_fi_ff7_g(4),...
             beta_vw_fi_ff7_g(5).*100,t_vw_fi_ff7_g(5),beta_vw_fi_ff7_g(6).*100,t_vw_fi_ff7_g(6),...
             beta_vw_fi_ff7_g(7).*100,t_vw_fi_ff7_g(7),beta_vw_fi_ff7_g(8).*100,t_vw_fi_ff7_g(8),...
             fit_vw_fiff7g.Rsquared.Ordinary,fit_vw_fiff7g.Rsquared.Adjusted];
    
disp(' ');
VariableNames3 = {'VW_CC','VW_FI'};
RowNames3 = {'Intercept';'t_alpha';'Market';'t_beta';'SMB';'t_SMB';'HML';'t_HML';...
    'RMW';'t_RMW';'CMA';'t_CMA';'Mom';'t_Mom';'LT_Rev';'t_LT_Rev';'R2';'R2adj'};
table3 = table(ff7g_vw_cc',ff7g_vw_fi',...
         'VariableNames',VariableNames3,'RowNames',RowNames3);

     
for j=1:6172
MaxDD2_vw_cc(j)= (1+Rp_vw_cc(j,:))*(1+Rp_vw_cc(j+1,:));
MaxDD2_vw_fi(j)= (1+Rp_vw_fi(j,:))*(1+Rp_vw_fi(j+1,:));
MaxDD2_Rm_Rf(j)= (1+RmRf(j,:))*(1+RmRf(j+1,:));
end

MDD2_vw_cc= min(MaxDD2_vw_cc); MDD2_vw_fi= min(MaxDD2_vw_fi);
MDD2_Rm_Rf= min(MaxDD2_Rm_Rf);

[c1_mixcopG2,c2_mixcopG2]= min(MaxDD2_vw_cc);
[c1f2,c2f2]= min(MaxDD2_vw_fi);
[c1r2,c2r2]= min(MaxDD2_Rm_Rf);

for i=1:6047
    MaxDD_vw_cc(i,:)= cumprod(1+Rp_vw_cc(i:i+126-1,:));
    MaxDD_vw_fi(i,:)= cumprod(1+Rp_vw_fi(i:i+126-1,:));
    MaxDD_Rm_Rf(i,:)= cumprod(1+RmRf(i:i+126-1,:));
end

[c1_mixcopG,c2_mixcopG]= min(min(MaxDD_vw_cc));
[c1f,c2f]= min(min(MaxDD_vw_fi));
[c1r,c2r]= min(min(MaxDD_Rm_Rf));

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc,0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi,0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf,0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
     t_vw_cc,100*(sum([Rp_vw_cc]<0)/size(Rp_vw_cc,1)), 100*(1-MDD2_vw_cc),...
     100*(1-min(min(MaxDD_vw_cc))), desc2(2,1), desc2(3,1), desc2(4,1),...
     min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
     t_vw_fi,100*(sum(Rp_vw_fi<0)/size(Rp_vw_fi,1)),100*(1-MDD2_vw_fi),...
     100*(1-min(min(MaxDD_vw_fi))), desc2(2,2), desc2(3,2), desc2(4,2),...
     min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
     t_bench,100*(sum(RmRf<0)/size(RmRf,1)),100*(1-MDD2_Rm_Rf),...
     100*(1-min(min(MaxDD_Rm_Rf))), desc3(2,3), desc3(3,3), desc3(4,3),...
     min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames1 = {'VW_CC','VW_FI','Benchmark'};
RowNames1 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';'t-statistic';...
    'Share of negative excess returns';'MDD1';'MDD2'; 'Std Dev'; 'Skewness';...
    'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table1 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames1,'RowNames',RowNames1);

no_pairs_open = sum(sum(no_pairs_opened)'); x = sum(abs(Av_price_dev(:,1:no_pairs)) > 0);
days_open = days_open(1:no_pairs_open,1);

VariableNames2 = {'Trading_Statistics'};
RowNames2 = {'Av_Price_Dev_trigger_openpa';'Total_number_of_pairs_opened';...
    'Average_number_of_pairs_opened_per_six-month_period'; ...
    'Average_number_of_round-trip_trades_per_pair_in_months'; 'Standard_Dev';'Average_time_pairs_are_open_in_days';...
    'Standard_Deviation';'Median_time_pairs_are_open_in_days'};

trading_stat=[sum(sum(abs(Av_price_dev(:,1:no_pairs)))')./sum((sum(abs(Av_price_dev(:,1:no_pairs)) >.0))'),...
    no_pairs_open,no_pairs_open/(big_loop-1),...
    mean(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),...
    std(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),mean(days_open),std(days_open),median(days_open)];
table2 = table(trading_stat',...
    'VariableNames',VariableNames2,'RowNames',RowNames2);
 
writetable(table1,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table2,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table3,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',3);
    
    desc2a = stat2(1+Rp_vw_cc(1:1138,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1:1138,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1:1138,1) 1+Rf(1:1138,1) 1+RmRf(1:1138,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1:1138,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1:1138,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1:1138,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames4 = {'VW_CC','VW_FI','Benchmark'};
RowNames4 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table4 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames4,'RowNames',RowNames4);

writetable(table4,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',4);
    
desc2a = stat2(1+Rp_vw_cc(1139:2401,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1139:2401,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1139:2401,1) 1+Rf(1139:2401,1) 1+RmRf(1139:2401,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1139:2401,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1139:2401,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1139:2401,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames5 = {'VW_CC','VW_FI','Benchmark'};
RowNames5 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table5 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames5,'RowNames',RowNames5);

writetable(table5,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',5);
    
    desc2a = stat2(1+Rp_vw_cc(2402:3657,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(2402:3657,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(2402:3657,1) 1+Rf(2402:3657,1) 1+RmRf(2402:3657,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(2402:3657,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(2402:3657,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(2402:3657,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames6 = {'VW_CC','VW_FI','Benchmark'};
RowNames6 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table6 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames6,'RowNames',RowNames6);

writetable(table6,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',6);
    
    desc2a = stat2(1+Rp_vw_cc(3657:4916,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(3657:4916,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(3657:4916,1) 1+Rf(3657:4916,1) 1+RmRf(3657:4916,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(3657:4916,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(3657:4916,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(3657:4916,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames7 = {'VW_CC','VW_FI','Benchmark'};
RowNames7 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table7 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames7,'RowNames',RowNames7);

writetable(table7,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',7);
    
    desc2a = stat2(1+Rp_vw_cc(4917:6173,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(4917:6173,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(4917:6173,1) 1+Rf(4917:6173,1) 1+RmRf(4917:6173,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(4917:6173,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(4917:6173,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(4917:6173,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames8 = {'VW_CC','VW_FI','Benchmark'};
RowNames8 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table8 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames8,'RowNames',RowNames8);

writetable(table8,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',8);
    
save('C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c1_sq2.0.mat');
    
    %% Top 20, C = 0.002
    
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
addpath('C:\Users\fsabino\Desktop\Fernando\papers')';


% ----------------------------------------------------
% Load in data
% ----------------------------------------------------
testing = 0;

load SP500_p1
% ----------------------------------------------------
% Set default values
% ----------------------------------------------------

[T,N]= size(Rt); % T = number of periods (days)
% N = number of assets in the whole period
daylag = 0;    % set whether (1, default) or not (0) signals take one day to go into effect (cf. Table 1A vs. 1B)
wi_update = 1; % set whether (1, default) or not (0) intra-pair weights are updated when pair is open; 
               % if not: weights stay at 50-50%
Years = 2015 - 1990 + 0.5;
 
no_pairs = 20;
trading_cost = 0; % works just with one day lag
C = 0.002; % buy/sell (percentage cost for opening and closing pairs)
trade_req = 0; % set whether (0) or not (2) positive trading volume is required for opening/closing a pair
Stop_loss = -Inf ; %disp(['Stop_loss = ', num2str(Stop_loss)]);%Choose how much loss we are willing to accept on a given pair, compared to 1, i.e 0.93 = 7% stop loss
Stop_gain = Inf;  %disp(['Stop_loss = ', num2str(Stop_gain)]); %Choose how much gain we are willing to accept on a given pair, compared to 1, i.e 1.10 = 10% stop gain
s1218 = 1; % listing req. (look ahead): 12+6 months (=1)

% ----------------------------------------------------
% Reset several variables used for desc statistics
% ----------------------------------------------------
Av_price_dev = zeros(T-sum(Periods(1:2,1)),no_pairs*2); % 12 months are w/o price deviations
% The first 12 months are formation period
Rpair = zeros(sum(Periods(end-1,4)),no_pairs); % Keeps track of the return of each pair

MDDpairs = zeros(length(Periods)-1,no_pairs); % Pre allocate MDD matrix for each pair out of sample;
MDDw = zeros(length(Periods)-1,5); %- Preallocate MDD matrix out of sample for 4 weighting schemes + Rm + (Rm-Rf).
STNpairs = zeros(length(Periods)-2,no_pairs);
STNw = zeros(length(Periods)-2,5);

periods_with_open_pair = 0; % number of periods with pairs opened
periods_without_openpa = 0; % number of periods without pairs opened
pairs_number = 0; pair_open = 0; %
days_open = zeros(no_pairs*10000,1); % measures number of days each pair open; bad programming, but we do not know how many pairs we get
no_pairs_opened = zeros(Years*2-2,no_pairs); % measures number of times pairs opened in each pair per 6 month period

counter = 1; % Keeps track of the days in the main loop
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
listed2 = IPt(Twe_mo+Six_mo*(s1218==1),:)>0; % listed at the end: 12/18 months from now (1xN vector of 0/1s)
listed = listed1 .* listed2; % listed throughout the 12+6 month period (1xN vector of 0/1s)

no_listed = sum(listed);
index_listed = find(listed>0); % find columns that should be included

% [D,ia,ib]=intersect(ticker2(:,big_loop),ticker2(:,big_loop+1));
% [ic,id]= ismember(D,ticker2(:,big_loop+2));
% [ie,ig]= ismember(D(ic),tickerb);
% index_listed2= intersect(index_listed,ig');
% no_listed2 = size(index_listed2,2);

[D,ia,ib]=union(ticker2(:,big_loop),ticker2(:,big_loop+1));
[ic,id]= ismember(D,ticker2(:,big_loop+2));
[ie,ig]= ismember(D(ic),tickerb);
index_listed2= ig';
no_listed2 = sum(ie);


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
% ----------------------------------------------------
% Calc SSEs
% ----------------------------------------------------

SSE = zeros(no_listed2,no_listed2);
    for j=1:(no_listed2-1) % calculate SSE for all pairs
        for k=(j+1):no_listed2 % can prob. be speeded up by better programming
            % SSE(index_listed2(j),index_listed2(k)) = sum(abs( IPt(1:Twe_mo,index_listed2(j))- IPt(1:Twe_mo,index_listed2(k)) ));
           SSE(index_listed2(j),index_listed2(k)) = sum(( IPt(1:Twe_mo,index_listed2(j))-...
                IPt(1:Twe_mo,index_listed2(k)) ).^2);
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

% ----------------------------------------------------
% Calculate returns during the 6 month period
% ----------------------------------------------------
count_temp = counter;

for p=1:no_pairs
    counter = count_temp; pairs_opened = 0; new_pairs_opened = 0; lag = 0;
    std_limit = std(IPt(1:Twe_mo,min_SSE_ro(p))-IPt(1:+Twe_mo,min_SSE_co(p)));
% Fixed volatility estimated in the 12 months period. Doing the calculation one pair at a time 
Rcum = zeros(Twe_mo,1); counter_ret = 1; Rcum_ret = 1; % Presets all variables for each pair
        
for j=(i+Twe_mo):(i+Twe_mo+Six_mo-1) % portfolio period
% Defining the period as from the first day of the twe_month to the 
% last day of the twe_month

if daylag == 0 % w/o one day delay
        if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
                              % If a sign to open has been given, then calcule the returns
           Rpair(counter,p) = +Rt(j,min_SSE_ro(p)) .* wi(1)- Rt(j,min_SSE_co(p)) .* wi(2);
           % Rpair is the return of each pair.
           Rcum(counter_ret,1) = Rpair(counter,p); 
           counter_ret = counter_ret + 1;
           Rcum_ret = cumprod(1+Rcum);  
           lag = lag + 1; %used for paying tc    

		if wi_update == 1 % The weight of each asset in the pair is updated. 
                        wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                        wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
               Rpair(counter,p) = -Rt(j,min_SSE_ro(p)) .* wi(1) + Rt(j,min_SSE_co(p)) .* wi(2);
               Rcum(counter_ret,1) = Rpair(counter,p); 
               counter_ret = counter_ret + 1;
               Rcum_ret = cumprod(1+Rcum);
               lag = lag + 1;
                
		if wi_update == 1
                   wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                   wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        else
               Rpair(counter,p) = 0; % closed (this code not necessary)
        end
            
            if ((pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <= 0)...
               || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain) ...
 	           || (pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0))...
               && ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)...

                pairs_opened = 0; % close pairs: prices cross
		        lag = 0; % when pair is closed reset lag (it serves for paying tc)
                Av_price_dev(counter,no_pairs+p) = 1; % add a marker for closing; 
                                                      % used to calc length of the "open-period"
                Rpair(counter,p) = Rpair(counter,p) - C; %Includes trading cost in the last day of trading, due to closing position                                      
            elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
            if pairs_opened == 0 % record dev (and time) at open
                Rcum = zeros(Six_mo,1);
		        counter_ret = 1;
                Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
                                          /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
            end
            
            pairs_opened = 1; % open pairs
	        lag = lag + 1;  %- Lag was 0. On the next loop C will be paid
            wi = ones(1,2);
            
            elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)

        if pairs_opened == 0 % record dev (and time) at open
	       Rcum = zeros(Six_mo,1);
           counter_ret = 1;
           Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))...
                                    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
        end
        
        pairs_opened = -1; % open pairs
 	    lag = lag + 1;
        wi = ones(1,2);
            
         end
            
        counter = counter + 1; % This is done for the first day, now update 
                               % counter so it is done for the 2nd day        
        elseif daylag == 1 % w/one day delay
            
if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
    Rpair(counter,p) = (+Rt(j,min_SSE_ro(p)) * wi(1) - Rt(j,min_SSE_co(p))* wi(2)) - (lag==2)*trading_cost;
    Rcum (counter_ret,1) = Rpair(counter,p); 
    counter_ret = counter_ret + 1;
    Rcum_ret = cumprod(1+Rcum);
if wi_update == 1
    wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
    wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
end

elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
        Rpair(counter,p) = (-Rt(j,min_SSE_ro(p)) * wi(1)+ Rt(j,min_SSE_co(p)) * wi(2)) - (lag==2)*trading_cost;
    	Rcum (counter_ret,1) = Rpair(counter,p); 
        counter_ret = counter_ret + 1;
        Rcum_ret = cumprod(1+Rcum);
        if wi_update == 1
            wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
            wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
else
    Rpair(counter,p) = 0; % closed (this code not necessary)
end

    pairs_opened = new_pairs_opened;

if (pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <=  0 ...
   || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain)...   
   || pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0)...
   &&((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
    
    new_pairs_opened = 0; % close prices: prices cross
    % If the pairs are open and the spread is smaller than the
    % threshold, close the position 
    lag = 0;
    Av_price_dev(counter+1,no_pairs+p) = 1; % see above, marker

    if wi_update == 1
        Rpair(counter,p) = Rpair(counter,p) - trading_cost - C;
    end
    
elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = 1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 1st, long 2nd) 
        lag = lag + 1;
        if  pairs_opened == 0
            Rcum = zeros(Six_mo,1);
            counter_ret = 1;
        end         
        
elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = -1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 2nd, long 1st)       
        lag = lag + 1;
        if pairs_opened == 0 % - If the pair was closed, reset accumulated return matrix and counter
           Rcum = zeros(Six_mo,1);
           counter_ret = 1;
        end
end

if new_pairs_opened == +1 && lag == 1
    Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);

elseif new_pairs_opened == -1 && lag == 1
    
Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))/(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);
end
    counter = counter + 1;
end % endif of one day lag (0/1)
end % end for pairs-period days (j)

% if a pair open at the end, add a sign that closed
% otherwise no additional steps necessary, as closing just gets last day's return

if pairs_opened ~= 0
    Rpair(counter-1,p) = Rpair(counter-1,p) - trading_cost - C; %Includes trading cost in the last day of trading, due to closing position
    Av_price_dev(counter-1,no_pairs+p) = 1;
end

end % end for portfolio (p)
%% Using 2 Weighting Schemes - Fully Invested and Committed Capital
% ------------------------------------------------------------
% Calculate portfolio returns (ew, vw) out of percentage Rpair
% ------------------------------------------------------------
Rpair_temp = Rpair(counter-Six_mo:counter-1,:);
%
% eq-weighted average on committed cap.; weights reset to "one" (or any equal weight) after each day
%
Ret_acum_pairs(counter-Six_mo:counter-1,:) = (cumprod(1+(Rpair_temp)));
[MaxDD,~] = maxdrawdown(ret2tick(Rpair_temp));
MDDpairs(big_loop,:)= MaxDD;  
STN = sortinoratio(Rpair_temp,0);
STNpairs(big_loop,:) = STN;

%
wi = ones(1,no_pairs);
wi = [wi;cumprod(1+Rpair_temp)];
wi = wi(1:Six_mo,:);
%
% vw-weighted, committed cap.; weights "restart" every 6 month period; 
% (each portfolio gets 1 dollar at the beginning)
Rp_vw_cc(counter-Six_mo:counter-1,:) = (sum((wi .* Rpair_temp)'))' ./ sum(wi')';
%
% vw-weighted, fully invested; weights "restart" from 1 every time a new pair is opened;
% Capital divided between open portfolios.
Ret_acum(counter-Six_mo:counter-1,2) = (cumprod(1+(Rp_vw_cc(counter-Six_mo:counter-1,:))));
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_cc(counter-Six_mo:counter-1,:)));
MDDw(big_loop,2) = MaxDD;
STN = sortinoratio(Rp_vw_cc(counter-Six_mo:counter-1,:),0);
STNw(big_loop,2) = STN;
%
pa_open = zeros(Six_mo,no_pairs); % indicator for days when pairs open

    for i2=1:no_pairs
        pa_opened_temp = 0;temp_lag = 0;
    for i1=1:Six_mo
        if  pa_opened_temp == 1 && daylag == 0 % opening period not included, closing included
            pa_open(i1,i2) = 1;
            days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end
        if   pa_opened_temp == 1 && daylag == 1 && temp_lag == 1
             pa_open(i1,i2) = 1;
             days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end

        if  pa_opened_temp == 1 && daylag == 1 && temp_lag == 0
            temp_lag = 1;
        end

        if  Av_price_dev(counter-1-Six_mo+i1,i2) ~= 0
            pa_opened_temp = 1;
            pairs_number = pairs_number + 1;
        end

         if  Av_price_dev(counter-1-Six_mo+i1,no_pairs+i2) ~= 0
             pa_opened_temp = 0;
             temp_lag = 0;
         end
    end
    end

wi2 = wi .* pa_open;

for i2=1:Six_mo % takes care in a situation where no pairs are open
    if  sum(pa_open(i2,:)') == 0
        wi2(i2,1:no_pairs) = 0.2 * ones(1,no_pairs);
        pa_open(i2,1:no_pairs) = ones(1,no_pairs);
    end
end

Rp_vw_fi(counter-Six_mo:counter-1,:) = (sum((wi2 .* Rpair_temp)'))' ./ sum(wi2')';

Ret_acum(counter-Six_mo:counter-1,3) = (cumprod(1+(Rp_vw_fi(counter-Six_mo:counter-1,:))));
%
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_fi(counter-Six_mo:counter-1,:)));
MDDw(big_loop,4) = MaxDD;
STN = sortinoratio(Rp_vw_fi(counter-Six_mo:counter-1,:),0);
STNw(big_loop,4) = STN;
%
%
RmRf(counter-Six_mo:counter-1,:) = Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:);
Ret_acum(i:i+Six_mo-1,6) = (cumprod(1+(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:))));
[MDD,MDDIndex] = maxdrawdown(ret2tick(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:)));
MDDw(big_loop,5) = MaxDD;
STN = sortinoratio(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:),0);
STNw(big_loop,5) = STN;

    for i2=1:no_pairs
        if  sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0) ~= 0
            periods_with_open_pair = periods_with_open_pair + 1;
            no_pairs_opened(big_loop,i2) = no_pairs_opened(big_loop,p)+ sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0);
        else

        periods_without_openpa = periods_without_openpa + 1;
        end
    end

i = i + Periods(big_loop,1);

big_loop = big_loop + 1;

end % end main loop
% ----------------------------------------------------
% ************* Analysis of the results **************
% ----------------------------------------------------
T_Rp = size(Rp_vw_cc,1); T_Rm = size(Rm,1);
Rm = Rm((1+T_Rm-T_Rp):T_Rm,1); % market
Rf = Rf((1+T_Rm-T_Rp):T_Rm,1); % risk-free rate
RmRf = Rm - Rf; % excess market

MktRf2 = MktRf2((1+T_Rm-T_Rp):T_Rm,1); SMB = SMB((1+T_Rm-T_Rp):T_Rm,1);
HML = HML((1+T_Rm-T_Rp):T_Rm,1); Mom = Mom((1+T_Rm-T_Rp):T_Rm,1);
LT_Rev = LT_Rev((1+T_Rm-T_Rp):T_Rm,1); CMA = CMA((1+T_Rm-T_Rp):T_Rm,1);
RMW = RMW((1+T_Rm-T_Rp):T_Rm,1);

Ret_vw = [Rp_vw_cc, Rp_vw_fi, Rm, Rf, RmRf];

T_Rp

desc2a= stat2(1+Rp_vw_cc,1,3,0); desc2b= stat2(1+Rp_vw_fi,1,3,0);
desc2= [desc2a desc2b]; desc3= stat2([1+Rm 1+Rf 1+RmRf],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

[~,t_vw_cc] = alpha_factor_model(Rp_vw_cc,ones(size(Rp_vw_cc,1),1),0,6);
[~,t_vw_fi] = alpha_factor_model(Rp_vw_fi,ones(size(Rp_vw_fi,1),1),0,6);
[~,t_bench] = alpha_factor_model(RmRf,ones(size(RmRf,1),1),0,6);

ff7_g = [MktRf2,SMB,HML,RMW,CMA,Mom,LT_Rev]; ff7_vw_cc_g = [Rp_vw_cc, ff7_g];

vw_ff7_g = ff7_vw_cc_g(:,2:8);

[beta_vw_cc_ff7_g,se_vw_cc_ff7_g,t_vw_cc_ff7_g] = beta_factor_model(Rp_vw_cc,vw_ff7_g,6);
[beta_vw_fi_ff7_g,se_vw_fi_ff7_g,t_vw_fi_ff7_g] = beta_factor_model(Rp_vw_fi,vw_ff7_g,6);

fit_vw_ccff7g = fitlm(vw_ff7_g,Rp_vw_cc); fit_vw_fiff7g = fitlm(vw_ff7_g,Rp_vw_fi);

ff7g_vw_cc = [beta_vw_cc_ff7_g(1).*100,t_vw_cc_ff7_g(1),beta_vw_cc_ff7_g(2).*100,t_vw_cc_ff7_g(2),...
             beta_vw_cc_ff7_g(3).*100,t_vw_cc_ff7_g(3),beta_vw_cc_ff7_g(4).*100,t_vw_cc_ff7_g(4),...
             beta_vw_cc_ff7_g(5).*100,t_vw_cc_ff7_g(5),beta_vw_cc_ff7_g(6).*100,t_vw_cc_ff7_g(6),...
             beta_vw_cc_ff7_g(7).*100,t_vw_cc_ff7_g(7),beta_vw_cc_ff7_g(8).*100,t_vw_cc_ff7_g(8),...
             fit_vw_ccff7g.Rsquared.Ordinary,fit_vw_ccff7g.Rsquared.Adjusted];
ff7g_vw_fi = [beta_vw_fi_ff7_g(1).*100,t_vw_fi_ff7_g(1),beta_vw_fi_ff7_g(2).*100,t_vw_fi_ff7_g(2),...
             beta_vw_fi_ff7_g(3).*100,t_vw_fi_ff7_g(3),beta_vw_fi_ff7_g(4).*100,t_vw_fi_ff7_g(4),...
             beta_vw_fi_ff7_g(5).*100,t_vw_fi_ff7_g(5),beta_vw_fi_ff7_g(6).*100,t_vw_fi_ff7_g(6),...
             beta_vw_fi_ff7_g(7).*100,t_vw_fi_ff7_g(7),beta_vw_fi_ff7_g(8).*100,t_vw_fi_ff7_g(8),...
             fit_vw_fiff7g.Rsquared.Ordinary,fit_vw_fiff7g.Rsquared.Adjusted];
    
disp(' ');
VariableNames3 = {'VW_CC','VW_FI'};
RowNames3 = {'Intercept';'t_alpha';'Market';'t_beta';'SMB';'t_SMB';'HML';'t_HML';...
    'RMW';'t_RMW';'CMA';'t_CMA';'Mom';'t_Mom';'LT_Rev';'t_LT_Rev';'R2';'R2adj'};
table3 = table(ff7g_vw_cc',ff7g_vw_fi',...
         'VariableNames',VariableNames3,'RowNames',RowNames3);

     
for j=1:6172
MaxDD2_vw_cc(j)= (1+Rp_vw_cc(j,:))*(1+Rp_vw_cc(j+1,:));
MaxDD2_vw_fi(j)= (1+Rp_vw_fi(j,:))*(1+Rp_vw_fi(j+1,:));
MaxDD2_Rm_Rf(j)= (1+RmRf(j,:))*(1+RmRf(j+1,:));
end

MDD2_vw_cc= min(MaxDD2_vw_cc); MDD2_vw_fi= min(MaxDD2_vw_fi);
MDD2_Rm_Rf= min(MaxDD2_Rm_Rf);

[c1_mixcopG2,c2_mixcopG2]= min(MaxDD2_vw_cc);
[c1f2,c2f2]= min(MaxDD2_vw_fi);
[c1r2,c2r2]= min(MaxDD2_Rm_Rf);

for i=1:6047
    MaxDD_vw_cc(i,:)= cumprod(1+Rp_vw_cc(i:i+126-1,:));
    MaxDD_vw_fi(i,:)= cumprod(1+Rp_vw_fi(i:i+126-1,:));
    MaxDD_Rm_Rf(i,:)= cumprod(1+RmRf(i:i+126-1,:));
end

[c1_mixcopG,c2_mixcopG]= min(min(MaxDD_vw_cc));
[c1f,c2f]= min(min(MaxDD_vw_fi));
[c1r,c2r]= min(min(MaxDD_Rm_Rf));

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc,0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi,0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf,0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
     t_vw_cc,100*(sum([Rp_vw_cc]<0)/size(Rp_vw_cc,1)), 100*(1-MDD2_vw_cc),...
     100*(1-min(min(MaxDD_vw_cc))), desc2(2,1), desc2(3,1), desc2(4,1),...
     min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
     t_vw_fi,100*(sum(Rp_vw_fi<0)/size(Rp_vw_fi,1)),100*(1-MDD2_vw_fi),...
     100*(1-min(min(MaxDD_vw_fi))), desc2(2,2), desc2(3,2), desc2(4,2),...
     min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
     t_bench,100*(sum(RmRf<0)/size(RmRf,1)),100*(1-MDD2_Rm_Rf),...
     100*(1-min(min(MaxDD_Rm_Rf))), desc3(2,3), desc3(3,3), desc3(4,3),...
     min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames1 = {'VW_CC','VW_FI','Benchmark'};
RowNames1 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';'t-statistic';...
    'Share of negative excess returns';'MDD1';'MDD2'; 'Std Dev'; 'Skewness';...
    'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table1 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames1,'RowNames',RowNames1);

no_pairs_open = sum(sum(no_pairs_opened)'); x = sum(abs(Av_price_dev(:,1:no_pairs)) > 0);
days_open = days_open(1:no_pairs_open,1);

VariableNames2 = {'Trading_Statistics'};
RowNames2 = {'Av_Price_Dev_trigger_openpa';'Total_number_of_pairs_opened';...
    'Average_number_of_pairs_opened_per_six-month_period'; ...
    'Average_number_of_round-trip_trades_per_pair_in_months'; 'Standard_Dev';'Average_time_pairs_are_open_in_days';...
    'Standard_Deviation';'Median_time_pairs_are_open_in_days'};

trading_stat=[sum(sum(abs(Av_price_dev(:,1:no_pairs)))')./sum((sum(abs(Av_price_dev(:,1:no_pairs)) >.0))'),...
    no_pairs_open,no_pairs_open/(big_loop-1),...
    mean(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),...
    std(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),mean(days_open),std(days_open),median(days_open)];
table2 = table(trading_stat',...
    'VariableNames',VariableNames2,'RowNames',RowNames2);
 
writetable(table1,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table2,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table3,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',3);
    
    desc2a = stat2(1+Rp_vw_cc(1:1138,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1:1138,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1:1138,1) 1+Rf(1:1138,1) 1+RmRf(1:1138,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1:1138,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1:1138,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1:1138,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames4 = {'VW_CC','VW_FI','Benchmark'};
RowNames4 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table4 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames4,'RowNames',RowNames4);

writetable(table4,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',4);
    
desc2a = stat2(1+Rp_vw_cc(1139:2401,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1139:2401,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1139:2401,1) 1+Rf(1139:2401,1) 1+RmRf(1139:2401,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1139:2401,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1139:2401,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1139:2401,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames5 = {'VW_CC','VW_FI','Benchmark'};
RowNames5 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table5 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames5,'RowNames',RowNames5);

writetable(table5,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',5);
    
    desc2a = stat2(1+Rp_vw_cc(2402:3657,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(2402:3657,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(2402:3657,1) 1+Rf(2402:3657,1) 1+RmRf(2402:3657,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(2402:3657,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(2402:3657,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(2402:3657,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames6 = {'VW_CC','VW_FI','Benchmark'};
RowNames6 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table6 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames6,'RowNames',RowNames6);

writetable(table6,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',6);
    
    desc2a = stat2(1+Rp_vw_cc(3657:4916,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(3657:4916,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(3657:4916,1) 1+Rf(3657:4916,1) 1+RmRf(3657:4916,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(3657:4916,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(3657:4916,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(3657:4916,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames7 = {'VW_CC','VW_FI','Benchmark'};
RowNames7 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table7 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames7,'RowNames',RowNames7);

writetable(table7,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',7);
    
    desc2a = stat2(1+Rp_vw_cc(4917:6173,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(4917:6173,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(4917:6173,1) 1+Rf(4917:6173,1) 1+RmRf(4917:6173,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(4917:6173,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(4917:6173,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(4917:6173,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames8 = {'VW_CC','VW_FI','Benchmark'};
RowNames8 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table8 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames8,'RowNames',RowNames8);

writetable(table8,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',8);
    
save('C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p20c2_sq2.0.mat');
    
    %% Top 35, C = 0

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
addpath('C:\Users\fsabino\Desktop\Fernando\papers')';


% ----------------------------------------------------
% Load in data
% ----------------------------------------------------
testing = 0;

load SP500_p1
% ----------------------------------------------------
% Set default values
% ----------------------------------------------------

[T,N]= size(Rt); % T = number of periods (days)
% N = number of assets in the whole period
daylag = 0;    % set whether (1, default) or not (0) signals take one day to go into effect (cf. Table 1A vs. 1B)
wi_update = 1; % set whether (1, default) or not (0) intra-pair weights are updated when pair is open; 
               % if not: weights stay at 50-50%
Years = 2015 - 1990 + 0.5;
 
no_pairs = 35;
trading_cost = 0; % works just with one day lag
C = 0; % buy/sell (percentage cost for opening and closing pairs)
trade_req = 0; % set whether (0) or not (2) positive trading volume is required for opening/closing a pair
Stop_loss = -Inf ; %disp(['Stop_loss = ', num2str(Stop_loss)]);%Choose how much loss we are willing to accept on a given pair, compared to 1, i.e 0.93 = 7% stop loss
Stop_gain = Inf;  %disp(['Stop_loss = ', num2str(Stop_gain)]); %Choose how much gain we are willing to accept on a given pair, compared to 1, i.e 1.10 = 10% stop gain
s1218 = 1; % listing req. (look ahead): 12+6 months (=1)

% ----------------------------------------------------
% Reset several variables used for desc statistics
% ----------------------------------------------------
Av_price_dev = zeros(T-sum(Periods(1:2,1)),no_pairs*2); % 12 months are w/o price deviations
% The first 12 months are formation period
Rpair = zeros(sum(Periods(end-1,4)),no_pairs); % Keeps track of the return of each pair

MDDpairs = zeros(length(Periods)-1,no_pairs); % Pre allocate MDD matrix for each pair out of sample;
MDDw = zeros(length(Periods)-1,5); %- Preallocate MDD matrix out of sample for 4 weighting schemes + Rm + (Rm-Rf).
STNpairs = zeros(length(Periods)-2,no_pairs);
STNw = zeros(length(Periods)-2,5);

periods_with_open_pair = 0; % number of periods with pairs opened
periods_without_openpa = 0; % number of periods without pairs opened
pairs_number = 0; pair_open = 0; %
days_open = zeros(no_pairs*10000,1); % measures number of days each pair open; bad programming, but we do not know how many pairs we get
no_pairs_opened = zeros(Years*2-2,no_pairs); % measures number of times pairs opened in each pair per 6 month period

counter = 1; % Keeps track of the days in the main loop
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
listed2 = IPt(Twe_mo+Six_mo*(s1218==1),:)>0; % listed at the end: 12/18 months from now (1xN vector of 0/1s)
listed = listed1 .* listed2; % listed throughout the 12+6 month period (1xN vector of 0/1s)

no_listed = sum(listed);
index_listed = find(listed>0); % find columns that should be included

% [D,ia,ib]=intersect(ticker2(:,big_loop),ticker2(:,big_loop+1));
% [ic,id]= ismember(D,ticker2(:,big_loop+2));
% [ie,ig]= ismember(D(ic),tickerb);
% index_listed2= intersect(index_listed,ig');
% no_listed2 = size(index_listed2,2);

[D,ia,ib]=union(ticker2(:,big_loop),ticker2(:,big_loop+1));
[ic,id]= ismember(D,ticker2(:,big_loop+2));
[ie,ig]= ismember(D(ic),tickerb);
index_listed2= ig';
no_listed2 = sum(ie);


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
% ----------------------------------------------------
% Calc SSEs
% ----------------------------------------------------

SSE = zeros(no_listed2,no_listed2);
    for j=1:(no_listed2-1) % calculate SSE for all pairs
        for k=(j+1):no_listed2 % can prob. be speeded up by better programming
            % SSE(index_listed2(j),index_listed2(k)) = sum(abs( IPt(1:Twe_mo,index_listed2(j))- IPt(1:Twe_mo,index_listed2(k)) ));
           SSE(index_listed2(j),index_listed2(k)) = sum(( IPt(1:Twe_mo,index_listed2(j))-...
                IPt(1:Twe_mo,index_listed2(k)) ).^2);
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

% ----------------------------------------------------
% Calculate returns during the 6 month period
% ----------------------------------------------------
count_temp = counter;

for p=1:no_pairs
    counter = count_temp; pairs_opened = 0; new_pairs_opened = 0; lag = 0;
    std_limit = std(IPt(1:Twe_mo,min_SSE_ro(p))-IPt(1:+Twe_mo,min_SSE_co(p)));
% Fixed volatility estimated in the 12 months period. Doing the calculation one pair at a time 
Rcum = zeros(Twe_mo,1); counter_ret = 1; Rcum_ret = 1; % Presets all variables for each pair
        
for j=(i+Twe_mo):(i+Twe_mo+Six_mo-1) % portfolio period
% Defining the period as from the first day of the twe_month to the 
% last day of the twe_month

if daylag == 0 % w/o one day delay
        if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
                              % If a sign to open has been given, then calcule the returns
           Rpair(counter,p) = +Rt(j,min_SSE_ro(p)) .* wi(1)- Rt(j,min_SSE_co(p)) .* wi(2);
           % Rpair is the return of each pair.
           Rcum(counter_ret,1) = Rpair(counter,p); 
           counter_ret = counter_ret + 1;
           Rcum_ret = cumprod(1+Rcum);  
           lag = lag + 1; %used for paying tc    

		if wi_update == 1 % The weight of each asset in the pair is updated. 
                        wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                        wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
               Rpair(counter,p) = -Rt(j,min_SSE_ro(p)) .* wi(1) + Rt(j,min_SSE_co(p)) .* wi(2);
               Rcum(counter_ret,1) = Rpair(counter,p); 
               counter_ret = counter_ret + 1;
               Rcum_ret = cumprod(1+Rcum);
               lag = lag + 1;
                
		if wi_update == 1
                   wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                   wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        else
               Rpair(counter,p) = 0; % closed (this code not necessary)
        end
            
            if ((pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <= 0)...
               || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain) ...
 	           || (pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0))...
               && ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)...

                pairs_opened = 0; % close pairs: prices cross
		        lag = 0; % when pair is closed reset lag (it serves for paying tc)
                Av_price_dev(counter,no_pairs+p) = 1; % add a marker for closing; 
                                                      % used to calc length of the "open-period"
                Rpair(counter,p) = Rpair(counter,p) - C; %Includes trading cost in the last day of trading, due to closing position                                      
            elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
            if pairs_opened == 0 % record dev (and time) at open
                Rcum = zeros(Six_mo,1);
		        counter_ret = 1;
                Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
                                          /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
            end
            
            pairs_opened = 1; % open pairs
	        lag = lag + 1;  %- Lag was 0. On the next loop C will be paid
            wi = ones(1,2);
            
            elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)

        if pairs_opened == 0 % record dev (and time) at open
	       Rcum = zeros(Six_mo,1);
           counter_ret = 1;
           Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))...
                                    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
        end
        
        pairs_opened = -1; % open pairs
 	    lag = lag + 1;
        wi = ones(1,2);
            
         end
            
        counter = counter + 1; % This is done for the first day, now update 
                               % counter so it is done for the 2nd day        
        elseif daylag == 1 % w/one day delay
            
if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
    Rpair(counter,p) = (+Rt(j,min_SSE_ro(p)) * wi(1) - Rt(j,min_SSE_co(p))* wi(2)) - (lag==2)*trading_cost;
    Rcum (counter_ret,1) = Rpair(counter,p); 
    counter_ret = counter_ret + 1;
    Rcum_ret = cumprod(1+Rcum);
if wi_update == 1
    wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
    wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
end

elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
        Rpair(counter,p) = (-Rt(j,min_SSE_ro(p)) * wi(1)+ Rt(j,min_SSE_co(p)) * wi(2)) - (lag==2)*trading_cost;
    	Rcum (counter_ret,1) = Rpair(counter,p); 
        counter_ret = counter_ret + 1;
        Rcum_ret = cumprod(1+Rcum);
        if wi_update == 1
            wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
            wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
else
    Rpair(counter,p) = 0; % closed (this code not necessary)
end

    pairs_opened = new_pairs_opened;

if (pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <=  0 ...
   || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain)...   
   || pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0)...
   &&((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
    
    new_pairs_opened = 0; % close prices: prices cross
    % If the pairs are open and the spread is smaller than the
    % threshold, close the position 
    lag = 0;
    Av_price_dev(counter+1,no_pairs+p) = 1; % see above, marker

    if wi_update == 1
        Rpair(counter,p) = Rpair(counter,p) - trading_cost - C;
    end
    
elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = 1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 1st, long 2nd) 
        lag = lag + 1;
        if  pairs_opened == 0
            Rcum = zeros(Six_mo,1);
            counter_ret = 1;
        end         
        
elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = -1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 2nd, long 1st)       
        lag = lag + 1;
        if pairs_opened == 0 % - If the pair was closed, reset accumulated return matrix and counter
           Rcum = zeros(Six_mo,1);
           counter_ret = 1;
        end
end

if new_pairs_opened == +1 && lag == 1
    Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);

elseif new_pairs_opened == -1 && lag == 1
    
Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))/(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);
end
    counter = counter + 1;
end % endif of one day lag (0/1)
end % end for pairs-period days (j)

% if a pair open at the end, add a sign that closed
% otherwise no additional steps necessary, as closing just gets last day's return

if pairs_opened ~= 0
    Rpair(counter-1,p) = Rpair(counter-1,p) - trading_cost - C; %Includes trading cost in the last day of trading, due to closing position
    Av_price_dev(counter-1,no_pairs+p) = 1;
end

end % end for portfolio (p)
%% Using 2 Weighting Schemes - Fully Invested and Committed Capital
% ------------------------------------------------------------
% Calculate portfolio returns (ew, vw) out of percentage Rpair
% ------------------------------------------------------------
Rpair_temp = Rpair(counter-Six_mo:counter-1,:);
%
% eq-weighted average on committed cap.; weights reset to "one" (or any equal weight) after each day
%
Ret_acum_pairs(counter-Six_mo:counter-1,:) = (cumprod(1+(Rpair_temp)));
[MaxDD,~] = maxdrawdown(ret2tick(Rpair_temp));
MDDpairs(big_loop,:)= MaxDD;  
STN = sortinoratio(Rpair_temp,0);
STNpairs(big_loop,:) = STN;

%
wi = ones(1,no_pairs);
wi = [wi;cumprod(1+Rpair_temp)];
wi = wi(1:Six_mo,:);
%
% vw-weighted, committed cap.; weights "restart" every 6 month period; 
% (each portfolio gets 1 dollar at the beginning)
Rp_vw_cc(counter-Six_mo:counter-1,:) = (sum((wi .* Rpair_temp)'))' ./ sum(wi')';
%
% vw-weighted, fully invested; weights "restart" from 1 every time a new pair is opened;
% Capital divided between open portfolios.
Ret_acum(counter-Six_mo:counter-1,2) = (cumprod(1+(Rp_vw_cc(counter-Six_mo:counter-1,:))));
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_cc(counter-Six_mo:counter-1,:)));
MDDw(big_loop,2) = MaxDD;
STN = sortinoratio(Rp_vw_cc(counter-Six_mo:counter-1,:),0);
STNw(big_loop,2) = STN;
%
pa_open = zeros(Six_mo,no_pairs); % indicator for days when pairs open

    for i2=1:no_pairs
        pa_opened_temp = 0;temp_lag = 0;
    for i1=1:Six_mo
        if  pa_opened_temp == 1 && daylag == 0 % opening period not included, closing included
            pa_open(i1,i2) = 1;
            days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end
        if   pa_opened_temp == 1 && daylag == 1 && temp_lag == 1
             pa_open(i1,i2) = 1;
             days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end

        if  pa_opened_temp == 1 && daylag == 1 && temp_lag == 0
            temp_lag = 1;
        end

        if  Av_price_dev(counter-1-Six_mo+i1,i2) ~= 0
            pa_opened_temp = 1;
            pairs_number = pairs_number + 1;
        end

         if  Av_price_dev(counter-1-Six_mo+i1,no_pairs+i2) ~= 0
             pa_opened_temp = 0;
             temp_lag = 0;
         end
    end
    end

wi2 = wi .* pa_open;

for i2=1:Six_mo % takes care in a situation where no pairs are open
    if  sum(pa_open(i2,:)') == 0
        wi2(i2,1:no_pairs) = 0.2 * ones(1,no_pairs);
        pa_open(i2,1:no_pairs) = ones(1,no_pairs);
    end
end

Rp_vw_fi(counter-Six_mo:counter-1,:) = (sum((wi2 .* Rpair_temp)'))' ./ sum(wi2')';

Ret_acum(counter-Six_mo:counter-1,3) = (cumprod(1+(Rp_vw_fi(counter-Six_mo:counter-1,:))));
%
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_fi(counter-Six_mo:counter-1,:)));
MDDw(big_loop,4) = MaxDD;
STN = sortinoratio(Rp_vw_fi(counter-Six_mo:counter-1,:),0);
STNw(big_loop,4) = STN;
%
%
RmRf(counter-Six_mo:counter-1,:) = Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:);
Ret_acum(i:i+Six_mo-1,6) = (cumprod(1+(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:))));
[MDD,MDDIndex] = maxdrawdown(ret2tick(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:)));
MDDw(big_loop,5) = MaxDD;
STN = sortinoratio(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:),0);
STNw(big_loop,5) = STN;

    for i2=1:no_pairs
        if  sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0) ~= 0
            periods_with_open_pair = periods_with_open_pair + 1;
            no_pairs_opened(big_loop,i2) = no_pairs_opened(big_loop,p)+ sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0);
        else

        periods_without_openpa = periods_without_openpa + 1;
        end
    end

i = i + Periods(big_loop,1);

big_loop = big_loop + 1;

end % end main loop
% ----------------------------------------------------
% ************* Analysis of the results **************
% ----------------------------------------------------
T_Rp = size(Rp_vw_cc,1); T_Rm = size(Rm,1);
Rm = Rm((1+T_Rm-T_Rp):T_Rm,1); % market
Rf = Rf((1+T_Rm-T_Rp):T_Rm,1); % risk-free rate
RmRf = Rm - Rf; % excess market

MktRf2 = MktRf2((1+T_Rm-T_Rp):T_Rm,1); SMB = SMB((1+T_Rm-T_Rp):T_Rm,1);
HML = HML((1+T_Rm-T_Rp):T_Rm,1); Mom = Mom((1+T_Rm-T_Rp):T_Rm,1);
LT_Rev = LT_Rev((1+T_Rm-T_Rp):T_Rm,1); CMA = CMA((1+T_Rm-T_Rp):T_Rm,1);
RMW = RMW((1+T_Rm-T_Rp):T_Rm,1);

Ret_vw = [Rp_vw_cc, Rp_vw_fi, Rm, Rf, RmRf];

T_Rp

desc2a= stat2(1+Rp_vw_cc,1,3,0); desc2b= stat2(1+Rp_vw_fi,1,3,0);
desc2= [desc2a desc2b]; desc3= stat2([1+Rm 1+Rf 1+RmRf],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

[~,t_vw_cc] = alpha_factor_model(Rp_vw_cc,ones(size(Rp_vw_cc,1),1),0,6);
[~,t_vw_fi] = alpha_factor_model(Rp_vw_fi,ones(size(Rp_vw_fi,1),1),0,6);
[~,t_bench] = alpha_factor_model(RmRf,ones(size(RmRf,1),1),0,6);

ff7_g = [MktRf2,SMB,HML,RMW,CMA,Mom,LT_Rev]; ff7_vw_cc_g = [Rp_vw_cc, ff7_g];

vw_ff7_g = ff7_vw_cc_g(:,2:8);

[beta_vw_cc_ff7_g,se_vw_cc_ff7_g,t_vw_cc_ff7_g] = beta_factor_model(Rp_vw_cc,vw_ff7_g,6);
[beta_vw_fi_ff7_g,se_vw_fi_ff7_g,t_vw_fi_ff7_g] = beta_factor_model(Rp_vw_fi,vw_ff7_g,6);

fit_vw_ccff7g = fitlm(vw_ff7_g,Rp_vw_cc); fit_vw_fiff7g = fitlm(vw_ff7_g,Rp_vw_fi);

ff7g_vw_cc = [beta_vw_cc_ff7_g(1).*100,t_vw_cc_ff7_g(1),beta_vw_cc_ff7_g(2).*100,t_vw_cc_ff7_g(2),...
             beta_vw_cc_ff7_g(3).*100,t_vw_cc_ff7_g(3),beta_vw_cc_ff7_g(4).*100,t_vw_cc_ff7_g(4),...
             beta_vw_cc_ff7_g(5).*100,t_vw_cc_ff7_g(5),beta_vw_cc_ff7_g(6).*100,t_vw_cc_ff7_g(6),...
             beta_vw_cc_ff7_g(7).*100,t_vw_cc_ff7_g(7),beta_vw_cc_ff7_g(8).*100,t_vw_cc_ff7_g(8),...
             fit_vw_ccff7g.Rsquared.Ordinary,fit_vw_ccff7g.Rsquared.Adjusted];
ff7g_vw_fi = [beta_vw_fi_ff7_g(1).*100,t_vw_fi_ff7_g(1),beta_vw_fi_ff7_g(2).*100,t_vw_fi_ff7_g(2),...
             beta_vw_fi_ff7_g(3).*100,t_vw_fi_ff7_g(3),beta_vw_fi_ff7_g(4).*100,t_vw_fi_ff7_g(4),...
             beta_vw_fi_ff7_g(5).*100,t_vw_fi_ff7_g(5),beta_vw_fi_ff7_g(6).*100,t_vw_fi_ff7_g(6),...
             beta_vw_fi_ff7_g(7).*100,t_vw_fi_ff7_g(7),beta_vw_fi_ff7_g(8).*100,t_vw_fi_ff7_g(8),...
             fit_vw_fiff7g.Rsquared.Ordinary,fit_vw_fiff7g.Rsquared.Adjusted];
    
disp(' ');
VariableNames3 = {'VW_CC','VW_FI'};
RowNames3 = {'Intercept';'t_alpha';'Market';'t_beta';'SMB';'t_SMB';'HML';'t_HML';...
    'RMW';'t_RMW';'CMA';'t_CMA';'Mom';'t_Mom';'LT_Rev';'t_LT_Rev';'R2';'R2adj'};
table3 = table(ff7g_vw_cc',ff7g_vw_fi',...
         'VariableNames',VariableNames3,'RowNames',RowNames3);

     
for j=1:6172
MaxDD2_vw_cc(j)= (1+Rp_vw_cc(j,:))*(1+Rp_vw_cc(j+1,:));
MaxDD2_vw_fi(j)= (1+Rp_vw_fi(j,:))*(1+Rp_vw_fi(j+1,:));
MaxDD2_Rm_Rf(j)= (1+RmRf(j,:))*(1+RmRf(j+1,:));
end

MDD2_vw_cc= min(MaxDD2_vw_cc); MDD2_vw_fi= min(MaxDD2_vw_fi);
MDD2_Rm_Rf= min(MaxDD2_Rm_Rf);

[c1_mixcopG2,c2_mixcopG2]= min(MaxDD2_vw_cc);
[c1f2,c2f2]= min(MaxDD2_vw_fi);
[c1r2,c2r2]= min(MaxDD2_Rm_Rf);

for i=1:6047
    MaxDD_vw_cc(i,:)= cumprod(1+Rp_vw_cc(i:i+126-1,:));
    MaxDD_vw_fi(i,:)= cumprod(1+Rp_vw_fi(i:i+126-1,:));
    MaxDD_Rm_Rf(i,:)= cumprod(1+RmRf(i:i+126-1,:));
end

[c1_mixcopG,c2_mixcopG]= min(min(MaxDD_vw_cc));
[c1f,c2f]= min(min(MaxDD_vw_fi));
[c1r,c2r]= min(min(MaxDD_Rm_Rf));

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc,0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi,0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf,0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
     t_vw_cc,100*(sum([Rp_vw_cc]<0)/size(Rp_vw_cc,1)), 100*(1-MDD2_vw_cc),...
     100*(1-min(min(MaxDD_vw_cc))), desc2(2,1), desc2(3,1), desc2(4,1),...
     min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
     t_vw_fi,100*(sum(Rp_vw_fi<0)/size(Rp_vw_fi,1)),100*(1-MDD2_vw_fi),...
     100*(1-min(min(MaxDD_vw_fi))), desc2(2,2), desc2(3,2), desc2(4,2),...
     min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
     t_bench,100*(sum(RmRf<0)/size(RmRf,1)),100*(1-MDD2_Rm_Rf),...
     100*(1-min(min(MaxDD_Rm_Rf))), desc3(2,3), desc3(3,3), desc3(4,3),...
     min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames1 = {'VW_CC','VW_FI','Benchmark'};
RowNames1 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';'t-statistic';...
    'Share of negative excess returns';'MDD1';'MDD2'; 'Std Dev'; 'Skewness';...
    'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table1 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames1,'RowNames',RowNames1);

no_pairs_open = sum(sum(no_pairs_opened)'); x = sum(abs(Av_price_dev(:,1:no_pairs)) > 0);
days_open = days_open(1:no_pairs_open,1);

VariableNames2 = {'Trading_Statistics'};
RowNames2 = {'Av_Price_Dev_trigger_openpa';'Total_number_of_pairs_opened';...
    'Average_number_of_pairs_opened_per_six-month_period'; ...
    'Average_number_of_round-trip_trades_per_pair_in_months'; 'Standard_Dev';'Average_time_pairs_are_open_in_days';...
    'Standard_Deviation';'Median_time_pairs_are_open_in_days'};

trading_stat=[sum(sum(abs(Av_price_dev(:,1:no_pairs)))')./sum((sum(abs(Av_price_dev(:,1:no_pairs)) >.0))'),...
    no_pairs_open,no_pairs_open/(big_loop-1),...
    mean(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),...
    std(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),mean(days_open),std(days_open),median(days_open)];
table2 = table(trading_stat',...
    'VariableNames',VariableNames2,'RowNames',RowNames2);
 
writetable(table1,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table2,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table3,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',3);
    
    desc2a = stat2(1+Rp_vw_cc(1:1138,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1:1138,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1:1138,1) 1+Rf(1:1138,1) 1+RmRf(1:1138,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1:1138,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1:1138,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1:1138,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames4 = {'VW_CC','VW_FI','Benchmark'};
RowNames4 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table4 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames4,'RowNames',RowNames4);

writetable(table4,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',4);
    
desc2a = stat2(1+Rp_vw_cc(1139:2401,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1139:2401,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1139:2401,1) 1+Rf(1139:2401,1) 1+RmRf(1139:2401,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1139:2401,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1139:2401,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1139:2401,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames5 = {'VW_CC','VW_FI','Benchmark'};
RowNames5 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table5 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames5,'RowNames',RowNames5);

writetable(table5,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',5);
    
    desc2a = stat2(1+Rp_vw_cc(2402:3657,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(2402:3657,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(2402:3657,1) 1+Rf(2402:3657,1) 1+RmRf(2402:3657,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(2402:3657,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(2402:3657,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(2402:3657,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames6 = {'VW_CC','VW_FI','Benchmark'};
RowNames6 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table6 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames6,'RowNames',RowNames6);

writetable(table6,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',6);
    
    desc2a = stat2(1+Rp_vw_cc(3657:4916,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(3657:4916,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(3657:4916,1) 1+Rf(3657:4916,1) 1+RmRf(3657:4916,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(3657:4916,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(3657:4916,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(3657:4916,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames7 = {'VW_CC','VW_FI','Benchmark'};
RowNames7 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table7 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames7,'RowNames',RowNames7);

writetable(table7,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',7);
    
    desc2a = stat2(1+Rp_vw_cc(4917:6173,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(4917:6173,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(4917:6173,1) 1+Rf(4917:6173,1) 1+RmRf(4917:6173,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(4917:6173,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(4917:6173,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(4917:6173,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames8 = {'VW_CC','VW_FI','Benchmark'};
RowNames8 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table8 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames8,'RowNames',RowNames8);

writetable(table8,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c0_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',8);
    
save('C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c0_sq2.0.mat');
    
    %% Top 35, C = 0.001
    
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
addpath('C:\Users\fsabino\Desktop\Fernando\papers')';


% ----------------------------------------------------
% Load in data
% ----------------------------------------------------
testing = 0;

load SP500_p1
% ----------------------------------------------------
% Set default values
% ----------------------------------------------------

[T,N]= size(Rt); % T = number of periods (days)
% N = number of assets in the whole period
daylag = 0;    % set whether (1, default) or not (0) signals take one day to go into effect (cf. Table 1A vs. 1B)
wi_update = 1; % set whether (1, default) or not (0) intra-pair weights are updated when pair is open; 
               % if not: weights stay at 50-50%
Years = 2015 - 1990 + 0.5;
 
no_pairs = 35;
trading_cost = 0; % works just with one day lag
C = 0.001; % buy/sell (percentage cost for opening and closing pairs)
trade_req = 0; % set whether (0) or not (2) positive trading volume is required for opening/closing a pair
Stop_loss = -Inf ; %disp(['Stop_loss = ', num2str(Stop_loss)]);%Choose how much loss we are willing to accept on a given pair, compared to 1, i.e 0.93 = 7% stop loss
Stop_gain = Inf;  %disp(['Stop_loss = ', num2str(Stop_gain)]); %Choose how much gain we are willing to accept on a given pair, compared to 1, i.e 1.10 = 10% stop gain
s1218 = 1; % listing req. (look ahead): 12+6 months (=1)

% ----------------------------------------------------
% Reset several variables used for desc statistics
% ----------------------------------------------------
Av_price_dev = zeros(T-sum(Periods(1:2,1)),no_pairs*2); % 12 months are w/o price deviations
% The first 12 months are formation period
Rpair = zeros(sum(Periods(end-1,4)),no_pairs); % Keeps track of the return of each pair

MDDpairs = zeros(length(Periods)-1,no_pairs); % Pre allocate MDD matrix for each pair out of sample;
MDDw = zeros(length(Periods)-1,5); %- Preallocate MDD matrix out of sample for 4 weighting schemes + Rm + (Rm-Rf).
STNpairs = zeros(length(Periods)-2,no_pairs);
STNw = zeros(length(Periods)-2,5);

periods_with_open_pair = 0; % number of periods with pairs opened
periods_without_openpa = 0; % number of periods without pairs opened
pairs_number = 0; pair_open = 0; %
days_open = zeros(no_pairs*10000,1); % measures number of days each pair open; bad programming, but we do not know how many pairs we get
no_pairs_opened = zeros(Years*2-2,no_pairs); % measures number of times pairs opened in each pair per 6 month period

counter = 1; % Keeps track of the days in the main loop
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
listed2 = IPt(Twe_mo+Six_mo*(s1218==1),:)>0; % listed at the end: 12/18 months from now (1xN vector of 0/1s)
listed = listed1 .* listed2; % listed throughout the 12+6 month period (1xN vector of 0/1s)

no_listed = sum(listed);
index_listed = find(listed>0); % find columns that should be included

% [D,ia,ib]=intersect(ticker2(:,big_loop),ticker2(:,big_loop+1));
% [ic,id]= ismember(D,ticker2(:,big_loop+2));
% [ie,ig]= ismember(D(ic),tickerb);
% index_listed2= intersect(index_listed,ig');
% no_listed2 = size(index_listed2,2);

[D,ia,ib]=union(ticker2(:,big_loop),ticker2(:,big_loop+1));
[ic,id]= ismember(D,ticker2(:,big_loop+2));
[ie,ig]= ismember(D(ic),tickerb);
index_listed2= ig';
no_listed2 = sum(ie);


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
% ----------------------------------------------------
% Calc SSEs
% ----------------------------------------------------

SSE = zeros(no_listed2,no_listed2);
    for j=1:(no_listed2-1) % calculate SSE for all pairs
        for k=(j+1):no_listed2 % can prob. be speeded up by better programming
            % SSE(index_listed2(j),index_listed2(k)) = sum(abs( IPt(1:Twe_mo,index_listed2(j))- IPt(1:Twe_mo,index_listed2(k)) ));
           SSE(index_listed2(j),index_listed2(k)) = sum(( IPt(1:Twe_mo,index_listed2(j))-...
                IPt(1:Twe_mo,index_listed2(k)) ).^2);
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

% ----------------------------------------------------
% Calculate returns during the 6 month period
% ----------------------------------------------------
count_temp = counter;

for p=1:no_pairs
    counter = count_temp; pairs_opened = 0; new_pairs_opened = 0; lag = 0;
    std_limit = std(IPt(1:Twe_mo,min_SSE_ro(p))-IPt(1:+Twe_mo,min_SSE_co(p)));
% Fixed volatility estimated in the 12 months period. Doing the calculation one pair at a time 
Rcum = zeros(Twe_mo,1); counter_ret = 1; Rcum_ret = 1; % Presets all variables for each pair
        
for j=(i+Twe_mo):(i+Twe_mo+Six_mo-1) % portfolio period
% Defining the period as from the first day of the twe_month to the 
% last day of the twe_month

if daylag == 0 % w/o one day delay
        if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
                              % If a sign to open has been given, then calcule the returns
           Rpair(counter,p) = +Rt(j,min_SSE_ro(p)) .* wi(1)- Rt(j,min_SSE_co(p)) .* wi(2);
           % Rpair is the return of each pair.
           Rcum(counter_ret,1) = Rpair(counter,p); 
           counter_ret = counter_ret + 1;
           Rcum_ret = cumprod(1+Rcum);  
           lag = lag + 1; %used for paying tc    

		if wi_update == 1 % The weight of each asset in the pair is updated. 
                        wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                        wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
               Rpair(counter,p) = -Rt(j,min_SSE_ro(p)) .* wi(1) + Rt(j,min_SSE_co(p)) .* wi(2);
               Rcum(counter_ret,1) = Rpair(counter,p); 
               counter_ret = counter_ret + 1;
               Rcum_ret = cumprod(1+Rcum);
               lag = lag + 1;
                
		if wi_update == 1
                   wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                   wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        else
               Rpair(counter,p) = 0; % closed (this code not necessary)
        end
            
            if ((pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <= 0)...
               || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain) ...
 	           || (pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0))...
               && ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)...

                pairs_opened = 0; % close pairs: prices cross
		        lag = 0; % when pair is closed reset lag (it serves for paying tc)
                Av_price_dev(counter,no_pairs+p) = 1; % add a marker for closing; 
                                                      % used to calc length of the "open-period"
                Rpair(counter,p) = Rpair(counter,p) - C; %Includes trading cost in the last day of trading, due to closing position                                      
            elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
            if pairs_opened == 0 % record dev (and time) at open
                Rcum = zeros(Six_mo,1);
		        counter_ret = 1;
                Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
                                          /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
            end
            
            pairs_opened = 1; % open pairs
	        lag = lag + 1;  %- Lag was 0. On the next loop C will be paid
            wi = ones(1,2);
            
            elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)

        if pairs_opened == 0 % record dev (and time) at open
	       Rcum = zeros(Six_mo,1);
           counter_ret = 1;
           Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))...
                                    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
        end
        
        pairs_opened = -1; % open pairs
 	    lag = lag + 1;
        wi = ones(1,2);
            
         end
            
        counter = counter + 1; % This is done for the first day, now update 
                               % counter so it is done for the 2nd day        
        elseif daylag == 1 % w/one day delay
            
if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
    Rpair(counter,p) = (+Rt(j,min_SSE_ro(p)) * wi(1) - Rt(j,min_SSE_co(p))* wi(2)) - (lag==2)*trading_cost;
    Rcum (counter_ret,1) = Rpair(counter,p); 
    counter_ret = counter_ret + 1;
    Rcum_ret = cumprod(1+Rcum);
if wi_update == 1
    wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
    wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
end

elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
        Rpair(counter,p) = (-Rt(j,min_SSE_ro(p)) * wi(1)+ Rt(j,min_SSE_co(p)) * wi(2)) - (lag==2)*trading_cost;
    	Rcum (counter_ret,1) = Rpair(counter,p); 
        counter_ret = counter_ret + 1;
        Rcum_ret = cumprod(1+Rcum);
        if wi_update == 1
            wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
            wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
else
    Rpair(counter,p) = 0; % closed (this code not necessary)
end

    pairs_opened = new_pairs_opened;

if (pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <=  0 ...
   || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain)...   
   || pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0)...
   &&((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
    
    new_pairs_opened = 0; % close prices: prices cross
    % If the pairs are open and the spread is smaller than the
    % threshold, close the position 
    lag = 0;
    Av_price_dev(counter+1,no_pairs+p) = 1; % see above, marker

    if wi_update == 1
        Rpair(counter,p) = Rpair(counter,p) - trading_cost - C;
    end
    
elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = 1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 1st, long 2nd) 
        lag = lag + 1;
        if  pairs_opened == 0
            Rcum = zeros(Six_mo,1);
            counter_ret = 1;
        end         
        
elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = -1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 2nd, long 1st)       
        lag = lag + 1;
        if pairs_opened == 0 % - If the pair was closed, reset accumulated return matrix and counter
           Rcum = zeros(Six_mo,1);
           counter_ret = 1;
        end
end

if new_pairs_opened == +1 && lag == 1
    Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);

elseif new_pairs_opened == -1 && lag == 1
    
Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))/(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);
end
    counter = counter + 1;
end % endif of one day lag (0/1)
end % end for pairs-period days (j)

% if a pair open at the end, add a sign that closed
% otherwise no additional steps necessary, as closing just gets last day's return

if pairs_opened ~= 0
    Rpair(counter-1,p) = Rpair(counter-1,p) - trading_cost - C; %Includes trading cost in the last day of trading, due to closing position
    Av_price_dev(counter-1,no_pairs+p) = 1;
end

end % end for portfolio (p)
%% Using 2 Weighting Schemes - Fully Invested and Committed Capital
% ------------------------------------------------------------
% Calculate portfolio returns (ew, vw) out of percentage Rpair
% ------------------------------------------------------------
Rpair_temp = Rpair(counter-Six_mo:counter-1,:);
%
% eq-weighted average on committed cap.; weights reset to "one" (or any equal weight) after each day
%
Ret_acum_pairs(counter-Six_mo:counter-1,:) = (cumprod(1+(Rpair_temp)));
[MaxDD,~] = maxdrawdown(ret2tick(Rpair_temp));
MDDpairs(big_loop,:)= MaxDD;  
STN = sortinoratio(Rpair_temp,0);
STNpairs(big_loop,:) = STN;

%
wi = ones(1,no_pairs);
wi = [wi;cumprod(1+Rpair_temp)];
wi = wi(1:Six_mo,:);
%
% vw-weighted, committed cap.; weights "restart" every 6 month period; 
% (each portfolio gets 1 dollar at the beginning)
Rp_vw_cc(counter-Six_mo:counter-1,:) = (sum((wi .* Rpair_temp)'))' ./ sum(wi')';
%
% vw-weighted, fully invested; weights "restart" from 1 every time a new pair is opened;
% Capital divided between open portfolios.
Ret_acum(counter-Six_mo:counter-1,2) = (cumprod(1+(Rp_vw_cc(counter-Six_mo:counter-1,:))));
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_cc(counter-Six_mo:counter-1,:)));
MDDw(big_loop,2) = MaxDD;
STN = sortinoratio(Rp_vw_cc(counter-Six_mo:counter-1,:),0);
STNw(big_loop,2) = STN;
%
pa_open = zeros(Six_mo,no_pairs); % indicator for days when pairs open

    for i2=1:no_pairs
        pa_opened_temp = 0;temp_lag = 0;
    for i1=1:Six_mo
        if  pa_opened_temp == 1 && daylag == 0 % opening period not included, closing included
            pa_open(i1,i2) = 1;
            days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end
        if   pa_opened_temp == 1 && daylag == 1 && temp_lag == 1
             pa_open(i1,i2) = 1;
             days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end

        if  pa_opened_temp == 1 && daylag == 1 && temp_lag == 0
            temp_lag = 1;
        end

        if  Av_price_dev(counter-1-Six_mo+i1,i2) ~= 0
            pa_opened_temp = 1;
            pairs_number = pairs_number + 1;
        end

         if  Av_price_dev(counter-1-Six_mo+i1,no_pairs+i2) ~= 0
             pa_opened_temp = 0;
             temp_lag = 0;
         end
    end
    end

wi2 = wi .* pa_open;

for i2=1:Six_mo % takes care in a situation where no pairs are open
    if  sum(pa_open(i2,:)') == 0
        wi2(i2,1:no_pairs) = 0.2 * ones(1,no_pairs);
        pa_open(i2,1:no_pairs) = ones(1,no_pairs);
    end
end

Rp_vw_fi(counter-Six_mo:counter-1,:) = (sum((wi2 .* Rpair_temp)'))' ./ sum(wi2')';

Ret_acum(counter-Six_mo:counter-1,3) = (cumprod(1+(Rp_vw_fi(counter-Six_mo:counter-1,:))));
%
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_fi(counter-Six_mo:counter-1,:)));
MDDw(big_loop,4) = MaxDD;
STN = sortinoratio(Rp_vw_fi(counter-Six_mo:counter-1,:),0);
STNw(big_loop,4) = STN;
%
%
RmRf(counter-Six_mo:counter-1,:) = Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:);
Ret_acum(i:i+Six_mo-1,6) = (cumprod(1+(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:))));
[MDD,MDDIndex] = maxdrawdown(ret2tick(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:)));
MDDw(big_loop,5) = MaxDD;
STN = sortinoratio(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:),0);
STNw(big_loop,5) = STN;

    for i2=1:no_pairs
        if  sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0) ~= 0
            periods_with_open_pair = periods_with_open_pair + 1;
            no_pairs_opened(big_loop,i2) = no_pairs_opened(big_loop,p)+ sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0);
        else

        periods_without_openpa = periods_without_openpa + 1;
        end
    end

i = i + Periods(big_loop,1);

big_loop = big_loop + 1;

end % end main loop
% ----------------------------------------------------
% ************* Analysis of the results **************
% ----------------------------------------------------
T_Rp = size(Rp_vw_cc,1); T_Rm = size(Rm,1);
Rm = Rm((1+T_Rm-T_Rp):T_Rm,1); % market
Rf = Rf((1+T_Rm-T_Rp):T_Rm,1); % risk-free rate
RmRf = Rm - Rf; % excess market

MktRf2 = MktRf2((1+T_Rm-T_Rp):T_Rm,1); SMB = SMB((1+T_Rm-T_Rp):T_Rm,1);
HML = HML((1+T_Rm-T_Rp):T_Rm,1); Mom = Mom((1+T_Rm-T_Rp):T_Rm,1);
LT_Rev = LT_Rev((1+T_Rm-T_Rp):T_Rm,1); CMA = CMA((1+T_Rm-T_Rp):T_Rm,1);
RMW = RMW((1+T_Rm-T_Rp):T_Rm,1);

Ret_vw = [Rp_vw_cc, Rp_vw_fi, Rm, Rf, RmRf];

T_Rp

desc2a= stat2(1+Rp_vw_cc,1,3,0); desc2b= stat2(1+Rp_vw_fi,1,3,0);
desc2= [desc2a desc2b]; desc3= stat2([1+Rm 1+Rf 1+RmRf],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

[~,t_vw_cc] = alpha_factor_model(Rp_vw_cc,ones(size(Rp_vw_cc,1),1),0,6);
[~,t_vw_fi] = alpha_factor_model(Rp_vw_fi,ones(size(Rp_vw_fi,1),1),0,6);
[~,t_bench] = alpha_factor_model(RmRf,ones(size(RmRf,1),1),0,6);

ff7_g = [MktRf2,SMB,HML,RMW,CMA,Mom,LT_Rev]; ff7_vw_cc_g = [Rp_vw_cc, ff7_g];

vw_ff7_g = ff7_vw_cc_g(:,2:8);

[beta_vw_cc_ff7_g,se_vw_cc_ff7_g,t_vw_cc_ff7_g] = beta_factor_model(Rp_vw_cc,vw_ff7_g,6);
[beta_vw_fi_ff7_g,se_vw_fi_ff7_g,t_vw_fi_ff7_g] = beta_factor_model(Rp_vw_fi,vw_ff7_g,6);

fit_vw_ccff7g = fitlm(vw_ff7_g,Rp_vw_cc); fit_vw_fiff7g = fitlm(vw_ff7_g,Rp_vw_fi);

ff7g_vw_cc = [beta_vw_cc_ff7_g(1).*100,t_vw_cc_ff7_g(1),beta_vw_cc_ff7_g(2).*100,t_vw_cc_ff7_g(2),...
             beta_vw_cc_ff7_g(3).*100,t_vw_cc_ff7_g(3),beta_vw_cc_ff7_g(4).*100,t_vw_cc_ff7_g(4),...
             beta_vw_cc_ff7_g(5).*100,t_vw_cc_ff7_g(5),beta_vw_cc_ff7_g(6).*100,t_vw_cc_ff7_g(6),...
             beta_vw_cc_ff7_g(7).*100,t_vw_cc_ff7_g(7),beta_vw_cc_ff7_g(8).*100,t_vw_cc_ff7_g(8),...
             fit_vw_ccff7g.Rsquared.Ordinary,fit_vw_ccff7g.Rsquared.Adjusted];
ff7g_vw_fi = [beta_vw_fi_ff7_g(1).*100,t_vw_fi_ff7_g(1),beta_vw_fi_ff7_g(2).*100,t_vw_fi_ff7_g(2),...
             beta_vw_fi_ff7_g(3).*100,t_vw_fi_ff7_g(3),beta_vw_fi_ff7_g(4).*100,t_vw_fi_ff7_g(4),...
             beta_vw_fi_ff7_g(5).*100,t_vw_fi_ff7_g(5),beta_vw_fi_ff7_g(6).*100,t_vw_fi_ff7_g(6),...
             beta_vw_fi_ff7_g(7).*100,t_vw_fi_ff7_g(7),beta_vw_fi_ff7_g(8).*100,t_vw_fi_ff7_g(8),...
             fit_vw_fiff7g.Rsquared.Ordinary,fit_vw_fiff7g.Rsquared.Adjusted];
    
disp(' ');
VariableNames3 = {'VW_CC','VW_FI'};
RowNames3 = {'Intercept';'t_alpha';'Market';'t_beta';'SMB';'t_SMB';'HML';'t_HML';...
    'RMW';'t_RMW';'CMA';'t_CMA';'Mom';'t_Mom';'LT_Rev';'t_LT_Rev';'R2';'R2adj'};
table3 = table(ff7g_vw_cc',ff7g_vw_fi',...
         'VariableNames',VariableNames3,'RowNames',RowNames3);

     
for j=1:6172
MaxDD2_vw_cc(j)= (1+Rp_vw_cc(j,:))*(1+Rp_vw_cc(j+1,:));
MaxDD2_vw_fi(j)= (1+Rp_vw_fi(j,:))*(1+Rp_vw_fi(j+1,:));
MaxDD2_Rm_Rf(j)= (1+RmRf(j,:))*(1+RmRf(j+1,:));
end

MDD2_vw_cc= min(MaxDD2_vw_cc); MDD2_vw_fi= min(MaxDD2_vw_fi);
MDD2_Rm_Rf= min(MaxDD2_Rm_Rf);

[c1_mixcopG2,c2_mixcopG2]= min(MaxDD2_vw_cc);
[c1f2,c2f2]= min(MaxDD2_vw_fi);
[c1r2,c2r2]= min(MaxDD2_Rm_Rf);

for i=1:6047
    MaxDD_vw_cc(i,:)= cumprod(1+Rp_vw_cc(i:i+126-1,:));
    MaxDD_vw_fi(i,:)= cumprod(1+Rp_vw_fi(i:i+126-1,:));
    MaxDD_Rm_Rf(i,:)= cumprod(1+RmRf(i:i+126-1,:));
end

[c1_mixcopG,c2_mixcopG]= min(min(MaxDD_vw_cc));
[c1f,c2f]= min(min(MaxDD_vw_fi));
[c1r,c2r]= min(min(MaxDD_Rm_Rf));

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc,0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi,0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf,0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
     t_vw_cc,100*(sum([Rp_vw_cc]<0)/size(Rp_vw_cc,1)), 100*(1-MDD2_vw_cc),...
     100*(1-min(min(MaxDD_vw_cc))), desc2(2,1), desc2(3,1), desc2(4,1),...
     min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
     t_vw_fi,100*(sum(Rp_vw_fi<0)/size(Rp_vw_fi,1)),100*(1-MDD2_vw_fi),...
     100*(1-min(min(MaxDD_vw_fi))), desc2(2,2), desc2(3,2), desc2(4,2),...
     min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
     t_bench,100*(sum(RmRf<0)/size(RmRf,1)),100*(1-MDD2_Rm_Rf),...
     100*(1-min(min(MaxDD_Rm_Rf))), desc3(2,3), desc3(3,3), desc3(4,3),...
     min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames1 = {'VW_CC','VW_FI','Benchmark'};
RowNames1 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';'t-statistic';...
    'Share of negative excess returns';'MDD1';'MDD2'; 'Std Dev'; 'Skewness';...
    'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table1 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames1,'RowNames',RowNames1);

no_pairs_open = sum(sum(no_pairs_opened)'); x = sum(abs(Av_price_dev(:,1:no_pairs)) > 0);
days_open = days_open(1:no_pairs_open,1);

VariableNames2 = {'Trading_Statistics'};
RowNames2 = {'Av_Price_Dev_trigger_openpa';'Total_number_of_pairs_opened';...
    'Average_number_of_pairs_opened_per_six-month_period'; ...
    'Average_number_of_round-trip_trades_per_pair_in_months'; 'Standard_Dev';'Average_time_pairs_are_open_in_days';...
    'Standard_Deviation';'Median_time_pairs_are_open_in_days'};

trading_stat=[sum(sum(abs(Av_price_dev(:,1:no_pairs)))')./sum((sum(abs(Av_price_dev(:,1:no_pairs)) >.0))'),...
    no_pairs_open,no_pairs_open/(big_loop-1),...
    mean(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),...
    std(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),mean(days_open),std(days_open),median(days_open)];
table2 = table(trading_stat',...
    'VariableNames',VariableNames2,'RowNames',RowNames2);
 
writetable(table1,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table2,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table3,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',3);
    
    desc2a = stat2(1+Rp_vw_cc(1:1138,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1:1138,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1:1138,1) 1+Rf(1:1138,1) 1+RmRf(1:1138,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1:1138,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1:1138,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1:1138,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames4 = {'VW_CC','VW_FI','Benchmark'};
RowNames4 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table4 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames4,'RowNames',RowNames4);

writetable(table4,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',4);
    
desc2a = stat2(1+Rp_vw_cc(1139:2401,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1139:2401,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1139:2401,1) 1+Rf(1139:2401,1) 1+RmRf(1139:2401,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1139:2401,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1139:2401,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1139:2401,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames5 = {'VW_CC','VW_FI','Benchmark'};
RowNames5 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table5 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames5,'RowNames',RowNames5);

writetable(table5,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',5);
    
    desc2a = stat2(1+Rp_vw_cc(2402:3657,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(2402:3657,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(2402:3657,1) 1+Rf(2402:3657,1) 1+RmRf(2402:3657,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(2402:3657,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(2402:3657,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(2402:3657,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames6 = {'VW_CC','VW_FI','Benchmark'};
RowNames6 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table6 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames6,'RowNames',RowNames6);

writetable(table6,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',6);
    
    desc2a = stat2(1+Rp_vw_cc(3657:4916,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(3657:4916,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(3657:4916,1) 1+Rf(3657:4916,1) 1+RmRf(3657:4916,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(3657:4916,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(3657:4916,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(3657:4916,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames7 = {'VW_CC','VW_FI','Benchmark'};
RowNames7 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table7 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames7,'RowNames',RowNames7);

writetable(table7,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',7);
    
    desc2a = stat2(1+Rp_vw_cc(4917:6173,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(4917:6173,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(4917:6173,1) 1+Rf(4917:6173,1) 1+RmRf(4917:6173,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(4917:6173,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(4917:6173,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(4917:6173,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames8 = {'VW_CC','VW_FI','Benchmark'};
RowNames8 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table8 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames8,'RowNames',RowNames8);

writetable(table8,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c1_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',8);
    
save('C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c1_sq2.0.mat');
    
    %% Top 35, C = 0.002
    
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
addpath('C:\Users\fsabino\Desktop\Fernando\papers')';


% ----------------------------------------------------
% Load in data
% ----------------------------------------------------
testing = 0;

load SP500_p1
% ----------------------------------------------------
% Set default values
% ----------------------------------------------------

[T,N]= size(Rt); % T = number of periods (days)
% N = number of assets in the whole period
daylag = 0;    % set whether (1, default) or not (0) signals take one day to go into effect (cf. Table 1A vs. 1B)
wi_update = 1; % set whether (1, default) or not (0) intra-pair weights are updated when pair is open; 
               % if not: weights stay at 50-50%
Years = 2015 - 1990 + 0.5;
 
no_pairs = 35;
trading_cost = 0; % works just with one day lag
C = 0.002; % buy/sell (percentage cost for opening and closing pairs)
trade_req = 0; % set whether (0) or not (2) positive trading volume is required for opening/closing a pair
Stop_loss = -Inf ; %disp(['Stop_loss = ', num2str(Stop_loss)]);%Choose how much loss we are willing to accept on a given pair, compared to 1, i.e 0.93 = 7% stop loss
Stop_gain = Inf;  %disp(['Stop_loss = ', num2str(Stop_gain)]); %Choose how much gain we are willing to accept on a given pair, compared to 1, i.e 1.10 = 10% stop gain
s1218 = 1; % listing req. (look ahead): 12+6 months (=1)

% ----------------------------------------------------
% Reset several variables used for desc statistics
% ----------------------------------------------------
Av_price_dev = zeros(T-sum(Periods(1:2,1)),no_pairs*2); % 12 months are w/o price deviations
% The first 12 months are formation period
Rpair = zeros(sum(Periods(end-1,4)),no_pairs); % Keeps track of the return of each pair

MDDpairs = zeros(length(Periods)-1,no_pairs); % Pre allocate MDD matrix for each pair out of sample;
MDDw = zeros(length(Periods)-1,5); %- Preallocate MDD matrix out of sample for 4 weighting schemes + Rm + (Rm-Rf).
STNpairs = zeros(length(Periods)-2,no_pairs);
STNw = zeros(length(Periods)-2,5);

periods_with_open_pair = 0; % number of periods with pairs opened
periods_without_openpa = 0; % number of periods without pairs opened
pairs_number = 0; pair_open = 0; %
days_open = zeros(no_pairs*10000,1); % measures number of days each pair open; bad programming, but we do not know how many pairs we get
no_pairs_opened = zeros(Years*2-2,no_pairs); % measures number of times pairs opened in each pair per 6 month period

counter = 1; % Keeps track of the days in the main loop
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
listed2 = IPt(Twe_mo+Six_mo*(s1218==1),:)>0; % listed at the end: 12/18 months from now (1xN vector of 0/1s)
listed = listed1 .* listed2; % listed throughout the 12+6 month period (1xN vector of 0/1s)

no_listed = sum(listed);
index_listed = find(listed>0); % find columns that should be included

% [D,ia,ib]=intersect(ticker2(:,big_loop),ticker2(:,big_loop+1));
% [ic,id]= ismember(D,ticker2(:,big_loop+2));
% [ie,ig]= ismember(D(ic),tickerb);
% index_listed2= intersect(index_listed,ig');
% no_listed2 = size(index_listed2,2);

[D,ia,ib]=union(ticker2(:,big_loop),ticker2(:,big_loop+1));
[ic,id]= ismember(D,ticker2(:,big_loop+2));
[ie,ig]= ismember(D(ic),tickerb);
index_listed2= ig';
no_listed2 = sum(ie);


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
% ----------------------------------------------------
% Calc SSEs
% ----------------------------------------------------

SSE = zeros(no_listed2,no_listed2);
    for j=1:(no_listed2-1) % calculate SSE for all pairs
        for k=(j+1):no_listed2 % can prob. be speeded up by better programming
            % SSE(index_listed2(j),index_listed2(k)) = sum(abs( IPt(1:Twe_mo,index_listed2(j))- IPt(1:Twe_mo,index_listed2(k)) ));
           SSE(index_listed2(j),index_listed2(k)) = sum(( IPt(1:Twe_mo,index_listed2(j))-...
                IPt(1:Twe_mo,index_listed2(k)) ).^2);
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

% ----------------------------------------------------
% Calculate returns during the 6 month period
% ----------------------------------------------------
count_temp = counter;

for p=1:no_pairs
    counter = count_temp; pairs_opened = 0; new_pairs_opened = 0; lag = 0;
    std_limit = std(IPt(1:Twe_mo,min_SSE_ro(p))-IPt(1:+Twe_mo,min_SSE_co(p)));
% Fixed volatility estimated in the 12 months period. Doing the calculation one pair at a time 
Rcum = zeros(Twe_mo,1); counter_ret = 1; Rcum_ret = 1; % Presets all variables for each pair
        
for j=(i+Twe_mo):(i+Twe_mo+Six_mo-1) % portfolio period
% Defining the period as from the first day of the twe_month to the 
% last day of the twe_month

if daylag == 0 % w/o one day delay
        if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
                              % If a sign to open has been given, then calcule the returns
           Rpair(counter,p) = +Rt(j,min_SSE_ro(p)) .* wi(1)- Rt(j,min_SSE_co(p)) .* wi(2);
           % Rpair is the return of each pair.
           Rcum(counter_ret,1) = Rpair(counter,p); 
           counter_ret = counter_ret + 1;
           Rcum_ret = cumprod(1+Rcum);  
           lag = lag + 1; %used for paying tc    

		if wi_update == 1 % The weight of each asset in the pair is updated. 
                        wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                        wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
               Rpair(counter,p) = -Rt(j,min_SSE_ro(p)) .* wi(1) + Rt(j,min_SSE_co(p)) .* wi(2);
               Rcum(counter_ret,1) = Rpair(counter,p); 
               counter_ret = counter_ret + 1;
               Rcum_ret = cumprod(1+Rcum);
               lag = lag + 1;
                
		if wi_update == 1
                   wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
                   wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
        else
               Rpair(counter,p) = 0; % closed (this code not necessary)
        end
            
            if ((pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <= 0)...
               || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain) ...
 	           || (pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0))...
               && ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)...

                pairs_opened = 0; % close pairs: prices cross
		        lag = 0; % when pair is closed reset lag (it serves for paying tc)
                Av_price_dev(counter,no_pairs+p) = 1; % add a marker for closing; 
                                                      % used to calc length of the "open-period"
                Rpair(counter,p) = Rpair(counter,p) - C; %Includes trading cost in the last day of trading, due to closing position                                      
            elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
            if pairs_opened == 0 % record dev (and time) at open
                Rcum = zeros(Six_mo,1);
		        counter_ret = 1;
                Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
                                          /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
            end
            
            pairs_opened = 1; % open pairs
	        lag = lag + 1;  %- Lag was 0. On the next loop C will be paid
            wi = ones(1,2);
            
            elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
                    ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)

        if pairs_opened == 0 % record dev (and time) at open
	       Rcum = zeros(Six_mo,1);
           counter_ret = 1;
           Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))...
                                    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
        end
        
        pairs_opened = -1; % open pairs
 	    lag = lag + 1;
        wi = ones(1,2);
            
         end
            
        counter = counter + 1; % This is done for the first day, now update 
                               % counter so it is done for the 2nd day        
        elseif daylag == 1 % w/one day delay
            
if pairs_opened == -1 % pairs opened: long 1st, short 2nd stock
    Rpair(counter,p) = (+Rt(j,min_SSE_ro(p)) * wi(1) - Rt(j,min_SSE_co(p))* wi(2)) - (lag==2)*trading_cost;
    Rcum (counter_ret,1) = Rpair(counter,p); 
    counter_ret = counter_ret + 1;
    Rcum_ret = cumprod(1+Rcum);
if wi_update == 1
    wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
    wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
end

elseif pairs_opened == 1 % pairs opened: short 1st, long 2nd stock
        Rpair(counter,p) = (-Rt(j,min_SSE_ro(p)) * wi(1)+ Rt(j,min_SSE_co(p)) * wi(2)) - (lag==2)*trading_cost;
    	Rcum (counter_ret,1) = Rpair(counter,p); 
        counter_ret = counter_ret + 1;
        Rcum_ret = cumprod(1+Rcum);
        if wi_update == 1
            wi(1)=wi(1)*(1+Rt(j,min_SSE_ro(p)));
            wi(2)=wi(2)*(1+Rt(j,min_SSE_co(p)));
        end
else
    Rpair(counter,p) = 0; % closed (this code not necessary)
end

    pairs_opened = new_pairs_opened;

if (pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <=  0 ...
   || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain)...   
   || pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0)...
   &&((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
    
    new_pairs_opened = 0; % close prices: prices cross
    % If the pairs are open and the spread is smaller than the
    % threshold, close the position 
    lag = 0;
    Av_price_dev(counter+1,no_pairs+p) = 1; % see above, marker

    if wi_update == 1
        Rpair(counter,p) = Rpair(counter,p) - trading_cost - C;
    end
    
elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = 1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 1st, long 2nd) 
        lag = lag + 1;
        if  pairs_opened == 0
            Rcum = zeros(Six_mo,1);
            counter_ret = 1;
        end         
        
elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) && ...
        ((trade_req + (Vt(j,min_SSE_ro(p))>0) + (Vt(j,min_SSE_co(p))>0)) > 1)
        new_pairs_opened = -1; % open pairs
        % If the difference between the prices are larger than 
        % the limit, and there is volume, open the position (short 2nd, long 1st)       
        lag = lag + 1;
        if pairs_opened == 0 % - If the pair was closed, reset accumulated return matrix and counter
           Rcum = zeros(Six_mo,1);
           counter_ret = 1;
        end
end

if new_pairs_opened == +1 && lag == 1
    Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
    /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);

elseif new_pairs_opened == -1 && lag == 1
    
Av_price_dev(counter,p) = 2*(-IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)))/(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
    lag = lag + 1;
    wi = ones(1,2);
end
    counter = counter + 1;
end % endif of one day lag (0/1)
end % end for pairs-period days (j)

% if a pair open at the end, add a sign that closed
% otherwise no additional steps necessary, as closing just gets last day's return

if pairs_opened ~= 0
    Rpair(counter-1,p) = Rpair(counter-1,p) - trading_cost - C; %Includes trading cost in the last day of trading, due to closing position
    Av_price_dev(counter-1,no_pairs+p) = 1;
end

end % end for portfolio (p)
%% Using 2 Weighting Schemes - Fully Invested and Committed Capital
% ------------------------------------------------------------
% Calculate portfolio returns (ew, vw) out of percentage Rpair
% ------------------------------------------------------------
Rpair_temp = Rpair(counter-Six_mo:counter-1,:);
%
% eq-weighted average on committed cap.; weights reset to "one" (or any equal weight) after each day
%
Ret_acum_pairs(counter-Six_mo:counter-1,:) = (cumprod(1+(Rpair_temp)));
[MaxDD,~] = maxdrawdown(ret2tick(Rpair_temp));
MDDpairs(big_loop,:)= MaxDD;  
STN = sortinoratio(Rpair_temp,0);
STNpairs(big_loop,:) = STN;

%
wi = ones(1,no_pairs);
wi = [wi;cumprod(1+Rpair_temp)];
wi = wi(1:Six_mo,:);
%
% vw-weighted, committed cap.; weights "restart" every 6 month period; 
% (each portfolio gets 1 dollar at the beginning)
Rp_vw_cc(counter-Six_mo:counter-1,:) = (sum((wi .* Rpair_temp)'))' ./ sum(wi')';
%
% vw-weighted, fully invested; weights "restart" from 1 every time a new pair is opened;
% Capital divided between open portfolios.
Ret_acum(counter-Six_mo:counter-1,2) = (cumprod(1+(Rp_vw_cc(counter-Six_mo:counter-1,:))));
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_cc(counter-Six_mo:counter-1,:)));
MDDw(big_loop,2) = MaxDD;
STN = sortinoratio(Rp_vw_cc(counter-Six_mo:counter-1,:),0);
STNw(big_loop,2) = STN;
%
pa_open = zeros(Six_mo,no_pairs); % indicator for days when pairs open

    for i2=1:no_pairs
        pa_opened_temp = 0;temp_lag = 0;
    for i1=1:Six_mo
        if  pa_opened_temp == 1 && daylag == 0 % opening period not included, closing included
            pa_open(i1,i2) = 1;
            days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end
        if   pa_opened_temp == 1 && daylag == 1 && temp_lag == 1
             pa_open(i1,i2) = 1;
             days_open(pairs_number,1) = days_open(pairs_number,1) + 1;
        end

        if  pa_opened_temp == 1 && daylag == 1 && temp_lag == 0
            temp_lag = 1;
        end

        if  Av_price_dev(counter-1-Six_mo+i1,i2) ~= 0
            pa_opened_temp = 1;
            pairs_number = pairs_number + 1;
        end

         if  Av_price_dev(counter-1-Six_mo+i1,no_pairs+i2) ~= 0
             pa_opened_temp = 0;
             temp_lag = 0;
         end
    end
    end

wi2 = wi .* pa_open;

for i2=1:Six_mo % takes care in a situation where no pairs are open
    if  sum(pa_open(i2,:)') == 0
        wi2(i2,1:no_pairs) = 0.2 * ones(1,no_pairs);
        pa_open(i2,1:no_pairs) = ones(1,no_pairs);
    end
end

Rp_vw_fi(counter-Six_mo:counter-1,:) = (sum((wi2 .* Rpair_temp)'))' ./ sum(wi2')';

Ret_acum(counter-Six_mo:counter-1,3) = (cumprod(1+(Rp_vw_fi(counter-Six_mo:counter-1,:))));
%
[MaxDD,~] = maxdrawdown(ret2tick(Rp_vw_fi(counter-Six_mo:counter-1,:)));
MDDw(big_loop,4) = MaxDD;
STN = sortinoratio(Rp_vw_fi(counter-Six_mo:counter-1,:),0);
STNw(big_loop,4) = STN;
%
%
RmRf(counter-Six_mo:counter-1,:) = Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:);
Ret_acum(i:i+Six_mo-1,6) = (cumprod(1+(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:))));
[MDD,MDDIndex] = maxdrawdown(ret2tick(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:)));
MDDw(big_loop,5) = MaxDD;
STN = sortinoratio(Rm(i:i+Six_mo-1,:)-Rf(i:i+Six_mo-1,:),0);
STNw(big_loop,5) = STN;

    for i2=1:no_pairs
        if  sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0) ~= 0
            periods_with_open_pair = periods_with_open_pair + 1;
            no_pairs_opened(big_loop,i2) = no_pairs_opened(big_loop,p)+ sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0);
        else

        periods_without_openpa = periods_without_openpa + 1;
        end
    end

i = i + Periods(big_loop,1);

big_loop = big_loop + 1;

end % end main loop
% ----------------------------------------------------
% ************* Analysis of the results **************
% ----------------------------------------------------
T_Rp = size(Rp_vw_cc,1); T_Rm = size(Rm,1);
Rm = Rm((1+T_Rm-T_Rp):T_Rm,1); % market
Rf = Rf((1+T_Rm-T_Rp):T_Rm,1); % risk-free rate
RmRf = Rm - Rf; % excess market

MktRf2 = MktRf2((1+T_Rm-T_Rp):T_Rm,1); SMB = SMB((1+T_Rm-T_Rp):T_Rm,1);
HML = HML((1+T_Rm-T_Rp):T_Rm,1); Mom = Mom((1+T_Rm-T_Rp):T_Rm,1);
LT_Rev = LT_Rev((1+T_Rm-T_Rp):T_Rm,1); CMA = CMA((1+T_Rm-T_Rp):T_Rm,1);
RMW = RMW((1+T_Rm-T_Rp):T_Rm,1);

Ret_vw = [Rp_vw_cc, Rp_vw_fi, Rm, Rf, RmRf];

T_Rp

desc2a= stat2(1+Rp_vw_cc,1,3,0); desc2b= stat2(1+Rp_vw_fi,1,3,0);
desc2= [desc2a desc2b]; desc3= stat2([1+Rm 1+Rf 1+RmRf],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

[~,t_vw_cc] = alpha_factor_model(Rp_vw_cc,ones(size(Rp_vw_cc,1),1),0,6);
[~,t_vw_fi] = alpha_factor_model(Rp_vw_fi,ones(size(Rp_vw_fi,1),1),0,6);
[~,t_bench] = alpha_factor_model(RmRf,ones(size(RmRf,1),1),0,6);

ff7_g = [MktRf2,SMB,HML,RMW,CMA,Mom,LT_Rev]; ff7_vw_cc_g = [Rp_vw_cc, ff7_g];

vw_ff7_g = ff7_vw_cc_g(:,2:8);

[beta_vw_cc_ff7_g,se_vw_cc_ff7_g,t_vw_cc_ff7_g] = beta_factor_model(Rp_vw_cc,vw_ff7_g,6);
[beta_vw_fi_ff7_g,se_vw_fi_ff7_g,t_vw_fi_ff7_g] = beta_factor_model(Rp_vw_fi,vw_ff7_g,6);

fit_vw_ccff7g = fitlm(vw_ff7_g,Rp_vw_cc); fit_vw_fiff7g = fitlm(vw_ff7_g,Rp_vw_fi);

ff7g_vw_cc = [beta_vw_cc_ff7_g(1).*100,t_vw_cc_ff7_g(1),beta_vw_cc_ff7_g(2).*100,t_vw_cc_ff7_g(2),...
             beta_vw_cc_ff7_g(3).*100,t_vw_cc_ff7_g(3),beta_vw_cc_ff7_g(4).*100,t_vw_cc_ff7_g(4),...
             beta_vw_cc_ff7_g(5).*100,t_vw_cc_ff7_g(5),beta_vw_cc_ff7_g(6).*100,t_vw_cc_ff7_g(6),...
             beta_vw_cc_ff7_g(7).*100,t_vw_cc_ff7_g(7),beta_vw_cc_ff7_g(8).*100,t_vw_cc_ff7_g(8),...
             fit_vw_ccff7g.Rsquared.Ordinary,fit_vw_ccff7g.Rsquared.Adjusted];
ff7g_vw_fi = [beta_vw_fi_ff7_g(1).*100,t_vw_fi_ff7_g(1),beta_vw_fi_ff7_g(2).*100,t_vw_fi_ff7_g(2),...
             beta_vw_fi_ff7_g(3).*100,t_vw_fi_ff7_g(3),beta_vw_fi_ff7_g(4).*100,t_vw_fi_ff7_g(4),...
             beta_vw_fi_ff7_g(5).*100,t_vw_fi_ff7_g(5),beta_vw_fi_ff7_g(6).*100,t_vw_fi_ff7_g(6),...
             beta_vw_fi_ff7_g(7).*100,t_vw_fi_ff7_g(7),beta_vw_fi_ff7_g(8).*100,t_vw_fi_ff7_g(8),...
             fit_vw_fiff7g.Rsquared.Ordinary,fit_vw_fiff7g.Rsquared.Adjusted];
    
disp(' ');
VariableNames3 = {'VW_CC','VW_FI'};
RowNames3 = {'Intercept';'t_alpha';'Market';'t_beta';'SMB';'t_SMB';'HML';'t_HML';...
    'RMW';'t_RMW';'CMA';'t_CMA';'Mom';'t_Mom';'LT_Rev';'t_LT_Rev';'R2';'R2adj'};
table3 = table(ff7g_vw_cc',ff7g_vw_fi',...
         'VariableNames',VariableNames3,'RowNames',RowNames3);

     
for j=1:6172
MaxDD2_vw_cc(j)= (1+Rp_vw_cc(j,:))*(1+Rp_vw_cc(j+1,:));
MaxDD2_vw_fi(j)= (1+Rp_vw_fi(j,:))*(1+Rp_vw_fi(j+1,:));
MaxDD2_Rm_Rf(j)= (1+RmRf(j,:))*(1+RmRf(j+1,:));
end

MDD2_vw_cc= min(MaxDD2_vw_cc); MDD2_vw_fi= min(MaxDD2_vw_fi);
MDD2_Rm_Rf= min(MaxDD2_Rm_Rf);

[c1_mixcopG2,c2_mixcopG2]= min(MaxDD2_vw_cc);
[c1f2,c2f2]= min(MaxDD2_vw_fi);
[c1r2,c2r2]= min(MaxDD2_Rm_Rf);

for i=1:6047
    MaxDD_vw_cc(i,:)= cumprod(1+Rp_vw_cc(i:i+126-1,:));
    MaxDD_vw_fi(i,:)= cumprod(1+Rp_vw_fi(i:i+126-1,:));
    MaxDD_Rm_Rf(i,:)= cumprod(1+RmRf(i:i+126-1,:));
end

[c1_mixcopG,c2_mixcopG]= min(min(MaxDD_vw_cc));
[c1f,c2f]= min(min(MaxDD_vw_fi));
[c1r,c2r]= min(min(MaxDD_Rm_Rf));

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc,0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi,0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf,0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
     t_vw_cc,100*(sum([Rp_vw_cc]<0)/size(Rp_vw_cc,1)), 100*(1-MDD2_vw_cc),...
     100*(1-min(min(MaxDD_vw_cc))), desc2(2,1), desc2(3,1), desc2(4,1),...
     min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
     t_vw_fi,100*(sum(Rp_vw_fi<0)/size(Rp_vw_fi,1)),100*(1-MDD2_vw_fi),...
     100*(1-min(min(MaxDD_vw_fi))), desc2(2,2), desc2(3,2), desc2(4,2),...
     min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
     t_bench,100*(sum(RmRf<0)/size(RmRf,1)),100*(1-MDD2_Rm_Rf),...
     100*(1-min(min(MaxDD_Rm_Rf))), desc3(2,3), desc3(3,3), desc3(4,3),...
     min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames1 = {'VW_CC','VW_FI','Benchmark'};
RowNames1 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';'t-statistic';...
    'Share of negative excess returns';'MDD1';'MDD2'; 'Std Dev'; 'Skewness';...
    'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table1 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames1,'RowNames',RowNames1);

no_pairs_open = sum(sum(no_pairs_opened)'); x = sum(abs(Av_price_dev(:,1:no_pairs)) > 0);
days_open = days_open(1:no_pairs_open,1);

VariableNames2 = {'Trading_Statistics'};
RowNames2 = {'Av_Price_Dev_trigger_openpa';'Total_number_of_pairs_opened';...
    'Average_number_of_pairs_opened_per_six-month_period'; ...
    'Average_number_of_round-trip_trades_per_pair_in_months'; 'Standard_Dev';'Average_time_pairs_are_open_in_days';...
    'Standard_Deviation';'Median_time_pairs_are_open_in_days'};

trading_stat=[sum(sum(abs(Av_price_dev(:,1:no_pairs)))')./sum((sum(abs(Av_price_dev(:,1:no_pairs)) >.0))'),...
    no_pairs_open,no_pairs_open/(big_loop-1),...
    mean(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),...
    std(reshape(no_pairs_opened,no_pairs*(big_loop-1),1)),mean(days_open),std(days_open),median(days_open)];
table2 = table(trading_stat',...
    'VariableNames',VariableNames2,'RowNames',RowNames2);
 
writetable(table1,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table2,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table3,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',3);
    
    desc2a = stat2(1+Rp_vw_cc(1:1138,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1:1138,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1:1138,1) 1+Rf(1:1138,1) 1+RmRf(1:1138,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1:1138,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1:1138,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1:1138,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames4 = {'VW_CC','VW_FI','Benchmark'};
RowNames4 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table4 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames4,'RowNames',RowNames4);

writetable(table4,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',4);
    
desc2a = stat2(1+Rp_vw_cc(1139:2401,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1139:2401,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(1139:2401,1) 1+Rf(1139:2401,1) 1+RmRf(1139:2401,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(1139:2401,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(1139:2401,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(1139:2401,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames5 = {'VW_CC','VW_FI','Benchmark'};
RowNames5 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table5 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames5,'RowNames',RowNames5);

writetable(table5,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',5);
    
    desc2a = stat2(1+Rp_vw_cc(2402:3657,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(2402:3657,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(2402:3657,1) 1+Rf(2402:3657,1) 1+RmRf(2402:3657,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(2402:3657,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(2402:3657,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(2402:3657,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames6 = {'VW_CC','VW_FI','Benchmark'};
RowNames6 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table6 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames6,'RowNames',RowNames6);

writetable(table6,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',6);
    
    desc2a = stat2(1+Rp_vw_cc(3657:4916,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(3657:4916,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(3657:4916,1) 1+Rf(3657:4916,1) 1+RmRf(3657:4916,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(3657:4916,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(3657:4916,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(3657:4916,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames7 = {'VW_CC','VW_FI','Benchmark'};
RowNames7 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table7 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames7,'RowNames',RowNames7);

writetable(table7,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',7);
    
    desc2a = stat2(1+Rp_vw_cc(4917:6173,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(4917:6173,1),1,3,0);
desc2 = [desc2a desc2b]; desc3= stat2([1+Rm(4917:6173,1) 1+Rf(4917:6173,1) 1+RmRf(4917:6173,1)],1,3,0);

SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2);
SR_Rm_Rf = sqrt(252)*desc3(1,3)./desc3(2,3);

Sortino_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc(4917:6173,1),0);
Sortino_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi(4917:6173,1),0);
Sortino_Rm_Rf= sqrt(252)*sortinoratio(RmRf(4917:6173,1),0);

ds_vw_cc = [((1+desc2(1,1)).^252-1), SR_vw_cc,Sortino_vw_cc,...
          desc2(2,1), desc2(3,1), desc2(4,1),...
          min(Rp_vw_cc), max(Rp_vw_cc), desc2(1,1)*100000];
 
ds_vw_fi = [((1+desc2(1,2)).^252-1), SR_vw_fi,Sortino_vw_fi,...
           desc2(2,2), desc2(3,2), desc2(4,2),...
           min(Rp_vw_fi), max(Rp_vw_fi), desc2(1,2)*100000];
 
 ds_Rm_Rf= [((1+desc3(1,3)).^252-1), SR_Rm_Rf, Sortino_Rm_Rf,...
           desc3(2,3), desc3(3,3), desc3(4,3),...
           min(RmRf), max(RmRf), desc3(1,3)*10000];
     
VariableNames8 = {'VW_CC','VW_FI','Benchmark'};
RowNames8 = {'Mean Return';'Sharpe_Ratio'; 'Sortino Ratio';
             'Std Dev'; 'Skewness';...
             'Kurtosis'; 'Minimum'; 'Maximum'; 'bps'};
table8 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames8,'RowNames',RowNames8);

writetable(table8,'C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c2_sq2.0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',8);

save('C:\Users\fsabino\Desktop\Fernando\Results_tables_paper1\dist_p35c2_sq2.0.mat');
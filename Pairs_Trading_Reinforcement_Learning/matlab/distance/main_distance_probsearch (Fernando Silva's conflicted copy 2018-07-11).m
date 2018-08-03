     %% Top 20, C = 0.001 (20 pares, custo de transacao = 10 bps)

    clear all; close all; clc; 

    % add folders to search path (preciso de funcoes que estao nestes
    % caminhos)
    addpath('C:\Program Files\MATLAB\R2013b\toolbox\stats');
    addpath('C:\Users\fsabino\Dropbox\PairsTrading_ITA\matlab\distance\Toolbox');
    addpath('C:\Users\fsabino\Dropbox\PairsTrading_ITA\data\data_hf')
    addpath('C:\Users\fsabino\Dropbox\PairsTrading_ITA\data\data_SP500_1990_2015');

    % ----------------------------------------------------
    % Load in data
    % ----------------------------------------------------
    testing = 0;

    load data_hf
    %load SP500_p1
    % ----------------------------------------------------
    % Set default values
    % ----------------------------------------------------

    [T,N]= size(Rt); % T = number of periods (days)
    % N = number of assets in the whole period
    daylag = 0;    % set whether (1, default) or not 
    % (0) signals take one day to go into effect (cf. Table 1A vs. 1B)
                   % daylag é algo que tem nos artigos do Gatev (2006) e
                   % Broussard and Vaihekoski (2012) para tratar do bid-ask
                   % spread. Na minha defesa criticaram e eu nao considerei
                   % mais.
    wi_update = 1; % set whether (1, default) or not (0) intra-pair weights are updated when pair is open; 
                   % if not: weights stay at 50-50%
    Years = 2016 - 2009; % 7 anos de dados
    %Years = 2015 - 1990 + 0.5;

    no_pairs = 20;
    trading_cost = 0; % works just with one day lag 
    % (não irei considerar pelo explicado acima na linha 43).
    C = 0.001; % buy/sell (percentage cost for opening and closing pairs)
    % trade_req = 0; % set whether (0) or not (2) positive trading volume is required for opening/closing a pair
    Stop_loss = -Inf; %disp(['Stop_loss = ', num2str(Stop_loss)]);
    % Choose how much loss we are willing to accept on a given pair, compared to 1, i.e 0.93 = 7% stop loss
    Stop_gain = Inf;  %disp(['Stop_loss = ', num2str(Stop_gain)]); 
    % Choose how much gain we are willing to accept on a given pair, compared to 1, i.e 1.10 = 10% stop gain
    s1218 = 1; % listing req. (look ahead): 12+6 months (=1)

    % ----------------------------------------------------
    % Reset several variables used for desc statistics
    % ----------------------------------------------------
    Av_price_dev = zeros(T-sum(Periods(1:2,1)),no_pairs*2); % 12 months are w/o price deviations
    % The first 12 months are formation period
    Rpair = zeros(sum(Periods(end-1,4)),no_pairs); 
    % Keeps track of the return of each pair

    MDDpairs = zeros(length(Periods)-2,no_pairs); 
    % Pre allocate Maximum Drawdown (MDD) matrix for each pair out of sample;
    MDDw = zeros(length(Periods)-2,4); 
    % Preallocate MDD matrix out of sample for 4 weighting schemes.
    % Rp_vw_cc (committed capital), Rp_vw_fi (fully invested), Rf (renda fixa)
    % RmRf (excesso de retorno do mercado)
    STNpairs = zeros(length(Periods)-2,no_pairs); % Sortino Ratio. O -2 é por
    % causa dos dois primeiros semestres (o primeiro período de formação).
    STNw = zeros(length(Periods)-2,4); % Sortino para committed capital,
    % fully invested, renda fixa, excesso de retorno do mercado

    % as duas próximas linhas são utilizadas para calcular algumas 
    % estatísticas de trading (tabela 2 no paper)
    periods_with_open_pair = 0; % number of periods with pairs opened
    periods_without_openpa = 0; % number of periods without pairs opened
    pairs_number = 0; pair_open = 0; % um contador
    days_open = zeros(no_pairs*1000,1); % measures number of days each pair open;
    % bad programming, but we do not know how many pairs we get
    no_pairs_opened = zeros(Years*2-2,no_pairs); 
    % measures number of times pairs opened in each pair per 6 month period
    
    counter = 1; % Keeps track of the days in the main loop
    % ----------------------------------------------------
    % Start of Main Loop - Creating Price Index
    % ----------------------------------------------------
    % Main part of the program starts here
    % ----------------------------------------------------
    countLoop = 1;

    i = 1;

    while countLoop <= (Years * 2 -2); % big loop starts here; take 6 month steps
          Twe_mo = Periods(countLoop,4); % picks up # of days in 12 months
          Six_mo = Periods(countLoop+2,1); % picks up # of days in following 6 months
    % ----------------------------------------------------
    % Create price index IPt by setting first Pt>0 to 1
    % ----------------------------------------------------
    IPt = zeros(Twe_mo+Six_mo,N); % IPt = Indexed Price at time t
    % Preallocate a zeros matrix with the size of the Formation (12 months) 
    % + Trading period (6 months)
    % IPt = Indexed Price at time t
   
valor_otimo = 1/1000; %initiate the value to be optimized
Loop = 0; %initiate count
limiar = 0.99; %limiar of sum of top-probabilities
limiteLoop = 1000; % maximum number of loop
total_prob = 0; %sum of top-probabilities
%%%%%%%%%%%%%%
%funcao = @optPort_sharpe; %fitness function
%%%%%%%%%%%%%%%
taxa_convergencia = 0.001; %learning rate

% initial matrix of probabilities
prob_vector = [1:N]'; %stock
prob_vector(:,2) = ones(N,1)./N; %probabilities
prob_vector(:,3) = cumsum(prob_vector(:,2)); %cumulative probabilities
prob_vector(end,3) = 1; %complete cumulative probabilities
    
while total_prob < limiar && Loop < limiteLoop %criteria to run
    
    %Select Stock for the portfolio
    n=1; 
    stocks = zeros(no_pairs*2,1);
    while n <= no_pairs*2
        pre_stocks = min(find(prob_vector(:,3)>rand()));
        if isempty(find(stocks == pre_stocks))
            stocks(n) = pre_stocks;
            n=n+1;
        end
    end
    
    % sorteio aleatório dos stocks
    %stocks = sort(stocks); % Is it necessary?
    
   for j=1:size(stocks,1)
        m = 0;
        for i2=1:(Twe_mo+Six_mo)
            if Pt(i+i2-1,stocks(j))>0 & m == 0
                IPt(i2,stocks(j))= 1;  m= 1;
            elseif Pt(i+i2-1,stocks)>0 & m == 1
                IPt(i2,stocks(j)) = IPt(i2-1,stocks(j)) * (1 + Rt(i+i2-1,stocks(j)));
            end
        end
   end
   
    % ----------------------------------------------------
    % Calc SSEs
    % ----------------------------------------------------

    %Calculate the optimal portfolio for a given components selected
SSE = zeros(no_pairs*2,no_pairs*2);
        for j=1:(no_pairs*2-1) % calculate SSE for all pairs
            for k=(j+1):no_pairs*2 % can prob. be speeded up by better programming
%                 SSE(index_listed(j),index_listed(k)) = sum(( IPt(1:Twe_mo,index_listed(j))-...
%                     IPt(1:Twe_mo,index_listed(k)) ).^2);
                 % Mannhatan Distance
%                   SSE(index_listed(j),index_listed(k)) = sum(abs( IPt(1:Twe_mo,index_listed(j))-...
%                       IPt(1:Twe_mo,index_listed(k))));
                  % Elo Rating, Mannhatan Distance
                  SSE(j,k) = sum(abs(0.5-1./( 1+ exp(-(IPt(1:Twe_mo,stocks(j))-...
                     IPt(1:Twe_mo,stocks(k)) )))));
            end
        end

% Calculei o SSE dos ativos sorteados logo acima   
     % ----------------------------------------------------
    % Find min SSEs
    % ----------------------------------------------------
    max_SSE = max(max(SSE)) + 1;
    min_SSE = zeros(no_pairs,1);
    min_SSE_ro = zeros(1,no_pairs);
    min_SSE_co = zeros(1,no_pairs);

        for ii=1:no_pairs % find no_pairs minimum SSEs
            t_SSE = max_SSE; % temp_SSE

            for j=1:(no_pairs*2-1)
                    for k=(j+1):no_pairs*2
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
    min_SSE_ro(ii) = stocks(ro); % column of the 1st stock in a pair
    min_SSE_co(ii) = stocks(co); % column of the 2nd stock in a pair
  
SSE(ro,co) = max_SSE; % prevent re-selection
% As 4 linhas abaixo se estiverem comentadas permitem re-seleção.
% Caso não queira que aconteça re-seleção, comente a linha acima
% e descomente as 4 logo abaixo.
% SSE(ro,:) = max_SSE; % prevent re-selection
% SSE(:,ro) = max_SSE; % prevent re-selection
% SSE(co,:) = max_SSE; % prevent re-selection
% SSE(:,co) = max_SSE; % prevent re-selection

        end % of ii

 %disp([min_SSE_ro;min_SSE_co]); % mostra na tela os pares
 
  % Register new optimals
     if t_SSE > valor_otimo %check new optimal
        valor_otimo = t_SSE;
        otimo_componentes = stocks;
        prob_vector(otimo_componentes,2) = max(prob_vector(:,2));
     end
     
     %update the matrix of probabilities
      if valor_otimo>0 
         prob_vector(otimo_componentes,2) = prob_vector(otimo_componentes,2) + taxa_convergencia;
         prob_vector(:,2) = prob_vector(:,2)./sum(prob_vector(:,2));
         prob_vector(:,3) = cumsum(prob_vector(:,2));
         prob_vector(end,3) = 1;
      end
     
     % calculate the total probabilities of the top-no_pairs*2
     prob_sorted = sortrows(prob_vector,-2);
     total_prob = sum(prob_sorted(1:no_pairs*2,2));

Loop = Loop+1;

end


disp(['Period ',num2str(countLoop)]);
disp([min_SSE_ro;min_SSE_co]); % mostra na tela os pares % mostra na tela os pares
% Obs: Tem que calcular o retorno do portfólio e encaixá-los na sequência.
% ProbSearch também não pode ser usado para selecionar pares?
% ----------------------------------------------------
    % Calculate returns during the 6 month period
    % ----------------------------------------------------
    count_temp = counter;
    
for p=1:no_pairs
        counter = count_temp; pairs_opened = 0; new_pairs_opened = 0; lag = 0;
        std_limit = std(1./(1+exp(IPt(1:Twe_mo,min_SSE_ro(p))-IPt(1:+Twe_mo,min_SSE_co(p)))));
        % sqrt(470)/2) and (sqrt(512)/2) see ferreira_strength and elo_win_comparator
        %std_limit = std(IPt(1:Twe_mo,min_SSE_ro(p))-IPt(1:+Twe_mo,min_SSE_co(p)));
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
               lag = lag + 1; % used for paying transaction cost    

            if wi_update == 1 % The weight of each asset in the pair is updated. 
                            wi(1)= wi(1)*(1+Rt(j,min_SSE_ro(p)));
                            wi(2)= wi(2)*(1+Rt(j,min_SSE_co(p)));
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
                   Rpair(counter,p) = 0; % closed (this code is not necessary)
            end
                % filtros para fechar o par se ele está aberto
                if ((pairs_opened == +1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) <= 0)...
                   || Rcum_ret(end,1) <= Stop_loss || (Rcum_ret(end,1) >= Stop_gain) ...
                   || (pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0))
                   
                    pairs_opened = 0; % close pairs: prices cross
                    lag = 0; % when pair is closed reset lag (it serves for paying transaction cost)
                    Av_price_dev(counter,no_pairs+p) = 1; % add a marker for closing; 
                                                          % used to calc length of the "open-period"
                    Rpair(counter,p) = Rpair(counter,p) - C; 
                    % Includes trading cost in the last day of trading, due to closing position                                      
                elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit) 
                if pairs_opened == 0 % record dev (and time) at open
                    Rcum = zeros(Six_mo,1);
                    counter_ret = 1;
                    Av_price_dev(counter,p) = 2*(+IPt(j-i+1,min_SSE_ro(p))- IPt(j-i+1,min_SSE_co(p)))...
                                              /(IPt(j-i+1,min_SSE_ro(p))+ IPt(j-i+1,min_SSE_co(p)));
                end

                pairs_opened = 1; % open pairs
                lag = lag + 1;  % Lag was 0. On the next loop C will be paid
                wi = ones(1,2);

                elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit)

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
       || pairs_opened == -1 && (IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p))) >= 0)

        new_pairs_opened = 0; % close prices: prices cross
        % If the pairs are open and the spread is smaller than the
        % threshold, close the position 
        lag = 0;
        Av_price_dev(counter+1,no_pairs+p) = 1; % see above, marker

        if wi_update == 1
            Rpair(counter,p) = Rpair(counter,p) - trading_cost - C;
        end

    elseif (+IPt(j-i+1,min_SSE_ro(p))-IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit)
            new_pairs_opened = 1; % open pairs
            % If the difference between the prices are larger than 
            % the limit, and there is volume, open the position (short 1st, long 2nd) 
            lag = lag + 1;
            if  pairs_opened == 0
                Rcum = zeros(Six_mo,1);
                counter_ret = 1;
            end         

    elseif (-IPt(j-i+1,min_SSE_ro(p))+IPt(j-i+1,min_SSE_co(p)) > 2.0*std_limit)
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
        Rpair(counter-1,p) = Rpair(counter-1,p) - trading_cost - C; 
        % Includes trading cost in the last day of trading, due to closing position
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
%     Ret_acum_pairs(counter-Six_mo:counter-1,:) = (cumprod(1+(Rpair_temp)));
%     MaxDD = maxdrawdown(Rpair_temp);
%     MDDpairs(countLoop,:)= MaxDD;  
%     STN = sortinoratio(Rpair_temp,0);
%     STNpairs(countLoop,:) = STN;

    %
    wi = ones(1,no_pairs);
    wi = [wi;cumprod(1+Rpair_temp)];
    wi = wi(1:Six_mo,:);
    %
    % vw-weighted, committed cap.; weights "restart" every 6 month period; 
    % (each portfolio gets 1 dollar at the beginning)
    Rp_vw_cc(counter-Six_mo:counter-1,:) = (sum((wi .* Rpair_temp)'))' ./ sum(wi')';
    % Retorno do committed capital
    %
    % vw-weighted, fully invested; weights "restart" from 1 every time a new pair is opened;
    % Capital divided between open portfolios.
    Ret_acum(counter-Six_mo:counter-1,2) = (cumprod(1+(Rp_vw_cc(counter-Six_mo:counter-1,:))));
    MaxDD = maxdrawdown(Rp_vw_cc(counter-Six_mo:counter-1,:));
    MDDw(countLoop,2) = MaxDD;
    STN = sortinoratio(Rp_vw_cc(counter-Six_mo:counter-1,:),0);
    STNw(countLoop,2) = STN;
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
    % Retorno do fully invested

    Ret_acum(counter-Six_mo:counter-1,3) = cumprod(1+(Rp_vw_fi(counter-Six_mo:counter-1,:)));
    %
    MaxDD = maxdrawdown(Rp_vw_fi(counter-Six_mo:counter-1,:));
    MDDw(countLoop,4) = MaxDD;
    STN = sortinoratio(Rp_vw_fi(counter-Six_mo:counter-1,:),0);
    STNw(countLoop,4) = STN;
    %
    %
    %RmRf(counter-Six_mo:counter-1,:) = Rm(counter-Six_mo:counter-1,:)-Rf(counter-Six_mo:counter-1,:);
    Ret_acum(counter-Six_mo:counter-1,5) = cumprod(1+(RmRf(counter-Six_mo:counter-1,:)));
    MDD = maxdrawdown(RmRf(counter-Six_mo:counter-1,:));
    MDDw(countLoop,4) = MaxDD;
    STN = sortinoratio(RmRf(counter-Six_mo:counter-1,:),0);
    STNw(countLoop,4) = STN;

        for i2=1:no_pairs
            if  sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0) ~= 0
                periods_with_open_pair = periods_with_open_pair + 1;
                no_pairs_opened(countLoop,i2) = no_pairs_opened(countLoop,p)+ sum(Av_price_dev(counter-Six_mo:counter-1,i2) ~= 0);
            else

            periods_without_openpa = periods_without_openpa + 1;
            end
        end
    
i = i + Periods(countLoop,1);

    countLoop = countLoop + 1;

    end % end main loop
 
% ----------------------------------------------------
% ************* Analysis of the results **************
% ----------------------------------------------------
T_Rp = size(Rp_vw_cc,1); T_RmRf = size(RmRf,1);
Rf = Rf((1+T_RmRf-T_Rp):T_RmRf,1); % risk-free rate
% RmRf excess market

%% Incluir os fatores de risco do NEFIN
% (http://www.nefin.com.br/risk_factors.html)
% Similar ao fatores de risco de Fama-French para o Brasil
RmRf = RmRf((1+T_RmRf-T_Rp):T_RmRf,1);
SMB = SMB((1+T_RmRf-T_Rp):T_RmRf,1); HML = HML((1+T_RmRf-T_Rp):T_RmRf,1);
WML = WML((1+T_RmRf-T_Rp):T_RmRf,1); IML = IML((1+T_RmRf-T_Rp):T_RmRf,1);

Ret_vw = [Rp_vw_cc, Rp_vw_fi, Rf, RmRf];

T_Rp

% Descriptives
%	    1st row: geometric mean
%		2nd row: standard deviation
%		3rd row: coefficient for the skewnewss
%		4th row: coefficient for the degree of excess kurtosis
desc2a= stat2(1+Rp_vw_cc,1,3,0); desc2b= stat2(1+Rp_vw_fi,1,3,0); 
desc2= [desc2a desc2b]; desc3= stat2([1+Rf 1+RmRf],1,3,0);
% essas funções estão nos paths adicionados no início do código

% Sharpe Ratio
SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2); 
SR_Rm_Rf = sqrt(252)*desc3(1,2)./desc3(2,2);
  
% Max DrawDown 2 days 
for j=1:1474 % 1:dimension Rp_vw -1
    MaxDD2_vw_cc(j)= (1+Rp_vw_cc(j,:))*(1+Rp_vw_cc(j+1,:)); 
    MaxDD2_vw_fi(j)= (1+Rp_vw_fi(j,:))*(1+Rp_vw_fi(j+1,:));
    MaxDD2_Rm_Rf(j)= (1+RmRf(j,:))*(1+RmRf(j+1,:));
end

% Worst drawdown
MDD2_vw_cc= min(MaxDD2_vw_cc); MDD2_vw_fi= min(MaxDD2_vw_fi);
MDD2_Rm_Rf= min(MaxDD2_Rm_Rf);

% Not that relevant. I'm just curious to know where the the MaxDD has
% occurred
[row_vw_cc,col_vw_cc]= min(MaxDD2_vw_cc);
[row_vw_fi,col_vw_fi]= min(MaxDD2_vw_fi);
[row_RmRf,col_RmRf]= min(MaxDD2_Rm_Rf);

% Max DrawDown 6 months
for i=1:1349 % 1:dimension Rp_vw -126 (6 months)
    MaxDD_vw_cc(i,:)= cumprod(1+Rp_vw_cc(i:i+126-1,:));
    MaxDD_vw_fi(i,:)= cumprod(1+Rp_vw_fi(i:i+126-1,:));
    MaxDD_Rm_Rf(i,:)= cumprod(1+RmRf(i:i+126-1,:));
end

% Not that relevant. I'm just curious to know where the the MaxDD has
% occurred
[row_vw_cc6m,col_vw_cc6m]= min(min(MaxDD_vw_cc));
[row_vw_fi6m,col_vw_fi6m]= min(min(MaxDD_vw_fi));
[row_RmRf6m,col_RmRf6m]= min(min(MaxDD_Rm_Rf));

% Sortino Ratio
% 0 is level of minimum acceptable return (MAR). It could be Rf.
srt_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc,0);
srt_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi,0);
srt_Rm_Rf= sqrt(252)*sortinoratio(RmRf,0);

% Regress each series on the constant
[~,t_vw_cc] = alpha_factor_model(Rp_vw_cc,ones(size(Rp_vw_cc,1),1),0,6);
[~,t_vw_fi] = alpha_factor_model(Rp_vw_fi,ones(size(Rp_vw_fi,1),1),0,6);
[~,t_bench] = alpha_factor_model(RmRf,ones(size(RmRf,1),1),0,6);

% Table 1: Excess returns of distance strategy
%	    1st row: Annualized Mean Return (%)
%		2nd row: Sharpe Ratio
%		3rd row: Sortino Ratio
%		4th row: t-stat
%	    5th row: % of negative trades
%		6th row: MDD1
%		7th row: MDD2
%		8th row: Annualized Std. Dev (%)
%		9th row: Skewness
%		10th row: Kurtosis
%		11st row: Minimum Daily Return (%)
%		12nd row: Maximum Daily Return (%)
%		13rd row: Cumulative Excess Return
ds_vw_cc = [100*((1+desc2(1,1)).^252-1), SR_vw_cc, srt_vw_cc,...
     t_vw_cc, 100*(sum([Rp_vw_cc]<0)/size(Rp_vw_cc,1)), 100*(1-MDD2_vw_cc),...
     100*(1-min(min(MaxDD_vw_cc))), 100*((1+desc2(1,1)).^252-1)/SR_vw_cc, desc2(3,1), desc2(4,1),...
     100*min(Rp_vw_cc), 100*max(Rp_vw_cc), (1+desc2(1,1))^T_Rp];
 
ds_vw_fi = [100*((1+desc2(1,2)).^252-1), SR_vw_fi, srt_vw_fi,...
     t_vw_fi, 100*(sum(Rp_vw_fi<0)/size(Rp_vw_fi,1)), 100*(1-MDD2_vw_fi),...
     100*(1-min(min(MaxDD_vw_fi))), 100*((1+desc2(1,2)).^252-1)/SR_vw_fi, desc2(3,2), desc2(4,2),...
     100*min(Rp_vw_fi), 100*max(Rp_vw_fi), (1+desc2(1,2))^T_Rp];
 
 ds_Rm_Rf= [100*((1+desc3(1,2)).^252-1), SR_Rm_Rf, srt_Rm_Rf,...
     t_bench, 100*(sum(RmRf<0)/size(RmRf,1)), 100*(1-MDD2_Rm_Rf),...
     100*(1-min(min(MaxDD_Rm_Rf))), 100*((1+desc3(1,2)).^252-1)/SR_Rm_Rf, desc3(3,2), desc3(4,2),...
     100*min(RmRf), 100*max(RmRf), (1+desc3(1,2))^T_Rp];    

VariableNames1 = {'VW_CC','VW_FI','Benchmark'};
RowNames1 = {'Annualized Mean Return (%)';'Sharpe_Ratio';'Sortino Ratio';'t-stat';...
    'Share of negative excess returns';'MDD1';'MDD2'; 'Annualized Std Dev (%)'; 'Skewness';...
    'Kurtosis'; 'Minimum Daily Return (%)'; 'Maximum Daily Return (%)'; 'Cumulative Excess Return'};
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
    no_pairs_open,no_pairs_open/(countLoop-1),...
    mean(reshape(no_pairs_opened,no_pairs*(countLoop-1),1)),...
    std(reshape(no_pairs_opened,no_pairs*(countLoop-1),1)),mean(days_open),std(days_open),median(days_open)];
table2 = table(trading_stat',...
    'VariableNames',VariableNames2,'RowNames',RowNames2);

ff5 = [RmRf,SMB,HML,WML,IML]; ff5_vw_cc= [Rp_vw_cc, ff5]; % Similar to Fama-French 5 factors

vw_ff5 = ff5_vw_cc(:,2:6);

% Newey-West lags = 6 
[beta_vw_cc_ff5,se_vw_cc_ff5,t_vw_cc_ff5] = beta_factor_model(Rp_vw_cc,vw_ff5,6);
[beta_vw_fi_ff5,se_vw_fi_ff5,t_vw_fi_ff5] = beta_factor_model(Rp_vw_fi,vw_ff5,6);

fit_vw_cc = fitlm(vw_ff5,Rp_vw_cc); fit_vw_fi = fitlm(vw_ff5,Rp_vw_fi);

ff5_vw_cc = [beta_vw_cc_ff5(1).*100,t_vw_cc_ff5(1),beta_vw_cc_ff5(2).*100,t_vw_cc_ff5(2),...
             beta_vw_cc_ff5(3).*100,t_vw_cc_ff5(3),beta_vw_cc_ff5(4).*100,t_vw_cc_ff5(4),...
             beta_vw_cc_ff5(5).*100,t_vw_cc_ff5(5),beta_vw_cc_ff5(6).*100,t_vw_cc_ff5(6),...
             fit_vw_cc.Rsquared.Ordinary,fit_vw_cc.Rsquared.Adjusted];
ff5_vw_fi = [beta_vw_fi_ff5(1).*100,t_vw_fi_ff5(1),beta_vw_fi_ff5(2).*100,t_vw_fi_ff5(2),...
             beta_vw_fi_ff5(3).*100,t_vw_fi_ff5(3),beta_vw_fi_ff5(4).*100,t_vw_fi_ff5(4),...
             beta_vw_fi_ff5(5).*100,t_vw_fi_ff5(5),beta_vw_fi_ff5(6).*100,t_vw_fi_ff5(6),...
             fit_vw_fi.Rsquared.Ordinary,fit_vw_fi.Rsquared.Adjusted];
    
disp(' ');
VariableNames3 = {'VW_CC','VW_FI'};
RowNames3 = {'Intercept';'t_alpha';'Market';'t_beta';'SMB';'t_SMB';'HML';'t_HML';...
    'WML';'t_WML';'IML';'t_IML';'R2';'R2adj'};
table3 = table(ff5_vw_cc',ff5_vw_fi',...
         'VariableNames',VariableNames3,'RowNames',RowNames3);
 
writetable(table1,'C:\Users\fsabino\Dropbox\PairsTrading_ITA\matlab\results\distance\distance_p5c0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
    %distance_p5c0 (5 pares, custo C= 0)
writetable(table2,'C:\Users\fsabino\Dropbox\PairsTrading_ITA\matlab\results\distance\distance_p5c0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table3,'C:\Users\fsabino\Dropbox\PairsTrading_ITA\matlab\results\distance\distance_p5c0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',3);
 
% Sub-period Analysis
% sum(Periods(3:14,1)), % sum(Periods(3:8,1))
% I kept the names. If you feel confused add new ones for the 1st (1:739) and the
% 2nd subperiods (observations 740 to 1475).
desc2a= stat2(1+Rp_vw_cc(1:739,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(1:739,1),1,3,0); 
desc2= [desc2a desc2b]; desc3= stat2([1+Rf(1:739,1) 1+RmRf(1:739,1)],1,3,0);

% Sharpe Ratio
SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2); 
SR_Rm_Rf = sqrt(252)*desc3(1,2)./desc3(2,2);

% Sortino Ratio
% 0 is level of minimum acceptable return (MAR). It could be Rf.
srt_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc,0);
srt_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi,0);
srt_Rm_Rf= sqrt(252)*sortinoratio(RmRf,0);

% Table 1: Excess returns of distance strategy
%	    1st row: Annualized Mean Return (%)
%		2nd row: Sharpe Ratio
%		3rd row: Sortino Ratio
%		4th row: Annualized Std. Dev (%)
%		5th row: Skewness
%		6th row: Kurtosis
%		7th row: Minimum Daily Return (%)
%		8th row: Maximum Daily Return (%)
%		9th row: Cumulative Excess Return
ds_vw_cc = [100*((1+desc2(1,1)).^252-1), SR_vw_cc, srt_vw_cc,...
     100*((1+desc2(1,1)).^252-1)/SR_vw_cc, desc2(3,1), desc2(4,1),...
     100*min(Rp_vw_cc), 100*max(Rp_vw_cc), (1+desc2(1,1))^T_Rp];
 
ds_vw_fi = [100*((1+desc2(1,2)).^252-1), SR_vw_fi, srt_vw_fi,...
     100*((1+desc2(1,2)).^252-1)/SR_vw_fi, desc2(3,2), desc2(4,2),...
     100*min(Rp_vw_fi), 100*max(Rp_vw_fi), (1+desc2(1,2))^T_Rp];
 
 ds_Rm_Rf= [100*((1+desc3(1,2)).^252-1), SR_Rm_Rf, srt_Rm_Rf,...
     100*((1+desc3(1,2)).^252-1)/SR_Rm_Rf, desc3(3,2), desc3(4,2),...
     100*min(RmRf), 100*max(RmRf), (1+desc3(1,2))^T_Rp];    
 
VariableNames4 = {'VW_CC_subp1','VW_FI_subp1','Benchmark_subp1'};
%subp1: subperiod 1
RowNames4 = {'Annualized Mean Return (%)';'Sharpe_Ratio';'Sortino Ratio';...
    'Annualized Std Dev (%)'; 'Skewness';'Kurtosis'; 'Minimum Daily Return (%)';...
    'Maximum Daily Return (%)'; 'Cumulative Excess Return'};
table4 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames4,'RowNames',RowNames4);

writetable(table4,'C:\Users\fsabino\Dropbox\PairsTrading_ITA\matlab\results\distance\distance_p5c0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',4);
    
desc2a= stat2(1+Rp_vw_cc(740:1475,1),1,3,0); desc2b= stat2(1+Rp_vw_fi(740:1475,1),1,3,0); 
desc2= [desc2a desc2b]; desc3= stat2([1+Rf(740:1475,1) 1+RmRf(740:1475,1)],1,3,0);

% Sharpe Ratio
SR_vw_cc= sqrt(252)*desc2(1,1)./desc2(2,1); SR_vw_fi= sqrt(252)*desc2(1,2)./desc2(2,2); 
SR_Rm_Rf = sqrt(252)*desc3(1,2)./desc3(2,2);

% Sortino Ratio
% 0 is level of minimum acceptable return (MAR). It could be Rf.
srt_vw_cc= sqrt(252)*sortinoratio(Rp_vw_cc,0);
srt_vw_fi= sqrt(252)*sortinoratio(Rp_vw_fi,0);
srt_Rm_Rf= sqrt(252)*sortinoratio(RmRf,0);

% Table 1: Excess returns of distance strategy
%	    1st row: Annualized Mean Return (%)
%		2nd row: Sharpe Ratio
%		3rd row: Sortino Ratio
%		4th row: Annualized Std. Dev (%)
%		5th row: Skewness
%		6th row: Kurtosis
%		7th row: Minimum Daily Return (%)
%		8th row: Maximum Daily Return (%)
%		9th row: Cumulative Excess Return
ds_vw_cc = [100*((1+desc2(1,1)).^252-1), SR_vw_cc, srt_vw_cc,...
     100*((1+desc2(1,1)).^252-1)/SR_vw_cc, desc2(3,1), desc2(4,1),...
     100*min(Rp_vw_cc), 100*max(Rp_vw_cc), (1+desc2(1,1))^T_Rp];
 
ds_vw_fi = [100*((1+desc2(1,2)).^252-1), SR_vw_fi, srt_vw_fi,...
     100*((1+desc2(1,2)).^252-1)/SR_vw_fi, desc2(3,2), desc2(4,2),...
     100*min(Rp_vw_fi), 100*max(Rp_vw_fi), (1+desc2(1,2))^T_Rp];
 
 ds_Rm_Rf= [100*((1+desc3(1,2)).^252-1), SR_Rm_Rf, srt_Rm_Rf,...
     100*((1+desc3(1,2)).^252-1)/SR_Rm_Rf, desc3(3,2), desc3(4,2),...
     100*min(RmRf), 100*max(RmRf), (1+desc3(1,2))^T_Rp];    
     
VariableNames5 = {'VW_CC_subp2','VW_FI_subp2','Benchmark_subp2'};
% subp2 stands for subperiod 2
RowNames5 = {'Annualized Mean Return (%)';'Sharpe_Ratio';'Sortino Ratio';...
    'Annualized Std Dev (%)'; 'Skewness';'Kurtosis'; 'Minimum Daily Return (%)';...
    'Maximum Daily Return (%)'; 'Cumulative Excess Return'};
table5 = table(ds_vw_cc',ds_vw_fi',ds_Rm_Rf',...
    'VariableNames',VariableNames5,'RowNames',RowNames4);

writetable(table5,'C:\Users\fsabino\Dropbox\PairsTrading_ITA\matlab\results\distance\distance_p5c0.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',5);
  
% saving the .mat file
save('C:\Users\fsabino\Dropbox\PairsTrading_ITA\matlab\results\distance\mat_files\distance_p5c0.mat');
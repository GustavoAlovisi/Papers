function [pre_stocks] = distance_auxiliar(no_pairs,Loop)    

    % add folders to search path (preciso de funcoes que estao nestes
    % caminhos)
    addpath('C:\Program Files\MATLAB\R2013b\toolbox\stats');
    addpath('C:\Users\fsabino\Dropbox\PairsTrading_ITA\matlab\distance\Toolbox');
    addpath('C:\Users\fsabino\Dropbox\PairsTrading_ITA\data\data_hf')
    addpath('C:\Users\fsabino\Dropbox\PairsTrading_ITA\data\data_SP500_1990_2015');

    % ----------------------------------------------------
    % Load in data
    % ----------------------------------------------------
    load data_hf
    %load SP500_p1
    % ----------------------------------------------------
    % Set default values
    % ----------------------------------------------------

    [~,N]= size(Rt); 
    % N = number of assets in the whole period
  

    s1218 = 1; % listing req. (look ahead): 12+6 months (=1)

    % ----------------------------------------------------
    % Start of Main Loop - Creating Price Index
    % ----------------------------------------------------
    % Main part of the program starts here
    % ----------------------------------------------------
    %Years = 7;

          Twe_mo = Periods(Loop,4); % picks up # of days in 12 months
          Six_mo = Periods(Loop+2,1); % picks up # of days in following 6 months
    % ----------------------------------------------------
    % Create price index IPt by setting first Pt>0 to 1
    % ----------------------------------------------------
    IPt = zeros(Twe_mo+Six_mo,N); % IPt = Indexed Price at time t
    % Preallocate a zeros matrix with the size of the Formation (12 months) 
    % + Trading period (6 months)
    % IPt = Indexed Price at time t

    n2 = cumsum(Periods(:,1));
    n2 = [0,n2'];
    
    i = n2(Loop)+1;
    for j=1:N
        m = 0;
        for i2=1:(Twe_mo+Six_mo)
            if Pt(i+i2-1,j)>0 && m == 0
                IPt(i2,j)= 1;  m= 1;
         elseif Pt(i+i2-1,j)>0 && m == 1
                IPt(i2,j) = IPt(i2-1,j) * (1 + Rt(i+i2-1,j));
            end
        end
    end
    
    % As linhas abaixo são para evitar os casos em que há uma descontinuidade
    % Só consideramos o stock se ele estiver listado em todos os dias no
    % período de formação e de trading (12 + 6 meses)
    listed1 = IPt(1,:) > 0; % listed at the beginning (1xN vector of 0/1s)
    listed2 = IPt(Twe_mo+Six_mo*(s1218==1),:)>0; 
    % listed at the end: 12/18 months from now (1xN vector of 0/1s)
    listed = listed1 .* listed2; 
    % listed throughout the 12+6 month period (1xN vector of 0/1s)
    no_listed = sum(listed);
    index_listed = find(listed>0); % find columns that should be included

    % ----------------------------------------------------
    % Calc SSEs
    % ----------------------------------------------------

    SSE = zeros(no_listed,no_listed);
        for j=1:(no_listed-1) % calculate SSE for all pairs
            for k=(j+1):no_listed % can prob. be speeded up by better programming
                  SSE(index_listed(j),index_listed(k)) = sum(abs(0.5-1./( 1+ exp(-(IPt(1:Twe_mo,index_listed(j))-...
                     IPt(1:Twe_mo,index_listed(k)) )))));
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

            for j=1:(no_listed-1)
                    for k=(j+1):no_listed
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
    
        
    %disp(['Period ',num2str(Loop)]);
    
    %disp([min_SSE_ro;min_SSE_co]); % mostra na tela os pares
                                   % comment it if you don't want to see
        
    pre_stocks = [min_SSE_ro; min_SSE_co];

    

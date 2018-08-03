function SSE = euclidiana_fernando(Rt)

%2. Set Parameters to the optimization
    % countLoop = 1;
    
    i = 1;
    
   Twe_mo = Periods(countLoop,4); % picks up # of days in 12 months
   Six_mo = Periods(countLoop+2,1); %
   % [T,N] = size(Rt);
    % ----------------------------------------------------
    % Create price index IPt by setting first Pt>0 to 1
    % ----------------------------------------------------
    IPt = zeros(Twe_mo+Six_mo,N); % IPt = Indexed Price at time t
    % Preallocate a zeros matrix with the size of the Formation (12 months) 
    % + Trading period (6 months)
    % IPt = Indexed Price at time t
    
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
    % Desc stat of the price series
    % ----------------------------------------------------
    no_comp = sum((IPt > 0)')';

    % ----------------------------------------------------
    % Calc SSEs
    % ----------------------------------------------------

    SSE = zeros(no_listed,no_listed);
        for j=1:(no_listed-1) % calculate SSE for all pairs
            for k=(j+1):no_listed % can prob. be speeded up by better programming
                % SSE(index_listed(j),index_listed(k)) = sum(abs( IPt(1:Twe_mo,index_listed(j))- IPt(1:Twe_mo,index_listed(k)) ));
               SSE(index_listed(j),index_listed(k)) = sum(( IPt(1:Twe_mo,index_listed(j))-...
                    IPt(1:Twe_mo,index_listed(k)) ).^2);
            end
        end
  
% countLoop = countLoop +1;
    end % end main loop
    

nsim = 20;
stat = zeros(nsim,30);

rng('shuffle')

for isim=1:nsim
    tic
    disp(isim)
    main_2steps();
    stat(isim,1) = ds_vw_cc(1); % Annualized Mean Return (%)
    stat(isim,2) = ds_vw_cc(2); % Sharpe Ratio
    stat(isim,3) = ds_vw_cc(3); % Sortino Ratio (%)
    stat(isim,4) = ds_vw_cc(4); % t-stat
    stat(isim,5) = ds_vw_cc(5); % Share of negative excess returns
    stat(isim,6) = ds_vw_cc(6); % MDD1
    stat(isim,7) = ds_vw_cc(7); % MDD2
    stat(isim,8) = ds_vw_cc(8); % Annualized Std Dev
    stat(isim,9) = ds_vw_cc(11); % Minimum Daily Return
    stat(isim,10) = ds_vw_cc(12); % Maximum Daily Return
    stat(isim,11) = ds_vw_cc(13); % Cumulative Excess Return
    stat(isim,12) = ds_vw_fi(1); % Annualized Mean Return (%)
    stat(isim,13) = ds_vw_fi(2); % Sharpe Ratio
    stat(isim,14) = ds_vw_fi(3); % Sortino Ratio (%)
    stat(isim,15) = ds_vw_fi(4); % t-stat
    stat(isim,16) = ds_vw_fi(5); % Share of negative excess returns
    stat(isim,17) = ds_vw_fi(6); % MDD1
    stat(isim,18) = ds_vw_fi(7); % MDD2
    stat(isim,19) = ds_vw_fi(8); % Annualized Std Dev
    stat(isim,20) = ds_vw_fi(11); % Minimum Daily Return
    stat(isim,21) = ds_vw_fi(12); % Maximum Daily Return
    stat(isim,22) = ds_vw_fi(13); % Cumulative Excess Return
    stat(isim,23) = trading_stat(1); % 'Av_Price_Dev_trigger_openpa
    stat(isim,24) = trading_stat(2); % Total_number_of_pairs_opened
    stat(isim,25) = trading_stat(3); % Average_number_of_pairs_opened_per_six-month_period
    stat(isim,26) = trading_stat(4); % Average_number_of_round-trip_trades_per_pair_in_months
    stat(isim,27) = trading_stat(5); % Standard_Dev
    stat(isim,28) = trading_stat(6); % Average_time_pairs_are_open_in_days
    stat(isim,29) = trading_stat(7); % Standard_Deviation
    stat(isim,30) = trading_stat(8); % Median_time_pairs_are_open_in_days
    toc
end

%save('stat_iter1000_signal1000.csv','-ascii', '-tabs','stat')
n_simul=100;
lucros = zeros(n_simul,2);
for i_simul=1:n_simul
    tic
    disp(i_simul)
    elton_main_distance_probsearch();
    lucros(i_simul,1) = ds_vw_cc(1);
    lucros(i_simul,2) = trading_stat(2);
    toc
end

save('lucros_iter1000_signal10000.csv','-ascii', '-tabs','lucros')
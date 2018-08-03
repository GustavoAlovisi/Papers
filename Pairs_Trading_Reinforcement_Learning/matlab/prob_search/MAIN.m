%% MAIN

%INPUT
load dailyPrice.mat %load prices
retornos = price2ret(Data.close); %get the returns

%rodar a funcao probSearch com a euclidiana encapsulada
[otimo, compOpt, pesosOpt] = probSearch(retornos(1:380,:),@euclidiana,20,1000);
%INPUTS >>> probSearch(retornos,funcao,number_stocks,otimo_inicial)
%OUTPUT
% otimo >> menor SSE alcancado
% compOpt >> componentes que levaram ao menor SSE acima
% pesosOpt >> pesos dos componentes no portfolio
otimo

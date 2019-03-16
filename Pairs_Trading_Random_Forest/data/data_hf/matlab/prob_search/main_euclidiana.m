% carregar dados
addpath('C:\Users\fsabino\Dropbox\PairsTrading_ITA\data\data_SP500_1990_2015') 
addpath('C:\Users\fsabino\Dropbox\PairsTrading_ITA\data\data_hf')
%load SP500_p1 % SP500 (1990.2-2015)
load data_hf   % data ibov (2010-2016)
    
%retornos = price2ret(Pt);
% Já tenho os retornos no banco de dados # Rt

%rodar a funcao probSearch com a euclidiana encapsulada
[otimo1, compOpt1, pesosOpt1] = probSearch(Rt,@euclidiana,10,1000);

%rodar a mesma funcao acima com diferentes dados
% P.ex:
quant_acoes = 20; %selecione sempre numeros pares e o par sera quant_acoes/2
distancia_inicial = 10000;

[otimo, compOpt, pesosOpt] = probSearch(Rt,@euclidiana, ...
    quant_acoes,distancia_inicial);

%retornos do portoflio 1
ret_par1 = retornos(:,compOpt(1:quant_acoes/2))*pesosOpt;

%retornos do portoflio 2
ret_par2 = retornos(:,compOpt(1+quant_acoes/2:end))*pesosOpt;

%Obs: os pesos sao iguais. Proximo passo sera otimizar esses pesos.
% o output compOpt eh que sao os componentes dos dois pares.
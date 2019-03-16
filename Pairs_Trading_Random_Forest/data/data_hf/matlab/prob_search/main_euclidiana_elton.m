% carregar dados
%addpath('C:\Users\fsabino\Dropbox\PairsTrading_ITA\data\data_SP500_1990_2015') 
load dailyPrice.mat % SP500 (1990.2-2015)

    
retornos = price2ret(Data.close);
% J� tenho os retornos no banco de dados # Rt

%rodar a funcao probSearch com a euclidiana encapsulada
[otimo, compOpt, pesosOpt] = probSearch(retornos(1:380,:),@euclidiana,20,1000);

%rodar a mesma funcao acima com diferentes dados
% P.ex:
quant_acoes = 20; %selecione sempre numeros pares e o par sera quant_acoes/2
distancia_inicial = 10000;

[otimo, compOpt, pesosOpt] = probSearch(price2ret(Data.close),@euclidiana_optPesos, ...
    quant_acoes,distancia_inicial)

%retornos do portoflio 1
ret_par1 = retornos(:,compOpt(1:quant_acoes/2))*pesosOpt;

%retornos do portoflio 2
ret_par2 = retornos(:,compOpt(1+quant_acoes/2:end))*pesosOpt;

%Obs: os pesos sao iguais. Proximo passo sera otimizar esses pesos.
% o output compOpt eh que sao os componentes dos dois pares.
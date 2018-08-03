function[valor_otimo,otimo_componentes,otimo_pesos,dist_otimo] = probSearch(retornos,funcao,number_stocks,otimo_inicial)
%initial input
%retornos = price2ret(Data.close); %matrix of returns
%number_stocks = 10;% size of portfolio
valor_otimo = otimo_inicial; %initiate the value to be optimized
countLoop = 0; %initiate count
limiar = 0.999; %limiar of sum of top-probabilities
limiteLoop = 10000; % maximum number of loop
total_prob = 0; %sum of top-probabilities
%%%%%%%%%%%%%%
%funcao = @optPort_sharpe; %fitness function
%%%%%%%%%%%%%%%
taxa_convergencia = 0.0001; %learning rate

% get the amount of stocks
[row, quant_stocks] = size(retornos); %total of components

% initial matrix of probabilities
prob_vector = [1:quant_stocks]'; %stock
prob_vector(:,2) = ones(quant_stocks,1)./quant_stocks; %probabilities
prob_vector(:,3) = cumsum(prob_vector(:,2)); %cumulative probabilities
prob_vector(end,3) = 1; %complete cumulative probabilities

while total_prob<limiar && countLoop<limiteLoop %criteria to run
    
    countLoop = countLoop+1;
    
    %Select Stock for the portfolio
    n=1; 
    stocks = zeros(number_stocks,1);
    while n <= number_stocks
        pre_stocks = min(find(prob_vector(:,3)>rand()));
        if isempty(find(stocks == pre_stocks))
            stocks(n) = pre_stocks;
            n=n+1;
        end
    end
    
    %Calculate the optimal portfolio for a given components selected
    [pesos, fitness(countLoop)] =  funcao(retornos(1:380,stocks));

    %Register new optimals
    if fitness(countLoop)<valor_otimo %check new optimao
        valor_otimo = fitness(countLoop);
        otimo_componentes = stocks;
        otimo_pesos = pesos;
        dist_otimo = fitness(countLoop);
        prob_vector(otimo_componentes,2) = max(prob_vector(:,2));
    end
    
    %update the matrix of probabilities
 %   if valor_otimo>0 
    prob_vector(otimo_componentes,2) = prob_vector(otimo_componentes,2) + taxa_convergencia;
    prob_vector(:,2) = prob_vector(:,2)./sum(prob_vector(:,2));
    prob_vector(:,3) = cumsum(prob_vector(:,2));
    prob_vector(end,3) = 1;
 %   end
    
    %calculate the total probabilities of the top-10
    prob_sorted = sortrows(prob_vector,-2);
    total_prob = sum(prob_sorted(1:number_stocks,2));
    
%     dataTotal(countLoop,:) = [target(countLoop), total_prob, total_prob_port, countLoop]
%    st(countLoop) = valor_otimo;
%    total_prob
%    valor_otimo
%    countLoop
   
%    if countLoop == 500
%        nn=1
%    end
    
end

%% output

%end

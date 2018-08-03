function[wopt, fitness] = euclidiana_optPesos(ret)

%2. Set Parameters to the optimization
    [row, sizePortfolio] = size(ret);

%3. Funcao a ser otimizada
    function fitness = myfun(w)
    
    wP1 = w(1:sizePortfolio/2);
    wP2 = w(1+sizePortfolio/2:end);
    P1 = ret(:,1:(sizePortfolio/2)) * wP1;
    P2 = ret(:,(1+sizePortfolio/2:end)) * wP2;
    ipt1 = 1;ipt2 = 1;

        for i=2:row
            ipt1(i) = ipt1(i-1)*(1+P1(i-1));
            ipt2(i) = ipt2(i-1)*(1+P2(i-1));
        end

        fitness = sum((ipt1 - ipt2).^2);
    end

 w0 = 1*ones(sizePortfolio,1)./sizePortfolio;
 Aeq = ones(sizePortfolio,sizePortfolio);
 beq = 1*ones(sizePortfolio,1);
% A = ones(1,sizePortfolio);
% B = 20;
 lb = zeros(1,sizePortfolio);
 ub = 1*ones(1,sizePortfolio);
 options = optimset('Display','off', 'Algorithm', 'sqp');

% nonlcon = @extra;
        
wopt = fmincon(@myfun ...
         ,w0,[],[],Aeq,beq,lb,ub,[],options);

fitness = myfun(wopt);

end
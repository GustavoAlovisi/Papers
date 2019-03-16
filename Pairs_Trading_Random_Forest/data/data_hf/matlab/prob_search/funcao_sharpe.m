    function sharpe = funcao_sharpe(ret,w)
        sharpe = (exp(mean(ret*w)*252)-1)/(std(ret*w)*sqrt(252));
        
    end
    

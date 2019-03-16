quant_acoes = 10; %selecione sempre numeros pares e o par sera quant_acoes/2
distancia_inicial = 10000;
ret = price2ret(Data.close);
estagio = 250;
for t = 250:1250

    if t == estagio
    estagio = estagio + 10;   
    [otimo, compOpt, pesosOpt] = probSearch(ret(t-249:t,:),@euclidiana, ...
    quant_acoes,distancia_inicial);
    end

retLong = 20*ret(t+1,compOpt(1:quant_acoes/2))*p;esosOpt(1:quant_acoes/2);
retShort = 20*ret(t+1,compOpt(quant_acoes/2+1:end))*pesosOpt(quant_acoes/2+1:end);

retPair(t+1) = retLong - retShort
100*(prod(1+retPair)-1)
t

end
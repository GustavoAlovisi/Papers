quant_acoes = 10; %selecione sempre numeros pares e o par sera quant_acoes/2
distancia_inicial = 10000;
ret = price2ret(Data.close);
estagio = 250;
clear retPair
for t = 250:1250

    if t == estagio
    estagio = estagio + 22;   
    [otimo, compOpt, pesosOpt, distancia] = probSearch(ret(t-249:t,:),@euclidiana, ...
    quant_acoes,distancia_inicial);
    end

retLong = 1*ret(t+1,compOpt(1:quant_acoes/2))*pesosOpt;
retShort = 1*ret(t+1,compOpt(quant_acoes/2+1:end))*pesosOpt;
 if distancia>0
    retPair(t+1) = retLong - retShort;
 else
    retPair(t+1) = -(retLong - retShort);
 end
100*(prod(1+retPair)-1)
t

end
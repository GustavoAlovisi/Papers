
function [mean_return std_dev SR turnover] = stats(data,L,T,returns,weights)

turnover=0;

for i=2:L-T-1
    aux1=((1+data(i,:)./100).*weights(:,i-1)')';
    aux2=sum(aux1).\aux1;
    aux3=sum(abs(aux2-weights(:,i)));
    turnover=turnover + aux3;
end

turnover=turnover/(L-T-1);

% Computing out-of-sample portfolio standard deviation
std_dev = std(returns);

% Computing mean return of each stragegy
mean_return = mean(returns);

% Computing Sharpe ratio
SR = mean_return/std_dev;




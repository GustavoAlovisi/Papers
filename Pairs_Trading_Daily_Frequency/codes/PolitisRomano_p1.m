function [pvalSR pvalRet pvalSTD] = dgnu_StatisticsPolitisRomano_v5(xr, benchm,w)

B = 10000; % number of bootstrap samples
w = floor(w); % average block length

%Benchmark policies is benchm
xr1  = xr;
xr2 = benchm;
[bsdata1,bsdata2,indices]=my_stationary_bootstrap([xr1 xr2],B,w);

% Test differences in Sharpe ratios
Delta = mean(bsdata1)./std(bsdata1) - mean(bsdata2)./std(bsdata2);
[F,x]=ecdf(Delta);
[aux,j]=min(abs(x));
if (0>median(Delta))
    pvalSR = 2*(1-F(j));
else
    pvalSR = 2*F(j);
end

% Test differences in mean returns
Delta = mean(bsdata1) - mean(bsdata2);
[F,x]=ecdf(Delta);
[aux,j]=min(abs(x));
if (0>median(Delta))
    pvalRet = 2*(1-F(j));
else
    pvalRet = 2*F(j);
end

% Test differences in standard deviation
Delta = std(bsdata1) - std(bsdata2);
[F,x]=ecdf(Delta);
[aux,j]=min(abs(x));
if (0>median(Delta))
    pvalSTD = 2*(1-F(j));
else
    pvalSTD = 2*F(j);
end





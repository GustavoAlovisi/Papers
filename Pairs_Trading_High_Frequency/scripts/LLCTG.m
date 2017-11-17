%% AUXILIARY FUNCTION TO PASS TO OPTIMIZATION ALGORITHMS %%

% Multivariate Clayton-t-Gumbel copula
% negative log likelihood function

% Objective function

function nll = LLCTG(p,U)

par1 = p(1);
par2 = p(2);
par3 = p(3);
par4 = p(4);
par5 = p(5);
par6 = p(6);
par7 = p(7);

%%
nll = -sum(log(par1.*pdf('clayton',U,par4) + ...
      par2.*copulapdf('t',U,par5,par6)+ ...
      par3.*pdf('gumbel',U,par7)));
  


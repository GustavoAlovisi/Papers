%% AUXILIARY FUNCTION TO PASS TO OPTIMIZATION ALGORITHMS %%

% Multivariate Clayton-Frank-Gumbel copula
% negative log likelihood function

% Objective function

function nll = LLCFG(p,U)

par1 = p(1);
par2 = p(2);
par3 = p(3);
par4 = p(4);
par5 = p(5);
par6 = p(6);

%% check frank parameter is != 0
if (par5 < eps && par5 > -eps)
par5 = eps;
end

nll = -sum(log(par1.*pdf('clayton',U,par4) + ...
      par2.*pdf('frank',U,par5)+ ...
      par3.*pdf('gumbel',U,par6)));
  
% nll = -sum(log(par1.*clayton_pdf(U(:,1),U(:,2),par3) + ...
%       par2.*frank_pdf(U(:,1),U(:,2),par4)+ ...
%       (1-par1-par2).*gumbel_pdf(U(:,1),U(:,2),par5)));
    
% nll = log(nll);   
% nll = sum(nll);
% nll = - nll;

% End of the objective function
%% Fits Clayton-Frank-Gumbel Mixture Copula to data
% that has been transformed to [0,1]margins.
% (i.e. after margins have been fitted).
% Input: (n x d) Data matrix U, with [0,1] margins.
% Outputs: Maximum likelihood estimates for:
% lambda c - clayton mixture component
% lambda f - frank mixture component
% lambda g - gumbel mixture component
% rho c - clayton copula parameter
% rho f - clayton copula parameter
% rho g - gumbel copula parameter

function [lc, lf, lg, pc, pf, pg, nll] = copfit_cfg(U)

%% Fit clayton-frank-gumbel mixture copula using fmincon
% initialization of lambda, rho clayton, rho gumbel
%x0 = [0.33; 0.33; 0.34; 2; 2; 2];

% Specify the initial condition

%p0 = zeros(5,k1);

%% Fit clayton-frank-gumbel mixture copula using fmincon
% initialization of lambda, rho clayton, rho gumbel

p0 = [1/3; 1/3; 1/3; 2; 2; 2]; % Give some initial guess for the probabilities and thetas

% Make sure three lambdas add up to 1 !!!
Aeq = [1 1 1 0 0 0];
beq = [1];

% % Specify the lower and upper bdds
% lb = [0; 0; 0; eps; -10; 1];
% ub = [1; 1; 1; 10; 10; 10];

% Specify the lower and upper bdds

lb = [0, 0, 0, eps, 0, 1];
ub = [1, 1, 1, Inf, Inf, Inf];

% Make sure three lambdas add up to 1 !!!
% Aeq = [1 1 1 0 0 0];
% beq = [1]; 
options = optimset('Display','off','Algorithm','interior-point');

% Solve the optimization problem using fmincon

%LLCFG_ecdf = zeros(1,k1);

% for im = 1:k1
% [x(:,im), LLCFG_ecdf(1,im)] = fmincon('LLCFG', p0, A, b, [], [], lower, upper,[], options, [u1(:,im), v1(:,im)]);
% end


% fmincon
[p, nll] = fmincon(@(p) LLCFG(p,U), p0,[],[],Aeq,beq,lb,ub,[],options);

lc = p(1);
lf = p(2);
lg = p(3);
pc = p(4);
pf = p(5);
pg = p(6);


disp(['fmincon estimates: ' num2str(p') ]);

end

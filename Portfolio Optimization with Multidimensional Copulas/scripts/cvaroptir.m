function [pweights,CVaR] = cvaroptir(Er,r,beta)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%This function performs a CVaR minimization while a minimum 
%return constraint is imposed 
% 
% Inputs: 
%       r:  Matrix of size J x N  containing the N asset returns
%                  for the J scenarios considered (this matrix samples the 
%                  actual return distribution of the assets considered)
%       Er:    The minimum Expected Return for the portfolio 
%       b:       The confidence level used to calculate CVaR 
% 
% Outputs: 
%       pweights:   vector of size N containing the weights of the assets 
%                   in the optimal portfolio 
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%Find Size of the problem: No. of assets and No of scenarios 
[nSims, nAssets]=size(r); 

% Construct LP Problem 

%Function to be minimized 
ff=[1 zeros(1,nAssets) ones(1,nSims)/nSims/(1-beta)];
ff=ff';

%Inequalities on the dummy variables z 
%L.H.S. 
AA=[-ones(nSims,1) -r -eye(nSims)]; 

%R.h.s. 
bb=zeros(1+nSims,1);

%Inequality on expected return %L.H.S. 
AA=[AA;[0 -mean(r(:,:)) zeros(1,nSims)]]; 

%R.h.s. 
bb(1+nSims,1)=-Er;

%Lower Bounds 
lb=zeros(1+nAssets+nSims,1); 
lb(1,1)=-100;

%Equality (portfolio consistency) 
Aeq=[0  ones(1,nAssets) zeros(1,nSims)]; 
beq=[1]; 
tic 

%Call LinProg Subroutine 
options = optimoptions('linprog','Algorithm','interior-point','Display','off','MaxIter', 10^10, 'TolFun', 10e-8);
%[xx,fval,exitflag, output]=linprog(ff,AA,bb,Aeq,beq,lb,[],[],optimset('LargeScale','on','Simplex','off','Display','off')); 
%[xx,fval,exitflag, output]=linprog(ff,AA,bb,Aeq,beq,lb,[],[],optimset('LargeScale','on','interior-point','off','Display','off', 'MaxIter', 10^10, 'MaxFunEvals',10^10, 'TolFun', 10e-8)); 
[xx,fval,exitflag, output]=linprog(ff,AA,bb,Aeq,beq,lb,[],[],options); 

if exitflag < 1    
    disp(output); 
    disp(['No Assets = ' num2str(nAssets)  ' No Scenarios =' num2str(nSims) ]);    
    return 

end
pweights=xx(2:nAssets+1)';
% VaR=xx(1)';
CVaR=fval;
end
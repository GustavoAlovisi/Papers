function [alpha,tstat] = alpha_factor_model(ret_portfolio,factors_aux,constant,nwlags)

[t k]=size(ret_portfolio);

% Regress each series on the excess return

if constant ==0
    for i=1:k
        [EstCoeffCov,se,coeff] = hac(factors_aux,ret_portfolio(:,i),...
            'intercept',false,'bandwidth',nwlags,'display','off');
        beta(:,i) = coeff;
        tstat(:,i) = coeff./se;
    end
else
    for i=1:k
        [EstCoeffCov,se,coeff] = hac(factors_aux,ret_portfolio(:,i),...
            'intercept',true,'bandwidth',nwlags,'display','off');
        beta(:,i) = coeff;
        tstat(:,i) = coeff./se;
    end
end

alpha = beta(1,:);
tstat = tstat(1,:);


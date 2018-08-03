 function [beta,se,tstat] = beta_factor_model(ret_portfolio,factors_aux,nwlags)

[t k]=size(factors_aux);

% Regress each series on the excess return

for i=1:k
        [EstCoeffCov,se,coeff] = hac(factors_aux,ret_portfolio,...
            'intercept',true,'bandwidth',nwlags,'display','off');
        beta = coeff;
        se = se;
        tstat = coeff./se;
 end



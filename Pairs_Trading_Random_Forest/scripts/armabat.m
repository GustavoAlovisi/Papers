function [mbest,minaic,pbest,qbest]=armabat(x,pvec,qvec)
%
%   [mbest,minaic,pbest,qbest]=armabat(x,pvec,qvec)
%
% This functions computes ARMA  (p,q) models for 
% (p,q) in (pvec x qvec ); it returns the best according to AIC
% where AIC has been modified to account for fixed parameters
%
% x = input data
% pvec = vector of p's ; set pvec=[0] for no AR
% qvec = vector of q's; set qvec=0[] for no MA
% mbest = matlab model structure for the best one found using the matlab aic
%         the model parameters can be retreived from mbest
% minaic = value of the aic at the min
% pbest = best value of p found
% qbest = best value of q found

% now estimate ARMA model; ARMAX is AX=BU + Ce so identify phi with A and theta with C
%nx=length(x);
np=length(pvec);
nq=length(qvec);
aicsave=-99*ones(np,nq);
fpesave=-99*ones(np,nq);
minaic=1e+6;
for pp=1:np 
    p=pvec(pp);
    for qq=1:nq
        q=qvec(qq);
        if p+q ~=0
            orders=[p q];
            m=armax(x,orders);      % m is a structure with the model stuff in it
            resids=pe(m,x);         % pe returns the prediction errors
            nres=length(resids);
            rhores=acf(resids,1); % this returns the acf normalized by the variance
            nrho=length(rhores);  
            % next compute the Ljung - Box statistic and P-values
%             deltak=floor(nrho/10)+1;
%             kvec=[p+q+1:deltak:p+q+1+4*deltak];
%             for kk=1:5
%                 Qsum=0;
%                 for j=2:kvec(kk)+1
%                     Qsum=Qsum+(rhores(j).^2)/(nx-j);
%                 end
%                 Qsum=nx*(nx-1)*Qsum;
%                 ljpv(kk)=1-chi2cdf(Qsum,kvec(kk)-p-q);  % df=kvec(kk)-p-q
%             end
            aicsave(pp,qq)=aic(m);
            fpesave(pp,qq)=fpe(m);
            AICTEST=1;
            if AICTEST
                nval = m.EstimationInfo.DataLength;
                vval = m.EstimationInfo.LossFcn;
                totalpars=m.na+m.nc;
                netpars=totalpars-length(m.fix);
                aicval=log(vval)+2*netpars/nval;
                %disp(sprintf('AIC : %g  NEWAIC : %g',aicsave(pp,qq),aicval));
            end
            if aicsave(pp,qq) < minaic
                minaic=aicsave(pp,qq); % save the min
                pbest=p;
                qbest=q;
                mbest=m;
            end
            %disp(sprintf('(p,q)=(%d,%d) aic=%g  fpe=%g',p,q,aicsave(pp,qq),fpesave(pp,qq)));
%             QQ=[kvec;ljpv];
%             disp(sprintf('Ljung-Box P-values : '));
%             disp(sprintf('  K=%d P-v=%6.3e \n',QQ(:)));

        end
    end
end
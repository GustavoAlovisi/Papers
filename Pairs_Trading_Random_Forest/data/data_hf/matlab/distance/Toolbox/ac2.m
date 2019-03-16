function [a,q,p] = ac2(x,lags,type,test,plot)
% [a,q,p] = AC2(X,LAGS,TYPE,TEST,PLOT)
% Calculates sample autocorrelations coefficients for each columns in X.
% The number of coefficients must be specified in LAGS. Results include
% test for significance and Chi-squared test whether all rho(i) are zero
% up to specified lags using  Box-Pierce (1970) or small sample adjusted
% Ljung-Box (1978) test statistic.
% 
% Input:
%	x	matrix of time series 
%	lags	number of lags
%	type	0 if unadjusted coefficients
%		1 if adjusted coefficients (i.e. n*r/(n-rho))
%	test	0 no test
%		1 test whether all rho(i)=0, where i=1..lags using Box-Pierce (1970)
%		2 test whether all rho(i)=0, where i=1..lags using Ljung-Box (1978)
%	plot	1 print out the result table
%
% Output:
%	a	matrix of autocorrelation coefficients
%	q	vector of Q-statistics for all a=0
%	p	vector of p-values (1-chi2)
%
% Notes:
%	Equations specified as in Green (1993), p. 426-427,
%	and Mills (1993), p. 24-26.
%
% (c) Mika Vaihekoski 30.5.1996

q    = 0;
sum1 = 0;
sum2 = 0;
[T,s]= size(x);
	m    = nanmean(x);
	sum2 = nansum( (x-ones(T,1)*m).^2 );
for i=1:lags
	sum1 = nansum( (x((i+1):T,:)-ones(T-i,1)*m) .* (x(1:(T-i),:)-ones(T-i,1)*m) );
   if type == 0
	a(i,:)=sum1./sum2;
   else
	a(i,:)=T*(sum1./sum2)/(T-i);	
   end
   if test == 1
   	q=q+(a(i,:).^2);				% Box & Pierce (1970) Q
   elseif test == 2
 	q=q+(a(i,:).^2).*(1/(T-i));			% Ljung & Box (1978) Q*
   end
end							
 q=q*T*(1+(test==2)*(T+2));
if type == 0 & plot == 1
	disp('  ');
	disp(' Sample autocorrelation coefficients');
elseif plot == 1
	disp('  ');
	disp(' Adjusted sample autocorrelation coefficients');
end

i2=zeros(lags,s);
i2(1,1:s)=ones(1,s)/T;

for i=1:s
	i1(1,i)=i;
	i3(1,i)=(abs(a(1,i)) > (1.96 * sqrt(i2(1,i)) )); % 5 percent level -> 1.96 * st.dev.
	if lags>1
	 i2(2,i)=(1+2*a(2,i).^2)/T;
	 i3(2,i)=(abs(a(2,i)) > (1.96 * sqrt(i2(2,i)) ));% 5 percent level -> 1.96 * st.dev.
	end;
end
if lags>2,
	for j=3:lags
	i2(j,:)=((1+2*nansum(a(1:(j-1),:).^2))/T);
	i3(j,:)=abs(a(j,:)) > (1.96 * sqrt(i2(j,:)) );	 % 5 percent level -> 1.96 * st.dev.
	end
end
	q1=chi2cdf(q,i);
	
if plot == 1
	disp('   ');
	disp(rowlab2([' Equation: --------->'],'',i1(1,:),0,8));
 for i=1:lags
	s1=zeros(1,s);
	s2=zeros(1,s);
		disp(rowlab2([' Rho lag             ',num2str(i)],'',a(i,:),3,8));
		disp(rowlab2(['  St. dev.     :      '],'',sqrt(i2(i,:)),3,8));
		disp(rowlab2(['  Significance :      '],'',i3(i,:),0,8));
 end
 if test == 1
 		disp(rowlab2([' *Box & Pierce:       '],'',q,3,8));
 elseif test == 2		
  		disp(rowlab2([' *Ljung & Box:        '],'',q,3,8));
 end
		disp(rowlab2([' *Sign. (p-value) =   '],'',1-q1,3,8));
		disp('   ');
end

p=1-q1;


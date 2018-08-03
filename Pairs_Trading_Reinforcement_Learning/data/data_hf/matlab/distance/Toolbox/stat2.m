function desc = stat2(x,sample,decim,output)
% desc = STAT2(x,sample,decim,output)
% calculates statistical descriptives for each columns in X-matrix.
% The first four central moments can be calculated using formula for
% asymptotic, sample or even small sample adjusted central moments.
% Output includes also Bera-Jarque (1980) test for normality and 
% 1st autocorrelation coefficient if required.
%
% Input:
%	x	time series
%	sample	0 = asymptotic central moments
%		1 = use sample central moments
%		2 = use sample central moments with small sample adjustments
%	decim	number of decimals in the output
% 	output	0 = do not display
%		1 = display only moments
%		2 = display also test for normality
%		3 = display also 1st autocorrelation
% Output:
%	desc	1st row: geometric mean
%		2nd row: standard deviation
%		3rd row: coefficient for the skewnewss
%		4th row: coefficient for the degree of excess kurtosis
% Display only:
%	       (5th row: W test-statictic for normality)
%	       (6th row: p-value for W with Chi2 with 2 df)
%	       (7th row: 1st autocorrelation)
%
%
% (c) Adapted from Mika Vaihekoski 24.1.1996

disp(' ');
[r,c]=size(x);
a=zeros(4,c);
if sample == 0,
	%disp('Descriptive statistics (asymptotic central moments)');
	a(1,:)=geomean(x)-1;
	a(2,:)=geostd(x)-1;
	a(3,:)=nansum((x - ones(r,1)*(geomean(x)-1)).^3./(ones(r,1)*a(2,:).^3)) / (r-1);
	a(4,:)=nansum((x - ones(r,1)*(geomean(x)-1)).^4./(ones(r,1)*a(2,:).^4)) / (r-1);
elseif sample > 0,
	s1=nansum(x)/r;
	s2=nansum(x.^2)/r;
	s3=nansum(x.^3)/r;
	s4=nansum(x.^4)/r;
	m2=s2 - (s1.^2);
	m3=s3 - 3 .* s1 .* s2 + 2 .* (s1.^3);
	m4=s4 - 4.*s1.*s3 + 6.*(s1.^2).*s2 - 3.*(s1.^4);
	a(1,:)=geomean(x)-1;
	a(2,:)=geostd(x)-1;
	a(3,:)=m3./(m2.^1.5);
	a(4,:)=(m4./(m2.^2))-3;
        if sample == 2,
		k2=r*m2/(r-1);
		k3=r^2*m3/((r-1)*(r-2));
		k4=r^2*((r+1)*m4-3*(r-1)*m2.^2)/((r-1)*(r-2)*(r-3));
		a(3,:)=k3./(k2.^1.5);
		a(4,:)=k4./(k2.^2);
		%disp('Descriptive statistics (sample central moments with small sample adjustment)');
	%else    disp('Descriptive statistics (sample central moments)');
	end
end
disp(' ');
if output > 0,
	disp(rowlab2('  Geometric Mean:     ','',a(1,:),decim,10));
	disp(rowlab2('  Standard Deviation:  ','',a(2,:),decim,10));
	disp(rowlab2('  Skewness:            ','',a(3,:),decim,10));
	disp(rowlab2('  Excess Kurtosis:     ','',a(4,:),decim,10));
end
if output > 1,
	w=r*((a(3,:).^2)/6 + (a(4,:).^2)/24);
	p=chi2cdf(w,2);
	disp(rowlab2('  Bera-Jarque chi(2):  ','',w,decim,10));
	disp(rowlab2('  p-value:             ','',1-p,decim,10));
end
if output == 3,
	[autoc,q,p]=ac2(x,1,1,0,0);
	disp(rowlab2('  1st Autocorrelation: ','',autoc,decim,10));
end
disp('  ');
desc=a;




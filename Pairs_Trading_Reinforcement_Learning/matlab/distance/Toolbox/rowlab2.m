function a = rowlab2(x1,x2,x3,x4,x5)
% a = ROWLAB2(x1,x2,x3,x4,x5) return in variable a, a line where
% vector x3 is modified according to x4 and x5.
%
% Input:
%	x1 = line text
%	x2 = number of tabs
%	x3 = vector of numbers
%	x4 = number of decimal points (default=3)
%	x5 = space lenght for the numbers (default=10)
%
% Output:
%	a  = requested text line
%
% (c) Mika Vaihekoski

if 	nargin<5
	x5=10;	
elseif 	nargin<4,
	x4=3;
	x5=10;
end
b=size(x3,2);
if b*x4 > 21
	x5=max(4+x4,min(10,fix(75/b)));
end
i=100*(x5-x4);
a=['%',num2str(x5+1),'.',num2str(x4),'f'];	% set format
b1=sprintf(a,x3(:,2:b));
a1=['%',num2str(10),'.',num2str(x4),'f'];	% set format to 1st value
b2=sprintf(a1,x3(:,1));
%i=ones(1,x2);
%x2=char(9)*i;
x2=char(9);
a=[x1,x2,b2,b1];



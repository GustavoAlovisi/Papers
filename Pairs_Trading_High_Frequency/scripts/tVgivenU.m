function ddut = tVgivenU(u,v,nu,theta)

df = nu;
u1= u;
v1= v;

U=[u v];

R= tinv(U,df);

ddut= tcdf(sqrt((df+1)./(df+R(:,1).^2))./sqrt(1-theta.^2).*(R(:,2)-theta.*R(:,1)),df+1);

function ddvt = tUgivenV(u,v,nu,theta)

df = nu;
u1= u;
v1= v;

U=[u v];

R= tinv(U,df);

ddvt= tcdf(sqrt((df+1)./(df+R(:,2).^2))./sqrt(1-theta.^2).*(R(:,1)-theta.*R(:,2)),df+1);

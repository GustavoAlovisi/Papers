function ddvFrank = FrankUgivenV(u,v,theta)

u1= u;
v1= v;

ddvFrank= exp(-theta*v1).*(exp(-theta*u1)-1)./((exp(-theta)-1)+(exp(-theta*v1)-1).*(exp(-theta*u1)-1));


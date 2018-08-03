function ddunorm = normVgivenU(u,v,theta)

u1= norminv(u);
v1= norminv(v);

ddunorm= normcdf(v1,theta*u1,sqrt(1-theta.^2));
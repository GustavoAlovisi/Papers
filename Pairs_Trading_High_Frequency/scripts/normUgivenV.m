function ddvnorm = normUgivenV(u,v,theta)

u1= norminv(u);
v1= norminv(v);

ddvnorm= normcdf(u1,theta*v1,sqrt(1-theta.^2));
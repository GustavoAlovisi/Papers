function ddvClayton = ClaytonUgivenV(u,v,theta)

u1= u;
v1= v;

ddvClayton= (v1.^(-theta)+ u1.^(-theta)-1).^((-1-theta)/theta).*v1.^(-theta-1);
function dduClayton = ClaytonVgivenU(u,v,theta)

u1= u;
v1= v;

dduClayton= (u1.^(-theta)+ v1.^(-theta)-1).^((-1-theta)/theta).*u1.^(-theta-1);
function dduGumbel = GumbelVgivenU(u,v,theta)

U= [u v];
u1= u;
v1= v;

dduGumbel= copulacdf('Gumbel',U,theta).*((-log(u1)).^theta + (-log(v1)).^theta).^(1/theta-1).*(-log(u1)).^(theta-1)./u1;



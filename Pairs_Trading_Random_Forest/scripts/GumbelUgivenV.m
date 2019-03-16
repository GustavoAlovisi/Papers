function ddvGumbel = GumbelUgivenV(u,v,theta)

U= [u v];
u1= u;
v1= v;

ddvGumbel= copulacdf('Gumbel',U,theta).*((-log(v1)).^theta + (-log(u1)).^theta).^(1/theta-1).*(-log(v1)).^(theta-1)./v1;



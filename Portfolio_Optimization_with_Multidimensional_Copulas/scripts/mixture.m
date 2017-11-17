addpath('C:\Users\Fernando\Desktop\CopulaMatlab\copula-matlab');

lc= zeros(size(unif,1),1); lf= lc; lg= lc; pc= lc; pf= lc; pg= lc; nll= lc;

for k=1:size(unif,1)-1011
    for i=1:
        
[lc(k), lf(k), lg(k), pc(k), pf(k), pg(k),~] = ...
    copfit_cfg(unif(,:));
    end

end

mix = table(lc, lf,lg, pc, pf, pg, 'VariableNames',{'lc','lf','lg',...
    'pc', 'pf', 'pg'});

writetable(mix,'C:\Users\Fernando\Desktop\paper3\mixture_sse\mixture.xlsx','WriteVariableNames',true,...
    'WriteRowNames',false,'Sheet',1);

window = zeros(43,1);
for i=1:43 
    window(i)= sum(per6(9:(8+i),1));
end



CR_g = zeros(6173-250,1);
CR_m = zeros(6173-250,1);
viol = zeros(6173-250,1);
delta = zeros(6173-250,1);
viol_m = zeros(6173-250,1);
delta_m = zeros(6173-250,1);

for i = 1:(6173-250); 

    viol(i) = numel(find(VaR5(1,i:i+249) < VaR5(1,i+250)));

end


for i = 1:(6173-250); 
    
    if viol(i) <=4
        delta(i) = 0;
    elseif 5 <= viol(i) <= 6
        delta(i) = 0.3 + 0.1*(viol(i)-4);
    elseif viol(i) == 7
        delta(i) = 0.65;
    elseif 8 <= viol(i) <= 9
        delta(i) = 0.65 + 0.1*(viol(i)-7);
    else delta(i) = 1;
    end
    
    
end

for i = 1:(6173-250);
    CR_g(i)= max(((3+ delta(i))/60)*sum(VaR5(1,i:i+59)),VaR5(1,i+59));
end

for i = 1:(6173-250); 

    viol_m(i) = numel(find(VaR5m(i:i+249,1) < VaR5m(i+250,1)));

end


for i = 1:(6173-250); 
    
    if viol_m(i) <=4
        delta(i) = 0;
    elseif 5 <= viol_m(i) <= 6
        delta(i) = 0.3 + 0.1*(viol_m(i)-4);
    elseif viol_m(i) == 7
        delta(i) = 0.65;
    elseif 8 <= viol_m(i) <= 9
        delta(i) = 0.65 + 0.1*(viol_m(i)-7);
    else delta(i) = 1;
    end
    
    
end

for i = 1:(6173-250);
    CR_m(i)= max(((3+ delta(i))/60)*sum(VaR5m(i:i+59,1)),VaR5m(i+59,1));
end


               
                
                
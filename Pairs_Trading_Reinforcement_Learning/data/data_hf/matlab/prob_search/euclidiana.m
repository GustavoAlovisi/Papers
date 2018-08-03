function[w0, fitness] = euclidiana(ret)

%2. Set Parameters to the optimization
    [T, N] = size(ret);
    w0 = ones(N/2,1)*(1/(N/2));
    rL = ret(:,1:(N/2))*w0;
    rS = ret(:,(1+N/2:end))*w0;
    Rt = [rL rS];
    %Obs: sizeP quando o n�mero � �mpar.

i=1;IPt = ones(25,2);
    for j=1:2
        m = 0;
        for i2=2:375 %Two_mo(250) + Six_mo(125)
            if Rt(i+i2-1,j)>0 && m == 0
                IPt(i2,j)= 1;  m= 1;
            elseif Rt(i+i2-1,j)>0 && m == 1
                IPt(i2,j) = IPt(i2-1,j) * (1 + Rt(i+i2-1,j));
            else
                IPt(i2,j) = IPt(i2-1,j);
            end
        end
    end


fitness = sum((IPt(:,1) - IPt(:,2)).^2);
% Obs: A dist�ncia j� � a fitness. 
% Por�m, a fitness dividiu as a��es em dois grupos.
% Deveriam ser todos contra todos. Estas a��es foram
% as escolhidas (long e short)?

end
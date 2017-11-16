clear all; close all; clc;
addpath('C:\Users\Fernando\Desktop\PDS\cvx\kevinsheppard_multivariate\multivariate');
addpath('C:\Users\Fernando\Desktop\PDS\cvx\utility');
addpath('C:\Users\Fernando\Desktop\PDS\cvx');
addpath('C:\Users\Fernando\Desktop\Fernando\MFE');
addpath('C:\Users\Fernando\Desktop\Fernando\PTCop'); 
addpath('C:\Program Files\MATLAB\R2012b\toolbox\stats');
addpath('C:\Users\Fernando\Desktop\Fernando\PTCop\Patton_copula_toolbox');
addpath('C:\Users\Fernando\Desktop\Fernando\PTCop\ARMAX_GARCH_K_Toolbox');
addpath('C:\Users\Fernando\Desktop\Fernando\MFE\MFEToolbox\univariate');
addpath('C:\Users\Fernando\Desktop\Fernando\MFE\MFEToolbox\distributions');
addpath('C:\Users\Fernando\Desktop\Fernando\MFE\MFEToolbox\mex_source');
addpath('C:\Users\Fernando\Desktop\Paper Cristina\New Folder\Codes Matlab');
addpath('C:\Users\Fernando\Desktop\Fernando\PairsTrading_FEX\PairsTrading_FEX\m_Files');
addpath('C:\Users\Fernando\Desktop\Fernando\MFE\Matlab5\TOOLBOX\MATLAB\OMAT');
addpath('C:\Users\Fernando\Desktop\Fernando\PDS\codigos');
addpath('C:\Users\Fernando\Desktop\Fernando\Garch');
addpath('C:\Users\Fernando\Desktop\Fernando\codes');
addpath('C:\Users\Fernando\Desktop\paper3')
addpath('C:\Users\Fernando\Desktop\paper3\Nova pasta');
addpath('C:\Users\Fernando\Desktop\paper1');
addpath('C:\Users\Fernando\Desktop\CopulaMatlab\copula-matlab');
addpath('C:\Users\Fernando\Desktop\paper3\Nova pasta');
addpath('C:\Users\Fernando\Desktop\paper3\rev_09_07');

load SP500
load emp
load per48
load per6
load Rt50
%load rsim
load data_aux

Rt50 = data_aux;

L=6425; T=1011; n=50; one_over_n = ones(n,1)/n; nsim= 1000;

P = zeros((L-T)*n,n); A = zeros((L-T)*n,n); ret = zeros((L-T),n); 
sig = zeros((L-T),n); U = zeros(nsim*(L-T),n); zsim = zeros(nsim*(L-T),n);
Z = zeros(nsim*(L-T),n); X= zeros(nsim*(L-T),n);

window = zeros(43,1);

for i=1:43
    window(i)= sum(per6(9:8+i,1));
end

int_w = [0;window];

for j=1:43
    
    disp(['Period ',num2str(j)]);

for k=int_w(j)+1:int_w(j+1)
    
    disp(['d ',num2str(k)]);
    
    P((50*k-49):(50*k),:)=corr(norminv(unif(k:per48(j)+k-1,:)));
    
    % Simulation (non-vectorized version)
    A((50*k-49):(50*k),:) = chol(P((50*k-49):(50*k),:))';
    
    for l = (k*nsim-(nsim-1):(k*nsim))
      Z = normrnd(0,1,[1 50]);
      X = A((50*k-49):(50*k),:)*Z';
      % should be U[0,1]
      U(l,:) = normcdf(X,0,1)';         
    end

% bad programming, but for my purposes I wanted to check one by one.
    
  zsim((k*nsim-(nsim-1):(k*nsim)),1) = norminv(U((k*nsim-(nsim-1):(k*nsim)),1),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),1),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),2) = norminv(U((k*nsim-(nsim-1):(k*nsim)),2),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),2),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),3) = norminv(U((k*nsim-(nsim-1):(k*nsim)),3),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),3),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),4) = norminv(U((k*nsim-(nsim-1):(k*nsim)),4),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),4),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),5) = norminv(U((k*nsim-(nsim-1):(k*nsim)),5),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),5),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),6) = norminv(U((k*nsim-(nsim-1):(k*nsim)),6),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),6),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),7) = norminv(U((k*nsim-(nsim-1):(k*nsim)),7),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),7),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),8) = norminv(U((k*nsim-(nsim-1):(k*nsim)),8),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),8),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),9) = norminv(U((k*nsim-(nsim-1):(k*nsim)),9),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),9),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),10) = norminv(U((k*nsim-(nsim-1):(k*nsim)),10),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),10),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),11) = norminv(U((k*nsim-(nsim-1):(k*nsim)),11),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),11),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),12) = norminv(U((k*nsim-(nsim-1):(k*nsim)),12),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),12),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),13) = norminv(U((k*nsim-(nsim-1):(k*nsim)),13),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),13),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),14) = norminv(U((k*nsim-(nsim-1):(k*nsim)),14),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),14),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),15) = norminv(U((k*nsim-(nsim-1):(k*nsim)),15),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),15),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),16) = norminv(U((k*nsim-(nsim-1):(k*nsim)),16),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),16),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),17) = norminv(U((k*nsim-(nsim-1):(k*nsim)),17),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),17),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),18) = norminv(U((k*nsim-(nsim-1):(k*nsim)),18),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),18),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),19) = norminv(U((k*nsim-(nsim-1):(k*nsim)),19),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),19),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),20) = norminv(U((k*nsim-(nsim-1):(k*nsim)),20),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),20),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),21) = norminv(U((k*nsim-(nsim-1):(k*nsim)),21),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),21),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),22) = norminv(U((k*nsim-(nsim-1):(k*nsim)),22),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),22),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),23) = norminv(U((k*nsim-(nsim-1):(k*nsim)),23),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),23),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),24) = norminv(U((k*nsim-(nsim-1):(k*nsim)),24),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),24),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),25) = norminv(U((k*nsim-(nsim-1):(k*nsim)),25),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),25),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),26) = norminv(U((k*nsim-(nsim-1):(k*nsim)),26),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),26),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),27) = norminv(U((k*nsim-(nsim-1):(k*nsim)),27),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),27),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),28) = norminv(U((k*nsim-(nsim-1):(k*nsim)),28),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),28),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),29) = norminv(U((k*nsim-(nsim-1):(k*nsim)),29),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),29),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),30) = norminv(U((k*nsim-(nsim-1):(k*nsim)),30),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),30),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),31) = norminv(U((k*nsim-(nsim-1):(k*nsim)),31),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),31),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),32) = norminv(U((k*nsim-(nsim-1):(k*nsim)),32),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),32),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),33) = norminv(U((k*nsim-(nsim-1):(k*nsim)),33),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),33),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),34) = norminv(U((k*nsim-(nsim-1):(k*nsim)),34),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),34),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),35) = norminv(U((k*nsim-(nsim-1):(k*nsim)),35),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),35),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),36) = norminv(U((k*nsim-(nsim-1):(k*nsim)),36),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),36),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),37) = norminv(U((k*nsim-(nsim-1):(k*nsim)),37),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),37),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),38) = norminv(U((k*nsim-(nsim-1):(k*nsim)),38),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),38),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),39) = norminv(U((k*nsim-(nsim-1):(k*nsim)),39),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),39),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),40) = norminv(U((k*nsim-(nsim-1):(k*nsim)),40),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),40),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),41) = norminv(U((k*nsim-(nsim-1):(k*nsim)),41),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),41),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),42) = norminv(U((k*nsim-(nsim-1):(k*nsim)),42),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),42),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),43) = norminv(U((k*nsim-(nsim-1):(k*nsim)),43),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),43),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),44) = norminv(U((k*nsim-(nsim-1):(k*nsim)),44),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),44),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),45) = norminv(U((k*nsim-(nsim-1):(k*nsim)),45),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),45),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),46) = norminv(U((k*nsim-(nsim-1):(k*nsim)),46),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),46),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),47) = norminv(U((k*nsim-(nsim-1):(k*nsim)),47),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),47),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),48) = norminv(U((k*nsim-(nsim-1):(k*nsim)),48),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),48),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),49) = norminv(U((k*nsim-(nsim-1):(k*nsim)),49),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),49),0,1));
  zsim((k*nsim-(nsim-1):(k*nsim)),50) = norminv(U((k*nsim-(nsim-1):(k*nsim)),50),0,1)/std(norminv(U((k*nsim-(nsim-1):(k*nsim)),50),0,1));
          
end

end

coef_w = [coef(:,7) coef(:,14) coef(:,21) coef(:,28) coef(:,35)...
coef(:,42) coef(:,49) coef(:,56) coef(:,63) coef(:,70)...
coef(:,77) coef(:,84) coef(:,91) coef(:,98) coef(:,105)...
coef(:,112) coef(:,119) coef(:,126) coef(:,133) coef(:,140)...
coef(:,147) coef(:,154) coef(:,161) coef(:,168) coef(:,175)...
coef(:,182) coef(:,189) coef(:,196) coef(:,203) coef(:,210)...
coef(:,217) coef(:,224) coef(:,231) coef(:,238) coef(:,245)...
coef(:,252) coef(:,259) coef(:,266) coef(:,273) coef(:,280)...
coef(:,287) coef(:,294) coef(:,301) coef(:,308) coef(:,315)...
coef(:,322) coef(:,329) coef(:,336) coef(:,343) coef(:,350)];

coef_c = [coef(:,1:6) coef(:,8:13) coef(:,15:20) coef(:,22:27) coef(:,29:34)...
coef(:,36:41) coef(:,43:48) coef(:,50:55) coef(:,57:62) coef(:,64:69)...
coef(:,71:76) coef(:,78:83) coef(:,85:90) coef(:,92:97) coef(:,99:104)...
coef(:,106:111) coef(:,113:118) coef(:,120:125) coef(:,127:132) coef(:,134:139)...
coef(:,141:146) coef(:,148:153) coef(:,155:160) coef(:,162:167) coef(:,169:174)...
coef(:,176:181) coef(:,183:188) coef(:,190:195) coef(:,197:202) coef(:,204:209)...
coef(:,211:216) coef(:,218:223) coef(:,225:230) coef(:,232:237) coef(:,239:244)...
coef(:,246:251) coef(:,253:258) coef(:,260:265) coef(:,267:272) coef(:,274:279)...
coef(:,281:286) coef(:,288:293) coef(:,295:300) coef(:,302:307) coef(:,309:314)...
coef(:,316:321) coef(:,323:328) coef(:,330:335) coef(:,337:342) coef(:,344:349)];

% 
mu1 = coef_c(:,1); ar1 = coef_c(:,2); a1 = coef_c(:,3); b1 = coef_c(:,4); sk1 = coef_c(:,5); s1 = coef_c(:,6);
mu2 = coef_c(:,7); ar2 = coef_c(:,8); a2 = coef_c(:,9); b2 = coef_c(:,10); sk2 = coef_c(:,11); s2 = coef_c(:,12);
mu3 = coef_c(:,13); ar3 = coef_c(:,14); a3 = coef_c(:,15); b3 = coef_c(:,16); sk3 = coef_c(:,17); s3 = coef_c(:,18);
mu4 = coef_c(:,19); ar4 = coef_c(:,20); a4 = coef_c(:,21); b4 = coef_c(:,22); sk4 = coef_c(:,23); s4 = coef_c(:,24);
mu5 = coef_c(:,25); ar5 = coef_c(:,26); a5 = coef_c(:,27); b5 = coef_c(:,28); sk5 = coef_c(:,29); s5 = coef_c(:,30);
mu6 = coef_c(:,31); ar6 = coef_c(:,32); a6 = coef_c(:,33); b6 = coef_c(:,34); sk6 = coef_c(:,35); s6 = coef_c(:,36);
mu7 = coef_c(:,37); ar7 = coef_c(:,38); a7 = coef_c(:,39); b7 = coef_c(:,40); sk7 = coef_c(:,41); s7 = coef_c(:,42);
mu8 = coef_c(:,43); ar8 = coef_c(:,44); a8 = coef_c(:,45); b8 = coef_c(:,46); sk8 = coef_c(:,47); s8 = coef_c(:,48);
mu9 = coef_c(:,49); ar9 = coef_c(:,50); a9 = coef_c(:,51); b9 = coef_c(:,52); sk9 = coef_c(:,53); s9 = coef_c(:,54);
mu10 = coef_c(:,55); ar10 = coef_c(:,56); a10 = coef_c(:,57); b10 = coef_c(:,58); sk10 = coef_c(:,59); s10 = coef_c(:,60);
mu11 = coef_c(:,61); ar11 = coef_c(:,62); a11 = coef_c(:,63); b11 = coef_c(:,64); sk11 = coef_c(:,65); s11 = coef_c(:,66);
mu12 = coef_c(:,67); ar12 = coef_c(:,68); a12 = coef_c(:,69); b12 = coef_c(:,70); sk12 = coef_c(:,71); s12 = coef_c(:,72);
mu13 = coef_c(:,73); ar13 = coef_c(:,74); a13 = coef_c(:,75); b13 = coef_c(:,76); sk13 = coef_c(:,77); s13 = coef_c(:,78);
mu14 = coef_c(:,79); ar14 = coef_c(:,80); a14 = coef_c(:,81); b14 = coef_c(:,82); sk14 = coef_c(:,83); s14 = coef_c(:,84);
mu15 = coef_c(:,85); ar15 = coef_c(:,86); a15 = coef_c(:,87); b15 = coef_c(:,88); sk15 = coef_c(:,89); s15 = coef_c(:,90);
mu16 = coef_c(:,91); ar16 = coef_c(:,92); a16 = coef_c(:,93); b16 = coef_c(:,94); sk16 = coef_c(:,95); s16 = coef_c(:,96);
mu17 = coef_c(:,97); ar17 = coef_c(:,98); a17 = coef_c(:,99); b17 = coef_c(:,100); sk17 = coef_c(:,101); s17 = coef_c(:,102);
mu18 = coef_c(:,103); ar18 = coef_c(:,104); a18 = coef_c(:,105); b18 = coef_c(:,106); sk18 = coef_c(:,107); s18 = coef_c(:,108);
mu19 = coef_c(:,109); ar19 = coef_c(:,110); a19 = coef_c(:,111); b19 = coef_c(:,112); sk19 = coef_c(:,113); s19 = coef_c(:,114);
mu20 = coef_c(:,115); ar20 = coef_c(:,116); a20 = coef_c(:,117); b20 = coef_c(:,118); sk20 = coef_c(:,119); s20 = coef_c(:,120);
mu21 = coef_c(:,121); ar21 = coef_c(:,122); a21 = coef_c(:,123); b21 = coef_c(:,124); sk21 = coef_c(:,125); s21 = coef_c(:,126);
mu22 = coef_c(:,127); ar22 = coef_c(:,128); a22 = coef_c(:,129); b22 = coef_c(:,130); sk22 = coef_c(:,131); s22 = coef_c(:,132);
mu23 = coef_c(:,133); ar23 = coef_c(:,134); a23 = coef_c(:,135); b23 = coef_c(:,136); sk23 = coef_c(:,137); s23 = coef_c(:,138);
mu24 = coef_c(:,139); ar24 = coef_c(:,140); a24 = coef_c(:,141); b24 = coef_c(:,142); sk24 = coef_c(:,143); s24 = coef_c(:,144);
mu25 = coef_c(:,145); ar25 = coef_c(:,146); a25 = coef_c(:,147); b25 = coef_c(:,148); sk25 = coef_c(:,149); s25 = coef_c(:,150);
mu26 = coef_c(:,151); ar26 = coef_c(:,152); a26 = coef_c(:,153); b26 = coef_c(:,154); sk26 = coef_c(:,155); s26 = coef_c(:,156);
mu27 = coef_c(:,157); ar27 = coef_c(:,158); a27 = coef_c(:,159); b27 = coef_c(:,160); sk27 = coef_c(:,161); s27 = coef_c(:,162);
mu28 = coef_c(:,163); ar28 = coef_c(:,164); a28 = coef_c(:,165); b28 = coef_c(:,166); sk28 = coef_c(:,167); s28 = coef_c(:,168);
mu29 = coef_c(:,169); ar29 = coef_c(:,170); a29 = coef_c(:,171); b29 = coef_c(:,172); sk29 = coef_c(:,173); s29 = coef_c(:,174);
mu30 = coef_c(:,175); ar30 = coef_c(:,176); a30 = coef_c(:,177); b30 = coef_c(:,178); sk30 = coef_c(:,179); s30 = coef_c(:,180);
mu31 = coef_c(:,181); ar31 = coef_c(:,182); a31 = coef_c(:,183); b31 = coef_c(:,184); sk31 = coef_c(:,185); s31 = coef_c(:,186);
mu32 = coef_c(:,187); ar32 = coef_c(:,188); a32 = coef_c(:,189); b32 = coef_c(:,190); sk32 = coef_c(:,191); s32 = coef_c(:,192);
mu33 = coef_c(:,193); ar33 = coef_c(:,194); a33 = coef_c(:,195); b33 = coef_c(:,196); sk33 = coef_c(:,197); s33 = coef_c(:,198);
mu34 = coef_c(:,199); ar34 = coef_c(:,200); a34 = coef_c(:,201); b34 = coef_c(:,202); sk34 = coef_c(:,203); s34 = coef_c(:,204);
mu35 = coef_c(:,205); ar35 = coef_c(:,206); a35 = coef_c(:,207); b35 = coef_c(:,208); sk35 = coef_c(:,209); s35 = coef_c(:,210);
mu36 = coef_c(:,211); ar36 = coef_c(:,212); a36 = coef_c(:,213); b36 = coef_c(:,214); sk36 = coef_c(:,215); s36 = coef_c(:,216);
mu37 = coef_c(:,217); ar37 = coef_c(:,218); a37 = coef_c(:,219); b37 = coef_c(:,220); sk37 = coef_c(:,221); s37 = coef_c(:,222);
mu38 = coef_c(:,223); ar38 = coef_c(:,224); a38 = coef_c(:,225); b38 = coef_c(:,226); sk38 = coef_c(:,227); s38 = coef_c(:,228);
mu39 = coef_c(:,229); ar39 = coef_c(:,230); a39 = coef_c(:,231); b39 = coef_c(:,232); sk39 = coef_c(:,233); s39 = coef_c(:,234);
mu40 = coef_c(:,235); ar40 = coef_c(:,236); a40 = coef_c(:,237); b40 = coef_c(:,238); sk40 = coef_c(:,239); s40 = coef_c(:,240);
mu41 = coef_c(:,241); ar41 = coef_c(:,242); a41 = coef_c(:,243); b41 = coef_c(:,244); sk41 = coef_c(:,245); s41 = coef_c(:,246);
mu42 = coef_c(:,247); ar42 = coef_c(:,248); a42 = coef_c(:,249); b42 = coef_c(:,250); sk42 = coef_c(:,251); s42 = coef_c(:,252);
mu43 = coef_c(:,253); ar43 = coef_c(:,254); a43 = coef_c(:,255); b43 = coef_c(:,256); sk43 = coef_c(:,257); s43 = coef_c(:,258);
mu44 = coef_c(:,259); ar44 = coef_c(:,260); a44 = coef_c(:,261); b44 = coef_c(:,262); sk44 = coef_c(:,263); s44 = coef_c(:,264);
mu45 = coef_c(:,265); ar45 = coef_c(:,266); a45 = coef_c(:,267); b45 = coef_c(:,268); sk45 = coef_c(:,269); s45 = coef_c(:,270);
mu46 = coef_c(:,271); ar46 = coef_c(:,272); a46 = coef_c(:,273); b46 = coef_c(:,274); sk46 = coef_c(:,275); s46 = coef_c(:,276);
mu47 = coef_c(:,277); ar47 = coef_c(:,278); a47 = coef_c(:,279); b47 = coef_c(:,280); sk47 = coef_c(:,281); s47 = coef_c(:,282);
mu48 = coef_c(:,283); ar48 = coef_c(:,284); a48 = coef_c(:,285); b48 = coef_c(:,286); sk48 = coef_c(:,287); s48 = coef_c(:,288);
mu49 = coef_c(:,289); ar49 = coef_c(:,290); a49 = coef_c(:,291); b49 = coef_c(:,292); sk49 = coef_c(:,293); s49 = coef_c(:,294);
mu50 = coef_c(:,295); ar50 = coef_c(:,296); a50 = coef_c(:,297); b50 = coef_c(:,298); sk50 = coef_c(:,299); s50 = coef_c(:,300);

coef_aux =[coef_c coef_w];

w1 = coef_aux(:,301); w2 = coef_aux(:,302); w3 = coef_aux(:,303); w4 = coef_aux(:,304); w5 = coef_aux(:,305); w6 = coef_aux(:,306); w7 = coef_aux(:,307); 
w8 = coef_aux(:,308); w9 = coef_aux(:,309); w10 = coef_aux(:,310); w11 = coef_aux(:,311); w12 = coef_aux(:,312); w13 = coef_aux(:,313); 
w14 = coef_aux(:,314); w15 = coef_aux(:,315); w16 = coef_aux(:,316); w17 = coef_aux(:,317); w18 = coef_aux(:,318); w19 = coef_aux(:,319); 
w20 = coef_aux(:,320); w21 = coef_aux(:,321); w22 = coef_aux(:,322); w23 = coef_aux(:,323); w24 = coef_aux(:,324); w25 = coef_aux(:,325); 
w26 = coef_aux(:,326); w27 = coef_aux(:,327); w28 = coef_aux(:,328); w29 = coef_aux(:,329); w30 = coef_aux(:,330); w31 = coef_aux(:,331); 
w32 = coef_aux(:,332); w33 = coef_aux(:,333); w34 = coef_aux(:,334); w35 = coef_aux(:,335); w36 = coef_aux(:,336); w37 = coef_aux(:,337);
w38 = coef_aux(:,338); w39 = coef_aux(:,339); w40 = coef_aux(:,340); w41 = coef_aux(:,341); w42 = coef_aux(:,342); 
w43 = coef_aux(:,343); w44 = coef_aux(:,344); w45 = coef_aux(:,345); w46 = coef_aux(:,346); w47 = coef_aux(:,347); w48 = coef_aux(:,348); 
w49 = coef_aux(:,349); w50 = coef_aux(:,350); 

z1 =zsim(:,1); z2 =zsim(:,2); z3 =zsim(:,3); z4 =zsim(:,4); z5 =zsim(:,5);
z6 =zsim(:,6); z7 =zsim(:,7); z8 =zsim(:,8); z9 =zsim(:,9); z10 =zsim(:,10);
z11 =zsim(:,11); z12 =zsim(:,12); z13 =zsim(:,13); z14 =zsim(:,14); z15 =zsim(:,15);
z16 =zsim(:,16); z17 =zsim(:,17); z18 =zsim(:,18); z19 =zsim(:,19); z20 =zsim(:,20);
z21 =zsim(:,21); z22 =zsim(:,22); z23 =zsim(:,23); z24 =zsim(:,24); z25 =zsim(:,25);
z26 =zsim(:,26); z27 =zsim(:,27); z28 =zsim(:,28); z29 =zsim(:,29); z30 =zsim(:,30);
z31 =zsim(:,31); z32 =zsim(:,32); z33 =zsim(:,33); z34 =zsim(:,34); z35 =zsim(:,35);
z36 =zsim(:,36); z37 =zsim(:,37); z38 =zsim(:,38); z39 =zsim(:,39); z40 =zsim(:,40);
z41 =zsim(:,41); z42 =zsim(:,42); z43 =zsim(:,43); z44 =zsim(:,44); z45 =zsim(:,45);
z46 =zsim(:,46); z47 =zsim(:,47); z48 =zsim(:,48); z49 =zsim(:,49); z50 =zsim(:,50);

e1 =zeros(nsim*(L-T),1); e2 =zeros(nsim*(L-T),1); e3 =zeros(nsim*(L-T),1); e4 =zeros(nsim*(L-T),1); e5 =zeros(nsim*(L-T),1);
e6 =zeros(nsim*(L-T),1); e7 =zeros(nsim*(L-T),1); e8 =zeros(nsim*(L-T),1); e9 =zeros(nsim*(L-T),1); e10 =zeros(nsim*(L-T),1);
e11 =zeros(nsim*(L-T),1); e12 =zeros(nsim*(L-T),1); e13 =zeros(nsim*(L-T),1); e14 =zeros(nsim*(L-T),1); e15 =zeros(nsim*(L-T),1);
e16 =zeros(nsim*(L-T),1); e17 =zeros(nsim*(L-T),1); e18 =zeros(nsim*(L-T),1); e19 =zeros(nsim*(L-T),1); e20 =zeros(nsim*(L-T),1);
e21 =zeros(nsim*(L-T),1); e22 =zeros(nsim*(L-T),1); e23 =zeros(nsim*(L-T),1); e24 =zeros(nsim*(L-T),1); e25 =zeros(nsim*(L-T),1);
e26 =zeros(nsim*(L-T),1); e27 =zeros(nsim*(L-T),1); e28 =zeros(nsim*(L-T),1); e29 =zeros(nsim*(L-T),1); e30 =zeros(nsim*(L-T),1);
e31 =zeros(nsim*(L-T),1); e32 =zeros(nsim*(L-T),1); e33 =zeros(nsim*(L-T),1); e34 =zeros(nsim*(L-T),1); e35 =zeros(nsim*(L-T),1);
e36 =zeros(nsim*(L-T),1); e37 =zeros(nsim*(L-T),1); e38 =zeros(nsim*(L-T),1); e39 =zeros(nsim*(L-T),1); e40 =zeros(nsim*(L-T),1);
e41 =zeros(nsim*(L-T),1); e42 =zeros(nsim*(L-T),1); e43 =zeros(nsim*(L-T),1); e44 =zeros(nsim*(L-T),1); e45 =zeros(nsim*(L-T),1);
e46 =zeros(nsim*(L-T),1); e47 =zeros(nsim*(L-T),1); e48 =zeros(nsim*(L-T),1); e49 =zeros(nsim*(L-T),1); e50 =zeros(nsim*(L-T),1);

s1 =zeros(nsim*(L-T),1); s2 =zeros(nsim*(L-T),1); s3 =zeros(nsim*(L-T),1); s4 =zeros(nsim*(L-T),1); s5 =zeros(nsim*(L-T),1);
s6 =zeros(nsim*(L-T),1); s7 =zeros(nsim*(L-T),1); s8 =zeros(nsim*(L-T),1); s9 =zeros(nsim*(L-T),1); s10 =zeros(nsim*(L-T),1);
s11 =zeros(nsim*(L-T),1); s12 =zeros(nsim*(L-T),1); s13 =zeros(nsim*(L-T),1); s14 =zeros(nsim*(L-T),1); s15 =zeros(nsim*(L-T),1);
s16 =zeros(nsim*(L-T),1); s17 =zeros(nsim*(L-T),1); s18 =zeros(nsim*(L-T),1); s19 =zeros(nsim*(L-T),1); s20 =zeros(nsim*(L-T),1);
s21 =zeros(nsim*(L-T),1); s22 =zeros(nsim*(L-T),1); s23 =zeros(nsim*(L-T),1); s24 =zeros(nsim*(L-T),1); s25 =zeros(nsim*(L-T),1);
s26 =zeros(nsim*(L-T),1); s27 =zeros(nsim*(L-T),1); s28 =zeros(nsim*(L-T),1); s29 =zeros(nsim*(L-T),1); s30 =zeros(nsim*(L-T),1);
s31 =zeros(nsim*(L-T),1); s32 =zeros(nsim*(L-T),1); s33 =zeros(nsim*(L-T),1); s34 =zeros(nsim*(L-T),1); s35 =zeros(nsim*(L-T),1);
s36 =zeros(nsim*(L-T),1); s37 =zeros(nsim*(L-T),1); s38 =zeros(nsim*(L-T),1); s39 =zeros(nsim*(L-T),1); s40 =zeros(nsim*(L-T),1);
s41 =zeros(nsim*(L-T),1); s42 =zeros(nsim*(L-T),1); s43 =zeros(nsim*(L-T),1); s44 =zeros(nsim*(L-T),1); s45 =zeros(nsim*(L-T),1);
s46 =zeros(nsim*(L-T),1); s47 =zeros(nsim*(L-T),1); s48 =zeros(nsim*(L-T),1); s49 =zeros(nsim*(L-T),1); s50 =zeros(nsim*(L-T),1);

rsim1 =zeros(nsim*(L-T),1); rsim2 =zeros(nsim*(L-T),1); rsim3 =zeros(nsim*(L-T),1); rsim4 =zeros(nsim*(L-T),1); rsim5 =zeros(nsim*(L-T),1);
rsim6 =zeros(nsim*(L-T),1); rsim7 =zeros(nsim*(L-T),1); rsim8 =zeros(nsim*(L-T),1); rsim9 =zeros(nsim*(L-T),1); rsim10 =zeros(nsim*(L-T),1);
rsim11 =zeros(nsim*(L-T),1); rsim12 =zeros(nsim*(L-T),1); rsim13 =zeros(nsim*(L-T),1); rsim14 =zeros(nsim*(L-T),1); rsim15 =zeros(nsim*(L-T),1);
rsim16 =zeros(nsim*(L-T),1); rsim17 =zeros(nsim*(L-T),1); rsim18 =zeros(nsim*(L-T),1); rsim19 =zeros(nsim*(L-T),1); rsim20 =zeros(nsim*(L-T),1);
rsim21 =zeros(nsim*(L-T),1); rsim22 =zeros(nsim*(L-T),1); rsim23 =zeros(nsim*(L-T),1); rsim24 =zeros(nsim*(L-T),1); rsim25 =zeros(nsim*(L-T),1);
rsim26 =zeros(nsim*(L-T),1); rsim27 =zeros(nsim*(L-T),1); rsim28 =zeros(nsim*(L-T),1); rsim29 =zeros(nsim*(L-T),1); rsim30 =zeros(nsim*(L-T),1);
rsim31 =zeros(nsim*(L-T),1); rsim32 =zeros(nsim*(L-T),1); rsim33 =zeros(nsim*(L-T),1); rsim34 =zeros(nsim*(L-T),1); rsim35 =zeros(nsim*(L-T),1);
rsim36 =zeros(nsim*(L-T),1); rsim37 =zeros(nsim*(L-T),1); rsim38 =zeros(nsim*(L-T),1); rsim39 =zeros(nsim*(L-T),1); rsim40 =zeros(nsim*(L-T),1);
rsim41 =zeros(nsim*(L-T),1); rsim42 =zeros(nsim*(L-T),1); rsim43 =zeros(nsim*(L-T),1); rsim44 =zeros(nsim*(L-T),1); rsim45 =zeros(nsim*(L-T),1);
rsim46 =zeros(nsim*(L-T),1); rsim47 =zeros(nsim*(L-T),1); rsim48 =zeros(nsim*(L-T),1); rsim49 =zeros(nsim*(L-T),1); rsim50 =zeros(nsim*(L-T),1);


res_aux = res(1010:6424,:); sig_aux = sig(1010:6424,:);

for i = 1:(L-T); 
    
    disp(['i ',num2str(i)]);
    
 for p = (i*nsim-(nsim-1):(i*nsim))
     
 s1(p,1) = sqrt(w1(i)+ a1(i)*(res_aux(i,1)).^2 + b1(i)*sig_aux(i,1).^2).^(1/2);
 s2(p,1) = sqrt(w2(i)+ a2(i)*(res_aux(i,2)).^2 + b2(i)*sig_aux(i,2).^2).^(1/2);
 s3(p,1) = sqrt(w3(i)+ a3(i)*(res_aux(i,3)).^2 + b3(i)*sig_aux(i,3).^2).^(1/2);
 s4(p,1) = sqrt(w4(i)+ a4(i)*(res_aux(i,4)).^2 + b4(i)*sig_aux(i,4).^2).^(1/2);
 s5(p,1) = sqrt(w5(i)+ a5(i)*(res_aux(i,5)).^2 + b5(i)*sig_aux(i,5).^2).^(1/2);
 s6(p,1) = sqrt(w6(i)+ a6(i)*(res_aux(i,6)).^2 + b6(i)*sig_aux(i,6).^2).^(1/2);
 s7(p,1) = sqrt(w7(i)+ a7(i)*(res_aux(i,7)).^2 + b7(i)*sig_aux(i,7).^2).^(1/2);
 s8(p,1) = sqrt(w8(i)+ a8(i)*(res_aux(i,8)).^2 + b8(i)*sig_aux(i,8).^2).^(1/2);
 s9(p,1) = sqrt(w9(i)+ a9(i)*(res_aux(i,9)).^2 + b9(i)*sig_aux(i,9).^2).^(1/2);
 s10(p,1) = sqrt(w10(i)+ a10(i)*(res_aux(i,10)).^2 + b10(i)*sig_aux(i,10).^2).^(1/2);
 s11(p,1) = sqrt(w11(i)+ a11(i)*(res_aux(i,11)).^2 + b11(i)*sig_aux(i,11).^2).^(1/2);
 s12(p,1) = sqrt(w12(i)+ a12(i)*(res_aux(i,12)).^2 + b12(i)*sig_aux(i,12).^2).^(1/2);
 s13(p,1) = sqrt(w13(i)+ a13(i)*(res_aux(i,13)).^2 + b13(i)*sig_aux(i,13).^2).^(1/2);
 s14(p,1) = sqrt(w14(i)+ a14(i)*(res_aux(i,14)).^2 + b14(i)*sig_aux(i,14).^2).^(1/2);
 s15(p,1) = sqrt(w15(i)+ a15(i)*(res_aux(i,15)).^2 + b15(i)*sig_aux(i,15).^2).^(1/2);
 s16(p,1) = sqrt(w16(i)+ a16(i)*(res_aux(i,16)).^2 + b16(i)*sig_aux(i,16).^2).^(1/2);
 s17(p,1) = sqrt(w17(i)+ a17(i)*(res_aux(i,17)).^2 + b17(i)*sig_aux(i,17).^2).^(1/2);
 s18(p,1) = sqrt(w18(i)+ a18(i)*(res_aux(i,18)).^2 + b18(i)*sig_aux(i,18).^2).^(1/2);
 s19(p,1) = sqrt(w19(i)+ a19(i)*(res_aux(i,19)).^2 + b19(i)*sig_aux(i,19).^2).^(1/2);
 s20(p,1) = sqrt(w20(i)+ a20(i)*(res_aux(i,20)).^2 + b20(i)*sig_aux(i,20).^2).^(1/2);
 s21(p,1) = sqrt(w21(i)+ a21(i)*(res_aux(i,21)).^2 + b21(i)*sig_aux(i,21).^2).^(1/2);
 s22(p,1) = sqrt(w22(i)+ a22(i)*(res_aux(i,22)).^2 + b22(i)*sig_aux(i,22).^2).^(1/2);
 s23(p,1) = sqrt(w23(i)+ a23(i)*(res_aux(i,23)).^2 + b23(i)*sig_aux(i,23).^2).^(1/2);
 s24(p,1) = sqrt(w24(i)+ a24(i)*(res_aux(i,24)).^2 + b24(i)*sig_aux(i,24).^2).^(1/2);
 s25(p,1) = sqrt(w25(i)+ a25(i)*(res_aux(i,25)).^2 + b25(i)*sig_aux(i,25).^2).^(1/2);
 s26(p,1) = sqrt(w26(i)+ a26(i)*(res_aux(i,26)).^2 + b26(i)*sig_aux(i,26).^2).^(1/2);
 s27(p,1) = sqrt(w27(i)+ a27(i)*(res_aux(i,27)).^2 + b27(i)*sig_aux(i,27).^2).^(1/2);
 s28(p,1) = sqrt(w28(i)+ a28(i)*(res_aux(i,28)).^2 + b28(i)*sig_aux(i,28).^2).^(1/2);
 s29(p,1) = sqrt(w29(i)+ a29(i)*(res_aux(i,29)).^2 + b29(i)*sig_aux(i,29).^2).^(1/2);
 s30(p,1) = sqrt(w30(i)+ a30(i)*(res_aux(i,30)).^2 + b30(i)*sig_aux(i,30).^2).^(1/2);
 s31(p,1) = sqrt(w31(i)+ a31(i)*(res_aux(i,31)).^2 + b31(i)*sig_aux(i,31).^2).^(1/2);
 s32(p,1) = sqrt(w32(i)+ a32(i)*(res_aux(i,32)).^2 + b32(i)*sig_aux(i,32).^2).^(1/2);
 s33(p,1) = sqrt(w33(i)+ a33(i)*(res_aux(i,33)).^2 + b33(i)*sig_aux(i,33).^2).^(1/2);
 s34(p,1) = sqrt(w34(i)+ a34(i)*(res_aux(i,34)).^2 + b34(i)*sig_aux(i,34).^2).^(1/2);
 s35(p,1) = sqrt(w35(i)+ a35(i)*(res_aux(i,35)).^2 + b35(i)*sig_aux(i,35).^2).^(1/2);
 s36(p,1) = sqrt(w36(i)+ a36(i)*(res_aux(i,36)).^2 + b36(i)*sig_aux(i,36).^2).^(1/2);
 s37(p,1) = sqrt(w37(i)+ a37(i)*(res_aux(i,37)).^2 + b37(i)*sig_aux(i,37).^2).^(1/2);
 s38(p,1) = sqrt(w38(i)+ a38(i)*(res_aux(i,38)).^2 + b38(i)*sig_aux(i,38).^2).^(1/2);
 s39(p,1) = sqrt(w39(i)+ a39(i)*(res_aux(i,39)).^2 + b39(i)*sig_aux(i,39).^2).^(1/2);
 s40(p,1) = sqrt(w40(i)+ a40(i)*(res_aux(i,40)).^2 + b40(i)*sig_aux(i,40).^2).^(1/2);
 s41(p,1) = sqrt(w41(i)+ a41(i)*(res_aux(i,41)).^2 + b41(i)*sig_aux(i,41).^2).^(1/2);
 s42(p,1) = sqrt(w42(i)+ a42(i)*(res_aux(i,42)).^2 + b42(i)*sig_aux(i,42).^2).^(1/2);
 s43(p,1) = sqrt(w43(i)+ a43(i)*(res_aux(i,43)).^2 + b43(i)*sig_aux(i,43).^2).^(1/2);
 s44(p,1) = sqrt(w44(i)+ a44(i)*(res_aux(i,44)).^2 + b44(i)*sig_aux(i,44).^2).^(1/2);
 s45(p,1) = sqrt(w45(i)+ a45(i)*(res_aux(i,45)).^2 + b45(i)*sig_aux(i,45).^2).^(1/2);
 s46(p,1) = sqrt(w46(i)+ a46(i)*(res_aux(i,46)).^2 + b46(i)*sig_aux(i,46).^2).^(1/2);
 s47(p,1) = sqrt(w47(i)+ a47(i)*(res_aux(i,47)).^2 + b47(i)*sig_aux(i,47).^2).^(1/2);
 s48(p,1) = sqrt(w48(i)+ a48(i)*(res_aux(i,48)).^2 + b48(i)*sig_aux(i,48).^2).^(1/2);
 s49(p,1) = sqrt(w49(i)+ a49(i)*(res_aux(i,49)).^2 + b49(i)*sig_aux(i,49).^2).^(1/2);
 s50(p,1) = sqrt(w50(i)+ a50(i)*(res_aux(i,50)).^2 + b50(i)*sig_aux(i,50).^2).^(1/2);
%        
     e1(p,1) = z1(p,1)*s1(p,1); e2(p,1) = z2(p,1)*s2(p,1); e3(p,1) = z3(p,1)*s3(p,1);
     e4(p,1) = z4(p,1)*s4(p,1); e5(p,1) = z5(p,1)*s5(p,1); e6(p,1) = z6(p,1)*s6(p,1);
     e7(p,1) = z7(p,1)*s7(p,1); e8(p,1) = z8(p,1)*s8(p,1); e9(p,1) = z9(p,1)*s9(p,1); 
     e10(p,1) = z10(p,1)*s10(p,1);
     e11(p,1) = z11(p,1)*s11(p,1); e12(p,1) = z12(p,1)*s12(p,1); e13(p,1) = z13(p,1)*s13(p,1);
     e14(p,1) = z14(p,1)*s14(p,1); e15(p,1) = z15(p,1)*s15(p,1); e16(p,1) = z16(p,1)*s16(p,1);
     e17(p,1) = z17(p,1)*s17(p,1); e18(p,1) = z18(p,1)*s18(p,1); e19(p,1) = z19(p,1)*s19(p,1); 
     e20(p,1) = z20(p,1)*s20(p,1);
     e21(p,1) = z21(p,1)*s21(p,1); e22(p,1) = z22(p,1)*s22(p,1); e23(p,1) = z23(p,1)*s23(p,1);
     e24(p,1) = z24(p,1)*s24(p,1); e25(p,1) = z25(p,1)*s25(p,1); e26(p,1) = z26(p,1)*s26(p,1);
     e27(p,1) = z27(p,1)*s27(p,1); e28(p,1) = z28(p,1)*s28(p,1); e29(p,1) = z29(p,1)*s29(p,1); 
     e30(p,1) = z30(p,1)*s30(p,1);
     e31(p,1) = z31(p,1)*s31(p,1); e32(p,1) = z32(p,1)*s32(p,1); e33(p,1) = z33(p,1)*s33(p,1);
     e34(p,1) = z34(p,1)*s34(p,1); e35(p,1) = z35(p,1)*s35(p,1); e36(p,1) = z36(p,1)*s36(p,1);
     e37(p,1) = z37(p,1)*s37(p,1); e38(p,1) = z38(p,1)*s38(p,1); e39(p,1) = z39(p,1)*s39(p,1); 
     e40(p,1) = z40(p,1)*s40(p,1);
     e41(p,1) = z41(p,1)*s41(p,1); e42(p,1) = z42(p,1)*s42(p,1); e43(p,1) = z43(p,1)*s43(p,1);
     e44(p,1) = z44(p,1)*s44(p,1); e45(p,1) = z45(p,1)*s45(p,1); e46(p,1) = z46(p,1)*s46(p,1);
     e47(p,1) = z47(p,1)*s47(p,1); e48(p,1) = z48(p,1)*s48(p,1); e49(p,1) = z49(p,1)*s49(p,1); 
     e50(p,1) = z50(p,1)*s50(p,1);


rsim1(p,1)= mu1(i)+ ar1(i)*Rt50(i,1)+ e1(p,1); rsim2(p,1)= mu2(i)+ ar2(i)*Rt50(i,2)+ e2(p,1);
rsim3(p,1)= mu3(i)+ ar3(i)*Rt50(i,3)+ e3(p,1); rsim4(p,1)= mu4(i)+ ar4(i)*Rt50(i,4)+ e4(p,1);
rsim5(p,1)= mu5(i)+ ar5(i)*Rt50(i,5)+ e5(p,1); rsim6(p,1)= mu6(i)+ ar6(i)*Rt50(i,6)+ e6(p,1);
rsim7(p,1)= mu7(i)+ ar7(i)*Rt50(i,7)+ e7(p,1); rsim8(p,1)= mu8(i)+ ar8(i)*Rt50(i,8)+ e8(p,1);
rsim9(p,1)= mu9(i)+ ar9(i)*Rt50(i,9)+ e9(p,1); rsim10(p,1)= mu10(i)+ ar10(i)*Rt50(i,10)+ e10(p,1);
rsim11(p,1)= mu11(i)+ ar11(i)*Rt50(i,11)+ e11(p,1); rsim12(p,1)= mu12(i)+ ar12(i)*Rt50(i,12)+ e12(p,1);
rsim13(p,1)= mu13(i)+ ar13(i)*Rt50(i,13)+ e13(p,1); rsim14(p,1)= mu14(i)+ ar14(i)*Rt50(i,14)+ e14(p,1);
rsim15(p,1)= mu15(i)+ ar15(i)*Rt50(i,15)+ e15(p,1); rsim16(p,1)= mu16(i)+ ar16(i)*Rt50(i,16)+ e16(p,1);
rsim17(p,1)= mu17(i)+ ar17(i)*Rt50(i,17)+ e17(p,1); rsim18(p,1)= mu18(i)+ ar18(i)*Rt50(i,18)+ e18(p,1);
rsim19(p,1)= mu19(i)+ ar19(i)*Rt50(i,19)+ e19(p,1); rsim20(p,1)= mu20(i)+ ar20(i)*Rt50(i,20)+ e20(p,1);
rsim21(p,1)= mu21(i)+ ar21(i)*Rt50(i,21)+ e21(p,1); rsim22(p,1)= mu22(i)+ ar22(i)*Rt50(i,22)+ e22(p,1);
rsim23(p,1)= mu23(i)+ ar23(i)*Rt50(i,23)+ e23(p,1); rsim24(p,1)= mu24(i)+ ar24(i)*Rt50(i,24)+ e24(p,1);
rsim25(p,1)= mu25(i)+ ar25(i)*Rt50(i,25)+ e25(p,1); rsim26(p,1)= mu26(i)+ ar26(i)*Rt50(i,26)+ e26(p,1);
rsim27(p,1)= mu27(i)+ ar27(i)*Rt50(i,27)+ e27(p,1); rsim28(p,1)= mu28(i)+ ar28(i)*Rt50(i,28)+ e28(p,1);
rsim29(p,1)= mu29(i)+ ar29(i)*Rt50(i,29)+ e29(p,1); rsim30(p,1)= mu30(i)+ ar30(i)*Rt50(i,30)+ e30(p,1);
rsim31(p,1)= mu31(i)+ ar31(i)*Rt50(i,31)+ e31(p,1); rsim32(p,1)= mu32(i)+ ar32(i)*Rt50(i,32)+ e32(p,1);
rsim33(p,1)= mu33(i)+ ar33(i)*Rt50(i,33)+ e33(p,1); rsim34(p,1)= mu34(i)+ ar34(i)*Rt50(i,34)+ e34(p,1);
rsim35(p,1)= mu35(i)+ ar35(i)*Rt50(i,35)+ e35(p,1); rsim36(p,1)= mu36(i)+ ar36(i)*Rt50(i,36)+ e36(p,1);
rsim37(p,1)= mu37(i)+ ar37(i)*Rt50(i,37)+ e37(p,1); rsim38(p,1)= mu38(i)+ ar38(i)*Rt50(i,38)+ e38(p,1);
rsim39(p,1)= mu39(i)+ ar39(i)*Rt50(i,39)+ e39(p,1); rsim40(p,1)= mu40(i)+ ar40(i)*Rt50(i,40)+ e40(p,1);
rsim41(p,1)= mu41(i)+ ar41(i)*Rt50(i,41)+ e41(p,1); rsim42(p,1)= mu42(i)+ ar42(i)*Rt50(i,42)+ e42(p,1);
rsim43(p,1)= mu43(i)+ ar43(i)*Rt50(i,43)+ e43(p,1); rsim44(p,1)= mu44(i)+ ar44(i)*Rt50(i,44)+ e44(p,1);
rsim45(p,1)= mu45(i)+ ar45(i)*Rt50(i,45)+ e45(p,1); rsim46(p,1)= mu46(i)+ ar46(i)*Rt50(i,46)+ e46(p,1);
rsim47(p,1)= mu47(i)+ ar47(i)*Rt50(i,47)+ e47(p,1); rsim48(p,1)= mu48(i)+ ar48(i)*Rt50(i,48)+ e48(p,1);
rsim49(p,1)= mu49(i)+ ar49(i)*Rt50(i,49)+ e49(p,1); rsim50(p,1)= mu50(i)+ ar50(i)*Rt50(i,50)+ e50(p,1);

  
end
end

% 
rsim = [rsim1, rsim2, rsim3, rsim4, rsim5, rsim6, rsim7, rsim8, rsim9, rsim10,...
rsim11, rsim12, rsim13, rsim14, rsim15, rsim16, rsim17, rsim18, rsim19, rsim20,...
rsim21, rsim22, rsim23, rsim24, rsim25, rsim26, rsim27, rsim28, rsim29, rsim30,...
rsim31, rsim32, rsim33, rsim34, rsim35, rsim36, rsim37, rsim38, rsim39, rsim40,...
rsim41, rsim42, rsim43, rsim44, rsim45, rsim46, rsim47, rsim48, rsim49, rsim50];

pweights = zeros(L-T,n); VaR = zeros(L-T,1); CVaR = zeros(L-T,1); wg = zeros(L-T,n);

for i = 1:(L-T); 

display(['Simulation ',num2str(i)])

[pweights(i,:),VaR(i),CVaR(i)] = cvaroptir(-1,rsim((i*nsim-(nsim-1):(i*nsim)),:),0.95);
%[pweights(idx(i),:),CVaR(idx(i))] = cvaroptir(0.00015,rsim((idx(i)*nsim-(nsim-1):(idx(i)*nsim)),:),0.05);
%[pweights(idx(i),:),CVaR(idx(i))] = cvaroptir(-1,rsim((idx(i)*nsim-(nsim-1):(idx(i)*nsim)),:),0.05);
%[pweights(i,:),CVaR(i)] = cvaroptir(0,rsim((i*nsim-(nsim-1):(i*nsim)),:),0.05);

% Matrix of weights
wg = pweights;

end

% Evaluate portfolio performance in t

for i = 1:(L-T);
%for i = 1:length(idx);

ret_gauss(i) = wg(i,:)*Rt50(T+i,i)' - Rf(T+i);
ret_gauss_gross(i) = wg(i,:)*Rt50(T+i,i)';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Equal Weight Strategy %%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ret_1N(idx(i)) = Rt(T+idx(i),idxsse(idx(i),:))*one_over_n - Rf(T+idx(i)); 
ret_1N_gross(idx(i)) = Rt(T+idx(i),idxsse(idx(i),:))*one_over_n;
%%%%%%%%%%%%%%%%%%%%
%%%Benchmark S&P500 %
%%%%%%%%%%%%%%%%%%%%%
ret_SP500(idx(i)) = Rm(T+idx(i))-Rf(T+idx(i)); 
ret_SP500_gross(idx(i)) = Rm(T+idx(i),1);
end

Sortino_ret_gauss= sqrt(252)*sortinoratio(ret_gauss,0);
Sortino_ret_gauss_gross= sqrt(252)*sortinoratio(ret_gauss_gross,0);

%--------------------------------------------------------------------------
% Compute statistics
%--------------------------------------------------------------------------
[return_gauss, std_gauss, SR_gauss, turnover_gauss] =...
stats(data,L,T,ret_gauss,wg');
[return_1N, std_1N, SR_1N, turnover_1N] =...
stats(data,L,T,ret_1N,repmat(one_over_n,1,L-T));
[return_gauss_gross, std_gauss_gross, SR_gauss_gross, turnover_gauss_gross] =...
stats(data,L,T,ret_gauss_gross,wg');
[return_1N_gross, std_1N_gross, SR_1N_gross, turnover_1N_gross] =...
stats(data,L,T,ret_1N_gross,repmat(one_over_n,1,L-T));

for i=1:6047
  MaxDD_gauss(i,:)= cumprod(1+ret_gauss(:,i:i+126-1));
  MaxDD_gauss_gross(i,:)= cumprod(1+ret_gauss_gross(:,i:i+126-1));
end

MDD_gauss = MaxDD_gauss(:,126)-MaxDD_gauss(:,1);
[r1g,r2g] = min(MDD_gauss);
MDD_gauss_gross = MaxDD_gauss_gross(:,126)-MaxDD_gauss_gross(:,1);
[r1gb,r2gb] = min(MDD_gauss_gross);

for j=1:6171
MaxDD2_gauss(j)= (1+ret_gauss(:,j))*(1+ret_gauss(:,j+1));
MaxDD2_gauss_gross(j)= (1+ret_gauss_gross(:,j))*(1+ret_gauss_gross(:,j+1));
end

MDD2_gauss= min(MaxDD2_gauss);
[c1g,c2g]= min(MaxDD2_gauss);
MDD2_gauss_gross= min(MaxDD2_gauss_gross);
[c1gb,c2gb]= min(MaxDD2_gauss_gross);

Bstar = opt_block_length([ret_gauss', ret_SP500']);
SBstar = Bstar(1,:);
% 
% %--------------------------------------------------------------------------------------------
% % Test the differences between Sharpe ratio and mean excess returns (Gauss Copula vs S&P 500)
% %--------------------------------------------------------------------------------------------
% 
[pvalSR_gauss, pvalMEAN_gauss] = dgnu_StatisticsPolitisRomano_v5(ret_gauss', ret_SP500',mean(SBstar));
if pvalSR_gauss<0.10 && SR_gauss>(mean(ret_SP500)/std(ret_SP500));
display('Minimum variance IS statistically different (greater) from SP500')
elseif pvalSR_gauss<0.10 && SR_gauss<(mean(ret_SP500)/std(ret_SP500));
display('Minimum variance IS statistically different (lesser) from SP500')
elseif pvalSR_gauss>0.10
display('Minimum variance IS statistically equal to SP500')
end
if pvalMEAN_gauss<0.10 && (mean(ret_gauss)<mean(ret_SP500));
display('Standard deviation of minimum variance statistically different (lesser) from SP500')
elseif pvalMEAN_gauss<0.10 && (mean(ret_gauss)>mean(ret_SP500));
display('Standard deviation of minimum variance statistically different (greater) from SP500')
elseif pvalMEAN_gauss>0.10
display('Standard deviation of minimum variance statistically equal to SP500')
end

%--------------------------------------------------------------------------
% Plots
%--------------------------------------------------------------------------

endDate=datenum('1-02-2016');
startDate=endDate-8948;
xData = linspace(startDate,endDate,L-T);
xData2 = linspace(startDate,endDate,26);

figure,
plot(xData,[cumprod(1+ret_gauss)'-1 cumprod(1+ret_1N)'-1 cumprod(1+ret_SP500)'-1]),
legend('Gauss' , 'Equal Weights', 'SP500')
set(gca,'XTick',xData2);
datetick('x','yy','keepticks');
grid on


%--------------------------------------------------------------------------
% Compute breakeven transaction costs (in basis points). 
% 100bp=1%
%--------------------------------------------------------------------------

breakeven_gauss = mean(ret_gauss)*100/(turnover_gauss*(1+mean(ret_gauss)));
breakeven_1N = mean(ret_1N)*100/(turnover_1N*(1+mean(ret_1N)));


%--------------------------------------------------------------------------
% Tables
%--------------------------------------------------------------------------

Table = [(1+return_gauss)^252 std_gauss*sqrt(252) SR_gauss*sqrt(252) turnover_gauss breakeven_gauss;
(1+return_1N)^252 std_1N*sqrt(252) SR_1N*sqrt(252) turnover_1N breakeven_1N;
(1+mean(ret_SP500))^252 std(ret_SP500)*sqrt(252) (mean(ret_SP500)/std(ret_SP500))*sqrt(252) 0 0];

Table_acum = [cumprod(1+ret_gauss)'-1 cumprod(1+ret_1N)'-1 cumprod(1+ret_SP500)'-1];

save('C:\Users\Fernando\Desktop\paper3\gauss_sse\rwpcop_gauss_sse.mat')









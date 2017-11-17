clear all; close all; clc; warning off;

addpath('C:\Users\Fernando\Desktop\Fernando\MFE');
addpath('C:\Users\Fernando\Desktop\Fernando\PTCop');
addpath('C:\Program Files\MATLAB\R2012b\toolbox\stats');
addpath('C:\Users\Fernando\Desktop\Fernando\PTCop\dados');
addpath('C:\Users\Fernando\Desktop\Fernando\PTCop\Patton_copula_toolbox');
addpath('C:\Users\Fernando\Desktop\Fernando\PTCop\ARMAX_GARCH_K_Toolbox');
addpath('C:\Users\Fernando\Desktop\Fernando\MFE\MFEToolbox\univariate');
addpath('C:\Users\Fernando\Desktop\Fernando\MFE\MFEToolbox\distributions');
addpath('C:\Users\Fernando\Desktop\Fernando\MFE\MFEToolbox\mex_source');
addpath('C:\Users\Fernando\Desktop\Fernando\MFE\MFEToolbox\utility');
addpath('C:\Users\Fernando\Desktop\Fernando\PairsTrading_FEX\PairsTrading_FEX\m_Files');
addpath('C:\Users\Fernando\Desktop\Fernando\PDS\codigos');
addpath('C:\Users\Fernando\Desktop\Fernando\MFE\Matlab5\TOOLBOX\MATLAB\OMAT');
addpath('C:\Users\Fernando\Desktop\Fernando\PDS\cvx');
addpath('C:\Users\Fernando\Desktop\Fernando\Paper Cristina\New Folder\Codes Matlab');
addpath('C:\Users\Fernando\Dropbox\paper_pairs_trading_realized');
addpath('C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1');
addpath('C:\Users\Fernando\Desktop\Paper Cristina\New Folder\Codes Matlab');
addpath('C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\dist');
addpath('C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG');
addpath('C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper3');
addpath('C:\Users\Fernando\Desktop\codes');


% (1)1-1137; (2)1138-2400; (3)2401-3656; (4)3657-4915; (5) 4916-6173.

load('d0p5c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d0p5c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d0p5c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c0_ccg, pmean_d0p5c0_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d0p5c0_fig, pmean_d0p5c0_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d0p5c0_ccv, pmean_d0p5c0_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d0p5c0_fiv, pmean_d0p5c0_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));

load('d0p5c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d0p5c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d0p5c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c1_ccg, pmean_d0p5c1_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d0p5c1_fig, pmean_d0p5c1_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d0p5c1_ccv, pmean_d0p5c1_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d0p5c1_fiv, pmean_d0p5c1_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));
 
load('d0p5c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d0p5c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d0p5c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c2_ccg, pmean_d0p5c2_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d0p5c2_fig, pmean_d0p5c2_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d0p5c2_ccv, pmean_d0p5c2_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d0p5c2_fiv, pmean_d0p5c2_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));

load('d1p5c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d1p5c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d1p5c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c2_ccg, pmean_d1p5c2_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d1p5c2_fig, pmean_d1p5c2_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d1p5c2_ccv, pmean_d1p5c2_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d1p5c2_fiv, pmean_d1p5c2_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));

load('d1p5c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d1p5c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d1p5c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c0_ccg, pmean_d1p5c0_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d1p5c0_fig, pmean_d1p5c0_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d1p5c0_ccv, pmean_d1p5c0_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d1p5c0_fiv, pmean_d1p5c0_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));

load('d1p5c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d1p5c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d1p5c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c1_ccg, pmean_d1p5c1_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d1p5c1_fig, pmean_d1p5c1_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d1p5c1_ccv, pmean_d1p5c1_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d1p5c1_fiv, pmean_d1p5c1_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));

load('d0p20c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d0p20c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d0p20c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c0_ccg, pmean_d0p20c0_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d0p20c0_fig, pmean_d0p20c0_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d0p20c0_ccv, pmean_d0p20c0_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d0p20c0_fiv, pmean_d0p20c0_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));

load('d0p20c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d0p20c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d0p20c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c1_ccg, pmean_d0p20c1_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d0p20c1_fig, pmean_d0p20c1_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d0p20c1_ccv, pmean_d0p20c1_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d0p20c1_fiv, pmean_d0p20c1_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));
 
load('d0p20c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d0p20c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d0p20c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c2_ccg, pmean_d0p20c2_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d0p20c2_fig, pmean_d0p20c2_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d0p20c2_ccv, pmean_d0p20c2_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d0p20c2_fiv, pmean_d0p20c2_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));

load('d1p20c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d1p20c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d1p20c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c2_ccg, pmean_d1p20c2_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d1p20c2_fig, pmean_d1p20c2_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,1);
[pSR_d1p20c2_ccv, pmean_d1p20c2_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d1p20c2_fiv, pmean_d1p20c2_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,1);

load('d1p20c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d1p20c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d1p20c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c0_ccg, pmean_d1p20c0_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d1p20c0_fig, pmean_d1p20c0_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d1p20c0_ccv, pmean_d1p20c0_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d1p20c0_fiv, pmean_d1p20c0_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));

load('d1p20c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d1p20c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d1p20c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c1_ccg, pmean_d1p20c1_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d1p20c1_fig, pmean_d1p20c1_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d1p20c1_ccv, pmean_d1p20c1_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d1p20c1_fiv, pmean_d1p20c1_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));

load('d0p101c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d0p101c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d0p101c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c0_ccg, pmean_d0p101c0_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d0p101c0_fig, pmean_d0p101c0_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d0p101c0_ccv, pmean_d0p101c0_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d0p101c0_fiv, pmean_d0p101c0_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));

load('d0p101c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d0p101c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d0p101c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c1_ccg, pmean_d0p101c1_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d0p101c1_fig, pmean_d0p101c1_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d0p101c1_ccv, pmean_d0p101c1_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d0p101c1_fiv, pmean_d0p101c1_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));
 
load('d0p101c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d0p101c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d0p101c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c2_ccg, pmean_d0p101c2_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d0p101c2_fig, pmean_d0p101c2_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d0p101c2_ccv, pmean_d0p101c2_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d0p101c2_fiv, pmean_d0p101c2_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));

load('d1p101c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d1p101c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d1p101c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c2_ccg, pmean_d1p101c2_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d1p101c2_fig, pmean_d1p101c2_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d1p101c2_ccv, pmean_d1p101c2_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d1p101c2_fiv, pmean_d1p101c2_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));

load('d1p101c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d1p101c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d1p101c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c0_ccg, pmean_d1p101c0_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d1p101c0_fig, pmean_d1p101c0_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d1p101c0_ccv, pmean_d1p101c0_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d1p101c0_fiv, pmean_d1p101c0_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));

load('d1p101c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc; Rp_fi= Rp_vw_fi;
load('d1p101c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg= Rp_vw_cc; Rp_fig= Rp_vw_fi;
load('d1p101c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv= Rp_vw_cc; Rp_fiv= Rp_vw_fi;
Bstar = opt_block_length([Rp_cc, Rp_ccg]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c1_ccg, pmean_d1p101c1_ccg] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg,max(mean(SBstar),1));
[pSR_d1p101c1_fig, pmean_d1p101c1_fig] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig,max(mean(SBstar2),1));
[pSR_d1p101c1_ccv, pmean_d1p101c1_ccv] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv,max(mean(SBstar3),1));
[pSR_d1p101c1_fiv, pmean_d1p101c1_fiv] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv,max(mean(SBstar4),1));

pSRccv = [pSR_d0p5c0_ccv, pSR_d0p5c1_ccv,pSR_d0p5c2_ccv,...
     pSR_d1p5c0_ccv, pSR_d1p5c1_ccv,pSR_d1p5c2_ccv,...
     pSR_d0p20c0_ccv, pSR_d0p20c1_ccv,pSR_d0p20c2_ccv,...
     pSR_d1p20c0_ccv, pSR_d1p20c1_ccv,pSR_d1p20c2_ccv,...
     pSR_d0p101c0_ccv, pSR_d0p101c1_ccv,pSR_d0p101c2_ccv,...
     pSR_d1p101c0_ccv, pSR_d1p101c1_ccv,pSR_d1p101c2_ccv];

pmean_ccv = [pmean_d0p5c0_ccv, pmean_d0p5c1_ccv,pmean_d0p5c2_ccv,...
     pmean_d1p5c0_ccv, pmean_d1p5c1_ccv,pmean_d1p5c2_ccv,...
     pmean_d0p20c0_ccv, pmean_d0p20c1_ccv,pmean_d0p20c2_ccv,...
     pmean_d1p20c0_ccv, pmean_d1p20c1_ccv,pmean_d1p20c2_ccv,...
     pmean_d0p101c0_ccv, pmean_d0p101c1_ccv,pmean_d0p101c2_ccv,...
     pmean_d1p101c0_ccv, pmean_d1p101c1_ccv,pmean_d1p101c2_ccv];
 
 
VariableNames1 = {'Return','Sharpe_Ratio'};
RowNames1 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table1 = table(pmean_ccv',pSRccv',...
    'VariableNames',VariableNames1,'RowNames',RowNames1);

pSRccg = [pSR_d0p5c0_ccg, pSR_d0p5c1_ccg,pSR_d0p5c2_ccg,...
     pSR_d1p5c0_ccg, pSR_d1p5c1_ccg,pSR_d1p5c2_ccg,...
     pSR_d0p20c0_ccg, pSR_d0p20c1_ccg,pSR_d0p20c2_ccg,...
     pSR_d1p20c0_ccg, pSR_d1p20c1_ccg,pSR_d1p20c2_ccg,...
     pSR_d0p101c0_ccg, pSR_d0p101c1_ccg,pSR_d0p101c2_ccg,...
     pSR_d1p101c0_ccg, pSR_d1p101c1_ccg,pSR_d1p101c2_ccg];

pmean_ccg = [pmean_d0p5c0_ccg, pmean_d0p5c1_ccg,pmean_d0p5c2_ccg,...
     pmean_d1p5c0_ccg, pmean_d1p5c1_ccg,pmean_d1p5c2_ccg,...
     pmean_d0p20c0_ccg, pmean_d0p20c1_ccg,pmean_d0p20c2_ccg,...
     pmean_d1p20c0_ccg, pmean_d1p20c1_ccg,pmean_d1p20c2_ccg,...
     pmean_d0p101c0_ccg, pmean_d0p101c1_ccg,pmean_d0p101c2_ccg,...
     pmean_d1p101c0_ccg, pmean_d1p101c1_ccg,pmean_d1p101c2_ccg];
 
 
VariableNames2 = {'Return','Sharpe_Ratio'};
RowNames2 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table2 = table(pmean_ccg',pSRccg',...
    'VariableNames',VariableNames2,'RowNames',RowNames2);

pSRfiv = [pSR_d0p5c0_fiv, pSR_d0p5c1_fiv,pSR_d0p5c2_fiv,...
     pSR_d1p5c0_fiv, pSR_d1p5c1_fiv,pSR_d1p5c2_fiv,...
     pSR_d0p20c0_fiv, pSR_d0p20c1_fiv,pSR_d0p20c2_fiv,...
     pSR_d1p20c0_fiv, pSR_d1p20c1_fiv,pSR_d1p20c2_fiv,...
     pSR_d0p101c0_fiv, pSR_d0p101c1_fiv,pSR_d0p101c2_fiv,...
     pSR_d1p101c0_fiv, pSR_d1p101c1_fiv,pSR_d1p101c2_fiv];

pmean_fiv = [pmean_d0p5c0_fiv, pmean_d0p5c1_fiv,pmean_d0p5c2_fiv,...
     pmean_d1p5c0_fiv, pmean_d1p5c1_fiv,pmean_d1p5c2_fiv,...
     pmean_d0p20c0_fiv, pmean_d0p20c1_fiv,pmean_d0p20c2_fiv,...
     pmean_d1p20c0_fiv, pmean_d1p20c1_fiv,pmean_d1p20c2_fiv,...
     pmean_d0p101c0_fiv, pmean_d0p101c1_fiv,pmean_d0p101c2_fiv,...
     pmean_d1p101c0_fiv, pmean_d1p101c1_fiv,pmean_d1p101c2_fiv];
 
 
VariableNames3 = {'Return','Sharpe_Ratio'};
RowNames3 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table3 = table(pmean_fiv',pSRfiv',...
    'VariableNames',VariableNames3,'RowNames',RowNames3);

pSRfig = [pSR_d0p5c0_fig, pSR_d0p5c1_fig,pSR_d0p5c2_fig,...
     pSR_d1p5c0_fig, pSR_d1p5c1_fig,pSR_d1p5c2_fig,...
     pSR_d0p20c0_fig, pSR_d0p20c1_fig,pSR_d0p20c2_fig,...
     pSR_d1p20c0_fig, pSR_d1p20c1_fig,pSR_d1p20c2_fig,...
     pSR_d0p101c0_fig, pSR_d0p101c1_fig,pSR_d0p101c2_fig,...
     pSR_d1p101c0_fig, pSR_d1p101c1_fig,pSR_d1p101c2_fig];

pmean_fig = [pmean_d0p5c0_fig, pmean_d0p5c1_fig,pmean_d0p5c2_fig,...
     pmean_d1p5c0_fig, pmean_d1p5c1_fig,pmean_d1p5c2_fig,...
     pmean_d0p20c0_fig, pmean_d0p20c1_fig,pmean_d0p20c2_fig,...
     pmean_d1p20c0_fig, pmean_d1p20c1_fig,pmean_d1p20c2_fig,...
     pmean_d0p101c0_fig, pmean_d0p101c1_fig,pmean_d0p101c2_fig,...
     pmean_d1p101c0_fig, pmean_d1p101c1_fig,pmean_d1p101c2_fig];
 
 
VariableNames4 = {'Return','Sharpe_Ratio'};
RowNames4 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table4= table(pmean_fig',pSRfig',...
    'VariableNames',VariableNames4,'RowNames',RowNames4);

load('d0p5c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d0p5c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d0p5c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c0_ccg1, pmean_d0p5c0_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d0p5c0_fig1, pmean_d0p5c0_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d0p5c0_ccv1, pmean_d0p5c0_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d0p5c0_fiv1, pmean_d0p5c0_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

load('d0p5c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d0p5c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d0p5c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c1_ccg1, pmean_d0p5c1_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d0p5c1_fig1, pmean_d0p5c1_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d0p5c1_ccv1, pmean_d0p5c1_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d0p5c1_fiv1, pmean_d0p5c1_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));
 
load('d0p5c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d0p5c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d0p5c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c2_ccg1, pmean_d0p5c2_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d0p5c2_fig1, pmean_d0p5c2_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d0p5c2_ccv1, pmean_d0p5c2_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d0p5c2_fiv1, pmean_d0p5c2_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

load('d1p5c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d1p5c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d1p5c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c2_ccg1, pmean_d1p5c2_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d1p5c2_fig1, pmean_d1p5c2_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d1p5c2_ccv1, pmean_d1p5c2_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d1p5c2_fiv1, pmean_d1p5c2_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

load('d1p5c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d1p5c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d1p5c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c0_ccg1, pmean_d1p5c0_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d1p5c0_fig1, pmean_d1p5c0_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d1p5c0_ccv1, pmean_d1p5c0_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d1p5c0_fiv1, pmean_d1p5c0_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

load('d1p5c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d1p5c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d1p5c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c1_ccg1, pmean_d1p5c1_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d1p5c1_fig1, pmean_d1p5c1_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d1p5c1_ccv1, pmean_d1p5c1_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d1p5c1_fiv1, pmean_d1p5c1_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

load('d0p20c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d0p20c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d0p20c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c0_ccg1, pmean_d0p20c0_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d0p20c0_fig1, pmean_d0p20c0_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d0p20c0_ccv1, pmean_d0p20c0_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d0p20c0_fiv1, pmean_d0p20c0_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

load('d0p20c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d0p20c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d0p20c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c1_ccg1, pmean_d0p20c1_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d0p20c1_fig1, pmean_d0p20c1_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d0p20c1_ccv1, pmean_d0p20c1_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d0p20c1_fiv1, pmean_d0p20c1_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));
 
load('d0p20c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d0p20c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d0p20c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c2_ccg1, pmean_d0p20c2_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d0p20c2_fig1, pmean_d0p20c2_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d0p20c2_ccv1, pmean_d0p20c2_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d0p20c2_fiv1, pmean_d0p20c2_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

load('d1p20c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d1p20c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d1p20c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c2_ccg1, pmean_d1p20c2_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d1p20c2_fig1, pmean_d1p20c2_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d1p20c2_ccv1, pmean_d1p20c2_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d1p20c2_fiv1, pmean_d1p20c2_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

load('d1p20c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d1p20c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d1p20c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c0_ccg1, pmean_d1p20c0_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d1p20c0_fig1, pmean_d1p20c0_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d1p20c0_ccv1, pmean_d1p20c0_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d1p20c0_fiv1, pmean_d1p20c0_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

load('d1p20c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d1p20c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d1p20c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c1_ccg1, pmean_d1p20c1_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d1p20c1_fig1, pmean_d1p20c1_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d1p20c1_ccv1, pmean_d1p20c1_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d1p20c1_fiv1, pmean_d1p20c1_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

load('d0p101c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d0p101c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d0p101c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c0_ccg1, pmean_d0p101c0_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d0p101c0_fig1, pmean_d0p101c0_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d0p101c0_ccv1, pmean_d0p101c0_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d0p101c0_fiv1, pmean_d0p101c0_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

load('d0p101c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d0p101c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d0p101c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c1_ccg1, pmean_d0p101c1_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d0p101c1_fig1, pmean_d0p101c1_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d0p101c1_ccv1, pmean_d0p101c1_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d0p101c1_fiv1, pmean_d0p101c1_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));
 
load('d0p101c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d0p101c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d0p101c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c2_ccg1, pmean_d0p101c2_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d0p101c2_fig1, pmean_d0p101c2_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d0p101c2_ccv1, pmean_d0p101c2_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d0p101c2_fiv1, pmean_d0p101c2_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

load('d1p101c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d1p101c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d1p101c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c2_ccg1, pmean_d1p101c2_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d1p101c2_fig1, pmean_d1p101c2_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d1p101c2_ccv1, pmean_d1p101c2_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d1p101c2_fiv1, pmean_d1p101c2_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

load('d1p101c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d1p101c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d1p101c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c0_ccg1, pmean_d1p101c0_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d1p101c0_fig1, pmean_d1p101c0_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d1p101c0_ccv1, pmean_d1p101c0_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d1p101c0_fiv1, pmean_d1p101c0_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

load('d1p101c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(1:2149,1); Rp_fi= Rp_vw_fi(1:2149,1);
load('d1p101c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg1= Rp_vw_cc(1:2149,1); Rp_fig1= Rp_vw_fi(1:2149,1);
load('d1p101c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv1= Rp_vw_cc(1:2149,1); Rp_fiv1= Rp_vw_fi(1:2149,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg1]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig1]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv1]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv1]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c1_ccg1, pmean_d1p101c1_ccg1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg1,max(mean(SBstar),1));
[pSR_d1p101c1_fig1, pmean_d1p101c1_fig1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig1,max(mean(SBstar2),1));
[pSR_d1p101c1_ccv1, pmean_d1p101c1_ccv1] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv1,max(mean(SBstar3),1));
[pSR_d1p101c1_fiv1, pmean_d1p101c1_fiv1] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv1,max(mean(SBstar4),1));

pSRccv1 = [pSR_d0p5c0_ccv1, pSR_d0p5c1_ccv1,pSR_d0p5c2_ccv1,...
     pSR_d1p5c0_ccv1, pSR_d1p5c1_ccv1,pSR_d1p5c2_ccv1,...
     pSR_d0p20c0_ccv1, pSR_d0p20c1_ccv1,pSR_d0p20c2_ccv1,...
     pSR_d1p20c0_ccv1, pSR_d1p20c1_ccv1,pSR_d1p20c2_ccv1,...
     pSR_d0p101c0_ccv1, pSR_d0p101c1_ccv1,pSR_d0p101c2_ccv1,...
     pSR_d1p101c0_ccv1, pSR_d1p101c1_ccv1,pSR_d1p101c2_ccv1];

pmean_ccv1 = [pmean_d0p5c0_ccv1, pmean_d0p5c1_ccv1,pmean_d0p5c2_ccv1,...
     pmean_d1p5c0_ccv1, pmean_d1p5c1_ccv1,pmean_d1p5c2_ccv1,...
     pmean_d0p20c0_ccv1, pmean_d0p20c1_ccv1,pmean_d0p20c2_ccv1,...
     pmean_d1p20c0_ccv1, pmean_d1p20c1_ccv1,pmean_d1p20c2_ccv1,...
     pmean_d0p101c0_ccv1, pmean_d0p101c1_ccv1,pmean_d0p101c2_ccv1,...
     pmean_d1p101c0_ccv1, pmean_d1p101c1_ccv1,pmean_d1p101c2_ccv1];
 
 
VariableNames5 = {'Return','Sharpe_Ratio'};
RowNames5 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table5 = table(pmean_ccv1',pSRccv1',...
    'VariableNames',VariableNames5,'RowNames',RowNames5);

pSRccg1 = [pSR_d0p5c0_ccg1, pSR_d0p5c1_ccg1,pSR_d0p5c2_ccg1,...
     pSR_d1p5c0_ccg1, pSR_d1p5c1_ccg1,pSR_d1p5c2_ccg1,...
     pSR_d0p20c0_ccg1, pSR_d0p20c1_ccg1,pSR_d0p20c2_ccg1,...
     pSR_d1p20c0_ccg1, pSR_d1p20c1_ccg1,pSR_d1p20c2_ccg1,...
     pSR_d0p101c0_ccg1, pSR_d0p101c1_ccg1,pSR_d0p101c2_ccg1,...
     pSR_d1p101c0_ccg1, pSR_d1p101c1_ccg1,pSR_d1p101c2_ccg1];

pmean_ccg1 = [pmean_d0p5c0_ccg1, pmean_d0p5c1_ccg1,pmean_d0p5c2_ccg1,...
     pmean_d1p5c0_ccg1, pmean_d1p5c1_ccg1,pmean_d1p5c2_ccg1,...
     pmean_d0p20c0_ccg1, pmean_d0p20c1_ccg1,pmean_d0p20c2_ccg1,...
     pmean_d1p20c0_ccg1, pmean_d1p20c1_ccg1,pmean_d1p20c2_ccg1,...
     pmean_d0p101c0_ccg1, pmean_d0p101c1_ccg1,pmean_d0p101c2_ccg1,...
     pmean_d1p101c0_ccg1, pmean_d1p101c1_ccg1,pmean_d1p101c2_ccg1];
 
 
VariableNames6 = {'Return','Sharpe_Ratio'};
RowNames6 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table6 = table(pmean_ccg1',pSRccg1',...
    'VariableNames',VariableNames6,'RowNames',RowNames6);

pSRfiv1 = [pSR_d0p5c0_fiv1, pSR_d0p5c1_fiv1,pSR_d0p5c2_fiv1,...
     pSR_d1p5c0_fiv1, pSR_d1p5c1_fiv1,pSR_d1p5c2_fiv1,...
     pSR_d0p20c0_fiv1, pSR_d0p20c1_fiv1,pSR_d0p20c2_fiv1,...
     pSR_d1p20c0_fiv1, pSR_d1p20c1_fiv1,pSR_d1p20c2_fiv1,...
     pSR_d0p101c0_fiv1, pSR_d0p101c1_fiv1,pSR_d0p101c2_fiv1,...
     pSR_d1p101c0_fiv1, pSR_d1p101c1_fiv1,pSR_d1p101c2_fiv1];

pmean_fiv1 = [pmean_d0p5c0_fiv1, pmean_d0p5c1_fiv1,pmean_d0p5c2_fiv1,...
     pmean_d1p5c0_fiv1, pmean_d1p5c1_fiv1,pmean_d1p5c2_fiv1,...
     pmean_d0p20c0_fiv1, pmean_d0p20c1_fiv1,pmean_d0p20c2_fiv1,...
     pmean_d1p20c0_fiv1, pmean_d1p20c1_fiv1,pmean_d1p20c2_fiv1,...
     pmean_d0p101c0_fiv1, pmean_d0p101c1_fiv1,pmean_d0p101c2_fiv1,...
     pmean_d1p101c0_fiv1, pmean_d1p101c1_fiv1,pmean_d1p101c2_fiv1];
 
 
VariableNames7 = {'Return','Sharpe_Ratio'};
RowNames7 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table7 = table(pmean_fiv1',pSRfiv1',...
    'VariableNames',VariableNames7,'RowNames',RowNames7);

pSRfig1 = [pSR_d0p5c0_fig1, pSR_d0p5c1_fig1,pSR_d0p5c2_fig1,...
     pSR_d1p5c0_fig1, pSR_d1p5c1_fig1,pSR_d1p5c2_fig1,...
     pSR_d0p20c0_fig1, pSR_d0p20c1_fig1,pSR_d0p20c2_fig1,...
     pSR_d1p20c0_fig1, pSR_d1p20c1_fig1,pSR_d1p20c2_fig1,...
     pSR_d0p101c0_fig1, pSR_d0p101c1_fig1,pSR_d0p101c2_fig1,...
     pSR_d1p101c0_fig1, pSR_d1p101c1_fig1,pSR_d1p101c2_fig1];

pmean_fig1 = [pmean_d0p5c0_fig1, pmean_d0p5c1_fig1,pmean_d0p5c2_fig1,...
     pmean_d1p5c0_fig1, pmean_d1p5c1_fig1,pmean_d1p5c2_fig1,...
     pmean_d0p20c0_fig1, pmean_d0p20c1_fig1,pmean_d0p20c2_fig1,...
     pmean_d1p20c0_fig1, pmean_d1p20c1_fig1,pmean_d1p20c2_fig1,...
     pmean_d0p101c0_fig1, pmean_d0p101c1_fig1,pmean_d0p101c2_fig1,...
     pmean_d1p101c0_fig1, pmean_d1p101c1_fig1,pmean_d1p101c2_fig1];
 
 
VariableNames8 = {'Return','Sharpe_Ratio'};
RowNames8 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table8= table(pmean_fig1',pSRfig1',...
    'VariableNames',VariableNames8,'RowNames',RowNames8);

load('d0p5c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p5c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p5c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c0_ccg2, pmean_d0p5c0_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p5c0_fig2, pmean_d0p5c0_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p5c0_ccv2, pmean_d0p5c0_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p5c0_fiv2, pmean_d0p5c0_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d0p5c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p5c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p5c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c1_ccg2, pmean_d0p5c1_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p5c1_fig2, pmean_d0p5c1_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p5c1_ccv2, pmean_d0p5c1_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p5c1_fiv2, pmean_d0p5c1_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));
 
load('d0p5c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p5c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p5c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c2_ccg2, pmean_d0p5c2_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p5c2_fig2, pmean_d0p5c2_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p5c2_ccv2, pmean_d0p5c2_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p5c2_fiv2, pmean_d0p5c2_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p5c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p5c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p5c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c2_ccg2, pmean_d1p5c2_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p5c2_fig2, pmean_d1p5c2_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p5c2_ccv2, pmean_d1p5c2_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p5c2_fiv2, pmean_d1p5c2_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p5c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p5c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p5c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c0_ccg2, pmean_d1p5c0_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p5c0_fig2, pmean_d1p5c0_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p5c0_ccv2, pmean_d1p5c0_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p5c0_fiv2, pmean_d1p5c0_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p5c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p5c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p5c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c1_ccg2, pmean_d1p5c1_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p5c1_fig2, pmean_d1p5c1_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p5c1_ccv2, pmean_d1p5c1_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p5c1_fiv2, pmean_d1p5c1_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d0p20c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p20c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p20c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c0_ccg2, pmean_d0p20c0_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p20c0_fig2, pmean_d0p20c0_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p20c0_ccv2, pmean_d0p20c0_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p20c0_fiv2, pmean_d0p20c0_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d0p20c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p20c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p20c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c1_ccg2, pmean_d0p20c1_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p20c1_fig2, pmean_d0p20c1_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p20c1_ccv2, pmean_d0p20c1_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p20c1_fiv2, pmean_d0p20c1_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));
 
load('d0p20c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p20c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p20c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c2_ccg2, pmean_d0p20c2_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p20c2_fig2, pmean_d0p20c2_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p20c2_ccv2, pmean_d0p20c2_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p20c2_fiv2, pmean_d0p20c2_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p20c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p20c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p20c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c2_ccg2, pmean_d1p20c2_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p20c2_fig2, pmean_d1p20c2_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p20c2_ccv2, pmean_d1p20c2_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p20c2_fiv2, pmean_d1p20c2_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p20c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p20c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p20c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c0_ccg2, pmean_d1p20c0_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p20c0_fig2, pmean_d1p20c0_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p20c0_ccv2, pmean_d1p20c0_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p20c0_fiv2, pmean_d1p20c0_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p20c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p20c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p20c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c1_ccg2, pmean_d1p20c1_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p20c1_fig2, pmean_d1p20c1_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p20c1_ccv2, pmean_d1p20c1_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p20c1_fiv2, pmean_d1p20c1_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d0p101c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p101c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p101c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c0_ccg2, pmean_d0p101c0_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p101c0_fig2, pmean_d0p101c0_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p101c0_ccv2, pmean_d0p101c0_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p101c0_fiv2, pmean_d0p101c0_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d0p101c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p101c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p101c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c1_ccg2, pmean_d0p101c1_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p101c1_fig2, pmean_d0p101c1_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p101c1_ccv2, pmean_d0p101c1_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p101c1_fiv2, pmean_d0p101c1_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));
 
load('d0p101c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p101c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p101c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c2_ccg2, pmean_d0p101c2_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p101c2_fig2, pmean_d0p101c2_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p101c2_ccv2, pmean_d0p101c2_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p101c2_fiv2, pmean_d0p101c2_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p101c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p101c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p101c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c2_ccg2, pmean_d1p101c2_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p101c2_fig2, pmean_d1p101c2_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p101c2_ccv2, pmean_d1p101c2_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p101c2_fiv2, pmean_d1p101c2_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p101c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p101c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p101c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c0_ccg2, pmean_d1p101c0_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p101c0_fig2, pmean_d1p101c0_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p101c0_ccv2, pmean_d1p101c0_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p101c0_fiv2, pmean_d1p101c0_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p101c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p101c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p101c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c1_ccg2, pmean_d1p101c1_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p101c1_fig2, pmean_d1p101c1_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p101c1_ccv2, pmean_d1p101c1_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p101c1_fiv2, pmean_d1p101c1_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d0p5c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p5c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p5c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c0_ccg2, pmean_d0p5c0_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p5c0_fig2, pmean_d0p5c0_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p5c0_ccv2, pmean_d0p5c0_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p5c0_fiv2, pmean_d0p5c0_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d0p5c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p5c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p5c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c1_ccg2, pmean_d0p5c1_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p5c1_fig2, pmean_d0p5c1_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p5c1_ccv2, pmean_d0p5c1_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p5c1_fiv2, pmean_d0p5c1_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));
 
load('d0p5c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p5c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p5c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c2_ccg2, pmean_d0p5c2_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p5c2_fig2, pmean_d0p5c2_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p5c2_ccv2, pmean_d0p5c2_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p5c2_fiv2, pmean_d0p5c2_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p5c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p5c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p5c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c2_ccg2, pmean_d1p5c2_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p5c2_fig2, pmean_d1p5c2_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p5c2_ccv2, pmean_d1p5c2_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p5c2_fiv2, pmean_d1p5c2_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p5c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p5c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p5c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c0_ccg2, pmean_d1p5c0_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p5c0_fig2, pmean_d1p5c0_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p5c0_ccv2, pmean_d1p5c0_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p5c0_fiv2, pmean_d1p5c0_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p5c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p5c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p5c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c1_ccg2, pmean_d1p5c1_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p5c1_fig2, pmean_d1p5c1_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p5c1_ccv2, pmean_d1p5c1_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p5c1_fiv2, pmean_d1p5c1_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d0p20c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p20c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p20c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c0_ccg2, pmean_d0p20c0_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p20c0_fig2, pmean_d0p20c0_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p20c0_ccv2, pmean_d0p20c0_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p20c0_fiv2, pmean_d0p20c0_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d0p20c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p20c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p20c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c1_ccg2, pmean_d0p20c1_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p20c1_fig2, pmean_d0p20c1_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p20c1_ccv2, pmean_d0p20c1_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p20c1_fiv2, pmean_d0p20c1_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));
 
load('d0p20c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p20c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p20c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c2_ccg2, pmean_d0p20c2_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p20c2_fig2, pmean_d0p20c2_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p20c2_ccv2, pmean_d0p20c2_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p20c2_fiv2, pmean_d0p20c2_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p20c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p20c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p20c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c2_ccg2, pmean_d1p20c2_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p20c2_fig2, pmean_d1p20c2_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p20c2_ccv2, pmean_d1p20c2_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p20c2_fiv2, pmean_d1p20c2_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p20c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p20c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p20c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c0_ccg2, pmean_d1p20c0_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p20c0_fig2, pmean_d1p20c0_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p20c0_ccv2, pmean_d1p20c0_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p20c0_fiv2, pmean_d1p20c0_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p20c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p20c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p20c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c1_ccg2, pmean_d1p20c1_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p20c1_fig2, pmean_d1p20c1_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p20c1_ccv2, pmean_d1p20c1_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p20c1_fiv2, pmean_d1p20c1_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d0p101c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p101c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p101c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c0_ccg2, pmean_d0p101c0_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p101c0_fig2, pmean_d0p101c0_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p101c0_ccv2, pmean_d0p101c0_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p101c0_fiv2, pmean_d0p101c0_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d0p101c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p101c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p101c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c1_ccg2, pmean_d0p101c1_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p101c1_fig2, pmean_d0p101c1_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p101c1_ccv2, pmean_d0p101c1_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p101c1_fiv2, pmean_d0p101c1_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));
 
load('d0p101c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d0p101c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d0p101c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c2_ccg2, pmean_d0p101c2_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d0p101c2_fig2, pmean_d0p101c2_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d0p101c2_ccv2, pmean_d0p101c2_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d0p101c2_fiv2, pmean_d0p101c2_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p101c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p101c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p101c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c2_ccg2, pmean_d1p101c2_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p101c2_fig2, pmean_d1p101c2_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p101c2_ccv2, pmean_d1p101c2_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p101c2_fiv2, pmean_d1p101c2_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p101c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p101c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p101c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c0_ccg2, pmean_d1p101c0_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p101c0_fig2, pmean_d1p101c0_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p101c0_ccv2, pmean_d1p101c0_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p101c0_fiv2, pmean_d1p101c0_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

load('d1p101c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2150:2901,1); Rp_fi= Rp_vw_fi(2150:2901,1);
load('d1p101c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg2= Rp_vw_cc(2150:2901,1); Rp_fig2= Rp_vw_fi(2150:2901,1);
load('d1p101c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv2= Rp_vw_cc(2150:2901,1); Rp_fiv2= Rp_vw_fi(2150:2901,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg2]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig2]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv2]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv2]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c1_ccg2, pmean_d1p101c1_ccg2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg2,max(mean(SBstar),1));
[pSR_d1p101c1_fig2, pmean_d1p101c1_fig2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig2,max(mean(SBstar2),1));
[pSR_d1p101c1_ccv2, pmean_d1p101c1_ccv2] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv2,max(mean(SBstar3),1));
[pSR_d1p101c1_fiv2, pmean_d1p101c1_fiv2] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv2,max(mean(SBstar4),1));

pSRccv2 = [pSR_d0p5c0_ccv2, pSR_d0p5c1_ccv2,pSR_d0p5c2_ccv2,...
     pSR_d1p5c0_ccv2, pSR_d1p5c1_ccv2,pSR_d1p5c2_ccv2,...
     pSR_d0p20c0_ccv2, pSR_d0p20c1_ccv2,pSR_d0p20c2_ccv2,...
     pSR_d1p20c0_ccv2, pSR_d1p20c1_ccv2,pSR_d1p20c2_ccv2,...
     pSR_d0p101c0_ccv2, pSR_d0p101c1_ccv2,pSR_d0p101c2_ccv2,...
     pSR_d1p101c0_ccv2, pSR_d1p101c1_ccv2,pSR_d1p101c2_ccv2];

pmean_ccv2 = [pmean_d0p5c0_ccv2, pmean_d0p5c1_ccv2,pmean_d0p5c2_ccv2,...
     pmean_d1p5c0_ccv2, pmean_d1p5c1_ccv2,pmean_d1p5c2_ccv2,...
     pmean_d0p20c0_ccv2, pmean_d0p20c1_ccv2,pmean_d0p20c2_ccv2,...
     pmean_d1p20c0_ccv2, pmean_d1p20c1_ccv2,pmean_d1p20c2_ccv2,...
     pmean_d0p101c0_ccv2, pmean_d0p101c1_ccv2,pmean_d0p101c2_ccv2,...
     pmean_d1p101c0_ccv2, pmean_d1p101c1_ccv2,pmean_d1p101c2_ccv2];
 
 
VariableNames9 = {'Return','Sharpe_Ratio'};
RowNames9= {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table9 = table(pmean_ccv2',pSRccv2',...
    'VariableNames',VariableNames9,'RowNames',RowNames9);

pSRccg2 = [pSR_d0p5c0_ccg2, pSR_d0p5c1_ccg2,pSR_d0p5c2_ccg2,...
     pSR_d1p5c0_ccg2, pSR_d1p5c1_ccg2,pSR_d1p5c2_ccg2,...
     pSR_d0p20c0_ccg2, pSR_d0p20c1_ccg2,pSR_d0p20c2_ccg2,...
     pSR_d1p20c0_ccg2, pSR_d1p20c1_ccg2,pSR_d1p20c2_ccg2,...
     pSR_d0p101c0_ccg2, pSR_d0p101c1_ccg2,pSR_d0p101c2_ccg2,...
     pSR_d1p101c0_ccg2, pSR_d1p101c1_ccg2,pSR_d1p101c2_ccg2];

pmean_ccg2 = [pmean_d0p5c0_ccg2, pmean_d0p5c1_ccg2,pmean_d0p5c2_ccg2,...
     pmean_d1p5c0_ccg2, pmean_d1p5c1_ccg2,pmean_d1p5c2_ccg2,...
     pmean_d0p20c0_ccg2, pmean_d0p20c1_ccg2,pmean_d0p20c2_ccg2,...
     pmean_d1p20c0_ccg2, pmean_d1p20c1_ccg2,pmean_d1p20c2_ccg2,...
     pmean_d0p101c0_ccg2, pmean_d0p101c1_ccg2,pmean_d0p101c2_ccg2,...
     pmean_d1p101c0_ccg2, pmean_d1p101c1_ccg2,pmean_d1p101c2_ccg2];
 
 
VariableNames6 = {'Return','Sharpe_Ratio'};
RowNames6 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table10 = table(pmean_ccg2',pSRccg2',...
    'VariableNames',VariableNames10,'RowNames',RowNames10);

pSRfiv2 = [pSR_d0p5c0_fiv2, pSR_d0p5c1_fiv2,pSR_d0p5c2_fiv2,...
     pSR_d1p5c0_fiv2, pSR_d1p5c1_fiv2,pSR_d1p5c2_fiv2,...
     pSR_d0p20c0_fiv2, pSR_d0p20c1_fiv2,pSR_d0p20c2_fiv2,...
     pSR_d1p20c0_fiv2, pSR_d1p20c1_fiv2,pSR_d1p20c2_fiv2,...
     pSR_d0p101c0_fiv2, pSR_d0p101c1_fiv2,pSR_d0p101c2_fiv2,...
     pSR_d1p101c0_fiv2, pSR_d1p101c1_fiv2,pSR_d1p101c2_fiv2];

pmean_fiv2 = [pmean_d0p5c0_fiv2, pmean_d0p5c1_fiv2,pmean_d0p5c2_fiv2,...
     pmean_d1p5c0_fiv2, pmean_d1p5c1_fiv2,pmean_d1p5c2_fiv2,...
     pmean_d0p20c0_fiv2, pmean_d0p20c1_fiv2,pmean_d0p20c2_fiv2,...
     pmean_d1p20c0_fiv2, pmean_d1p20c1_fiv2,pmean_d1p20c2_fiv2,...
     pmean_d0p101c0_fiv2, pmean_d0p101c1_fiv2,pmean_d0p101c2_fiv2,...
     pmean_d1p101c0_fiv2, pmean_d1p101c1_fiv2,pmean_d1p101c2_fiv2];
 
 
VariableNames11 = {'Return','Sharpe_Ratio'};
RowNames11 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table11= table(pmean_fiv2',pSRfiv2',...
    'VariableNames',VariableNames11,'RowNames',RowNames11);

pSRfig2 = [pSR_d0p5c0_fig2, pSR_d0p5c1_fig2,pSR_d0p5c2_fig2,...
     pSR_d1p5c0_fig2, pSR_d1p5c1_fig2,pSR_d1p5c2_fig2,...
     pSR_d0p20c0_fig2, pSR_d0p20c1_fig2,pSR_d0p20c2_fig2,...
     pSR_d1p20c0_fig2, pSR_d1p20c1_fig2,pSR_d1p20c2_fig2,...
     pSR_d0p101c0_fig2, pSR_d0p101c1_fig2,pSR_d0p101c2_fig2,...
     pSR_d1p101c0_fig2, pSR_d1p101c1_fig2,pSR_d1p101c2_fig2];

pmean_fig2 = [pmean_d0p5c0_fig2, pmean_d0p5c1_fig2,pmean_d0p5c2_fig2,...
     pmean_d1p5c0_fig2, pmean_d1p5c1_fig2,pmean_d1p5c2_fig2,...
     pmean_d0p20c0_fig2, pmean_d0p20c1_fig2,pmean_d0p20c2_fig2,...
     pmean_d1p20c0_fig2, pmean_d1p20c1_fig2,pmean_d1p20c2_fig2,...
     pmean_d0p101c0_fig2, pmean_d0p101c1_fig2,pmean_d0p101c2_fig2,...
     pmean_d1p101c0_fig2, pmean_d1p101c1_fig2,pmean_d1p101c2_fig2];
 
 
VariableNames12 = {'Return','Sharpe_Ratio'};
RowNames12 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table12= table(pmean_fig2',pSRfig2',...
    'VariableNames',VariableNames12,'RowNames',RowNames12);

load('d0p5c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d0p5c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d0p5c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c0_ccg3, pmean_d0p5c0_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d0p5c0_fig3, pmean_d0p5c0_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d0p5c0_ccv3, pmean_d0p5c0_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d0p5c0_fiv3, pmean_d0p5c0_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

load('d0p5c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d0p5c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d0p5c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c1_ccg3, pmean_d0p5c1_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d0p5c1_fig3, pmean_d0p5c1_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d0p5c1_ccv3, pmean_d0p5c1_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d0p5c1_fiv3, pmean_d0p5c1_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));
 
load('d0p5c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d0p5c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d0p5c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c2_ccg3, pmean_d0p5c2_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d0p5c2_fig3, pmean_d0p5c2_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d0p5c2_ccv3, pmean_d0p5c2_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d0p5c2_fiv3, pmean_d0p5c2_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

load('d1p5c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d1p5c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d1p5c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c2_ccg3, pmean_d1p5c2_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d1p5c2_fig3, pmean_d1p5c2_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d1p5c2_ccv3, pmean_d1p5c2_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d1p5c2_fiv3, pmean_d1p5c2_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

load('d1p5c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d1p5c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d1p5c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c0_ccg3, pmean_d1p5c0_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d1p5c0_fig3, pmean_d1p5c0_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d1p5c0_ccv3, pmean_d1p5c0_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d1p5c0_fiv3, pmean_d1p5c0_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

load('d1p5c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d1p5c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d1p5c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c1_ccg3, pmean_d1p5c1_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d1p5c1_fig3, pmean_d1p5c1_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d1p5c1_ccv3, pmean_d1p5c1_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d1p5c1_fiv3, pmean_d1p5c1_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

load('d0p20c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d0p20c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d0p20c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c0_ccg3, pmean_d0p20c0_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d0p20c0_fig3, pmean_d0p20c0_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d0p20c0_ccv3, pmean_d0p20c0_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d0p20c0_fiv3, pmean_d0p20c0_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

load('d0p20c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d0p20c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d0p20c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c1_ccg3, pmean_d0p20c1_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d0p20c1_fig3, pmean_d0p20c1_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d0p20c1_ccv3, pmean_d0p20c1_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d0p20c1_fiv3, pmean_d0p20c1_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));
 
load('d0p20c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d0p20c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d0p20c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c2_ccg3, pmean_d0p20c2_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d0p20c2_fig3, pmean_d0p20c2_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d0p20c2_ccv3, pmean_d0p20c2_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d0p20c2_fiv3, pmean_d0p20c2_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

load('d1p20c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d1p20c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d1p20c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c2_ccg3, pmean_d1p20c2_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d1p20c2_fig3, pmean_d1p20c2_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d1p20c2_ccv3, pmean_d1p20c2_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d1p20c2_fiv3, pmean_d1p20c2_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

load('d1p20c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d1p20c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d1p20c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c0_ccg3, pmean_d1p20c0_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d1p20c0_fig3, pmean_d1p20c0_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d1p20c0_ccv3, pmean_d1p20c0_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d1p20c0_fiv3, pmean_d1p20c0_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

load('d1p20c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d1p20c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d1p20c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c1_ccg3, pmean_d1p20c1_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d1p20c1_fig3, pmean_d1p20c1_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d1p20c1_ccv3, pmean_d1p20c1_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d1p20c1_fiv3, pmean_d1p20c1_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

load('d0p101c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d0p101c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d0p101c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c0_ccg3, pmean_d0p101c0_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d0p101c0_fig3, pmean_d0p101c0_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d0p101c0_ccv3, pmean_d0p101c0_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d0p101c0_fiv3, pmean_d0p101c0_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

load('d0p101c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d0p101c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d0p101c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c1_ccg3, pmean_d0p101c1_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d0p101c1_fig3, pmean_d0p101c1_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d0p101c1_ccv3, pmean_d0p101c1_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d0p101c1_fiv3, pmean_d0p101c1_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));
 
load('d0p101c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d0p101c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d0p101c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c2_ccg3, pmean_d0p101c2_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d0p101c2_fig3, pmean_d0p101c2_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d0p101c2_ccv3, pmean_d0p101c2_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d0p101c2_fiv3, pmean_d0p101c2_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

load('d1p101c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d1p101c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d1p101c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c2_ccg3, pmean_d1p101c2_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d1p101c2_fig3, pmean_d1p101c2_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d1p101c2_ccv3, pmean_d1p101c2_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d1p101c2_fiv3, pmean_d1p101c2_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

load('d1p101c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d1p101c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d1p101c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c0_ccg3, pmean_d1p101c0_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d1p101c0_fig3, pmean_d1p101c0_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d1p101c0_ccv3, pmean_d1p101c0_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d1p101c0_fiv3, pmean_d1p101c0_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

load('d1p101c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(2902:4032,1); Rp_fi= Rp_vw_fi(2902:4032,1);
load('d1p101c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg3= Rp_vw_cc(2902:4032,1); Rp_fig3= Rp_vw_fi(2902:4032,1);
load('d1p101c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv3= Rp_vw_cc(2902:4032,1); Rp_fiv3= Rp_vw_fi(2902:4032,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg3]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig3]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv3]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv3]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c1_ccg3, pmean_d1p101c1_ccg3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg3,max(mean(SBstar),1));
[pSR_d1p101c1_fig3, pmean_d1p101c1_fig3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig3,max(mean(SBstar2),1));
[pSR_d1p101c1_ccv3, pmean_d1p101c1_ccv3] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv3,max(mean(SBstar3),1));
[pSR_d1p101c1_fiv3, pmean_d1p101c1_fiv3] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv3,max(mean(SBstar4),1));

pSRccv3 = [pSR_d0p5c0_ccv3, pSR_d0p5c1_ccv3,pSR_d0p5c2_ccv3,...
     pSR_d1p5c0_ccv3, pSR_d1p5c1_ccv3,pSR_d1p5c2_ccv3,...
     pSR_d0p20c0_ccv3, pSR_d0p20c1_ccv3,pSR_d0p20c2_ccv3,...
     pSR_d1p20c0_ccv3, pSR_d1p20c1_ccv3,pSR_d1p20c2_ccv3,...
     pSR_d0p101c0_ccv3, pSR_d0p101c1_ccv3,pSR_d0p101c2_ccv3,...
     pSR_d1p101c0_ccv3, pSR_d1p101c1_ccv3,pSR_d1p101c2_ccv3];

pmean_ccv3 = [pmean_d0p5c0_ccv3, pmean_d0p5c1_ccv3,pmean_d0p5c2_ccv3,...
     pmean_d1p5c0_ccv3, pmean_d1p5c1_ccv3,pmean_d1p5c2_ccv3,...
     pmean_d0p20c0_ccv3, pmean_d0p20c1_ccv3,pmean_d0p20c2_ccv3,...
     pmean_d1p20c0_ccv3, pmean_d1p20c1_ccv3,pmean_d1p20c2_ccv3,...
     pmean_d0p101c0_ccv3, pmean_d0p101c1_ccv3,pmean_d0p101c2_ccv3,...
     pmean_d1p101c0_ccv3, pmean_d1p101c1_ccv3,pmean_d1p101c2_ccv3];
 
 
VariableNames13 = {'Return','Sharpe_Ratio'};
RowNames13= {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table13 = table(pmean_ccv3',pSRccv3',...
    'VariableNames',VariableNames13,'RowNames',RowNames13);

pSRccg3 = [pSR_d0p5c0_ccg3, pSR_d0p5c1_ccg3,pSR_d0p5c2_ccg3,...
     pSR_d1p5c0_ccg3, pSR_d1p5c1_ccg3,pSR_d1p5c2_ccg3,...
     pSR_d0p20c0_ccg3, pSR_d0p20c1_ccg3,pSR_d0p20c2_ccg3,...
     pSR_d1p20c0_ccg3, pSR_d1p20c1_ccg3,pSR_d1p20c2_ccg3,...
     pSR_d0p101c0_ccg3, pSR_d0p101c1_ccg3,pSR_d0p101c2_ccg3,...
     pSR_d1p101c0_ccg3, pSR_d1p101c1_ccg3,pSR_d1p101c2_ccg3];

pmean_ccg3 = [pmean_d0p5c0_ccg3, pmean_d0p5c1_ccg3,pmean_d0p5c2_ccg3,...
     pmean_d1p5c0_ccg3, pmean_d1p5c1_ccg3,pmean_d1p5c2_ccg3,...
     pmean_d0p20c0_ccg3, pmean_d0p20c1_ccg3,pmean_d0p20c2_ccg3,...
     pmean_d1p20c0_ccg3, pmean_d1p20c1_ccg3,pmean_d1p20c2_ccg3,...
     pmean_d0p101c0_ccg3, pmean_d0p101c1_ccg3,pmean_d0p101c2_ccg3,...
     pmean_d1p101c0_ccg3, pmean_d1p101c1_ccg3,pmean_d1p101c2_ccg3];
 
 
VariableNames14 = {'Return','Sharpe_Ratio'};
RowNames14 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table14 = table(pmean_ccg3',pSRccg3',...
    'VariableNames',VariableNames14,'RowNames',RowNames14);

pSRfiv3 = [pSR_d0p5c0_fiv3, pSR_d0p5c1_fiv3,pSR_d0p5c2_fiv3,...
     pSR_d1p5c0_fiv3, pSR_d1p5c1_fiv3,pSR_d1p5c2_fiv3,...
     pSR_d0p20c0_fiv3, pSR_d0p20c1_fiv3,pSR_d0p20c2_fiv3,...
     pSR_d1p20c0_fiv3, pSR_d1p20c1_fiv3,pSR_d1p20c2_fiv3,...
     pSR_d0p101c0_fiv3, pSR_d0p101c1_fiv3,pSR_d0p101c2_fiv3,...
     pSR_d1p101c0_fiv3, pSR_d1p101c1_fiv3,pSR_d1p101c2_fiv3];

pmean_fiv3 = [pmean_d0p5c0_fiv3, pmean_d0p5c1_fiv3,pmean_d0p5c2_fiv3,...
     pmean_d1p5c0_fiv3, pmean_d1p5c1_fiv3,pmean_d1p5c2_fiv3,...
     pmean_d0p20c0_fiv3, pmean_d0p20c1_fiv3,pmean_d0p20c2_fiv3,...
     pmean_d1p20c0_fiv3, pmean_d1p20c1_fiv3,pmean_d1p20c2_fiv3,...
     pmean_d0p101c0_fiv3, pmean_d0p101c1_fiv3,pmean_d0p101c2_fiv3,...
     pmean_d1p101c0_fiv3, pmean_d1p101c1_fiv3,pmean_d1p101c2_fiv3];
 
 
VariableNames15 = {'Return','Sharpe_Ratio'};
RowNames15 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table15= table(pmean_fiv3',pSRfiv3',...
    'VariableNames',VariableNames15,'RowNames',RowNames15);

pSRfig3 = [pSR_d0p5c0_fig3, pSR_d0p5c1_fig3,pSR_d0p5c2_fig3,...
     pSR_d1p5c0_fig3, pSR_d1p5c1_fig3,pSR_d1p5c2_fig3,...
     pSR_d0p20c0_fig3, pSR_d0p20c1_fig3,pSR_d0p20c2_fig3,...
     pSR_d1p20c0_fig3, pSR_d1p20c1_fig3,pSR_d1p20c2_fig3,...
     pSR_d0p101c0_fig3, pSR_d0p101c1_fig3,pSR_d0p101c2_fig3,...
     pSR_d1p101c0_fig3, pSR_d1p101c1_fig3,pSR_d1p101c2_fig3];

pmean_fig3 = [pmean_d0p5c0_fig3, pmean_d0p5c1_fig3,pmean_d0p5c2_fig3,...
     pmean_d1p5c0_fig3, pmean_d1p5c1_fig3,pmean_d1p5c2_fig3,...
     pmean_d0p20c0_fig3, pmean_d0p20c1_fig3,pmean_d0p20c2_fig3,...
     pmean_d1p20c0_fig3, pmean_d1p20c1_fig3,pmean_d1p20c2_fig3,...
     pmean_d0p101c0_fig3, pmean_d0p101c1_fig3,pmean_d0p101c2_fig3,...
     pmean_d1p101c0_fig3, pmean_d1p101c1_fig3,pmean_d1p101c2_fig3];
 
 
VariableNames16 = {'Return','Sharpe_Ratio'};
RowNames16 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table16= table(pmean_fig3',pSRfig3',...
    'VariableNames',VariableNames16,'RowNames',RowNames16);

load('d0p5c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d0p5c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d0p5c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c0_ccg4, pmean_d0p5c0_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d0p5c0_fig4, pmean_d0p5c0_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d0p5c0_ccv4, pmean_d0p5c0_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d0p5c0_fiv4, pmean_d0p5c0_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

load('d0p5c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d0p5c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d0p5c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c1_ccg4, pmean_d0p5c1_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d0p5c1_fig4, pmean_d0p5c1_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d0p5c1_ccv4, pmean_d0p5c1_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d0p5c1_fiv4, pmean_d0p5c1_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));
 
load('d0p5c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d0p5c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d0p5c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c2_ccg4, pmean_d0p5c2_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d0p5c2_fig4, pmean_d0p5c2_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d0p5c2_ccv4, pmean_d0p5c2_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d0p5c2_fiv4, pmean_d0p5c2_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

load('d1p5c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d1p5c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d1p5c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c2_ccg4, pmean_d1p5c2_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d1p5c2_fig4, pmean_d1p5c2_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d1p5c2_ccv4, pmean_d1p5c2_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d1p5c2_fiv4, pmean_d1p5c2_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

load('d1p5c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d1p5c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d1p5c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c0_ccg4, pmean_d1p5c0_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d1p5c0_fig4, pmean_d1p5c0_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d1p5c0_ccv4, pmean_d1p5c0_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d1p5c0_fiv4, pmean_d1p5c0_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

load('d1p5c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d1p5c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d1p5c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c1_ccg4, pmean_d1p5c1_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d1p5c1_fig4, pmean_d1p5c1_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d1p5c1_ccv4, pmean_d1p5c1_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d1p5c1_fiv4, pmean_d1p5c1_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

load('d0p20c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d0p20c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d0p20c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c0_ccg4, pmean_d0p20c0_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d0p20c0_fig4, pmean_d0p20c0_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d0p20c0_ccv4, pmean_d0p20c0_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d0p20c0_fiv4, pmean_d0p20c0_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

load('d0p20c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d0p20c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d0p20c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c1_ccg4, pmean_d0p20c1_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d0p20c1_fig4, pmean_d0p20c1_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d0p20c1_ccv4, pmean_d0p20c1_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d0p20c1_fiv4, pmean_d0p20c1_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));
 
load('d0p20c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d0p20c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d0p20c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c2_ccg4, pmean_d0p20c2_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d0p20c2_fig4, pmean_d0p20c2_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d0p20c2_ccv4, pmean_d0p20c2_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d0p20c2_fiv4, pmean_d0p20c2_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

load('d1p20c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d1p20c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d1p20c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c2_ccg4, pmean_d1p20c2_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d1p20c2_fig4, pmean_d1p20c2_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d1p20c2_ccv4, pmean_d1p20c2_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d1p20c2_fiv4, pmean_d1p20c2_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

load('d1p20c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d1p20c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d1p20c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c0_ccg4, pmean_d1p20c0_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d1p20c0_fig4, pmean_d1p20c0_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d1p20c0_ccv4, pmean_d1p20c0_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d1p20c0_fiv4, pmean_d1p20c0_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

load('d1p20c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d1p20c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d1p20c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c1_ccg4, pmean_d1p20c1_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d1p20c1_fig4, pmean_d1p20c1_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d1p20c1_ccv4, pmean_d1p20c1_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d1p20c1_fiv4, pmean_d1p20c1_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

load('d0p101c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d0p101c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d0p101c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c0_ccg4, pmean_d0p101c0_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d0p101c0_fig4, pmean_d0p101c0_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d0p101c0_ccv4, pmean_d0p101c0_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d0p101c0_fiv4, pmean_d0p101c0_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

load('d0p101c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d0p101c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d0p101c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c1_ccg4, pmean_d0p101c1_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d0p101c1_fig4, pmean_d0p101c1_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d0p101c1_ccv4, pmean_d0p101c1_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d0p101c1_fiv4, pmean_d0p101c1_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));
 
load('d0p101c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d0p101c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d0p101c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c2_ccg4, pmean_d0p101c2_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d0p101c2_fig4, pmean_d0p101c2_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d0p101c2_ccv4, pmean_d0p101c2_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d0p101c2_fiv4, pmean_d0p101c2_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

load('d1p101c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d1p101c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d1p101c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c2_ccg4, pmean_d1p101c2_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d1p101c2_fig4, pmean_d1p101c2_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d1p101c2_ccv4, pmean_d1p101c2_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d1p101c2_fiv4, pmean_d1p101c2_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

load('d1p101c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d1p101c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d1p101c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c0_ccg4, pmean_d1p101c0_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d1p101c0_fig4, pmean_d1p101c0_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d1p101c0_ccv4, pmean_d1p101c0_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d1p101c0_fiv4, pmean_d1p101c0_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

load('d1p101c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4033:4536,1); Rp_fi= Rp_vw_fi(4033:4536,1);
load('d1p101c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg4= Rp_vw_cc(4033:4536,1); Rp_fig4= Rp_vw_fi(4033:4536,1);
load('d1p101c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv4= Rp_vw_cc(4033:4536,1); Rp_fiv4= Rp_vw_fi(4033:4536,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg4]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig4]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv4]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv4]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c1_ccg4, pmean_d1p101c1_ccg4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg4,max(mean(SBstar),1));
[pSR_d1p101c1_fig4, pmean_d1p101c1_fig4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig4,max(mean(SBstar2),1));
[pSR_d1p101c1_ccv4, pmean_d1p101c1_ccv4] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv4,max(mean(SBstar3),1));
[pSR_d1p101c1_fiv4, pmean_d1p101c1_fiv4] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv4,max(mean(SBstar4),1));

pSRccv4 = [pSR_d0p5c0_ccv4, pSR_d0p5c1_ccv4,pSR_d0p5c2_ccv4,...
     pSR_d1p5c0_ccv4, pSR_d1p5c1_ccv4,pSR_d1p5c2_ccv4,...
     pSR_d0p20c0_ccv4, pSR_d0p20c1_ccv4,pSR_d0p20c2_ccv4,...
     pSR_d1p20c0_ccv4, pSR_d1p20c1_ccv4,pSR_d1p20c2_ccv4,...
     pSR_d0p101c0_ccv4, pSR_d0p101c1_ccv4,pSR_d0p101c2_ccv4,...
     pSR_d1p101c0_ccv4, pSR_d1p101c1_ccv4,pSR_d1p101c2_ccv4];

pmean_ccv4 = [pmean_d0p5c0_ccv4, pmean_d0p5c1_ccv4,pmean_d0p5c2_ccv4,...
     pmean_d1p5c0_ccv4, pmean_d1p5c1_ccv4,pmean_d1p5c2_ccv4,...
     pmean_d0p20c0_ccv4, pmean_d0p20c1_ccv4,pmean_d0p20c2_ccv4,...
     pmean_d1p20c0_ccv4, pmean_d1p20c1_ccv4,pmean_d1p20c2_ccv4,...
     pmean_d0p101c0_ccv4, pmean_d0p101c1_ccv4,pmean_d0p101c2_ccv4,...
     pmean_d1p101c0_ccv4, pmean_d1p101c1_ccv4,pmean_d1p101c2_ccv4];
 
 
VariableNames17 = {'Return','Sharpe_Ratio'};
RowNames17= {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table17 = table(pmean_ccv4',pSRccv4',...
    'VariableNames',VariableNames17,'RowNames',RowNames17);

pSRccg4 = [pSR_d0p5c0_ccg4, pSR_d0p5c1_ccg4,pSR_d0p5c2_ccg4,...
     pSR_d1p5c0_ccg4, pSR_d1p5c1_ccg4,pSR_d1p5c2_ccg4,...
     pSR_d0p20c0_ccg4, pSR_d0p20c1_ccg4,pSR_d0p20c2_ccg4,...
     pSR_d1p20c0_ccg4, pSR_d1p20c1_ccg4,pSR_d1p20c2_ccg4,...
     pSR_d0p101c0_ccg4, pSR_d0p101c1_ccg4,pSR_d0p101c2_ccg4,...
     pSR_d1p101c0_ccg4, pSR_d1p101c1_ccg4,pSR_d1p101c2_ccg4];

pmean_ccg4 = [pmean_d0p5c0_ccg4, pmean_d0p5c1_ccg4,pmean_d0p5c2_ccg4,...
     pmean_d1p5c0_ccg4, pmean_d1p5c1_ccg4,pmean_d1p5c2_ccg4,...
     pmean_d0p20c0_ccg4, pmean_d0p20c1_ccg4,pmean_d0p20c2_ccg4,...
     pmean_d1p20c0_ccg4, pmean_d1p20c1_ccg4,pmean_d1p20c2_ccg4,...
     pmean_d0p101c0_ccg4, pmean_d0p101c1_ccg4,pmean_d0p101c2_ccg4,...
     pmean_d1p101c0_ccg4, pmean_d1p101c1_ccg4,pmean_d1p101c2_ccg4];
 
 
VariableNames18 = {'Return','Sharpe_Ratio'};
RowNames18 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table18 = table(pmean_ccg4',pSRccg4',...
    'VariableNames',VariableNames18,'RowNames',RowNames18);

pSRfiv4 = [pSR_d0p5c0_fiv4, pSR_d0p5c1_fiv4,pSR_d0p5c2_fiv4,...
     pSR_d1p5c0_fiv4, pSR_d1p5c1_fiv4,pSR_d1p5c2_fiv4,...
     pSR_d0p20c0_fiv4, pSR_d0p20c1_fiv4,pSR_d0p20c2_fiv4,...
     pSR_d1p20c0_fiv4, pSR_d1p20c1_fiv4,pSR_d1p20c2_fiv4,...
     pSR_d0p101c0_fiv4, pSR_d0p101c1_fiv4,pSR_d0p101c2_fiv4,...
     pSR_d1p101c0_fiv4, pSR_d1p101c1_fiv4,pSR_d1p101c2_fiv4];

pmean_fiv4 = [pmean_d0p5c0_fiv4, pmean_d0p5c1_fiv4,pmean_d0p5c2_fiv4,...
     pmean_d1p5c0_fiv4, pmean_d1p5c1_fiv4,pmean_d1p5c2_fiv4,...
     pmean_d0p20c0_fiv4, pmean_d0p20c1_fiv4,pmean_d0p20c2_fiv4,...
     pmean_d1p20c0_fiv4, pmean_d1p20c1_fiv4,pmean_d1p20c2_fiv4,...
     pmean_d0p101c0_fiv4, pmean_d0p101c1_fiv4,pmean_d0p101c2_fiv4,...
     pmean_d1p101c0_fiv4, pmean_d1p101c1_fiv4,pmean_d1p101c2_fiv4];
 
 
VariableNames19 = {'Return','Sharpe_Ratio'};
RowNames19 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table19= table(pmean_fiv4',pSRfiv4',...
    'VariableNames',VariableNames19,'RowNames',RowNames19);

pSRfig4 = [pSR_d0p5c0_fig4, pSR_d0p5c1_fig4,pSR_d0p5c2_fig4,...
     pSR_d1p5c0_fig4, pSR_d1p5c1_fig4,pSR_d1p5c2_fig4,...
     pSR_d0p20c0_fig4, pSR_d0p20c1_fig4,pSR_d0p20c2_fig4,...
     pSR_d1p20c0_fig4, pSR_d1p20c1_fig4,pSR_d1p20c2_fig4,...
     pSR_d0p101c0_fig4, pSR_d0p101c1_fig4,pSR_d0p101c2_fig4,...
     pSR_d1p101c0_fig4, pSR_d1p101c1_fig4,pSR_d1p101c2_fig4];

pmean_fig4 = [pmean_d0p5c0_fig4, pmean_d0p5c1_fig4,pmean_d0p5c2_fig4,...
     pmean_d1p5c0_fig4, pmean_d1p5c1_fig4,pmean_d1p5c2_fig4,...
     pmean_d0p20c0_fig4, pmean_d0p20c1_fig4,pmean_d0p20c2_fig4,...
     pmean_d1p20c0_fig4, pmean_d1p20c1_fig4,pmean_d1p20c2_fig4,...
     pmean_d0p101c0_fig4, pmean_d0p101c1_fig4,pmean_d0p101c2_fig4,...
     pmean_d1p101c0_fig4, pmean_d1p101c1_fig4,pmean_d1p101c2_fig4];
 
 
VariableNames20 = {'Return','Sharpe_Ratio'};
RowNames20 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table20= table(pmean_fig4',pSRfig4',...
    'VariableNames',VariableNames20,'RowNames',RowNames20);

load('d0p5c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d0p5c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d0p5c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c0_ccg5, pmean_d0p5c0_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d0p5c0_fig5, pmean_d0p5c0_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d0p5c0_ccv5, pmean_d0p5c0_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d0p5c0_fiv5, pmean_d0p5c0_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

load('d0p5c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d0p5c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d0p5c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c1_ccg5, pmean_d0p5c1_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d0p5c1_fig5, pmean_d0p5c1_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d0p5c1_ccv5, pmean_d0p5c1_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d0p5c1_fiv5, pmean_d0p5c1_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));
 
load('d0p5c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d0p5c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d0p5c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d0p5c2_ccg5, pmean_d0p5c2_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d0p5c2_fig5, pmean_d0p5c2_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d0p5c2_ccv5, pmean_d0p5c2_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d0p5c2_fiv5, pmean_d0p5c2_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

load('d1p5c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d1p5c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d1p5c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c2_ccg5, pmean_d1p5c2_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d1p5c2_fig5, pmean_d1p5c2_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d1p5c2_ccv5, pmean_d1p5c2_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d1p5c2_fiv5, pmean_d1p5c2_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

load('d1p5c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d1p5c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d1p5c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c0_ccg5, pmean_d1p5c0_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d1p5c0_fig5, pmean_d1p5c0_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d1p5c0_ccv5, pmean_d1p5c0_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d1p5c0_fiv5, pmean_d1p5c0_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

load('d1p5c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d1p5c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d1p5c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d1p5c1_ccg5, pmean_d1p5c1_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d1p5c1_fig5, pmean_d1p5c1_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d1p5c1_ccv5, pmean_d1p5c1_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d1p5c1_fiv5, pmean_d1p5c1_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

load('d0p20c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d0p20c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d0p20c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c0_ccg5, pmean_d0p20c0_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d0p20c0_fig5, pmean_d0p20c0_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d0p20c0_ccv5, pmean_d0p20c0_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d0p20c0_fiv5, pmean_d0p20c0_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

load('d0p20c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d0p20c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d0p20c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c1_ccg5, pmean_d0p20c1_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d0p20c1_fig5, pmean_d0p20c1_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d0p20c1_ccv5, pmean_d0p20c1_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d0p20c1_fiv5, pmean_d0p20c1_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));
 
load('d0p20c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d0p20c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d0p20c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d0p20c2_ccg5, pmean_d0p20c2_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d0p20c2_fig5, pmean_d0p20c2_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d0p20c2_ccv5, pmean_d0p20c2_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d0p20c2_fiv5, pmean_d0p20c2_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

load('d1p20c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d1p20c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d1p20c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c2_ccg5, pmean_d1p20c2_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d1p20c2_fig5, pmean_d1p20c2_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d1p20c2_ccv5, pmean_d1p20c2_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d1p20c2_fiv5, pmean_d1p20c2_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

load('d1p20c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d1p20c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d1p20c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c0_ccg5, pmean_d1p20c0_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d1p20c0_fig5, pmean_d1p20c0_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d1p20c0_ccv5, pmean_d1p20c0_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d1p20c0_fiv5, pmean_d1p20c0_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

load('d1p20c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d1p20c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d1p20c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d1p20c1_ccg5, pmean_d1p20c1_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d1p20c1_fig5, pmean_d1p20c1_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d1p20c1_ccv5, pmean_d1p20c1_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d1p20c1_fiv5, pmean_d1p20c1_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

load('d0p101c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d0p101c0g','Rp_vw_cc','Rp_vw_fi','RmRf');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d0p101c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c0_ccg5, pmean_d0p101c0_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d0p101c0_fig5, pmean_d0p101c0_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d0p101c0_ccv5, pmean_d0p101c0_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d0p101c0_fiv5, pmean_d0p101c0_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

load('d0p101c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d0p101c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d0p101c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c1_ccg5, pmean_d0p101c1_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d0p101c1_fig5, pmean_d0p101c1_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d0p101c1_ccv5, pmean_d0p101c1_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d0p101c1_fiv5, pmean_d0p101c1_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));
 
load('d0p101c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d0p101c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d0p101c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d0p101c2_ccg5, pmean_d0p101c2_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d0p101c2_fig5, pmean_d0p101c2_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d0p101c2_ccv5, pmean_d0p101c2_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d0p101c2_fiv5, pmean_d0p101c2_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

load('d1p101c2_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d1p101c2g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d1p101c2v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c2_ccg5, pmean_d1p101c2_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d1p101c2_fig5, pmean_d1p101c2_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d1p101c2_ccv5, pmean_d1p101c2_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d1p101c2_fiv5, pmean_d1p101c2_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

load('d1p101c0_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d1p101c0g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d1p101c0v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c0_ccg5, pmean_d1p101c0_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d1p101c0_fig5, pmean_d1p101c0_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d1p101c0_ccv5, pmean_d1p101c0_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d1p101c0_fiv5, pmean_d1p101c0_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

load('d1p101c1_copG','Rp_vw_cc','Rp_vw_fi'); 
Rp_cc= Rp_vw_cc(4537:6173,1); Rp_fi= Rp_vw_fi(4537:6173,1);
load('d1p101c1g','Rp_vw_cc','Rp_vw_fi');
Rp_ccg5= Rp_vw_cc(4537:6173,1); Rp_fig5= Rp_vw_fi(4537:6173,1);
load('d1p101c1v','Rp_vw_cc','Rp_vw_fi');
Rp_ccv5= Rp_vw_cc(4537:6173,1); Rp_fiv5= Rp_vw_fi(4537:6173,1);
Bstar = opt_block_length([Rp_cc, Rp_ccg5]);
SBstar = Bstar(1,:);
Bstar2 = opt_block_length([Rp_fi, Rp_fig5]);
SBstar2 = Bstar2(1,:);
Bstar3 = opt_block_length([Rp_cc, Rp_ccv5]);
SBstar3 = Bstar(1,:);
Bstar4 = opt_block_length([Rp_fi, Rp_fiv5]);
SBstar4 = Bstar2(1,:);

[pSR_d1p101c1_ccg5, pmean_d1p101c1_ccg5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccg5,max(mean(SBstar),1));
[pSR_d1p101c1_fig5, pmean_d1p101c1_fig5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fig5,max(mean(SBstar2),1));
[pSR_d1p101c1_ccv5, pmean_d1p101c1_ccv5] = dgnu_StatisticsPolitisRomano_v5(Rp_cc, Rp_ccv5,max(mean(SBstar3),1));
[pSR_d1p101c1_fiv5, pmean_d1p101c1_fiv5] = dgnu_StatisticsPolitisRomano_v5(Rp_fi, Rp_fiv5,max(mean(SBstar4),1));

pSRccv5 = [pSR_d0p5c0_ccv5, pSR_d0p5c1_ccv5,pSR_d0p5c2_ccv5,...
     pSR_d1p5c0_ccv5, pSR_d1p5c1_ccv5,pSR_d1p5c2_ccv5,...
     pSR_d0p20c0_ccv5, pSR_d0p20c1_ccv5,pSR_d0p20c2_ccv5,...
     pSR_d1p20c0_ccv5, pSR_d1p20c1_ccv5,pSR_d1p20c2_ccv5,...
     pSR_d0p101c0_ccv5, pSR_d0p101c1_ccv5,pSR_d0p101c2_ccv5,...
     pSR_d1p101c0_ccv5, pSR_d1p101c1_ccv5,pSR_d1p101c2_ccv5];

pmean_ccv5 = [pmean_d0p5c0_ccv5, pmean_d0p5c1_ccv5,pmean_d0p5c2_ccv5,...
     pmean_d1p5c0_ccv5, pmean_d1p5c1_ccv5,pmean_d1p5c2_ccv5,...
     pmean_d0p20c0_ccv5, pmean_d0p20c1_ccv5,pmean_d0p20c2_ccv5,...
     pmean_d1p20c0_ccv5, pmean_d1p20c1_ccv5,pmean_d1p20c2_ccv5,...
     pmean_d0p101c0_ccv5, pmean_d0p101c1_ccv5,pmean_d0p101c2_ccv5,...
     pmean_d1p101c0_ccv5, pmean_d1p101c1_ccv5,pmean_d1p101c2_ccv5];
 
 
VariableNames21 = {'Return','Sharpe_Ratio'};
RowNames21= {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table21 = table(pmean_ccv5',pSRccv5',...
    'VariableNames',VariableNames21,'RowNames',RowNames21);

pSRccg5 = [pSR_d0p5c0_ccg5, pSR_d0p5c1_ccg5,pSR_d0p5c2_ccg5,...
     pSR_d1p5c0_ccg5, pSR_d1p5c1_ccg5,pSR_d1p5c2_ccg5,...
     pSR_d0p20c0_ccg5, pSR_d0p20c1_ccg5,pSR_d0p20c2_ccg5,...
     pSR_d1p20c0_ccg5, pSR_d1p20c1_ccg5,pSR_d1p20c2_ccg5,...
     pSR_d0p101c0_ccg5, pSR_d0p101c1_ccg5,pSR_d0p101c2_ccg5,...
     pSR_d1p101c0_ccg5, pSR_d1p101c1_ccg5,pSR_d1p101c2_ccg5];

pmean_ccg5 = [pmean_d0p5c0_ccg5, pmean_d0p5c1_ccg5,pmean_d0p5c2_ccg5,...
     pmean_d1p5c0_ccg5, pmean_d1p5c1_ccg5,pmean_d1p5c2_ccg5,...
     pmean_d0p20c0_ccg5, pmean_d0p20c1_ccg5,pmean_d0p20c2_ccg5,...
     pmean_d1p20c0_ccg5, pmean_d1p20c1_ccg5,pmean_d1p20c2_ccg5,...
     pmean_d0p101c0_ccg5, pmean_d0p101c1_ccg5,pmean_d0p101c2_ccg5,...
     pmean_d1p101c0_ccg5, pmean_d1p101c1_ccg5,pmean_d1p101c2_ccg5];
 
 
VariableNames22 = {'Return','Sharpe_Ratio'};
RowNames22 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table22 = table(pmean_ccg5',pSRccg5',...
    'VariableNames',VariableNames22,'RowNames',RowNames22);

pSRfiv5 = [pSR_d0p5c0_fiv5, pSR_d0p5c1_fiv5,pSR_d0p5c2_fiv5,...
     pSR_d1p5c0_fiv5, pSR_d1p5c1_fiv5,pSR_d1p5c2_fiv5,...
     pSR_d0p20c0_fiv5, pSR_d0p20c1_fiv5,pSR_d0p20c2_fiv5,...
     pSR_d1p20c0_fiv5, pSR_d1p20c1_fiv5,pSR_d1p20c2_fiv5,...
     pSR_d0p101c0_fiv5, pSR_d0p101c1_fiv5,pSR_d0p101c2_fiv5,...
     pSR_d1p101c0_fiv5, pSR_d1p101c1_fiv5,pSR_d1p101c2_fiv5];

pmean_fiv5 = [pmean_d0p5c0_fiv5, pmean_d0p5c1_fiv5,pmean_d0p5c2_fiv5,...
     pmean_d1p5c0_fiv5, pmean_d1p5c1_fiv5,pmean_d1p5c2_fiv5,...
     pmean_d0p20c0_fiv5, pmean_d0p20c1_fiv5,pmean_d0p20c2_fiv5,...
     pmean_d1p20c0_fiv5, pmean_d1p20c1_fiv5,pmean_d1p20c2_fiv5,...
     pmean_d0p101c0_fiv5, pmean_d0p101c1_fiv5,pmean_d0p101c2_fiv5,...
     pmean_d1p101c0_fiv5, pmean_d1p101c1_fiv5,pmean_d1p101c2_fiv5];
 
 
VariableNames23 = {'Return','Sharpe_Ratio'};
RowNames23 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table23= table(pmean_fiv5',pSRfiv5',...
    'VariableNames',VariableNames23,'RowNames',RowNames23);

pSRfig5 = [pSR_d0p5c0_fig5, pSR_d0p5c1_fig5,pSR_d0p5c2_fig5,...
     pSR_d1p5c0_fig5, pSR_d1p5c1_fig5,pSR_d1p5c2_fig5,...
     pSR_d0p20c0_fig5, pSR_d0p20c1_fig5,pSR_d0p20c2_fig5,...
     pSR_d1p20c0_fig5, pSR_d1p20c1_fig5,pSR_d1p20c2_fig5,...
     pSR_d0p101c0_fig5, pSR_d0p101c1_fig5,pSR_d0p101c2_fig5,...
     pSR_d1p101c0_fig5, pSR_d1p101c1_fig5,pSR_d1p101c2_fig5];

pmean_fig5 = [pmean_d0p5c0_fig5, pmean_d0p5c1_fig5,pmean_d0p5c2_fig5,...
     pmean_d1p5c0_fig5, pmean_d1p5c1_fig5,pmean_d1p5c2_fig5,...
     pmean_d0p20c0_fig5, pmean_d0p20c1_fig5,pmean_d0p20c2_fig5,...
     pmean_d1p20c0_fig5, pmean_d1p20c1_fig5,pmean_d1p20c2_fig5,...
     pmean_d0p101c0_fig5, pmean_d0p101c1_fig5,pmean_d0p101c2_fig5,...
     pmean_d1p101c0_fig5, pmean_d1p101c1_fig5,pmean_d1p101c2_fig5];
 
 
VariableNames24 = {'Return','Sharpe_Ratio'};
RowNames24 = {'d0p5c0';'d0p5c1'; 'd0p5c2';'d1p5c0';...
    'd1p5c1';'d1p5c2';'d0p20c0'; 'd0p20c1'; 'd0p20c2';...
'd1p20c0';'d1p20c1';'d1p20c2'; 'd0p101c0'; 'd0p101c1';...
'd0p101c2';'d1p101c0';'d1p101c1'; 'd1p101c2'};

table24= table(pmean_fig5',pSRfig5',...
    'VariableNames',VariableNames24,'RowNames',RowNames24);

writetable(table1,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fiv.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table3,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fiv.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table2,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fig.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table4,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fig.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table5,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fiv99.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table7,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fiv99.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table6,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fig99.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table8,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fig99.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table9,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fiv02.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table11,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fiv02.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table10,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fig02.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table12,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fig02.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table13,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fiv07.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table15,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fiv07.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table14,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fig07.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table16,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fig07.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table17,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fiv09.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table19,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fiv09.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table18,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fig09.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table20,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fig09.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table21,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fiv15.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table23,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fiv15.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);
writetable(table22,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fig15.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',1);
writetable(table24,'C:\Users\Fernando\Dropbox\paper_pairs_trading_realized\fillts\paper1\copG\cc_fig15.xlsx','WriteVariableNames',true,...
        'WriteRowNames',true,'Sheet',2);







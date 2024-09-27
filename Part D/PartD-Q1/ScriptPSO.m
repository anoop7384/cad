clc
clear

%% Problem settings
[product,l,m,h,il,im,ih,cl,cm,ch,SP,rm1,rm2,rm3,nProcess] = ProductionPlanningData;
lb = zeros(1,nProcess);
ub = h';

prob = @SKS_ProductionPlanning;     % Fitness function


%% Parameters for Differential Evolution
Np = 100;
T = 100;
w = 0.5; c1 = 2; c2 = 2;

rng(2,'twister');

data = [];
for i = 1:25
    [Xbest,Fbest,run] = PSOfunc(prob,Np,lb,ub,T,w,c1,c2);
    data = [data; run];
end

plotthisgraph(data')
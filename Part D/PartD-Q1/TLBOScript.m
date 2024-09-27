clc
clear
close all

%% Problem settings
[product,l,m,h,il,im,ih,cl,cm,ch,SP,rm1,rm2,rm3,nProcess] = ProductionPlanningData;
lb = zeros(1,nProcess);
ub = h';

prob = @SKS_ProductionPlanning;     % Fitness function

%% Algorithm parameters
Np = 100;                            % Population Size
T = 50;                             % No. of iterations

data = [];
for i = 1:25
    [bestsol,bestfitness,BestFitIter,~,~,run] = TLBO(prob,lb,ub,Np,T);
    data = [data; run];
end

plotthisgraph(data');



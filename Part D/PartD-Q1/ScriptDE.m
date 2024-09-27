clc                                 % To clear the command window
clear                               % To clear the workspace

%% Problem settings
[product,l,m,h,il,im,ih,cl,cm,ch,SP,rm1,rm2,rm3,nProcess] = ProductionPlanningData;
lb = zeros(1,nProcess);
ub = h';

prob = @SKS_ProductionPlanning;     % Fitness function


%% Parameters for Differential Evolution
Np = 100;                             % Population Size
T = 100;                             % No. of iterations
Pc = 0.8;                           % crossover probability
F = 0.85;                           % Scaling factor

rng(1,'twister')

data = [];
for i = 1:25
    [bestsol,bestfitness,run] = DifferentialEvolution(prob,lb,ub,Np,T,Pc,F);
    data=[data; run];
end
plotthisgraph(data');
% Script per visualizzare graficamente se l'addestramento è efficace
clc
%clear

load test_sim_100Ep_v3.mat
%load test_sim_1000Ep_v2newparam.mat
load("BusActors1.mat")
load("BusActors1Actors.mat")

eps = 0;
s = [15*rand+5; 5*rand; 0; 0;0]
%s = [12; 4; 0; 0;0]
x_0 = s(1);
y_0 = s(2);

a_in = eps_greedy(s, w, 0, gridx, gridy,gridvx, gridvy, gridyaw, M, N, A);
[az_1,az_2] = ind2sub([3 3], a_in);

[st, r] = graphicSimulation2D(w,gridx,gridy,gridvx,gridvy,gridyaw,M,N,A);


% cosa salvare su file
% save test_sim.mat w Ts gridx gridy gridvx gridvy gridyaw M N A passo_v passo_steerang d egoID lby uby lbx ubx lbvx ubvx lbvy ubvy safetyDist leftDistCG retroDistCG frontDistCG

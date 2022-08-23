% Script per visualizzare graficamente se l'addestramento è efficace
clc
%clear

%load test_sim_10000Ep_v6.mat
%load test_sim_2375Ep_v13.mat
%load test_sim_3275Ep_v14.mat
load("BusActors1.mat")
load("BusActors1Actors.mat")

eps = 0;
% old
%s = [15*rand+5; 5*rand; 0; 0;0]
% new
% [(7 17) (0.2 9.2)]
%s = [8; 5; 0; 0;0]
%s = [20*rand+2; (5*rand+0.2); 0; 0;0]
s = [18; 2; 0; 0;0] % comportamento strano laterale
x_0 = s(1);
y_0 = -s(2);

a_in = eps_greedy(s, w, 0, gridx, gridy,gridvx, gridvy, gridyaw, M, N, A);
[az_1,az_2] = ind2sub([3 3], a_in);

[st ,r ,output] = simulation2D(w,gridx,gridy,gridvx,gridvy,gridyaw,M,N,A);

%graphicSimulation2D(st,r);


% cosa salvare su file
% save test_sim.mat w Ts gridx gridy gridvx gridvy gridyaw M N A passo_v passo_steerang d egoID lby uby lbx ubx lbvx ubvx lbvy ubvy safetyDist leftDistCG retroDistCG frontDistCG

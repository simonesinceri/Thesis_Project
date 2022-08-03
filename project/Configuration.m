% Script configurazione per modello simulink
clc
clear 

% Ts tempo di campionamento dello scenario reader
% lo utilizzo per rate tra le porte
load("BusActors1.mat")
load("BusActors1Actors.mat")

% Parametri CAR presi da scenario

% non ho ben capito se coincidono con quelli del bloccho simulink
% però le mie misure le prendo dallo scenario quindi per collisioni ok
% se coincidono azioni prese saranno leggermente diverse dalla realtà
length_car = 4.7;
width_car = 1.8;
height_car = 1.4;

% Safety dist
safetyDist = 1.5;
lateralSft = 1;
frontSft = 1;
retroSft = 1;

% distanze CG da lati veicolo
leftDistCG = 0.9;
retroDistCG = 1;
frontDistCG = 3.7;

% egoID, ID del veiocolo controllato
egoID = 1;

% limiti spaziali ambiente simulazione
lby = -10; %limSx = 10;
uby = 10; %limDx = -10;
lbx = 0; %limUp = 25;       % attenzione qui -> ricontrollare
ubx = 25; %limDown = 0;
% limiti su vx e vy
lbvx = -2;
ubvx = 2;
lbvy = -2; % queste possono anche essere inferiori
ubvy = 2;


Ts = 0.1; % tempo campionamento scenario
numEpisodes = 2;
epsilon = 1e-1;
alpha = 1e-3;
gamma = 0.9; %1

% M N A sono da rivedere
M = 3; % numero celle
N = 8;%4; % numero griglie  num righe

A = 3*3; % numero azioni [-1,0,1] su vlong e [-1 0 1] su angsterzo
% azione vettore 2*1
passo_v = 0.1;
passo_steerang = 30;

nCells = (M + 1)^4;
d = A*N*nCells;

[gridx, gridy, gridvx, gridvy] = construct_tiles(lbx, ubx, lby, uby, lbvx, ubvx, lbvy, ubvy, M, N);

w = zeros(d, 1);
 
% devo definire range stato iniziale
% x -> [5 20] y -> [5 0] 
%x_0 = 10;
%y_0 = 5;
v_longitudinal = 0;  % sta roba va portata dentro il for ,tutto stato iniz
v_lateral = 0;

%Azioni iniziali  , pure questo devo portarlo dentro il for
%az_1 = 1;  %x_dot_in = 0;
%az_2 = 1;   %steerang_in = 0;

%x_in = [x_0;y_0;v_longitudinal;v_lateral];

% Manca il corpo di questo for
% simulazione e aggiornamento parametri

% simulo numEpisodes volte modello Simulink
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=0:numEpisodes
    
    % stato iniziale random
    x_0 = 15*rand+5;
    y_0 = 5*rand;
    x_in = [x_0;y_0;v_longitudinal;v_lateral];

    % azionne iniziale epsgreedy
    a_in = eps_greedy(x_in, w, epsilon, gridx, gridy, gridvx, gridvy, M, N, A);
    [az_1, az_2] = ind2sub([3 3], a_in);
    % az_1 
    % az_2

    % simulazione episodio e aggiornamento parametri con modello simulink
    %sim("Vehicle_dynamics")  % aggiornare nome modello simulink

    % da qua finito episodio
    % w passati su MATLAB con assignin
 end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
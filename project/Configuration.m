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
limSx = 10;
limDx = -10;
limUp = 25;
limDown = 0;
% limiti su vx e vy

Ts = 0.1;
numEpisodes = 2;
epsilon = 1e-1;
alpha = 1e-3;
gamma = 1;

% M N A sono da rivedere
M = 3; % numero celle
N = 8;%4; % numero griglie  num righe

A = 3*3; % numero azioni [-1,0,1] su vlong e [-1 0 1] su angsterzo
% azione vettore 2*1
passo_v
passo_steerang

nCells = (M + 1)^4;
d = A*N*nCells;

[gridx, gridy, gridvx, gridvy] = build_tiles(lbx, ubx, lbv, ubv, M, N);
w = zeros(d, 1);
 
% Stato Iniziale
% Per adesso, all'iterazione successiva nel for basta che cambio questi
% valori ed è fatta
x_0 = 20;
y_0 = 5;
v_longitudinal = 0;
v_lateral = 0;

%Azioni iniziali
x_dot_in = 0;
steerang_in = 0;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Manca il corpo di questo for
% simulazione e aggiornamento parametri

% simulo numEpisodes volte modello Simulink
for i=0:numEpisodes
    
    %sim("Vehicle_dynamics")  % aggiornare nome modello simulink
 end

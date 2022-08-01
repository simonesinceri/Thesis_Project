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
safetyDist = 1;
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

Ts = 0.1;
numEpisodes = 2;
epsilon = 1e-1;
alpha = 1e-3;
gamma = 1;

% M N A sono da rivedere
M = 3; % numero celle
N = 8;%4; % numero griglie  num righe

A = 3; % numero azioni [-1,0,1]  -> queste sono di più

% Stato Iniziale
% Per adesso, all'iterazione successiva nel for basta che cambio questi
% valori ed è fatta
x_0 = 1;
y_0 = 0;
v_longitudinal = 0;
v_lateral = 0;

%Azioni iniziali
x_dot_in = 1;
steerang_in = 0;

% simulo numEpisodes volte modello Simulink
for i=0:numEpisodes
    %sim("Vehicle_dynamics")  % aggiornare nome modello simulink
 end

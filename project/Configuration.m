% Script configurazione per modello simulink
clc
clear 


% Ts tempo di campionamento dello scenario reader
% lo utilizzo per rate tra le porte
load("BusActors1.mat")
load("BusActors1Actors.mat")

Ts = 0.1;
numEpisodes = 2;



% egoID, ID del veiocolo controllato
egoID = 1;

% Stato Iniziale
% Per adesso, all'iterazione successiva nel for basta che cambio questi
% valori ed è fatta
x_0 = 1;
y_0 = 0;

x_dot_in = 1;
steerang_in = 0;

% simulo numEpisodes volte modello Simulink
for i=0:numEpisodes

end

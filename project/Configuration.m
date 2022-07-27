% Script configurazione per modello simulink
clc
clear 


% Ts tempo di campionamento dello scenario reader
% lo utilizzo per rate tra le porte
load("BusActors1.mat")
load("BusActors1Actors.mat")

Ts = 0.1;



% egoID, ID del veiocolo controllato
egoID = 1;
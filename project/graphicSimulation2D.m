% prima il load dei parametri che servono

function graphicSimulation2D(w,gridx,gridy,gridvx,gridvy,M,N,A)

% Carico eventuali dati addestrati,devo prima fare il load
% load addestramentoSARSA_1000episodes_delta1.mat
% dentro file  A M N grtidxx limDx limSX passo w

%s = [0; (rand*4-rand*4)] % [y,x] sono inverite sul simulatore
s = [15*rand+5; 5*rand; 0; 0] % anche questo va modificato o invludo le vel o a parte
x_0 = s(1);y_0 = s(2);
% Caso limite
%s = [0,4] % caso 4 mi rimane a x = 1 potrebbe apprendere meglio, o problema di griglie
% Soffre la parte sinistra, forse non esplora bene quella parte
% Capita che quando fuori strada va sempre dritto?? -> serve più exper???
% rivedi caso riga precedente con SARSA

% Con epsgreedy prende anche az causale -> gli do epsilon = 0
a_in = eps_greedy(s, w, 0, gridx, gridy,gridvx, gridvy, M, N, A);
[az_1,az_2] = ind2sub([3 3], a_in);
%i = 1;

%state = zeros(7,3); % non so a priori il numero di stati, devo usare vettore che aumenta dinamicamente 
%state(1,1:2) = s;
% stato inteso x y z le velovità a parte, potrei usa vettore a parte èer le
% velocità e passare 2 argomenti
%state = s;

%isTerminal = 0;   % lo devo prendere la dal modello o uso stop condition

%for y=1:1:6
%while ~isTerminal
    %x = features(s, a, gridx, M, N, A);
    %dati = Road_Scenario(x_iniz,y_iniz,x_next,y*5); % prendo dati(end)
    %[sp, r, isTerminal] = dynamics(s, a_in, limSx, limDx, y, passo,i);           % mi serve versione troncata del modello che mi da sp,r,isTerminal
    output = sim("model_graphicSim.slx");

    % Eventuale visualizzione di r,a per vedere come si comporta
    %fprintf("r = %f a = %f \n", r, (a_in-2))
    
    % da qui devo far uscire il mio stato
   % if isTerminal
        %w = w + alpha*(r - w'*x)*x; % x è il gradiente rispetto w
    %    fprintf("Fine Episodio \n")
    %else
        % Con epsgreedy prende anche az causale -> gli do epsilon = 0
     %   ap = eps_greedy(sp, w, 0, gridx, gridy,gridvx, gridvy, M, N, A); % azione success    
        %xp = features(sp, ap, gridx, M, N, A); % features stato success
        %w = w + alpha*(r + gamma*w'*xp - w'*x)*x;
    %end
    %s = sp; % aggiorno
    %a_in = ap;
    %state(y+1,1:2) = s; % salva tutti i valori dello stato per poi visualizzare
display("sim finished")
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
% devo prendere lo state da simulink
    lenEp = size(output.stato,3);
    % out.stato(:,:,1)   % devo sistemarli in modo da darli in input 
    state = zeros(lenEp,3);
    vel = zeros(lenEp,1); % velx e vely mi interesa solo sux o devo calcolare la vel tot 
    for i=1:lenEp
        app = output.stato(:,:,i);
        state(i,1:2) = [app(1) app(2)];
        vel(i) = app(3);
    end
    %state = [state s]; % preallocare per la velocità

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


    %if(y == 6) % qui già sapevo che al sesto istante sarebbe terminato episodio, visualizzo appena terminato
    %if(isTerminal)
        close all
        parking_Scenario_Sim(state, vel);  % funzione matlab esportata da drivingScenario
        % display stato finale
    %end

%end

end
%-------------------------------------------------------------------------%
% PARTE B) PROYECTO 1 EL3005, ANALIZAR DATOS TOMADOS
%-------------------------------------------------------------------------%

% Se cargan los datos

load('proyecto1_data_phi.mat')       % Angulos
load('proyecto1_data_Y_parte1.mat'); % Señal recibida
load('proyecto1_data_Y_parte2.mat'); % Señal recibida


% Se guardan los datos a analizar (k = 1...7)

k = 7;      % Set de datos

load('targets',['target' int2str(k)])
X = eval(['target' int2str(k)]);
angulo = X(:,1);
posicion = X(:,2); 
Yk = eval(['Y' int2str(k)]);
Phik = eval(['Phi' int2str(k)]);

%-------------------------------------------------------------------------%
% DATOS DEL MUESTREO, VELOCIDAD DE PROPAGACION
%-------------------------------------------------------------------------%

muestras = 10000;               % numero de muestras
frec_muestreo = 5000;           % frecuencia de muestreo Fs
periodo = 1/frec_muestreo;      % periodo
mu = 0.6;                       % centro de la gaussiana emitida
sigma2 = 0.01;                  % varianza de la gaussiana emitida
D = 0;                          % desplazamiento de la gaussiana emitida
velocidad = 1513;               % velocidad de la señal en el agua


rng(42) % Semilla de random
x0 = gaussian_signal(muestras,frec_muestreo,mu,sigma2,D); % Señal emitida


%-------------------------------------------------------------------------%
% CORRELACION DE LAS SEÑALES
% Cada angulo Phi(i) tiene un vector de datos (de largo 10000)
% de la forma Y(:,i)
%-------------------------------------------------------------------------%


% Se correlacionan las señales, para encontrar el maximo de semejanza

m = zeros(1,length(Phik));
indices = zeros(1,length(Phik));

for i = 1:length(Phik)
    r = xcorr(Yk(:,i),x0);          % Correlacion cruzada
    [m(i),indices(i)] = max(r);     % Se extrae el maximo
end

dist_muestras = transpose(indices-10000); % Se extrae el desplazamiento 



tiempo_retardo = periodo.*dist_muestras;  % Tiempo de retardo


%-------------------------------------------------------------------------%
% SE CALCULA LA POSICION Y SE GRAFICA EN POLARES
%-------------------------------------------------------------------------%

pos = velocidad.*tiempo_retardo/2; % Posicion detectada

% Se grafica

clf
polar(Phik,pos,'*')
hold on
polar(angulo,posicion)
titulo = title(['Figura ' int2str(k)]);
set(titulo,'Fontsize', 20)
hold off

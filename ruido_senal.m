function e = ruido_senal(k,ganancia)

%-------------------------------------------------------------------------%
% PARTE C) PROYECTO 1 EL3005, ANALIZAR COMPORTAMIENTO EN FUNCION DE LA
% GANANCIA AGREGADA A LA SEÑAL EMITIDA
% input:    k = representa el set de datos con k = (1...7)
%           ganancia = ganancia de la señal emitida
% output:   e = indicador ruido-señal
%-------------------------------------------------------------------------%

% Se cargan los datos reales
load('targets',['target' int2str(k)])
X = eval(['target' int2str(k)]);
posicion = X(:,2);

%-------------------------------------------------------------------------%
% DATOS DEL MUESTREO
%-------------------------------------------------------------------------%

muestras = 10000;               % numero de muestras
frec_muestreo = 5000;           % frecuencia de muestreo Fs
periodo = 1/frec_muestreo;      % periodo
sigma2 = 0.01;                  % varianza de la gaussiana emitida
sigma2_ruido = 50;              % varianza del ruido
mu = 0.6;                       % centro de la gaussiana emitida
velocidad = 1513;               % velocidad de la señal en el agua


% Señal enviada
x0 = ganancia*gaussian_signal(muestras,frec_muestreo,mu,sigma2,0);

% Señal recibida
[Y,Phi] = data_gen(k,sigma2,sigma2_ruido,ganancia);

%-------------------------------------------------------------------------%
% CORRELACION DE LAS SEÑALES
% Cada angulo Phi(i) tiene un vector de datos (de largo 10000)
% de la forma Y(:,i)
%-------------------------------------------------------------------------%


indices = zeros(1,length(Phi));
m = zeros(1,length(Phi));

for i = 1:length(Phi)
    %r = correlacion_cruzada(Y(:,1),x0)
    r = xcorr(Y(:,i),x0);       %correlacion cruzada
    [m(i),indices(i)] = max(r); % Se extrae el maximo
end

dist_muestras = transpose(indices-10000); % Se extrae el desplazamiento
tiempo_retardo = periodo.*dist_muestras;  % Tiempo de retardo


%-------------------------------------------------------------------------%
% SE CALCULA LA POSICION Y SE CALCULA EL INDICADOR RUIDO-SEÑAL
%-------------------------------------------------------------------------%


pos = velocidad.*tiempo_retardo/2;          % Posicion calculada  
vector_error =  posicion-pos;               % Diferencias con posicion real
e = norm(vector_error)/norm(posicion);      % Se calcula el indicador R-S

end
function e = error_respuesta_senal(k,sigma2)

%-------------------------------------------------------------------------%
% PARTE D) PROYECTO 1 EL3005, ANALIZAR COMPORTAMIENTO EN FUNCION DEL ANCHO
% DE LA SEÑAL EMITIDA
% input:    k = representa el set de datos con k = (1...7)
%           sigma2 = varianza de la gaussiana emitida
% output:   e = indicador ruido-señal
%-------------------------------------------------------------------------%

load('targets',['target' int2str(k)])
X = eval(['target' int2str(k)]);
angulo = X(:,1);
posicion = X(:,2);

%-------------------------------------------------------------------------%
% DATOS DEL MUESTREO
%-------------------------------------------------------------------------%

ganancia = 1;                   % ganancia de la señal emitida
muestras = 10000;               % numero de muestras
frec_muestreo = 5000;           % frecuencia de muestreo
periodo = 1/frec_muestreo;      % periodo
sigma2_ruido = 0.5;             % varianza del ruido
mu = 0.6;                       % centro de la gaussiana emitida
velocidad = 1513;               % velocidad de la señal en el agua

% Señal enviada
x0 = ganancia*gaussian_signal(muestras,frec_muestreo,mu,sigma2,0);

% Señal recibida
rng(42)
[Y,Phi] = data_gen(k,sigma2,sigma2_ruido,ganancia);



%-------------------------------------------------------------------------%
% CORRELACION DE LAS SEÑALES
% Cada angulo Phi(i) tiene un vector de datos (de largo 10000)
% de la forma Y(:,i)
%-------------------------------------------------------------------------%

indices = zeros(1,length(Phi));
maximos = zeros(1,length(Phi));

for i = 1:length(Phi)
    r = xcorr(Y(:,i),x0);               % correlacion cruzada
    [maximos(i),indices(i)] = max(r);   % se extrae el maximo
end


dist_muestras = transpose(indices-10000);   % se extrae el desplazamiento
tiempo_retardo = periodo.*dist_muestras;    % tiempo de retardo

%-------------------------------------------------------------------------%
% SE CALCULA LA POSICION Y SE CALCULA EL INDICADOR RUIDO-SEÑAL
%-------------------------------------------------------------------------%

pos = velocidad.*tiempo_retardo/2;          % Posicion calculada


vector_error =  posicion-pos;               % diferencias con posicion real
e = norm(vector_error)/norm(posicion);      % se calcula el indicador R-S


end
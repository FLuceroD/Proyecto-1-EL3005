%-------------------------------------------------------------------------%
% PARTE C) PROYECTO 1 EL3005, ANALIZAR COMPORTAMIENTO EN FUNCION DE LA
% GANANCIA AGREGADA A LA SEÑAL EMITIDA
%-------------------------------------------------------------------------%


k = 7;                                      % Set de datos
ganancias = linspace(0.5,90,100);           % Arreglo de ganancias
errores = csvread('errores_sonar.txt');  % Errores, para cada ganancia

% La matriz [errores_sonar.txt] se crea con la funcion ruido_senal.m

e = errores(:,k);       % se extraen los errores para el set de datos k


% Para generar nuevos errores, se debe ejecutar la funcion ruido_senal.m
% Recursivamente para cada 


%-------------------------------------------------------------------------%
% Se grafica
%-------------------------------------------------------------------------%

clf
hold on
latex = ['(\epsilon_{G,' int2str(k) '})'];
titulo = title(['Indicador ruido-señal ' latex]);
set(titulo,'Fontsize',22)
ejey = ylabel('Log_{10}(\epsilon)');
set(ejey,'Fontsize',20)
ejex = xlabel('Ganancia'); 
set(ejex,'Fontsize',20)
plot(ganancias,log10(e))
hold off

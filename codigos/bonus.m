%-------------------------------------------------------------------------%
% BONUS: SE COMPARA EL SONAR AL EMITIR UNA SEÑAL DE PULSO CUADRADO
%-------------------------------------------------------------------------%

k = 7;                      % set de datos

largo = 15;                 % largo del vector de errores

sigmas2 = zeros(1,largo);   % arreglo para las distintas varianzas
errores = zeros(1,largo);   % arreglo para los distintos indicadores R-S

%-------------------------------------------------------------------------%
% Se crea una secuencia para las varianzas (1,1/2,1/10,1/20,1/100,1/200...)
%-------------------------------------------------------------------------%

for i = 1:largo
    if mod(i,2) == 0
        sigmas2(i) = 1/(2*10^((i-2)/2-1));
    else
       sigmas2(i) = 1/(10^(((i-2)-1)/2));
    end
end

% Se ordenan las varianzas (no es necesario)
sigmas2 = sort(sigmas2);


% Se calcula el error para cada varianza y se guarda en un arreglo
for i = 1:largo
    errores(i) = error_respuesta_senal2(k,sigmas2(i));
end

% Se encuentra el minimo

[minimo, indice] = min(errores);
sigma2_optimo = sigmas2(indice);

% Se muestran los valores 
disp(['para el set de datos: ' int2str(k)])
disp('sigma2 optimo: ')
disp(sigma2_optimo)
disp('error:')
disp(minimo)

%-------------------------------------------------------------------------%
% Se grafica
%-------------------------------------------------------------------------%

clf
hold on 
latex = ['(\epsilon_{\sigma^2,' int2str(k) '})'];
titulo=title('Indicador R-S según ancho de la señal emitida');
set(titulo,'Fontsize',22)
ejey = ylabel(['log_{10}' latex]);
set(ejey,'Fontsize',20)
ejex = xlabel('log_{10}(\sigma^2)');
set(ejex,'Fontsize',20)
plot(log10(sigmas2),log10(errores))

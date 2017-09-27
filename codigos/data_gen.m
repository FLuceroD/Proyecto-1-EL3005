function [Y, Phi] = data_gen(im,sigma_g,sigma_n,G)
%% [Y, Phi] = data_gen(im,sigma_g,sigma_n,G)
% 
% Simula la transmision y recepcion de señales en un rango de 360 grados,
% a intervalos de 1 grado. 
% Outputs: Phi representa los angulos donde fueron detectados objetos.
% Y representa una matriz de 10000 filas y tantas columnas como 
% objetos detectados. La columna i-esima de Y representa la señal reflejada 
% (version muestreada de la señal continua y_a(t)) asociada a la componente
% i-esima de Phi.
% Inputs: im representa el set de datos a utilizar. sigma_g representa la
% varianza de la gaussiana emitida, sigma_n representa la varianza del
% ruido ambiente y G la ganancia de la señal.


if(nargin<2), sigma_g = 0.01; end
if(nargin<3), sigma_n = 5; end
if(nargin<4), G = 1; end

load('targets',['target' int2str(im)])
mu = 0.6;
N = 10000;
f = 5000;

X = eval(['target' int2str(im)]);
n = size(X,1);
Phi = X(:,1);
Y = zeros(N,n);
mm = max(X(:,2));
for i = 1:n
    
    y = G*gaussian_signal(N,f,mu,sigma_g,round(X(i,3)));
    yn = 0.9*(tanh(0.01*(mm-X(i,2)))/2+0.5)*y + sqrt(sigma_n)*randn(N,1);
    Y(:,i) = yn;
    
end

end
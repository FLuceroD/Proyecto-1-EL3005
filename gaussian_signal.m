function [x] = gaussian_signal(N,f,mu,sigma2,D)
%% [x] = gaussian_signal(N,f,mu,sigma2,D)
%
% Genera una señal discreta correspondiente a la version discretizada de
% una gaussiana retardada en D. El largo del vector es N. La tasa de 
% muestreo es T=1/f. La media de la gaussiana es mu. La varianza de la
% gaussiana es sigma2.
%
n = 0:N-1; n=n(:);
if(nargin<5)
    D=0;
end
    x = sqrt(20)/sqrt(sqrt(pi*sigma2)*f)*exp(-((n-D)/f-mu).^2/(2*sigma2)); %constant energy
    %x = 1/sqrt(2*pi*sigma2)*exp(-((n-D-mu)/f).^2/(2*sigma2)); %constant integral 
end
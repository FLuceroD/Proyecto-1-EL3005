l = 21;
sigmas2 =  logspace(-20,0,l);
energias = zeros(1,l);
N = 10000;
f = 5000;
mu = 0.6;
x = zeros(N,l);

for i = 1:l
    x(:,i) = gaussian_signal(N,f,mu,sigmas2(i),0);
    energias(i) = energia(x(:,i));
end



clf
hold on 
titulo=title('Energía de la señal gaussiana en funcion de la varianza');
set(titulo,'Fontsize',22)
ejey = ylabel('log_{10}(E_{x})');
set(ejey,'Fontsize',20)
ejex = xlabel('log_{10}(\sigma^2)');
set(ejex,'Fontsize',20)
plot(log10(sigmas2),log10(energias))


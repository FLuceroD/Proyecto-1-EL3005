function r = correlacion_cruzada(x,y)
    largo = length(x);
    n = -largo+1:largo-1;
    corr = zeros(1,length(n));
    numero = zeros(length(n),length(n));
    
    for i = 1:length(n);
        for j = 1:length(n);
            numero(i,j) = indice(x,j)*indice(y,j-i+largo);
        end
        corr(i) = sum(numero(i,:));
    end
    r = corr;
    
end

    
  
    
        
                
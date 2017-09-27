function x_n = indice(x,n)
% Indice n-esimo de una secuencia
%   Output: retorna el elemento n-esimo de un vector
% si el vector no tiene numero definido, retorna 0
%   Input: vector x, indice n

largo = length(x);

if n > 0 && n <= largo
    x_n = x(n);
else
    x_n = 0;
end


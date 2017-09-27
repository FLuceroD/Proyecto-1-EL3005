function [x] = pulso(N,f,d,T,D)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


n = 0:N-1;
n = n(:);

y = zeros(1,length(n));

for i = 1:length(n)
    y(i) = 1.*(abs(((n(i)-D)./f - d)./T)<1/2);
end
constante  = 20/energia(y);
x = (sqrt(constante).*y)';
end


function [K1,K2] = equilibrium_constants(T)

lnK1 = 30.11 - (26830./T);
lnK2 = 4.33  - (4577./T);

K1 = exp(lnK1);
K2 = exp(lnK2);

end

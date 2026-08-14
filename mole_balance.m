function F = mole_balance(x,K1,K2,P,S)

xi1 = x(1);
xi2 = x(2);

% Moles
n_CH4 = 1 - xi1;
n_H2O = S - xi1 - xi2;
n_CO  = xi1 - xi2;
n_CO2 = xi2;
n_H2  = 3*xi1 + xi2;

nT = n_CH4 + n_H2O + n_CO + n_CO2 + n_H2;

% Mole fractions
y_CH4 = n_CH4/nT;
y_H2O = n_H2O/nT;
y_CO  = n_CO/nT;
y_CO2 = n_CO2/nT;
y_H2  = n_H2/nT;

% Equilibrium equations
F(1) = K1 - (y_CO*y_H2^3/(y_CH4*y_H2O))*P^2;
F(2) = K2 - (y_CO2*y_H2/(y_CO*y_H2O));

end

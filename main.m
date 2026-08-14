clc; clear; close all;

% Operating conditions
T = 1173;       % K (900 C)
P = 25;         % bar
S = 3;          % steam-to-carbon ratio

% Equilibrium constants
[K1, K2] = equilibrium_constants(T);

% Initial guess [xi1 xi2]
x0 = [0.6 0.3];

options = optimoptions('fsolve','Display','iter');
x = fsolve(@(x) mole_balance(x,K1,K2,P,S), x0, options);

xi1 = x(1);
xi2 = x(2);

fprintf('SMR extent = %.3f\n',xi1)
fprintf('WGS extent = %.3f\n',xi2)

X_CH4 = xi1;
Y_H2  = 3*xi1 + xi2;

fprintf('Methane conversion = %.2f\n',X_CH4)
fprintf('Hydrogen yield = %.2f mol/mol CH4\n',Y_H2)

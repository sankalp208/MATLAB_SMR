clc; clear; close all;

T = 1173;   % K
S = 3;
P_range = 5:2:30;

H2_P = zeros(size(P_range));

x0 = [0.6 0.3];
options = optimoptions('fsolve','Display','off');

for i = 1:length(P_range)
    P = P_range(i);
    [K1,K2] = equilibrium_constants(T);

    x = fsolve(@(x) mole_balance(x,K1,K2,P,S), x0, options);
    H2_P(i) = 3*x(1) + x(2);

    x0 = x;
end
figure;
plot(P_range, H2_P,'LineWidth',2)
xlabel('Pressure (bar)')
ylabel('Hydrogen Yield (mol/mol CH_4)')
grid on

set(gca,'FontSize',12)
set(findall(gcf,'Type','line'),'LineWidth',2)
box on
title('Effect of Pressure on Hydrogen Yield')


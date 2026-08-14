clc; clear; close all;

T = 1173;
P = 25;
S_range = 1.5:0.25:5;

H2_S = zeros(size(S_range));

x0 = [0.5 0.2];
options = optimoptions('fsolve','Display','off');

for i = 1:length(S_range)
    S = S_range(i);
    [K1,K2] = equilibrium_constants(T);

    x = fsolve(@(x) mole_balance(x,K1,K2,P,S), x0, options);
    H2_S(i) = 3*x(1) + x(2);

    x0 = x;
end
figure;
plot(S_range, H2_S,'LineWidth',2)
xlabel('Steam-to-Carbon Ratio')
ylabel('Hydrogen Yield (mol/mol CH_4)')
grid on

set(gca,'FontSize',12)
set(findall(gcf,'Type','line'),'LineWidth',2)
box on
title('Effect of Steam to Carbon Ratio on Hydrogen Yield')


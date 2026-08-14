clc; clear; close all;

P = 25;      % bar
S = 3;       % steam-to-carbon
T_range = (700:25:1000) + 273;   % K

xi1_vec = zeros(size(T_range));
xi2_vec = zeros(size(T_range));
H2_yield = zeros(size(T_range));

x0 = [0.5 0.3];
options = optimoptions('fsolve','Display','off');

for i = 1:length(T_range)
    T = T_range(i);
    [K1,K2] = equilibrium_constants(T);

    x = fsolve(@(x) mole_balance(x,K1,K2,P,S), x0, options);

    xi1_vec(i) = x(1);
    xi2_vec(i) = x(2);
    H2_yield(i) = 3*x(1) + x(2);

    x0 = x;  % good numerical practice
end
figure;
plot(T_range-273, H2_yield,'LineWidth',2)
xlabel('Temperature (°C)')
ylabel('Hydrogen Yield (mol H_2 / mol CH_4)')
grid on

set(gca,'FontSize',12)
set(findall(gcf,'Type','line'),'LineWidth',2)
box on
title('Effect of Temperature on Hydrogen Yield')


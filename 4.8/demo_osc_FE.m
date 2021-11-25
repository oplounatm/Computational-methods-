%Olli-Petteri Lounatmaa
%0511110
function demo_osc_FE()
clear all
close all
    omega = 2;
    P = 2*pi/omega;
    dt = P/20;
    T = 3*P;
    X_0 = 2;
    % Initial condition
    [u, v, t] = osc_FE(X_0, omega, dt, T);

    plot(t, u, 'b-', t, X_0*cos(omega*t), 'r--');
legend('numerical', 'exact', 'Location','northwest');
xlabel('t');
print('tmp', '-dpdf');  print('tmp', '-dpng');
end
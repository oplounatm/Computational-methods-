%Task 4.10
%Olli-Petteri Lounatmaa
%0511110
omega = 2;
P = 2*pi/omega;
dt = P/20;
T = 3*P;
N_t = floor(round(T/dt));
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;

% Step equations forward in time
for n = 1:N_t
    u(n+1) = u(n) + dt*v(n);
    v(n+1) = v(n) - dt*omega^2*u(n);
end

[U, K] = osc_energy(u, v, omega);

plot(t, U+K, 'b-');
xlabel('t');
ylabel('sum of energy');


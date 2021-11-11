%Exercise 4.4
%Olli-Petteri Lounatmaa
%0511110

dt = 20; T = 100; %DT is amount of measure points, T value of time
f = @(u,t) 0.1*(1-u/500)*u; %function 
U_0 = 100;

[u_old, t_old] = ode_FE(f, U_0, dt, T);
k = 1;
answer = 'y';

while answer == 'y'
    dt_k = 2^(-k)*dt;
    [u_new, t_new] = ode_FE(f, U_0, dt_k, T);
    plot(t_old, u_old, t_new, u_new)
    xlabel('time'); ylabel('value'); 
    fprintf('Timestep in this round is: %g\n', dt_k);
    answer = input('Do you want halve dt (y/n)? ', 's')
    if answer == 'y'
        u_old = u_new;
        t_old = t_new;
    else
   
    disp('Program stopped')
    break   
    end
    k = k + 1;
end

function [sol, time] = ode_FE(f, U_0, dt, T) %function from book
N_t = floor(T/dt);
u = zeros(N_t+1, 1);
t = linspace(0, N_t*dt, length(u));
u(1) = U_0;
for n = 1:N_t
u(n+1) = u(n) + dt*f(u(n), t(n));
end
sol = u;
time = t;
end
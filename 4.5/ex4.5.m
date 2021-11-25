%Olli-Petteri Lounatmaa
%051110
function demo_SIR()
    % Find appropriate time step for an SIR model
   
    dt = 10;   % 48 h
    D = 30;      % Simulate for D days
    N_t = floor(D*24/dt);    % Corresponding no of hours
    T = dt*N_t;              % End time
    U_0 = [50 1 0];
    
    f_handle = @f;
    
    [u_old, t_old] = ode_FE(f_handle, U_0, dt, T);
    
    S_old = u_old(:,1);
    I_old = u_old(:,2);
    R_old = u_old(:,3);
    k = 1;
    answer='y'
    while answer=='y'
        dt_k = 2^(-k)*dt;
        [u_new, t_new] = ode_FE(@f, U_0, dt_k, T);
        S_new = u_new(:,1);
        I_new = u_new(:,2);
        R_new = u_new(:,3);

        plot(t_old, S_old, 'b-', t_new, S_new, 'b--',t_old, I_old, 'r-', t_new, I_new, 'r--',t_old, R_old, 'g-', t_new, R_new, 'g--'); 
        ylabel('S (blue), I (red), R (green)');
        xlabel('Time');
        fprintf('Finest timestep was: %g\n', dt_k);
        answer = input('Halve dt (y/n)? ','s');
        if strcmp(answer, 'y')
            S_old = S_new;
            R_old = R_new;
            I_old = I_new;
            t_old = t_new;
            k = k + 1;
        else
            break
        end
    end
      function result = f(u,t) %From book
        beta = 10/(40*8*24);
        gamma = 3/(15*24);        
        S = u(1); I = u(2); R = u(3);
        result = [-beta*S*I beta*S*I - gamma*I gamma*I];
    end
end
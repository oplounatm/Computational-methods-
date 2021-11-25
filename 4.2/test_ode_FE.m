%Olli-Pettteri Lounatmaa
%0511110
function growth2_test()
close all
clear all 
clc
    test_ode_FE_1();
   
end

function test_ode_FE_1()
   values  = [1 2 4 8];
    T = 3.5;
    dt = 1;
    U_0 = 1.0;
    
    function result = f(u, t)
        result = u;
    end

    [u] = ode_FE(@f, U_0, dt, T);
   error= zeros(length(u), 1);
    for i = 1:length(values)
        errror(i+1) = (values(i) - u(i));
  
    end
    u
    values
    error
end
        

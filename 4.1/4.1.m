%olli-petteri lounatmaa
%0511110
%A
clear all
clc 
close all

t1=0
t2=1
dudt=@(u) u
dt=1

t_point = [0 1]
u(1)=1
u(2)= u(1)+dudt(u(1)) %Equation from forward euler 
t_point = [0 1]

hold on 
plot(t_point, u, 'r*')
line(t_point,u)

%%
%B
clc
clear all
close all


dt = 1
dudt=@(u) u
u = zeros(3, 1); %empty vector for u values
u(1) = 1;

for i = 1:2
    u(i+1) = u(i) + dt*dudt(u(i)); %Equation from forward euler 
end

u
tP = [0 1 2]
hold on
plot(tP, u, '*');
line(tP,u)
xlabel('t');
ylabel('u(t)');
%%
%C
clc
clear all
close all
x=linspace(0,4,5)
dt = 1
dudt=@(u) u

u = zeros(4, 1); %empty vector for u values 
u(1) = 1;

for i = 1:3
    u(i+1) = u(i) + dt*dudt(u(i)); %Equation to calculate u values 
end

u
tP = [0 1 2 3]
hold on
plot(tP, u, '*');
line(tP, u)
xlabel('t');
ylabel('u(t)');
%%
%D
clc
clear all
close all
line=linspace(-1,4,7)
x=linspace(0,4,5)
dt = 1
dudt=@(u) u
u_exact = @(t) exp(t);  %Equation for exact values, because u'=u with u(0)=1

u = zeros(4, 1); %empty vector for u values 
u(1) = 1;

for i = 1:3
    u(i+1) = u(i) + dt*dudt(u(i));
end
time_exact=linspace(0,3,20)
u
tP = [0 1 2 3]
u_curve=u_exact(time_exact)
hold on
plot(time_exact,u_curve)
plot(tP, u, '*');
xlabel('t');
ylabel('u(t)');
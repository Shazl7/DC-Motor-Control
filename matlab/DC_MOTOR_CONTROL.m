clc;
clear;
close all;

%% DC Motor Parameters
R  = 2;
L  = 0.5;
Kt = 0.015;
Ke = 0.015;
J  = 0.02;
b  = 0.2;

%% Motor Transfer Function
num = Kt;
den = [L*J, (L*b + R*J), (R*b + Ke*Kt)];

G = tf(num, den);

disp('DC Motor Transfer Function:');
G

%% Open Loop Response
figure;
step(12*G);
grid on;
title('DC Motor Open-Loop Response');
xlabel('Time (s)');
ylabel('Speed (rad/s)');

%% Open Loop Performance
info_open = stepinfo(G);

disp('Open Loop Performance:');
disp(info_open);

%% Reference
r = 0.4;

%% P Controller
Kp = 100;

G_P = feedback(Kp*G, 1);

figure;
step(r*G_P);
grid on;
title('P Controller Response');
xlabel('Time (s)');
ylabel('Speed (rad/s)');

info_P = stepinfo(G_P);

disp('P Controller Performance:');
disp(info_P);

%% PI Controller
Kp = 100;
Ki = 10;

C_PI = pid(Kp, Ki);

G_PI = feedback(C_PI*G, 1);

figure;
step(r*G_PI);
grid on;
title('PI Controller Response');
xlabel('Time (s)');
ylabel('Speed (rad/s)');

info_PI = stepinfo(G_PI);

disp('PI Controller Performance:');
disp(info_PI);

%% PID Controller
Kp = 100;
Ki = 200;
Kd = 10;

C_PID = pid(Kp, Ki, Kd);

G_PID = feedback(C_PID*G, 1);

figure;
step(r*G_PID);
grid on;
title('PID Controller Response');
xlabel('Time (s)');
ylabel('Speed (rad/s)');

info_PID = stepinfo(G_PID);

disp('PID Controller Performance:');
disp(info_PID);

%% Compare P, PI and PID
t = 0:0.01:20;

[yP, tP] = step(r*G_P, t);
[yPI, tPI] = step(r*G_PI, t);
[yPID, tPID] = step(r*G_PID, t);

figure;

plot(tP, yP, 'LineWidth', 1.5);
hold on;

plot(tPI, yPI, 'LineWidth', 1.5);

plot(tPID, yPID, 'LineWidth', 1.5);

yline(r, '--');

grid on;

title('P vs PI vs PID');
xlabel('Time (s)');
ylabel('Speed (rad/s)');

legend('P','PI','PID','Reference');

%% Display Steady-State Errors
ess_P = abs(r - dcgain(G_P)*r);
ess_PI = abs(r - dcgain(G_PI)*r);
ess_PID = abs(r - dcgain(G_PID)*r);

fprintf('\nSteady-State Errors:\n');
fprintf('P   = %.6f rad/s\n', ess_P);
fprintf('PI  = %.6f rad/s\n', ess_PI);
fprintf('PID = %.6f rad/s\n', ess_PID);
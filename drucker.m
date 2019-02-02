%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% drucker.m
% Author: Mohammad Azarnoush 
% E-mail: mazarnou@asu.edu
% Description:
% This code create drucker prager surface for eta = 0.5 and 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clf
clc
clear all
c = 1; % this is constant (c bar)
eta = 1; % you can put eta 0.5 or 1
 if eta == 0.5
   apex = -3.4642 * c;   % eta = 0.5
 elseif eta ==1
    apex = -1.7321 * c;  % eta = 1
 end
 
% h/r should be always remain constant. it is always (1/-apex) i.e. you can
% multiply both of them by any number as long as the ratio is constant.
% here I multiply both of them by 2 to get better view

r = 1*2; h = -apex*2;
m = h/r;
% meshgrid replicates the grid the two vectors to produce a full grid
[R,theta] = meshgrid(linspace(0,r,12),linspace(0,2*pi,42));

% x= r*cos(theta),y=r*sin(theta)
% z goes from apex (when R=0) to whatever h we want.
X = R .* cos(theta);
Y = R .* sin(theta);
Z = m*R + apex ;

% Cone around the z-axis, point at the apex
h1 = mesh(X,Y,Z);
% Rotate cone object,h1, around [-1 1 0] about 180+54.7356
% Origin of rotation is [0 0 0]
rotate(h1, [-1,1,0],180+54.7356,[0 0 0])
hold on

% plot hydrostatic line i.e. sigma1=sigma2=sigma3
plot3(-10:10,-10:10,-10:10,'--r');
grid on;
hold off
xlabel('\sigma_1','FontWeight','bold','FontSize',30);
ylabel('\sigma_2','FontWeight','bold','FontSize',30);
zlabel('\sigma_3','FontWeight','bold','FontSize',30);
view([31.5 14])
axis([-6 4 -6 4 -6 4])

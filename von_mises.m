%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% von_mises.m
% Author: Mohammad Azarnoush 
% E-mail: mazarnou@asu.edu
% Description:
% This code create von mises yield surface in principal stress space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% y is yield stress
y = 4; 
r = sqrt(2/3) * y;
% creating cylender with radius r.
% The cylinder has 100 equally spaced points around its circumference.
[x,y,z] = cylinder (r,100) ; 
% Define z coordinate of bottom and top of cylinder
z(1,:) = -10;
z(2,:) = 10 ;
h = surf(x,y,z,'LineStyle','none');

% Rotate cylinder object,h1, around [-1 1 0] about +54.7356
rotate(h, [-1,1,0],54.7356)

hold on

% plot hydrostatic line i.e. sigma1=sigma2=sigma3
plot3(-10:10,-10:10,-10:10,'r');
grid on;
hold off
xlabel('\sigma_1','FontWeight','bold','FontSize',30);
ylabel('\sigma_2','FontWeight','bold','FontSize',30);
zlabel('\sigma_3','FontWeight','bold','FontSize',30);
view([58.5 28]);
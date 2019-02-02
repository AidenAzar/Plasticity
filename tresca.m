%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% tresca.m
% Author: Mohammad Azarnoush 
% E-mail: mazarnou@asu.edu
% Description:
% This code create Tresca yield surface in principal stress space
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clf
clc
clear all
% y is  yield stress
y = 2;
Sy = sqrt(2/3) * y;
c = cos(pi/6);
s = sin(pi/6);
% each row of vevrt contains x,y and z coordinate of our hexagonal's
% vertices
vert = [Sy    0    -4; 
        Sy*s  Sy*c  -4; 
       -Sy*s  Sy*c  -4; 
       -Sy    0    -4;
       -Sy*s  -Sy*c -4;
        Sy*s  -Sy*c -4;
        Sy    0    4; 
        Sy*s  Sy*c  4; 
       -Sy*s  Sy*c  4; 
       -Sy    0    4;
       -Sy*s  -Sy*c 4;
        Sy*s  -Sy*c 4];
% each row of face includes vertcies that creat faces of hexagonal
fac = [1 2  8  7; ...
       2 3  9  8; ...
       3 9  10 4; ...
       4 10 11 5; ...
       5 11 12 6; ...
       6 1  7  12];
% patch function
h = patch('Faces',fac,'Vertices',vert,'FaceColor','b','FaceColor',[1 0 0]); 
material shiny;
alpha('color');
alphamap('rampdown');
% first rotate it along z axis about -15 
rotate(h, [0,0,1],-15)
% rotate again along [-1 1 0] about 54.7356
rotate(h, [-1,1,0],54.7356)
view([45.5 26]);
hold on

% plot hydrostatic line i.e. sigma1=sigma2=sigma3
plot3(-5:5,-5:5,-5:5,'--r');

grid on;
hold off
xlabel('\sigma_1','FontWeight','bold','FontSize',30);
ylabel('\sigma_2','FontWeight','bold','FontSize',30);
zlabel('\sigma_3','FontWeight','bold','FontSize',30);
set(gca,'FontSize',14);

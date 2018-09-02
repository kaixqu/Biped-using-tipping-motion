l1 = 50; l2 = 132; l3 = 10;
leg_rare = pi/16;
leg_mid = pi/5; 
leg_front = pi/8;
N = 15  ;
line_width = 2;
% -- plot -- %
draw_4dof_init
time_pause = 0.05;
for j = 0: 5
    draw_4dof_moveright
    draw_4dof_moveleft
end
hold off
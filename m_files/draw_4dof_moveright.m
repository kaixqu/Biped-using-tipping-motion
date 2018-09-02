lp3;
% support leg(front)(left)
LTHETA1     = linspace(leg_front,       leg_rare, 2*N);
% moving leg
RTHETA1_b   = linspace(leg_rare,        leg_mid,    N);
RTHETA2_b   = linspace(0,               -pi/6,      N);
RTHETA1_f   = linspace(leg_mid,         leg_front,  N);
RTHETA2_f   = linspace(RTHETA2_b(end),  0,          N);
RTHETA1     = [RTHETA1_b    RTHETA1_f];
RTHETA2     = [RTHETA2_b    RTHETA2_f];
for i = 1: length(RTHETA1)
    pause(time_pause)
    ltheta1 = LTHETA1(i);
    rtheta1 = RTHETA1(i);
    rtheta2 = RTHETA2(i);   rtheta3 = rtheta2 + pi/2;
    p1 = lp2    + [-sin(ltheta1)  cos(ltheta1)]*l1;
    lj = [p1; lp2];
    lp = [p1; lp2; lp3; lp4; lp5];
    rp2 = p1    + [sin(rtheta1) -cos(rtheta1)]*l1;
    rp3 = rp2   + [sin(rtheta2) -cos(rtheta2)]*l2;
    rp4 = rp3   + [sin(rtheta3) -cos(rtheta3)]*l3;
    rp5 = rp3   - [sin(rtheta3) -cos(rtheta3)]*l3;
    rj = [p1; rp2];
    rp = [p1; rp2; rp3; rp4; rp5];
    [ground, groundx, groundy] = plot_ground(lp4, rp4);
    if ground && i < length(LTHETA1)/2
        h = plot(groundx, groundy, '-g', ...
            lj(:,1) ,lj(:, 2), 'ob', ...
            lp(:,1) ,lp(:, 2), '-b', ...
            rj(:,1) ,rj(:, 2), 'or', ...
            rp(:,1) ,rp(:, 2), '-r', ...
            'LineWidth', line_width);
        rotate(h, [0, 0, 1], -rad2deg(atan( (rp4(2)-lp4(2))/(rp4(1)-lp4(1)) )), [lp4 0]);
    elseif i < length(LTHETA1)
        plot([lp3(1)-500 lp3(1)+500], [lp3(2) lp3(2)], '-g',...
            lj(:,1) ,lj(:, 2), 'ob', ...
            lp(:,1) ,lp(:, 2), '-b', ...
            rj(:,1) ,rj(:, 2), 'or', ...
            rp(:,1) ,rp(:, 2), '-r',  ...
            'LineWidth', line_width);
    end
end

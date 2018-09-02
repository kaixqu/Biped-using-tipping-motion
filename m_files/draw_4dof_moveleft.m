rp3;
% support leg
RTHETA1     = linspace(leg_front,       leg_rare, 2*N);
% moving leg
LTHETA1_b   = linspace(leg_rare,        leg_mid,    N);
LTHETA2_b   = linspace(0,               -pi/6,      N);
LTHETA1_f   = linspace(leg_mid,         leg_front,  N);
LTHETA2_f   = linspace(LTHETA2_b(end),  0,          N);
LTHETA1     = [LTHETA1_b    LTHETA1_f];
LTHETA2     = [LTHETA2_b    LTHETA2_f];
for i = 1: length(LTHETA1)
    pause(time_pause)
    rtheta1 = RTHETA1(i);
    ltheta1 = LTHETA1(i);
    ltheta2 = LTHETA2(i);   ltheta3 = ltheta2 + pi/2;
    p1 = rp2    + [-sin(rtheta1)  cos(rtheta1)]*l1;
    rj = [p1; rp2];
    rp = [p1; rp2; rp3; rp4; rp5];
    lp2 = p1    + [sin(ltheta1)   -cos(ltheta1)]*l1;
    lp3 = lp2   + [sin(ltheta2)   -cos(ltheta2)]*l2;
    lp4 = lp3   + [sin(ltheta3)   -cos(ltheta3)]*l3;
    lp5 = lp3   - [sin(ltheta3)   -cos(ltheta3)]*l3;
    lj = [p1; lp2];
    lp = [p1; lp2; lp3; lp4; lp5];
    [ground, groundx, groundy] = plot_ground(lp4, rp4);
    if ground && i < length(LTHETA1)/2
        h = plot(groundx, groundy, '-g', ...
            rj(:,1) ,rj(:, 2), 'or', ...
            rp(:,1) ,rp(:, 2), '-r', ...
            lj(:,1) ,lj(:, 2), 'ob', ...
            lp(:,1) ,lp(:, 2), '-b', ...
            'LineWidth', line_width);
        rotate(h, [0, 0, 1], -rad2deg(atan( (rp4(2)-lp4(2))/(rp4(1)-lp4(1)) )), [rp4 0]);
    elseif i < length(LTHETA1)
        plot([rp3(1)-500 rp3(1)+500], [rp3(2) rp3(2)],  '-g', ...
            rj(:,1) ,rj(:, 2), 'or', ...
            rp(:,1) ,rp(:, 2), '-r', ...
            lj(:,1) ,lj(:, 2), 'ob', ...
            lp(:,1) ,lp(:, 2), '-b', ...
            'LineWidth', line_width);
    end
end
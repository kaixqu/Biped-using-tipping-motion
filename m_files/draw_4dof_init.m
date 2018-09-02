p1 = [0, 0];
% support leg(front)(left)
ltheta1 = leg_front;
ltheta2 = 0;    ltheta3 = ltheta2 + pi/2;
lp2 = p1    + [sin(ltheta1) -cos(ltheta1)]*l1;
lp3 = lp2   + [sin(ltheta2) -cos(ltheta2)]*l2;
lp4 = lp3   + [sin(ltheta3) -cos(ltheta3)]*l3;
lp5 = lp3   - [sin(ltheta3) -cos(ltheta3)]*l3;
lj = [p1; lp2];
lp = [p1; lp2; lp3; lp4; lp5];
% moving leg(rare)(right)
rtheta1 = leg_rare;
rtheta2 = 0;    rtheta3 = rtheta2 + pi/2;
rp2 = p1    + [sin(rtheta1) -cos(rtheta1)]*l1;
rp3 = rp2   + [sin(rtheta2) -cos(rtheta2)]*l2;
rp4 = rp3   + [sin(rtheta3) -cos(rtheta3)]*l3;
rp5 = rp3   - [sin(rtheta3) -cos(rtheta3)]*l3;
rj = [p1; rp2];
rp = [p1; rp2; rp3; rp4; rp5];
[ground, groundx, groundy] = plot_ground(lp4, rp4);
% plot
plot(-400, 400, 'ok', 'LineWidth', line_width)
axis equal, axis square
xlim([-50, 200]), ylim([-200 50])
grid on, hold on
set(gca, 'XLimMode', 'manual','YLimMode', 'manual', 'XTickLabel',{''}, 'YTickLabel',{''})



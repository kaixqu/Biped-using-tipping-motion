function [ground, groundx, groundy] = plot_ground(lp4, rp4)
groundx = [(lp4(1)+rp4(1))/2 + 500*(lp4(1)-rp4(1))/abs((lp4(1)-rp4(1))) (lp4(1)+rp4(1))/2 - 500*(lp4(1)-rp4(1))/abs((lp4(1)-rp4(1)))];
groundy = [(lp4(2)+rp4(2))/2 + 500*(lp4(2)-rp4(2))/abs((lp4(1)-rp4(1))) (lp4(2)+rp4(2))/2 - 500*(lp4(2)-rp4(2))/abs((lp4(1)-rp4(1)))];
if ((groundx(2)-groundx(1))/(groundy(2)-groundy(1)) > 0)
    ground = 1;
else
    ground = 0;
end
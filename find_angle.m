function [angle] = find_angle(x1,x2,y1,y2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
angle=atan2(-(y2-y1),(x2-x1));
%(x1,y1)-my bot ; (x2,y2)-ext point;
angle=radtodeg(angle);
if(angle<0)
    angle=360+angle;
end
end


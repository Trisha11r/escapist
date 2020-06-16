function [value] = safe( goalAngle,enemyAngle,thresh )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
value=0;
if thresh<= goalAngle&&goalAngle<= 360-thresh
    if enemyAngle > goalAngle + thresh || enemyAngle < goalAngle -thresh
        value=1;
    end
else if goalAngle< thresh 
    if enemyAngle > goalAngle + thresh || enemyAngle < 360 - thresh + goalAngle
        value=1;
    end
    else if goalAngle > 360-thresh
        if enemyAngle > goalAngle + thresh -360 || enemyAngle < goalAngle - thresh
            value=1;
        end
else
    value=0;
        end
    end
end


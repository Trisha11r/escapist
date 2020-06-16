function [ distGoals,angleGoals ] =sortGoals(distGoals,angleGoals)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[g1,g2]=size(distGoals);
for i=1:g1
    for j=1:g1-i
        if distGoals(j)>distGoals(j+1)
            tmp=distGoals(j);
            distGoals(j)=distGoals(j+1);
            distGoals(j+1)=tmp;
            tmp=angleGoals(j);
            angleGoals(j)=angleGoals(j+1);
            angleGoals(j+1)=tmp;
        end
    end
end
end


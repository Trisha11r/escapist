function [] = mainWork(im,arduino)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[statsG, statsR,statsB,angle]=find_cen(im);
% disp('found cen');
[g1,g2]=size(statsG);
distGoals=zeros(g1,1);
angleGoals=zeros(g1,1);
[r1,r2]=size(statsR);
distEnemy=zeros(r1,1);
angleEnemy=zeros(r1,1);
for i=1:g1
    x1=statsB(1,1).Centroid(1);
    y1=statsB(1,1).Centroid(2);
    x2=statsG(i,1).Centroid(1);
    y2=statsG(i,1).Centroid(2);
    distGoals(i)=dist(x1,x2,y1,y2);
    angleGoals(i)=find_angle(x1,x2,y1,y2);
%     disp('x1 y1 x2 y2 distGoals angleGoals');
%     disp(x1);
%     disp(y1);
%     disp(x2);
%     disp(y2);
%     disp(distGoals);
%     disp(angleGoals);
end
for i=1:r1
    x1=statsB(1,1).Centroid(1);
    y1=statsB(1,1).Centroid(2);
    x2=statsR(i,1).Centroid(1);
    y2=statsR(i,1).Centroid(2);
    distEnemy(i)=dist(x1,x2,y1,y2);
    angleEnemy(i)=find_angle(x1,x2,y1,y2);
%     disp('x2 y2 distEnemy angleEnemy');
%     disp(x2);
%     disp(y2);
%     disp(distEnemy);
%     disp(angleEnemy);
end
% disp('found angles');
[ distGoals,angleGoals ] =sortGoals(distGoals,angleGoals);
% disp('sorted');
i=1;
found=0;
while found ==0&& i<=g1
    j=1;
    f=0;
    while j<=r1
         if safe(angleGoals(i),angleEnemy(j),20)==0
             f=1;
             break;
         end
          j=j+1;
    end
    if f==0
        found=1;
        foundGoal=i;
        for k=1:r1
            if angleGoals(foundGoal)==angleEnemy(k) && distGoals(foundGoal)==distEnemy(k)
                found=0;
            end
        end
    end
    i=i+1;
end
%disp(i);
if found==1
%     disp('angleGoals');
%     disp(angleGoals(foundGoal));
%       imshow(im);
    x1=statsB(1,1).Centroid(1);
    y1=statsB(1,1).Centroid(2);    
    m=tan(degtorad(angleGoals(foundGoal)));
    c=-statsB(1,1).Centroid(2)-m*(statsB(1,1).Centroid(1));
    if angleGoals(foundGoal)<=90||angleGoals(foundGoal)>=270
        xx=500+x1;
    else
        xx=x1-500;
    end
    yy=-(m*xx+c);
 %    line([x1,xx],[y1,yy],'Color','w');
%     disp('xx yy');
%     disp(xx);
%     disp(yy);
    finAngle2=angleGoals(foundGoal);
    
else 
%     disp('not found');
    %finAngle2=0;
end
 if found==0
     sort(angleEnemy);
%      disp(angleEnemy);
     Eangle=zeros(r1,1);
     for m=1:r1-1,n=1:r1-1;
         Eangle(n)=angleEnemy(m+1)-angleEnemy(m);
     end
     temp=360-sum(Eangle);
%      disp(temp);
%      disp(sum(Eangle));
%      disp(Eangle);
     Eangle(n)=temp;
     maxEangle=max(Eangle);
     index=1;
     for j=1:r1-1
         if Eangle(j)== maxEangle
             index=j;
             break;
         end
     end
     req_Eangle=maxEangle/2+angleEnemy(index);
     if req_Eangle>360
         req_Eangle=360-req_Eangle;
     end
%     disp(req_Eangle);
     finAngle2=req_Eangle;
 end
 finDir=angle-finAngle2;
 if(finDir<5 && finDir>-5)
     finDir=0;
 end
%  disp(finDir);
fprintf(arduino,'%f ', finDir);
end
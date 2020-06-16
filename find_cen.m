function [statsG, statsR,statsB,angle] = find_cen(Imag)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
redbw=im2bw(Imag(:,:,1),graythresh(Imag));
greenbw=im2bw(Imag(:,:,2),graythresh(Imag));
bluebw=im2bw(Imag(:,:,3),graythresh(Imag));
statsG=regionprops(greenbw,'Centroid');
statsR=regionprops(redbw,'Centroid');
statsB=regionprops(bluebw,'Centroid');
inv=~bluebw;
statsBinv=regionprops(inv,'Centroid','Area');
if statsBinv(1,1).Area > statsBinv(2,1).Area
    pos=statsBinv(2,1).Centroid;
else
    pos=statsBinv(1,1).Centroid;
end
%imshow(Imag);
%line([statsB.Centroid(1),pos(1)],[statsB.Centroid(2),pos(2)],'Color','w');
angle =atan2(-(pos(2)-(statsB.Centroid(2))),(pos(1)-statsB.Centroid(1)));
angle=radtodeg(angle);
if(angle<0)
    angle=360+angle;
end
%disp(angle);
end


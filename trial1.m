Imag=imread('prc2.png');
imshow(Imag);
redbw=im2bw(Imag(:,:,1),graythresh(Imag));
imshow(redbw);
greenbw=im2bw(Imag(:,:,2),graythresh(Imag));
imshow(greenbw);
bluebw=im2bw(Imag(:,:,3),graythresh(Imag));
imshow(bluebw);
figure,imshow(redbw);
figure, imshow(greenbw);
Stats=regionprops(greenbw,'Centroid','Area');
Stats(1,1).Area
Sats(1,1).Centroid
Stats(1,1).Centroid
Stats(1,1).Centroid(2)
Stats(1,1).Centroid(1)
statsG=regionprops(greenbw,'Centroid');
figure, imshow(greenbw);
statsG=regionprops(greenbw,'Centroid','BoundingBox');
rect(statsG(1,1).BoundingBox);
imshow(imcrop(statsG(1,1).BoundingBox));
imshow(greenbw,imcrop(statsG(1,1).BoundingBox));
imshow(imcrop(greenbw,statsG(1,1).BoundingBox));
figure, imshow(Imag);
figure, imshow(bluebw);
inv=~bluebw;
figure, imshow(inv);
find_cen
atan2([statsB.Centroid(1)-pos(1)],[statsB.Centroid(2)-pos(2)]);
Imag=imread('prc2.png');
find_cen(Imag);
dist(2,4,5,6);
find_cen(Imag);
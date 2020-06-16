        preFilename='.';
while 1
    tic;
path='C:\Users\Admin\Desktop\images\';  % address of folder to be read
s=dir(path);
[r c t]=size(s);
fileName1=s(r-1).name; % returns the file name of last but one file
disp(fileName1);
if(strcmp(preFilename,fileName1)==0)
im=imread(strcat(path,fileName1));
mainWork(im,arduino);
prefileName=fileName1;
end
t=toc;
disp(1/t);
end
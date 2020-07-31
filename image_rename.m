folder = '/home/ming/Desktop/test/person01_jogging_d2_uncomp';
images = dir([folder '/*.jpg']);

for i = 1 : numel(images)
    oldname = images(i).name;
    address = [folder, '/', oldname];
    I = imread(address);
    %newname = strcat(folder, '/frame', num2str(i), '.jpg');
    newname = strcat('frame', num2str(i), '.jpg');
    imwrite(I, newname, 'jpg');
end 
clc;clear;

folder = '/media/ming/DATADRIVE1/KTHtrim600/KTH600 frames/walking/person25_walking_d4_uncomp';
images = dir([folder '/*.jpg']);

int_name = zeros(1,numel(images));
for i = 1 : numel(images)
    currentname = images(i).name;
    L = length(currentname);
    name = currentname(6:(L-4));
    int_name(i) = str2num(name);
end

[x,ind] = sort(int_name);
new_int_name = int_name(ind);

for i = 1 : numel(images)
    index = new_int_name(i);
    str_number = num2str(index);
    address = [folder, '/frame', str_number, '.jpg'];
    I = imread(address);
    %newname = strcat(folder, '/frame', num2str(i), '.jpg');
    newname = strcat('frame', num2str(i), '.jpg');
    imwrite(I, newname, 'jpg');
end 
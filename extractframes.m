clc; clear;

video_file = '/media/ming/DATADRIVE1/KTH Dataset/KTH Dataset video/';  % original video place
subdir = dir(video_file);
OutputDir = '/media/ming/DATADRIVE1/KTH Dataset/KTH Dataset frame/';   % frames place

for i = 1 : length(subdir)
    if(isequal(subdir(i).name, '.') || isequal(subdir(i).name, '..'))
        continue;
    end
    subdirpath = [video_file, subdir(i).name];  %/media/ming/DATADRIVE1/KTH Dataset/KTH Dataset video/boxing
    videos = dir([subdirpath, '/*.avi']);
    Outputsubdir = [OutputDir, subdir(i).name];     %/media/ming/DATADRIVE1/KTH Dataset/KTH Dataset frame/boxing
    mkdir(Outputsubdir);
    for j = 1 : length(videos)
        video_filepath = [subdirpath, '/', videos(j).name];     %/media/ming/DATADRIVE1/KTH Dataset video/boxing/person01_boxing_d1_uncomp.avi
        video = VideoReader(video_filepath);            
        frame_number = video.NumberOfFrames;        
        Outputsubsubdir = [Outputsubdir, '/', video.Name];  %/media/ming/DATADRIVE1/KTH Dataset/KTH Dataset frame/boxing/person01_boxing_d1_uncomp.avi
        Outputsubsubdir(end-3:end) = [];                    %/media/ming/DATADRIVE1/KTH Dataset/KTH Dataset frame/boxing/person01_boxing_d1_uncomp
        mkdir(Outputsubsubdir);
        for k = 1 : frame_number
            image_name = strcat('frame', num2str(k));
            image_name = strcat(image_name, '.jpg');
            I = read(video, k);
            outputpath = [Outputsubsubdir, '/', image_name]; 
            imwrite(I, outputpath, 'jpg');
            I = [];
        end
    end
    fprintf('i: %d\n', i);
end

%{
video = VideoReader(video_file);
frame_number = video.NumberOfFrames;
frame_number2 = floor(video.Duration * video.FrameRate);
%fprintf('frame_number: %d\n', frame_number);
%fprintf('frame_number2: %d\n', frame_number2);

for i = 1 : frame_number
    image_name = strcat('frame', num2str(i));
    image_name = strcat(image_name, '.jpg');
    I = read(video, i);
    
    outputpath = ['/media/ming/DATADRIVE1/KTH Dataset frame/test2/', image_name]; 
    imwrite(I, outputpath, 'jpg');
    I = [];
end
%}
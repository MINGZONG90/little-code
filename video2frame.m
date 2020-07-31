clc; clear;

video_file = '/media/ming/DATADRIVE1/Prof. Chen/Matlabcode4ProfChen/AVG/AVG-TownCentre.mp4';  % original video place

video = VideoReader(video_file);
frame_number = video.NumberOfFrames;
frame_number2 = floor(video.Duration * video.FrameRate);
%fprintf('frame_number: %d\n', frame_number);
%fprintf('frame_number2: %d\n', frame_number2);

for i = 1 : frame_number
    image_name = strcat('frame', num2str(i));
    image_name = strcat(image_name, '.jpg');
    I = read(video, i);
    
    outputpath = ['/media/ming/DATADRIVE1/Prof. Chen/Matlabcode4ProfChen/AVG/frames/', image_name]; 
    imwrite(I, outputpath, 'jpg');
    I = [];
end
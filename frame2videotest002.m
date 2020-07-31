framesPath = '/media/ming/DATADRIVE1/Pro. Chen/img1/';
videoName = 'AVG-TownCentre.avi';
fps = 25;
frames = dir([framesPath '/*.jpg']);

startFrame = 1;
endFrame = numel(frames);

% generate video parameter setting
aviobj = VideoWriter(videoName);   % create a avi file object
aviobj.FrameRate = fps;

open(aviobj); % open file for writing video data
% read an image
for i = startFrame:endFrame
    if i < 10
        fileName = ['00000', num2str(i)];
    elseif (i < 100) && (i > 9)
        fileName = ['0000', num2str(i)];
    elseif (i <1000) && (i > 99)
        fileName = ['000', num2str(i)];
    end
    frames = imread([framesPath, fileName, '.jpg']);
    writeVideo(aviobj, frames);
end
close(aviobj);
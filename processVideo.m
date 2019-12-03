
fname = input('Enter the name of the video you want : ','s');

v = VideoReader(fname);
tic
currAxes = axes;
v2 = VideoWriter('new.avi');
open(v2);
firstFrame = 1;
secondFrame = 0;
hypotheses = 0;
numOfHypotheses = 0;
while hasFrame(v)
    trainScript
    vidFrame = readFrame(v);
    vidf = vidFrame;
%     image(vidFrame, 'Parent', currAxes);
%     currAxes.Visible = 'off';
%     pause(1/v.FrameRate);
%     pause
    vidFrame = rgb2ycbcr(vidFrame);
    vidFrame = vidFrame(:,:,2:3);
    
    [frame,prob] = classifyImage(vidFrame,priors, hist1,hist2,hist);
    [width,height] = size(frame);
    SE = strel('square', 30);
%      result = imdilate(result, SE);
%     result = imerode(result, SE);
   
    
    frame = bwlabel(frame);
    hist = getHist(frame);
    
    numOfBlobs = max(size(hist));
    %try
   if numOfBlobs == 0
       firstFrame = 1;
       continue
   
   else
       if firstFrame == 1
           
           hypotheses = hypothesesGenerate(frame, hypotheses);
           [~, numOfHypotheses ] = size(hypotheses);
           plotEllipses(frame, hypotheses, numOfBlobs)
           positions = getPositions(hypotheses);
           prevFrame1 = frame;
           firstFrame = 0;
           secondFrame = 1;
       elseif secondFrame == 1
           hypotheses = 0;
%            frame = matchBlobs(frame,prevFrame1);
           hypotheses = hypothesesGenerate(frame, hypotheses);
           plotEllipses(frame, hypotheses, numOfBlobs)
           positions = updatePositions(positions, hypotheses);
           secondFrame = 0;
           prevFrame2 = prevFrame1;
           prevFrame1 = frame;
       else
%            frame = matchBlobs(frame,prevFrame1);
            [~, numOfHypotheses ] = size(hypotheses);
           if numOfBlobs > numOfHypotheses
               [hypotheses , positions] = addHypotheses(frame, hypotheses, positions);
           end
           hypotheses = predictPositions(positions, hypotheses);
           positions;
           hypotheses = hypothesesTrack(frame,hypotheses);
           positions = updatePositions(positions, hypotheses);
           plotEllipses(vidf, hypotheses, numOfBlobs);
           prevFrame2 = prevFrame1;
           prevFrame1 = frame;
       end
   end
   
   
   
    
    %catch
    %    close(v2);
   % end
    bw = colormap(gray(2));
    t = imread('temp.png');
    writeVideo(v2,t);
end
close(v2);

toc
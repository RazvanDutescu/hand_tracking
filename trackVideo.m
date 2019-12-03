vid = VideoReader('2Blobs.avi');
v = VideoReader('2Blobs.avi');
currAxes = axes;
v2 = VideoWriter('new.avi');
open(v2);
firstFrame = 1;
secondFrame = 0;
hypotheses = 0;
numOfHypotheses = 0;
while hasFrame(vid)
    tic
    vidFrame = readFrame(vid);
    vFrame = readFrame(v);
    frame = vidFrame(:,:,1);
    [width,height] = size(frame);
    for i = 1:width
        for j = 1:height
            if frame(i,j) > 125
                frame(i,j) = 1;
            else
                frame(i,j) = 0;
            end
        end
    end
    
    frame = bwlabel(frame);
    hist = getHist(frame);
    
    numOfBlobs = max(size(hist));
    
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
           plotEllipses(vFrame, hypotheses, numOfBlobs);
  
           hypotheses = hypothesesTrack(frame,hypotheses);
           positions = updatePositions(positions, hypotheses);
           plotEllipses(vFrame, hypotheses, numOfBlobs);
           
           prevFrame2 = prevFrame1;
           prevFrame1 = frame;
       end
   end
   bw = colormap(gray(2));
    t = imread('temp.png');
    writeVideo(v2,t);
     writeVideo(v2,t);
     writeVideo(v2,t);
     writeVideo(v2,t);
   toc
end
close(v2);

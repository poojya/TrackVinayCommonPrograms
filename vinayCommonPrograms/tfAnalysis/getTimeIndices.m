% get time indices corresponding to an epoch
% This function is derived from the display programs
% Vinay Shirhatti, 29 February 2016

function [BLPos,xsBL] = getTimeIndices(folderName,BLMin,BLMax)

folderLFP = fullfile(folderName,'segmentedData','LFP');

load(fullfile(folderLFP,'lfpInfo.mat'));

Fs = round(1/(timeVals(2)-timeVals(1)));
BLRange = uint16((BLMax-BLMin)*Fs);
BLPos = find(timeVals>=BLMin,1)+ (1:BLRange);

xsBL = 0:1/(BLMax-BLMin):Fs-1/(BLMax-BLMin);

end
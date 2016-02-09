% load lfpInfo for a protocol
% This function is the same as the one in display programs
% Vinay Shirhatti, 05 February 2016
%**************************************************************************

function [analogChannelsStored,timeVals,goodStimPos,analogInputNums] = loadlfpInfo(folderLFP) %#ok<*STOUT>
load(fullfile(folderLFP,'lfpInfo.mat'));
if ~exist('analogInputNums','var')
    analogInputNums=[];
end
end
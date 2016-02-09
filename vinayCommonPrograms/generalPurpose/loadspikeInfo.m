% load spike Info for a protocol
% This function is the same as the one in display programs
% Vinay Shirhatti, 01 February 2016
%**************************************************************************

function [neuralChannelsStored,SourceUnitID] = loadspikeInfo(folderSpikes)
fileName = fullfile(folderSpikes,'spikeInfo.mat');
if exist(fileName,'file')
    load(fileName);
else
    neuralChannelsStored=[];
    SourceUnitID=[];
end
end
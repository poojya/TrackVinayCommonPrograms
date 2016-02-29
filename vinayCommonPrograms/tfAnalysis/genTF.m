% generate multitaper tf spectrum for a given set of electrodes
% This function is the same as the one in display programs
% Vinay Shirhatti, 29 February 2016
%
% INPUTS:
% folderName: protocol folder
% electrodeList: list of electrodes to be processed
% goodPos: contains the good stimulus indices
%
% OUTPUTS:
% dS: mean difference spectrum (averaged across the specified electrodes, 
%           across all good stimuli)
% t: time values
% f: frequency values
% dSElec: contains the mean difference spectrum for each electrode across 
%         trials
%**************************************************************************

function [dS,t,f,dSElec] = genTF(folderName,electrodesList,goodPos,BLMin,BLMax,movingWin,mtmParams)

folderSegment = fullfile(folderName,'segmentedData');
folderLFP = fullfile(folderSegment,'LFP');

load(fullfile(folderLFP,'lfpInfo.mat'));

%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
specType = 0; % uses mtspecgramc
takeLogTrial = 0;

if ~exist ('BLMin','var')
    BLMin = -0.5;
end

if ~exist ('BLMax','var')
    BLMax = 0;
end

if ~exist('mtmParams','var')
    mtmParams.Fs = 2000;
    mtmParams.tapers=[2 3];
    mtmParams.trialave=0;
    mtmParams.err=0;
    mtmParams.pad=-1;
end

if ~exist('movingWin','var')
    movingWin = [0.4 0.01];
end
%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

for i = 1:length(electrodesList)
    
    disp(['elec' num2str(electrodesList(i))]);
    clear analogData
    load(fullfile(folderLFP,['elec' num2str(electrodesList(i)) '.mat']));
    [~,~,dSElec(:,:,i),t,f] = getSpectrum(analogData(goodPos,:),timeVals,specType,mtmParams,movingWin,BLMin,BLMax,takeLogTrial);
    
end

dS = mean(dSElec,3); % mean across electrodes

end
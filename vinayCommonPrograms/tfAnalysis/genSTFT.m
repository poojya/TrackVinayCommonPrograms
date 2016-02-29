% generate stft for a given set of electrodes
% This function is the same as the one in display programs
% Vinay Shirhatti, 29 February 2016
%
% INPUTS:
% folderName: protocol folder
% electrodeList: list of electrodes to be processed
% goodPos: contains the good stimulus indices
% epoch: contains the time indices to be considered for stft
%
% OUTPUTS:
% mlogSTFT: mean stft (averaged across the specified electrodes, 
%           across all good stimuli)
% t: time values
% f: frequency values
% mlogSTFTElec: contains the mean stft for each electrode across trials
%**************************************************************************


function [mlogSTFT,t,f,mlogSTFTElec] = genSTFT(folderName,electrodesList,goodPos,epoch,movingWin,mtmParams)

folderSegment = fullfile(folderName,'segmentedData');
folderLFP = fullfile(folderSegment,'LFP');

load(fullfile(folderLFP,'lfpInfo.mat'));

%::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
specType = 3; % stft using MTM
takeLogTrial = 0;

if ~exist('mtmParams','var')
    mtmParams.Fs = 2000;
    mtmParams.tapers=[1 1]; % normal stft with dpss window
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
    [STFTElec(:,i),mlogSTFTElec(:,i),~,t,f] = getSpectrum(analogData(goodPos,epoch),timeVals,specType,mtmParams,movingWin,epoch(1),epoch(2),takeLogTrial);
    
end

mlogSTFT = mean(mlogSTFTElec,2); % mean across electrodes
stdlogSTFT = 

end
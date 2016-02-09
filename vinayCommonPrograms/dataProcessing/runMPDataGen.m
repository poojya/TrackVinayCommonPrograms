%==========================================================================
% For MP Decomposition Data Generation
% Vinay Shirhatti, 03 September 2014 - modified as run file 30/10/2014
% from prepareJobHost.m
% Prepare data for job submission on the local Host machine
% Also run MP decomposition and save gaborInfo in the respective mpAnalysis
% folder for ready reference during analysis
% modified again 13 October 2015
% modified: 23 December, 2015
%==========================================================================
tic;
clear;clc;close all;

% Choose the protocols (the indices correspond to those in listProtocols.m)
runForIndex = 83:86;

% Check the OS and set paths accordingly
if isunix
    folderSourceString = '/media/vinay/SRLHD02M/';
elseif ispc
    folderSourceString = 'J:\';
end

% define grid
% gridType = 'EEG';
gridType = 'Microelectrode';

subjectName = 'alpa';

% choice of electrodes
useHighRMSElectrodes = 1;
saveGaborInfoFlag = 1;

% Load the protocol specifics
if strncmp(gridType,'EEG',3)
    [~,subjectNames,expDates,protocolNames] = listProtocols;
    % define the number of channels
    channelNumbers = 1:21;
else
    [expDates,protocolNames,stimTypes] = eval(['allProtocols' upper(subjectName(1)) subjectName(2:end) gridType]);
end

% Specify the time epoch to be decomposed and analyzed
selectTime = 1;
tlen = 1024; 
if selectTime
    tMin(1) = -0.512; % base
    tMin(2) = 0.25; % stim
else
    tMin = 0;
end

% Main loop to generate MP data
for n = 1:length(runForIndex)
    for ti=1:length(tMin)
        if strncmp(gridType,'EEG',3)
            subjectName = subjectNames{runForIndex(n)};
        end
        expDate = expDates{runForIndex(n)};
        protocolName = protocolNames{runForIndex(n)};

        % Prepare folders
        folderNameMain = fullfile(folderSourceString,'data',subjectName,gridType,expDate,protocolName);

        % Input folder
        lfpFolder = fullfile(folderNameMain,'segmentedData','LFP');

        % Load lfpInfo for electrodes' information
        load(fullfile(lfpFolder,'lfpInfo.mat'));

        rfDataFile = [subjectName gridType 'RFData.mat']; % cutoff = 100
        if exist(rfDataFile,'file')
            load(rfDataFile);
        else
            highRMSElectrodes = 1:96;
        end

        if ~useHighRMSElectrodes
            channelNumbers = electrodesStored;
        else
            channelNumbers = highRMSElectrodes;
        end

        % time epoch and output folder
        if selectTime
            tRange = find(timeVals>=tMin(ti));
            tRange = tRange(1:tlen);
            outputFolder = fullfile(folderNameMain,'mpAnalysis',['epoch' num2str(ti)]);
            makeDirectory(outputFolder);
            mptimeVals = timeVals(tRange);
            save(fullfile(outputFolder,'mptimeVals.mat'),'mptimeVals');
        else
            tRange = [];
            outputFolder = fullfile(folderNameMain,'mpAnalysis');
            makeDirectory(outputFolder);
        end

        disp(['Number of electrodes/channels: ' num2str(length(channelNumbers))]);
        disp('Preparing data....')
        prepareDataForHost(subjectName,expDate,protocolName,channelNumbers,folderSourceString,gridType,tRange,outputFolder);

        % Run MP decomposition on the local machine

        disp('Running MP decomposition....');
        for i = 1:length(channelNumbers)
            localCtlFile = fullfile(outputFolder,['elec' num2str(channelNumbers(i))],'ImportData_SIG','GaborMP','local.ctl');
            gaborInfoFile = fullfile(outputFolder,['elec' num2str(channelNumbers(i))],'gaborInfo.mat');

            if ~exist(gaborInfoFile,'file')
                if ~exist(localCtlFile,'file')
                    disp([localCtlFile ' does not exist']);
                else
                    disp(['electrode/channel number:' num2str(channelNumbers(i))]);
                    runMPDecomp(localCtlFile); % simply runs gabord on the above local.ctl
                end

                if saveGaborInfoFlag
                    % Save gaborInfo for each electrode
                    disp('Saving gaborInfo....');
                    tag = ['elec' num2str(channelNumbers(i))];
                    gaborInfo = getGaborData(outputFolder,tag,1);
                    save(fullfile(outputFolder,tag,'gaborInfo.mat'),'gaborInfo');
                    clear gaborInfo
                end
            else
                disp(['gaborInfo already exists for channel ' num2str(channelNumbers(i))]);
            end
        end
    end
end
toc;
%% Reconstruct energy spectrum for each trial and store the energy matrix
% Vinay - not a good startegy this! Creates huge files!
% 
% for i = 1:length(channelNumbers)
%     if ispc
%         mpFolder = ([folderSourceString 'data\' subjectName '\' gridType '\' expDate '\' protocolName ...
%                 '\mpAnalysis\elec' num2str(channelNumbers(i)) '\']);
%         load([mpFolder '\gaborInfo.mat']);
%     else
%         mpFolder = ([folderSourceString 'data/' subjectName '/' gridType '/' expDate '/' protocolName ...
%                 '/mpAnalysis/elec' num2str(channelNumbers(i)) '/']);
%         load([mpFolder '/gaborInfo.mat']);
%     end
%     
%     goodPos = 1:length(gaborInfo);
%     
% %     gaborInfoGoodPos = gaborInfo(goodPos);
% 
%     L = 4096;
%     wrap = [];
%     numAtomsMP = 100;
%     atomList = (1:numAtomsMP);
%     
%     mpEnergy = [];
%     mpEfileName = ([mpFolder 'mpEnergy.mat']);
%     save(mpEfileName,'mpEnergy');
%     mpE = matfile(mpEfileName,'Writable',true);
%     
%     disp(['Reconstructing Energy from:' num2str(numAtomsMP) 'atoms, and'  num2str(length(goodPos)) 'trials']);
%     disp(['Saving mpEnergy for electrode ' num2str(channelNumbers(i))]);
%     for m=1:length(goodPos)
%         disp(['trial number: ' num2str(m) '(actual trial - )' num2str(goodPos(m))]);
%         mpEnergy = reconstructEnergyFromAtomsMPP(gaborInfo{m}.gaborData,L,wrap,atomList);
%         mpE.mpEnergy(m,1:size(mpEnergy,1),1:size(mpEnergy,2)) = mpEnergy;
%         clear mpEnergy;
%     end
%     
%     
% %     save([mpFolder 'mpEnergy.mat'], 'mpEnergy');
%     clear gaborInfo
% end
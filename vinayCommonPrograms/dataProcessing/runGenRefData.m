% run the genRefData code - to generate data for different reference
% techniques.
% Vinay Shirhatti, 27 October 2014
%==========================================================================
clc;clear;

% Choose the protocols (the indices correspond to those in listProtocols.m)
runForIndex = 50:51;

% Define the reference type
refType = 1:3; % 1 - bipolar, 2 - avg ref, 3 - csd

% Check the OS and set paths accordingly
if isunix
    folderSourceString = '/media/store/';
elseif ispc
    folderSourceString = 'J:\';
end

% define grid
gridType = 'EEG';

% Load the protocol specifics
[~,monkeyNames,expDates,protocolNames] = listProtocols;

% Main loop to generate the reference data
for i = 1:length(runForIndex)
    for refN = 1:length(refType)
        disp(['Index: ' num2str(runForIndex(i)) ' RefType: ' num2str(refType(refN))]);
        genRefData(monkeyNames{runForIndex(i)},expDates{runForIndex(i)},protocolNames{runForIndex(i)},folderSourceString,gridType,refType(refN));
    end
end
    
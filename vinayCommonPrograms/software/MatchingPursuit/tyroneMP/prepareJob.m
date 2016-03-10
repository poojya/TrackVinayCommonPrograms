%==========================================================================
% Vinay Shirhatti, 31 January 2014
% Prepare data for job submission on Tyrone cluster, SERC
% 13 October 2015
% modified from the old prepareJob.m
%==========================================================================

clear;clc;close all;

monkeyName = 'testMonk';
expDate = '310114';
protocolName = 'ANS_001';
channelNumbers = 1:10;
folderSourceString = '/media/Data/';
gridType = 'Microelectrode';

prepareDataForTyrone(monkeyName,expDate,protocolName,channelNumbers,folderSourceString,gridType);
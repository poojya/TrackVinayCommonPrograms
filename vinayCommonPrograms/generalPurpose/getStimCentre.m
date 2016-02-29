% get the stimulus location (azimuth,elevation)
% This function is the same as the one in display programs
% Vinay Shirhatti, 29 February 2016
%**************************************************************************


function [aziStim,eleStim] = getStimCentre(folderName,protocolName)

folderExtract = fullfile(folderName,'extractedData');

[~,aValsUnique,eValsUnique] = loadParameterCombinations(folderExtract);

if strncmpi(protocolName,'GRF',3)
    aziStim = aValsUnique;
    eleStim = eValsUnique;
else
    aziStim = aValsUnique{3}(1);
    eleStim = eValsUnique{3}(1);
end

end
% Make a list of all stimulus conditions
% Vinay Shirhatti, 10 Dec 2015
% *************************************************************************

runForIndex = []; % run for all indices if empty

usePipes = 1;

subjectName = 'alpa';
gridType = 'Microelectrode';

[expDates,protocolNames,stimType] = eval(['allProtocols' upper(subjectName(1)) subjectName(2:end) gridType]);

labUbuntu = 1;
if ispc
    folderSourceString = 'K:\'; % Vinay - changed source directory
else
    if labUbuntu
        folderSourceString = '/media/vinay/SRLHD02M/';
    else
        folderSourceString = '/media/store/';
    end
end

if isempty(runForIndex)
    runForIndex = 1:length(protocolNames);
end

% ignoreProtocolsList = [1:10];
% 
% runForIndex = diff(runForIndex,ignoreProtocolsList);
writeFile = 'protocolsConditionsDetails.txt';
fid = fopen(writeFile,'wt');

for i=1:length(runForIndex)
    clear azimuthString elevationString sigmaString spatialFreqString orientationString contrastString temporalFreqString spatialPhaseString radiusString
    j = runForIndex(i);
    disp(['working on index: ' num2str(j)]);
    expDate = expDates{j};
    protocolName = protocolNames{j};
    
    folderName = fullfile(folderSourceString,'data',subjectName,gridType,expDate,protocolName);
    folderExtract = fullfile(folderName,'extractedData');
    parameterCombinationsFile = fullfile(folderExtract,'parameterCombinations.mat');
    
    if exist(parameterCombinationsFile,'file')
        [~,aValsUnique,eValsUnique,sValsUnique,fValsUnique,oValsUnique,cValsUnique,tValsUnique,rValsUnique,pValsUnique] = loadParameterCombinations(folderExtract);

        if isempty(rValsUnique)
            rValsUnique = sValsUnique.*3;
        end

        if isempty(pValsUnique)
            pValsUnique = 0;
        end

        if strncmp(protocolName,'GRF',3)
            azimuthString = getStringFromValues(aValsUnique,1);
            elevationString = getStringFromValues(eValsUnique,1);
            sigmaString = getStringFromValues(sValsUnique,1);
            spatialFreqString = getStringFromValues(fValsUnique,1);
            orientationString = getStringFromValues(oValsUnique,1);
            contrastString = getStringFromValues(cValsUnique,1);
            temporalFreqString = getStringFromValues(tValsUnique,1);
            spatialPhaseString = getStringFromValues(pValsUnique,1);
            radiusString = getStringFromValues(rValsUnique,1);
        elseif strncmp(protocolName,'CRS',3)
            for gaborNum=1:3
                azimuthString{gaborNum} = getStringFromValues(aValsUnique,1, gaborNum);
                elevationString{gaborNum} = getStringFromValues(eValsUnique,1, gaborNum);
                sigmaString{gaborNum} = getStringFromValues(sValsUnique,1, gaborNum);
                spatialFreqString{gaborNum} = getStringFromValues(fValsUnique,1, gaborNum);
                orientationString{gaborNum} = getStringFromValues(oValsUnique,1, gaborNum);
                contrastString{gaborNum} = getStringFromValues(cValsUnique,1, gaborNum);
                temporalFreqString{gaborNum} = getStringFromValues(tValsUnique,1, gaborNum);
                spatialPhaseString{gaborNum} = getStringFromValues(pValsUnique,1, gaborNum);
                radiusString{gaborNum} = getStringFromValues(rValsUnique,1, gaborNum);
            end
        end

        fprintf(fid, '****************************************************\n');
        fprintf(fid,['index: ' num2str(j) '\n']);
        fprintf(fid,[expDate '\n']);
        fprintf(fid,[protocolName '\n']);
        if strncmp(protocolName,'GRF',3)
            if usePipes
                fprintf(fid,['azi[' num2str(length(aValsUnique)) '] : '  azimuthString '\n']);
                fprintf(fid,['ele[' num2str(length(eValsUnique)) '] : '  elevationString '\n']);
                fprintf(fid,['sig[' num2str(length(sValsUnique)) '] : '  sigmaString '\n']);
                fprintf(fid,['sf[' num2str(length(fValsUnique)) '] : '  spatialFreqString '\n']);
                fprintf(fid,['ori[' num2str(length(oValsUnique)) '] : '  orientationString '\n']);
                fprintf(fid,['con[' num2str(length(cValsUnique)) '] : '  contrastString '\n']);
                fprintf(fid,['tf[' num2str(length(tValsUnique)) '] : '  temporalFreqString '\n']);
                fprintf(fid,['sp[' num2str(length(pValsUnique)) '] : '  spatialPhaseString '\n']);
                fprintf(fid,['rad[' num2str(length(rValsUnique)) '] : '  radiusString '\n']);
            else
                fprintf(fid,['azi[' num2str(length(aValsUnique)) '] : '  num2str(aValsUnique) '\n']);
                fprintf(fid,['ele[' num2str(length(eValsUnique)) '] : '  num2str(eValsUnique) '\n']);
                fprintf(fid,['sig[' num2str(length(sValsUnique)) '] : '  num2str(sValsUnique) '\n']);
                fprintf(fid,['sf[' num2str(length(fValsUnique)) '] : '  num2str(fValsUnique) '\n']);
                fprintf(fid,['ori[' num2str(length(oValsUnique)) '] : '  num2str(oValsUnique) '\n']);
                fprintf(fid,['con[' num2str(length(cValsUnique)) '] : '  num2str(cValsUnique) '\n']);
                fprintf(fid,['tf[' num2str(length(tValsUnique)) '] : '  num2str(tValsUnique) '\n']);
                fprintf(fid,['sp[' num2str(length(pValsUnique)) '] : '  num2str(pValsUnique) '\n']);
                fprintf(fid,['rad[' num2str(length(rValsUnique)) '] : '  num2str(rValsUnique) '\n']);
            end
        elseif strncmp(protocolName,'CRS',3)
            for gaborNum=1:3
                switch gaborNum
                    case 1
                        fprintf(fid,'\n Surround: \n');
                    case 2
                        fprintf(fid,'\n Ring: \n');
                    case 3
                        fprintf(fid,'\n Centre: \n');
                end
                if usePipes
                    fprintf(fid,['azi[' num2str(length(aValsUnique{gaborNum})) '] : '  azimuthString{gaborNum} '\n']);
                    fprintf(fid,['ele[' num2str(length(eValsUnique{gaborNum})) '] : '  elevationString{gaborNum} '\n']);
                    fprintf(fid,['sig[' num2str(length(sValsUnique{gaborNum})) '] : '  sigmaString{gaborNum} '\n']);
                    fprintf(fid,['sf[' num2str(length(fValsUnique{gaborNum})) '] : '  spatialFreqString{gaborNum} '\n']);
                    fprintf(fid,['ori[' num2str(length(oValsUnique{gaborNum})) '] : '  orientationString{gaborNum} '\n']);
                    fprintf(fid,['con[' num2str(length(cValsUnique{gaborNum})) '] : '  contrastString{gaborNum} '\n']);
                    fprintf(fid,['tf[' num2str(length(tValsUnique{gaborNum})) '] : '  temporalFreqString{gaborNum} '\n']);
                    fprintf(fid,['sp[' num2str(length(pValsUnique{gaborNum})) '] : '  spatialPhaseString{gaborNum} '\n']);
                    fprintf(fid,['rad[' num2str(length(rValsUnique{gaborNum})) '] : '  radiusString{gaborNum} '\n']);
                else
                    fprintf(fid,['azi[' num2str(length(aValsUnique{gaborNum})) '] : '  num2str(aValsUnique{gaborNum}) '\n']);
                    fprintf(fid,['ele[' num2str(length(eValsUnique{gaborNum})) '] : '  num2str(eValsUnique{gaborNum}) '\n']);
                    fprintf(fid,['sig[' num2str(length(sValsUnique{gaborNum})) '] : '  num2str(sValsUnique{gaborNum}) '\n']);
                    fprintf(fid,['sf[' num2str(length(fValsUnique{gaborNum})) '] : '  num2str(fValsUnique{gaborNum}) '\n']);
                    fprintf(fid,['ori[' num2str(length(oValsUnique{gaborNum})) '] : '  num2str(oValsUnique{gaborNum}) '\n']);
                    fprintf(fid,['con[' num2str(length(cValsUnique{gaborNum})) '] : '  num2str(cValsUnique{gaborNum}) '\n']);
                    fprintf(fid,['tf[' num2str(length(tValsUnique{gaborNum})) '] : '  num2str(tValsUnique{gaborNum}) '\n']);
                    fprintf(fid,['sp[' num2str(length(pValsUnique{gaborNum})) '] : '  num2str(pValsUnique{gaborNum}) '\n']);
                    fprintf(fid,['rad[' num2str(length(rValsUnique{gaborNum})) '] : '  num2str(rValsUnique{gaborNum}) '\n']);
                end
            end
        end
        fprintf(fid,'\n');
        fprintf(fid,'\n');
    end
    
end

fclose(fid);

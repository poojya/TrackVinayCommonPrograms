
function genStimuli(protocoltype)

if ~exist('protocoltype','var')
    protocoltype = 1;
end

figure;
stimgridPos = [0.05 0.3 0.9 0.4];

rFactor = 1;

if protocoltype==1 % ori
    numStim = 6;
    stimhandles = getPlotHandles(1,numStim,stimgridPos);
    titleStringStim = {'0 deg';'30 deg';'60 deg';'90 deg';'120 deg';'150 deg'};
elseif protocoltype==2 % sf
    numStim = 2;
    stimhandles = getPlotHandles(1,numStim,stimgridPos);
    titleStringStim = {'2 cyc/deg';'4 cyc/deg'};
end

% Stimulus parameters
%--------------------------------------------------------------------------

% % background gabor
% aB = [0,0];};
% eB = [0,0];
% sB = [100000,100000];
% fB = [4,4];
% oB = [135,135];
% cB = [100,0];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rB = {[0 2],[0 0]};
% 
% % ring gabor
% aR = [0,0];
% eR = [0,0];
% sR = [100000,100000];
% fR = [4,4];
% oR = [135,135];
% cR = [100,0];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rR = {[0 0],[0 0]};

% %---size protocol---
% % titleString = 'S1occ';
% % background gabor
% aB = [0,0,0,0,0,0,0];
% eB = [0,0,0,0,0,0,0];
% sB = [100000,100000,100000,100000,100000,100000,100000];
% fB = [4,4,4,4,4,4,4];
% oB = [135,135,135,135,135,135,135];
% cB = [100,100,100,100,100,100,100];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rB = {[0 0],[0 1/10],[0 2/10],[0 4/10],[0 8/10],[0 16/10],[0 32/10]};
% 
% % ring gabor
% aR = [0,0,0,0,0,0,0];
% eR = [0,0,0,0,0,0,0];
% sR = [100000,100000,100000,100000,100000,100000,100000];
% fR = [4,4,4,4,4,4,4];
% oR = [135,135,135,135,135,135,135];
% cR = [100,100,100,100,100,100,100];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rR = {[0 0],[0 0],[0 0],[0 0],[0 0],[0 0],[0 0]};

%==========================================================================

% %---SF protocol--- S1
% % background gabor
% aB = [0,0,0,0,0,0,0];
% eB = [0,0,0,0,0,0,0];
% sB = [100000,100000,100000,100000,100000,100000,100000];
% fB = [0,0.5,1,2,4,8,16];
% oB = [90,90,90,90,90,90,90];
% cB = [0,100,100,100,100,100,100];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rB = {[0 32/10],[0 32/10],[0 32/10],[0 32/10],[0 32/10],[0 32/10],[0 32/10]};
% 
% % ring gabor
% aR = [0,0,0,0,0,0,0];
% eR = [0,0,0,0,0,0,0];
% sR = [100000,100000,100000,100000,100000,100000,100000];
% fR = [0,0.5,1,2,4,8,16];
% oR = [90,90,90,90,90,90,90];
% cR = [0,0,0,0,0,0,0];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rR = {[0 0],[0 0],[0 0],[0 0],[0 0],[0 0],[0 0]};

if protocoltype==1 % ori
    %---Ori protocol--- S2 a
    % background gabor
    aB = [0,0,0,0,0,0];
    eB = [0,0,0,0,0,0];
    sB = [100000,100000,100000,100000,100000,100000];
    fB = [4,4,4,4,4,4];
    oB = [0,30,60,90,120,150];
    cB = [100,100,100,100,100,100];
    % t is irrelevant here
    % p = [0,0]; % p is not being used yet
    rB = {[0 8/10],[0 8/10],[0 8/10],[0 8/10],[0 8/10],[0 8/10]};

    % ring gabor
    aR = [0,0,0,0,0,0];
    eR = [0,0,0,0,0,0];
    sR = [100000,100000,100000,100000,100000,100000];
    fR = [4,4,4,4,4,4];
    oR = [0,0,0,0,0,0];
    cR = [0,0,0,0,0,0];
    % t is irrelevant here
    % p = [0,0]; % p is not being used yet
    rR = {[0 0],[0 0],[0 0],[0 0],[0 0],[0 0]};
    
elseif protocoltype==2 % sf

    %---SF protocol--- S2
    % background gabor
    aB = [0,0];
    eB = [0,0];
    sB = [100000,100000];
    fB = [2,4];
    oB = [0,0];
    cB = [100,100];
    % t is irrelevant here
    % p = [0,0]; % p is not being used yet
    rB = {[0 8/10],[0 8/10]};

    % ring gabor
    aR = [0,0];
    eR = [0,0];
    sR = [100000,100000];
    fR = [2,4];
    oR = [0,0];
    cR = [0,0];
    % t is irrelevant here
    % p = [0,0]; % p is not being used yet
    rR = {[0 0],[0 0]};
    
end


% %---Ori protocol--- S2 b
% % background gabor
% aB = [0,0,0,0,0,0,0];
% eB = [0,0,0,0,0,0,0];
% sB = [100000,100000,100000,100000,100000,100000,100000];
% fB = [3,3,3,3,3,3,3];
% oB = [0,0,30,60,90,120,150];
% cB = [0,100,100,100,100,100,100];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rB = {[0 32/10],[0 32/10],[0 32/10],[0 32/10],[0 32/10],[0 32/10],[0 32/10]};
% 
% % ring gabor
% aR = [0,0,0,0,0,0,0];
% eR = [0,0,0,0,0,0,0];
% sR = [100000,100000,100000,100000,100000,100000,100000];
% fR = [3,3,3,3,3,3,3];
% oR = [0,0,0,0,0,0,0];
% cR = [0,0,0,0,0,0,0];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rR = {[0 0],[0 0],[0 0],[0 0],[0 0],[0 0],[0 0]};

%==========================================================================


% %---AFP protocol--- S2 a
% % background gabor
% aB = [0,0,0,0,0];
% eB = [0,0,0,0,0];
% sB = [100000,100000,100000,100000,100000];
% fB = [4,4,4,4,4];
% oB = [90,90,90,90,90];
% cB = [0,100,100,100,100];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rB = {[0 8/10],[0 8/10],[0 8/10],[0 8/10],[0 8/10]};
% 
% % ring gabor
% aR = [0,0,0,0,0];
% eR = [0,0,0,0,0];
% sR = [100000,100000,100000,100000,100000];
% fR = [4,4,4,4,4];
% oR = [0,0,0,0,0];
% cR = [0,0,0,0,0];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rR = {[0 0],[1/10 1.5/10],[2/10 2.5/10],[4/10 4.5/10],[8/10 8/10]};


% %---AFP protocol--- S1 b
% % background gabor
% aB = [0,0,0,0,0,0];
% eB = [0,0,0,0,0,0];
% sB = [100000,100000,100000,100000,100000,100000];
% fB = [4,4,4,4,4,4];
% oB = [135,135,135,135,135,135];
% cB = [100,100,100,100,100,100];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rB = {[0 32/10],[0 32/10],[0 32/10],[0 32/10],[0 32/10],[0 32/10]};
% 
% % ring gabor
% aR = [0,0,0,0,0,0];
% eR = [0,0,0,0,0,0];
% sR = [100000,100000,100000,100000,100000,100000];
% fR = [4,4,4,4,4,4];
% oR = [135,135,135,135,135,135];
% cR = [0,0,0,0,0,0];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rR = {[1/10 1.8/10],[2/10 2.8/10],[4/10 4.8/10],[8/10 8.8/10],[16/10 16.8/10],[32/10 32/10]};


% %---AFP protocol--- Stim generation
% % background gabor
% aB = [0,0,0];
% eB = [0,0,0];
% sB = [100000,100000,100000];
% fB = [4,4,4];
% oB = [90,90,90];
% cB = [0,100,100];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rB = {[0 8/10],[0 8/10],[0 8/10]};
% 
% % ring gabor
% aR = [0,0,0];
% eR = [0,0,0];
% sR = [100000,100000,100000];
% fR = [4,4,4];
% oR = [0,0,0];
% cR = [0,0,0];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rR = {[0 0],[2/10 3/10],[4/10 5/10]};


%==========================================================================

% %---TF protocol--- S1
% % background gabor
% aB = [0,0,0,0,0,0,0];
% eB = [0,0,0,0,0,0,0];
% sB = [100000,100000,100000,100000,100000,100000,100000];
% fB = [3,3,3,3,3,3,3];
% oB = [0,0,0,0,0,0,0];
% cB = [0,100,100,100,100,100,100];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rB = {[0 32/10],[0 32/10],[0 32/10],[0 32/10],[0 32/10],[0 32/10],[0 32/10]};
% 
% % ring gabor
% aR = [0,0,0,0,0,0,0];
% eR = [0,0,0,0,0,0,0];
% sR = [100000,100000,100000,100000,100000,100000,100000];
% fR = [3,3,3,3,3,3,3];
% oR = [0,0,0,0,0,0,0];
% cR = [0,0,0,0,0,0,0];
% % t is irrelevant here
% % p = [0,0]; % p is not being used yet
% rR = {[0 0],[0 0],[0 0],[0 0],[0 0],[0 0],[0 0]};

%==========================================================================

for i = 1:numStim
    gaborBackground.azimuthDeg = aB(i);
    gaborBackground.elevationDeg = eB(i);
    gaborBackground.sigmaDeg = sB(i);
    gaborBackground.spatialFreqCPD = fB(i);
    gaborBackground.orientationDeg = oB(i);
    gaborBackground.contrastPC = cB(i);
    gaborBackground.temporalFreqHz = 0;
    gaborBackground.spatialPhaseDeg = 0;
    gaborBackground.radiusDeg = rB{i}/rFactor;

    gaborRing.azimuthDeg = 0;
    gaborRing.elevationDeg = 0;
    gaborRing.sigmaDeg = 0;
    gaborRing.spatialFreqCPD = 0;
    gaborRing.orientationDeg = 0;
    gaborRing.contrastPC = 0;
    gaborRing.temporalFreqHz = 0;
    gaborRing.spatialPhaseDeg = 0;
    gaborRing.radiusDeg = 0;

    gabP = drawStimulus(stimhandles(i),gaborBackground,gaborRing,titleStringStim{i});
end
end


function gabP = drawStimulus(h,gaborBackground,gaborRing,titleString,protocolNumber)

if ~exist('gaborRing','var')
    gaborRing.azimuthDeg = 0;
    gaborRing.elevationDeg = 0;
    gaborRing.sigmaDeg = 0;
    gaborRing.spatialFreqCPD = 0;
    gaborRing.orientationDeg = 0;
    gaborRing.contrastPC = 0;
    gaborRing.temporalFreqHz = 0;
    gaborRing.spatialPhaseDeg = 0;
    gaborRing.radiusDeg = 0;
end

if ~exist('protocolNumber','var')
    protocolNumber = 11;
end

gridLims = [-3 -0.5 -2.5 0];
% gridLims = [-6 -1.5 -4 0.5];
% gridLims = [-21.5 -1.5 -19.5 0.5];
gridLimsNormalized(1) = -(gridLims(2)-gridLims(1))/2;
gridLimsNormalized(2) = (gridLims(2)-gridLims(1))/2;
gridLimsNormalized(3) = -(gridLims(4)-gridLims(3))/2;
gridLimsNormalized(4) = (gridLims(4)-gridLims(3))/2;

aPoints=gridLimsNormalized(1):1/30:gridLimsNormalized(2);
ePoints=gridLimsNormalized(3):1/30:gridLimsNormalized(4);

aVals = aPoints;
eVals = ePoints;

if protocolNumber == 3 || protocolNumber == 4 || protocolNumber == 5 % dual protocols
    innerphase = gaborBackground.spatialPhaseDeg; % for DPP
else
    innerphase = gaborRing.spatialPhaseDeg; % for PRP
end

gaborPatch = makeGRGStimulusWithPhase(gaborRing,gaborBackground,aVals,eVals,innerphase);

% Changed to show absolute contrasts and not normalized values - 26 Jan'13 
gabP = gaborPatch./100;
shiftclim = 0; % to pull down the values lower than the lower clim value for the TF spectrum plots
gabP = gabP - shiftclim; % to pull down the values lower than the lower clim value for the TF spectrum plots
hGab = imshow(gabP,'Parent',h); %colorbar;
fontSizeTiny = 7;
title(h,titleString,'Fontsize',fontSizeTiny);
set(h,'CLim',[-shiftclim -(shiftclim-1)]); % to pull down the values lower than the lower clim value for the TF spectrum plots - adjust the clim accordingly
% colormap(h,'gray');
end
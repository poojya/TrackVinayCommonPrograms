function [plotHandle,elecSelHandle,selectedElec] = showElectrodeLocationsSelectable(gridPosition,gridType,gridLayout,subjectName)

if ~exist('gridType','var');             gridType = 'EEG';   end


if gridLayout~=1
    numRows=8;numCols=10;
else
    numRows=10;numCols=11;
end


if ~exist('plotHandle','var') || isempty(plotHandle)
    plotHandle = subplot('Position',gridPosition,'XTickLabel',[],'YTickLabel',[],'XTick',[],'YTick',[],'box','on');
end
if ~exist('holdOnState','var')
    holdOnState = 1;
end

if ~holdOnState
    cla(plotHandle);
end
axes(plotHandle);
dX = 1/numCols;
dY = 1/numRows;

lineXRow = zeros(2,numRows);lineYRow = zeros(2,numRows);
for i=1:numRows
    lineXRow(:,i) = [0 1]; lineYRow(:,i) = [i*dY i*dY];
end
lineXCol = zeros(2,numCols);lineYCol = zeros(2,numCols);
for i=1:numCols
    lineXCol(:,i) = [i*dX i*dX]; lineYCol(:,i) = [0 1];
end
line(lineXRow,lineYRow,'color','k'); hold on;
line(lineXCol,lineYCol,'color','k'); 
hold off;

[~,~,electrodeArray] = electrodePositionOnGrid(1,gridType,subjectName,gridLayout);
patchColor = 'w';
elecSelHandle = cell(numRows,numCols);
selectedElec = [];

for i = 1:numRows
    for j = 1:numCols
        
        patchX = (j-1)*dX;
        patchY = (numRows - i)*dY;
        patchLocX = [patchX patchX patchX+dX patchX+dX];
        patchLocY = [patchY patchY+dY patchY+dY patchY];
        
        elecSelHandle{i,j} = patch('XData',patchLocX,'YData',patchLocY,'FaceColor',patchColor,'ButtonDownFcn',{@selectElectrode_Callback,selectedElec,i,j,elecSelHandle{i,j}});
        
    end
end

% Write electrode numbers
for i=1:numRows
    textY = (numRows-i)*dY + dY/2;
    for j=1:numCols
        textX = (j-1)*dX + dX/2;
        if electrodeArray(i,j)>0
            text(textX,textY,num2str(electrodeArray(i,j)),'HorizontalAlignment','center');
        end
    end
end
set(plotHandle,'XTickLabel',[],'YTickLabel',[]);

function selectedElec = selectElectrode_Callback(selectedElec,row,col,elecSelHandle)
    selectedElec = electrodeArray(row,col);
    disp(['Electrode selected: ' num2str(selectedElec)]);
    set(elecSelHandle,'Color','r');
end
end


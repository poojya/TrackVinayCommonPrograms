% Return the list of electrodes with their RF centres within a specified 
% radius from a location
% Vinay Shirhatti, 15 October 2015
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function [foundElectrode,distance] = electrodesInRange(x,y,xs,ys,radius,electrodeList)

foundElectrode = [];
distance = [];

for i = 1:length(xs)
    rad = sqrt(((xs(i)-x)^2) + ((ys(i)-y)^2));
    if rad <= radius
        distance = cat(1,distance,rad);
        foundElectrode = cat(1,foundElectrode,electrodeList(i));
    end
end

end
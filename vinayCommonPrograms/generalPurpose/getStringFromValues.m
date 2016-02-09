% get values in a string from valsUnique
% This function is similar to the ones in display programs
% Vinay Shirhatti, 01 February 2016
%**************************************************************************

function outString = getStringFromValues(valsUnique,decimationFactor, gaborNum)

if ~exist('gaborNum','var') % GRF
   if length(valsUnique)==1
        outString = convertNumToStr(valsUnique(1),decimationFactor);
    else
        outString='';
        for i=1:length(valsUnique)
            outString = cat(2,outString,[convertNumToStr(valsUnique(i),decimationFactor) '|']);
        end
        outString = [outString 'all'];
    end
 
else % CRS
    if length(valsUnique{gaborNum})==1
        outString = convertNumToStr(valsUnique{gaborNum}(1),decimationFactor);
    else
        outString='';
        for i=1:length(valsUnique{gaborNum})
            outString = cat(2,outString,[convertNumToStr(valsUnique{gaborNum}(i),decimationFactor) '|']);
        end
        outString = [outString 'all'];
    end
end

    function str = convertNumToStr(num,f)
        if num > 16384
            num=num-32768;
        end
        str = num2str(num/f);
    end
end
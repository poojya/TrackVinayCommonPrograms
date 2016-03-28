% Run MP decomposition on a ready local.ctl file
% Vinay Shirhatti, 03 Sep 2014
%==========================================================================

function runMPDecomp(filename)

if ispc
    executable = ['"' fullfile(platformSpecificNameMPP(removeIfPresentMPP(fileparts(mfilename('fullpath')),'matlab')),'source','gabord.exe') '"'];
else
    executable = fullfile(platformSpecificNameMPP(removeIfPresentMPP(fileparts(mfilename('fullpath')),'matlab')),'source','gabord');
end

sourcefolder = '~/Documents/MP/source/'; % Vinay
if ispc
    commandline = [executable ' ' filename];
else
    commandline = [sourcefolder 'gabord ' filename];
end
unix(commandline)

end
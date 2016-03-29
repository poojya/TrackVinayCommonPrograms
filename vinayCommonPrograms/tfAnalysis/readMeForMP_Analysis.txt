
Matching Pursuit - running it in windows :

Pre requistes 
1. Visual Studio C++ 2010
2. Matching Pursuit folder cloned/forked from any working online git repository. 


Changes made to MP repository 
1. Gabor info is generated for each electrode for a selected set of trials ( by tmp directories ) in the previous version. Here the code is split into
two parts. 

		---runMPDataGen.m generates the gabor info files for each electrode for all the trials. This is done so that if we have to change the trials
for some condition , we dont have to re run the entire code. 

 		---all the intermediate files ( eg: local ctl files,sig.hdr files ) are deleted and only the gaborInfo.mat is stored for each electrode

2.  The MP spectrum can be generated in any program/script for the specified condition using the  genMPSpectrum code. This makes use of the previously generated gaborInfo files for each electrode. 


Required folders/functions :  

Existing functions : ( contained in Supratim Ray MP online repository )
	1. source (containing the gabord executable file) and windows folder 
        2. platformSpecificNameMPP,appendIfNotPresentMPP,removeIfPresentMPP

Modified Functions : ( changed by Vinay )- can be pulled from  Vinay-vinayCommonPrograms reposiotry/ poojya-TrackVinayCommonPrograms repository
        1. runGabor
        2. prepareDataforHost
        3. prepareJobforTyrone
        4. prepareJobHost
        5. writeScriptFileTyrone
        6. prepareDataforTyrone
        7. prepareMPforOrchestra

Newly added functions :
        1. runMPDataGen
        2. genMPSpectrum
        3. runMPDecomp

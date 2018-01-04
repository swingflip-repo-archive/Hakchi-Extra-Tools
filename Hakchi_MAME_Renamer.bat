@echo off
title Hakchi2 MAME Renamer v0.1
color 0B
rem Hakchi2 MAME Renamer - Ryan Hamlin. Some shit but functional module
rem FART - Find And Replace Text command line utility by Lionello Lunesu
rem JREN - JREN.BAT version 2.7 by Dave Benham
echo     _   ___       __                 __         __  ____       _ 
echo    / ^| / (_)___  / /____  ____  ____/ /___     /  ^|/  (_)___  (_)
echo   /  ^|/ / / __ \/ __/ _ \/ __ \/ __  / __ \   / /^|_/ / / __ \/ / 
echo  / /^|  / / / / / /_/  __/ / / / /_/ / /_/ /  / /  / / / / / / /  
echo /_/ ^|_/_/_/ /_/\__/\___/_/ /_/\__,_/\____/  /_/  /_/_/_/ /_/_/  
echo     __  _____    __ __________  _________      __  ______    __  _________   ____  _______   _____    __  _________
echo    / / / /   ^|  / //_/ ____/ / / /  _/__ \    /  ^|/  /   ^|  /  ^|/  / ____/  / __ \/ ____/ ^| / /   ^|  /  ^|/  / ____/
echo   / /_/ / /^| ^| / ,^< / /   / /_/ // / __/ /   / /^|_/ / /^| ^| / /^|_/ / __/    / /_/ / __/ /  ^|/ / /^| ^| / /^|_/ / __/   
echo  / __  / ___ ^|/ /^| / /___/ __  // / / __/   / /  / / ___ ^|/ /  / / /___   / _, _/ /___/ /^|  / ___ ^|/ /  / / /___   
echo /_/ /_/_/  ^|_/_/ ^|_\____/_/ /_/___//____/  /_/  /_/_/  ^|_/_/  /_/_____/  /_/ ^|_/_____/_/ ^|_/_/  ^|_/_/  /_/_____/                                                                                                                     
echo Version 0.1 2/1/2018 Created by Swingflip
echo:
echo This is a basic tool which will rename the zip names for Mame roms into acutal names for the games in Hakchi.
echo:
rem Initialise some arrays and variables we need for cleaning
echo Initialising local variables and arrays...
echo:

setlocal 

set ext=.desktop
set run_type=fast

echo Initialised local variables and arrays - [OK]

echo:
echo ------------------------------------------------------------------------------------------------------
echo This script will run recursively in the directory: %cd%
echo MAKE SURE THIS IS THE CORRECT DIRECTORY! IT SHOULD BE SOMETHING LIKE: "G:\backup\hackchi2\games_snes"
echo ------------------------------------------------------------------------------------------------------ 
echo                                         ^*^*^*^*^* WARNING! ^*^*^*^*^*^*
echo ------------------------------------------------------------------------------------------------------
echo         This script will take a while to run as it processes up to 30,000^+ rom titles^!^!^!^!
echo       Grab a beer or three and let it run. It's a lot easier than manually processing the titles!
echo ------------------------------------------------------------------------------------------------------ 
echo:

pause

for /f "tokens=1,2 delims=," %%G in (mame_list.array) do (
	
	echo ----Processing: %%G
	FNR --cl --dir "%cd%" --fileMask "*%ext%" --excludeFileMask "*.dll, *.exe" --includeSubDirectories --skipBinaryFileDetection --find "Name=%%G" --replace "Name=%%H"
	FNR --cl --dir "%cd%" --fileMask "*%ext%" --excludeFileMask "*.dll, *.exe" --includeSubDirectories --skipBinaryFileDetection --find "SortRawTitle=%%G" --replace "SortRawTitle=%%H"
)

echo MAME game name rename ran successfully! Hopefully the majority of your MAME roms will be renamed within hakchi.

pause
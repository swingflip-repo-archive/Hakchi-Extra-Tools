@echo off
title Hakchi2 Rom Cleaner v0.1
color 0A
rem Hakchi2 Rom Cleaner - Ryan Hamlin. Some shit but functional module
rem FART - Find And Replace Text command line utility by Lionello Lunesu
rem JREN - JREN.BAT version 2.7 by Dave Benham
echo     _   ___       __                 __         __  ____       _ 
echo    / ^| / (_)___  / /____  ____  ____/ /___     /  ^|/  (_)___  (_)
echo   /  ^|/ / / __ \/ __/ _ \/ __ \/ __  / __ \   / /^|_/ / / __ \/ / 
echo  / /^|  / / / / / /_/  __/ / / / /_/ / /_/ /  / /  / / / / / / /  
echo /_/ ^|_/_/_/ /_/\__/\___/_/ /_/\__,_/\____/  /_/  /_/_/_/ /_/_/  
echo     __  __      __        __    _ ___      ____                     ________                          
echo    / / / /___ _/ /_______/ /_  (_)__ \    / __ \____  ____ ___     / ____/ /__  ____ _____  ___  _____
echo   / /_/ / __ `/ //_/ ___/ __ \/ /__/ /   / /_/ / __ \/ __ `__ \   / /   / / _ \/ __ `/ __ \/ _ \/ ___/
echo  / __  / /_/ / ,^< / /__/ / / / // __/   / _, _/ /_/ / / / / / /  / /___/ /  __/ /_/ / / / /  __/ /    
echo /_/ /_/\__,_/_/^|_^|\___/_/ /_/_//____/  /_/ ^|_^|\____/_/ /_/ /_/   \____/_/\___/\__,_/_/ /_/\___/_/  
echo Version 0.1 2/1/2018 Created by Swingflip  
echo:
echo This is a very basic tool which will strip any tags and illegal characters from ROM files and from .desktop files,
echo This script is intended to be included into the sync routine when used in an Hakchi2 USB-HOST environment.
echo "Eventually" I will make it so it replaces MAME zip names with true names too within the desktop files.
echo:
rem Initialise some arrays and variables we need for cleaning
echo Initialising local variables and arrays...
echo:

setlocal 

set "tag_array=[a] [p] [b] [t] [f] [T-] [T^+] [h] ^(-^) [o] [!] ^(M#^) ^(###^) ^(^?^?k^) ZZZ_ ^(Unl^) [C] [S] [BF] ^(BS^) ^(ST^) ^(NP^) ^(1^) ^(4^) ^(5^) ^(8^) ^(B^) [c] [x] [R-] [PC10] [VS] ^(1^) ^(4^) ^(A^) ^(J^) ^(B^) ^(K^) ^(C^) ^(NL^) ^(E^) ^(PD^) ^(F^) ^(S^) ^(F^) ^(FC^) ^(SW^) ^(FN^) ^(U^) ^(G^) ^(UK^) ^(GR^) ^(Unk^) ^(HK^) ^(I^) ^(H^) ^(JUE^) ^(UEJ^) ^(REV_00^) ^(V1.1^) ^(UE^) [S] [C] [b1] ^(31438^) ! [a1] [c] ^(PRG0^) ^(PRG1^) [p] ^(J^) ^(JU^) ^(Sep_1993^) [T-Eng] [T_Eng1.00_Demiforce] ^(M5^) [h1]" 

set "escaped_tag_array=\[a\] \[p\] \[b\] \[t\] \[f\] \[T-\] \[T+\] \[h\] \^(-\^) \[o\] \[!\] \^(M#\^) \^(###\^) \^(??k\^) ZZZ_ \^(Unl\^) \[C\] \[S\] \[BF\] \^(BS\^) \^(ST\^) \^(NP\^) \^(1\^) \^(4\^) \^(5\^) \^(8\^) \^(B\^) \[c\] \[x\] \[R-\] \[PC10\] \[VS\] \^(1\^) \^(4\^) \^(A\^) \^(J\^) \^(B\^) \^(K\^) \^(C\^) \^(NL\^) \^(E\^) \^(PD\^) \^(F\^) \^(S\^) \^(F\^) \^(FC\^) \^(SW\^) \^(FN\^) \^(U\^) \^(G\^) \^(UK\^) \^(GR\^) \^(Unk\^) \^(HK\^) \^(I\^) \^(H\^) \^(JUE\^) \^(UEJ\^) \^(REV_00\^) \^(V1.1\^) \^(UE\^) \[S\] \[C\] \[b1\] \^(31438\^) ! \[a1\] \[c\] \^(PRG0\^) \^(PRG1\^) \[p\] \^(J\^) \^(JU\^) \^(Sep_1993\^) \[T-Eng\] \[T_Eng1.00_Demiforce\] \^(M5\^) \[h1\]"

set ext=.desktop
set run_type=fast

echo Initialised local variables and arrays - [OK]
echo:

echo ------------------------------------------------------------------------------------------------------
echo This script will run recursively in the directory: %cd%
echo MAKE SURE THIS IS THE CORRECT DIRECTORY! IT SHOULD BE SOMETHING LIKE: "G:/backup/hackchi2/games_snes/"
echo ------------------------------------------------------------------------------------------------------ 

echo:
echo Please enter an extension (i.e. .bin) or leave blank to run the full spectrum.
echo (Full scan is slow as it covers LOTS of different ROM extensions!)
set /P _inputname=Please enter a extension (or leave blank):

if [%_inputname%]==[] set run_type=slow

echo %_inputname%
echo %run_type%

if "%run_type%"=="slow" (
	echo Running full spectrum mode 
	set "ext_array=.adf .adz .dms .exe .rp9 .cpc .a26 .gz .a52 .atr .bas .car .dcm .xex .xfd .atr .gz .xfd .gz .a78 .j64 .jag .lnx .ctr .img .ipf .raw .st .stx .asc .bas .cas .ccc .dmk  .jvc .os9 .sna .vdk .wav .col .crt .d64 .g64 .t64 .tap .x64 .asc .bas .cas .ccc .dmk  .jvc .os9 .sna .vdk .wav .cdi .gdi .fds .gen .md .sg .smd .gg .sms .gb .gbc .gba .int .img .sms .col  .mx1 .mx2 .ngp .ngc .n64 .v64 .z64 .nds .fds .fig .mgd .nes .sfc .smc .swc  .tap .bat .com .sh .88d .cmt .d88 .t88 .ccd .chd .cue .pce .cbn .cue .img .m3u .mdf .pbp .toc .z .znx .cso .pbp .32x .md .smd .chd .cue .cue .mdf .dim .fig .mgd .sfc .smc .ctg  .gam .vec .vb .ws .wsc .dat .z1 .z2 .z3 .z4 .z5 .z6 .z7 .z8  .gz .img .mgt .scl .sna .szx .tap .trd .tzx .udi .z80 .zip .7z .bin .iso .dsk"
)
if "%run_type%"=="fast" (
	echo Running against all .desktop files and only files with the %_inputname% extension
	set "ext_array=%_inputname%"
)

echo:
echo Running find and replace for common rom tags...
echo:

echo "%cd%*%ext%"
(for %%i in (%tag_array%) do (
	echo ---------- Clearing character: %%i 
	rem Replace tags with underscores. Underscores are ignored in the GUI
	FART -c -i -r "%cd%\*%ext%" %%i _
))

echo:
echo Finished find and replace for common rom tags - [OK]
echo:

echo:
echo Running file rename for common rom tags...
echo:

(for %%a in (%escaped_tag_array%) do (
	(for %%b in (%ext_array%) do (
		echo ---------- Clearing character: %%a from file extension matching: %%b
		rem We use this hybrid Jscript to rename the files recursively, easily. Otherwise we can dick about with it for ages.
		call jren "%%a" "" /i /s /fm "*%%b"
		rem call jren "%%a" "" /i /s /fm "*%%b"
	))
))

echo:
echo Finished running file rename for common rom tags - [OK]
echo:

echo:
echo Running failsafe clearence....
echo:

	FART -c -i -r "%cd%\*%ext%" ( _
	FART -c -i -r "%cd%\*%ext%" ) _
	FART -c -i -r "%cd%\*%ext%" ' _
	
	(for %%b in (%ext_array%) do (
		echo ---------- Clearing character: ^( from file extension matching: %%b
		call jren "\(" "_" /i /s /fm "*%%b"
	))
	
	(for %%b in (%ext_array%) do (
		echo ---------- Clearing character: ^) from file extension matching: %%b
		call jren "\)" "_" /i /s /fm "*%%b"
	))
	
	(for %%b in (%ext_array%) do (
		rem going to get rid of a lot of apostrophes from 'cluster' but fuck it, better to be safe
		echo ---------- Clearing character: ^' from file extension matching: %%b
		call jren "\'" "_" /i /s /fm "*%%b"
	))
	
	
	(for %%b in (%ext_array%) do (
		echo ---------- Replacing blank spaces with underscores for files matching extension: %%b
		call jren " " "_" /i /s /fm "*%%b"
	))
	
echo:
echo Finished running failsafe clearence - [OK]
echo:

echo:
echo Hakchi Rom Cleaner ran successfully! Make sure to double check your roms before syncing in case one or two slipped through!
echo:

pause
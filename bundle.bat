@echo off
REM Bundle releasable files into a folder for web download 

setlocal
set DIR=%~dp0
set TOOLSDIR=%DIR%\tools

REM Get version number from one place.
for /f "delims=" %%v in ('type version.txt') do set VERSION=%%v

REM Create a distribution directory
cd OntologyFiles
set ZIPDIR=..\gist%VERSION%_webDownload
mkdir %ZIPDIR%

REM Standardize the owl files' format
for %%f in (*.owl) do call %TOOLSDIR%\serialize %%f 

REM Add version number to distribution's .OWL file names
for %%f in (*.owl) do copy %%f %ZIPDIR%\%%~nf%VERSION%%%~xf

REM Inject version number into OWL file IRIs
for %%f in (%ZIPDIR%\*.owl) do call %TOOLSDIR%\versionize %VERSION% %%f 

REM Inject version number into catalog file
copy bundle-catalog-v001.xml %ZIPDIR%\catalog-v001.xml
call %TOOLSDIR%\versionize %VERSION% %ZIPDIR%\catalog-v001.xml

REM Include the license file & Release notes in the download
copy ..\LICENSE.txt %ZIPDIR%
copy ReleaseNotes.txt %ZIPDIR%

REM Create a deprecated items directory for the distribution
set DEPDIR=%ZIPDIR%\Deprecated
mkdir %DEPDIR%

REM Move select items into deprecation directory
move %ZIPDIR%\gistDeprecated*.owl %DEPDIR%

pause

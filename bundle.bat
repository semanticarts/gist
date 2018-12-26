@echo off
REM Bundle releasable files into a folder for web download 

setlocal
set DIR=%~dp0
set TOOLSDIR=%DIR%\tools

REM Get verison number from one place.
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
copy catalog-v001.xml %ZIPDIR%
call %TOOLSDIR%\versionize %VERSION% %ZIPDIR%\catalog-v001.xml

REM Include the license file in the download
copy ..\LICENSE.txt %ZIPDIR%

REM Create a documentation directory for the distribution
set DOCDIR=%ZIPDIR%\Documentation
mkdir %DOCDIR%

REM Copy items into documentation directory
copy ReleaseNotes.txt %DOCDIR%
copy gist.vsdx %DOCDIR%\gist%VERSION%.vsdx

REM Create a deprecated items directory for the distribution
set DEPDIR=%DOCDIR%\Deprecated
mkdir %DEPDIR%

REM Copy items into deprecation directory
move %ZIPDIR%\gistDeprecated*.owl %DEPDIR%

pause
REM Bundle releasable files into a folder for web download 

setlocal
set VERSION=8.0.0

cd OntologyFiles
set ZIPDIR=..\gist%VERSION%_webDownload
mkdir %ZIPDIR%
for %%f in (*.owl) do copy %%f %ZIPDIR%\%%~nf%VERSION%%%~xf

copy ..\LICENSE.txt %ZIPDIR%

set DOCDIR=%ZIPDIR%\Documentation
mkdir %DOCDIR%
copy ReleaseNotes_gist%VERSION%.txt %DOCDIR%
copy gist.vsdx %DOCDIR%\gist%VERSION%.vsdx

set DEPDIR=%DOCDIR%\Deprecated
mkdir %DEPDIR%
move %ZIPDIR%\gistDeprecated*.owl %DEPDIR%



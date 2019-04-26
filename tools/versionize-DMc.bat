@echo off

REM serialize an owl file
REM serializes all your owl files, assuming you are in /tools and your files in /OntologyFiles
setlocal

set DIR=%~dp0

cd ..
cd OntologyFiles
REM 
set VERSION="9.0.0"
echo "hi"
echo %cd%
echo "2"
for %%f in (*.owl) do (
		echo %%f

		set TMPFILE=%FILE%.bak
		copy %FILE% %TMPFILE%

		echo versionizing %FILE% to version %VERSION%

		%DIR%\sed.exe "s/X.x.x/%VERSION%/g" %TMPFILE% > %FILE% && del %TMPFILE%
)
goto :eof

:usage
echo. 1>&2
echo Versionize tool 1>&2
echo. 1>&2
echo   usage: %~n0 versionNumber somefile.owl 1>&2
echo   e.g.:  %~n0 9.0.0 gistAddress.owl 1>&2
echo. 1>&2

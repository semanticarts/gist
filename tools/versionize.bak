@echo off

REM serialize an owl file
setlocal

set DIR=%~dp0

if "%2" == "" goto :usage

set FILE=%2
set VERSION=%1
set TMPFILE=%FILE%.bak
copy %FILE% %TMPFILE%

echo versionizing %FILE% to version %VERSION%

%DIR%\sed.exe "s/X.x.x/%VERSION%/g" %TMPFILE% > %FILE% && del %TMPFILE%

goto :eof

:usage
echo. 1>&2
echo Versionize tool 1>&2
echo. 1>&2
echo   usage: %~n0 versionNumber somefile.owl 1>&2
echo   e.g.:  %~n0 9.0.0 gistAddress.owl 1>&2
echo. 1>&2

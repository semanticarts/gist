@echo off

REM serialize an owl file
setlocal

set DIR=%~dp0

if "%1" == "" goto :usage

set FILE=%1
set TMPFILE=%1.bak
copy %FILE% %TMPFILE%
echo serializing %FILE%

java -jar %DIR%/rdf-toolkit.jar -tfmt rdf-xml -sdt explicit -dtd -ibn -s %TMPFILE% -t %FILE% && del %TMPFILE%

goto :eof

:usage
echo. 1>&2
echo Serialize tool 1>&2
echo. 1>&2
echo   usage: %~n0 somefile.owl 1>&2
echo   e.g.:  %~n0 gistAddress.owl 1>&2
echo. 1>&2

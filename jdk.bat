@echo off
call :title
call :setThePath
SET scriptDrive=%~d0
if not %scriptDrive% == "M:" goto NoLoad

:START 
SET /P command="%cd%>" 
%command%
SET command=
@echo off
echo.
GOTO START 



:title
cls
echo      Java JDK 1.8 Window  (BETA)
echo       Made by Damian Hall-Beal.
echo.
goto :EOF


:setThePath
for /f "tokens=2*" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Development Kit\1.8" /v "JavaHome"') do (
  SET data=%%b
)
SET JDKPath=%data%\bin
SET PATH=%PATH%;"%JDKPath%"
goto :EOF


:NoLoad
pause
exit
goto :EOF
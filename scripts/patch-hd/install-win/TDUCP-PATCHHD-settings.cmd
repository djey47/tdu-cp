@ECHO OFF

SET START_DIR=%~dp0

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto getPrivileges )

:getPrivileges
if '%1'=='ELEV' (shift & goto gotPrivileges)

REM Invoking UAC for Privilege Escalation

setlocal DisableDelayedExpansion
set "batchPath=%~0"
setlocal EnableDelayedExpansion
ECHO Set UAC = CreateObject^("Shell.Application"^) > "%temp%\OEgetPrivileges.vbs"
ECHO UAC.ShellExecute "!batchPath!", "ELEV", "", "runas", 1 >> "%temp%\OEgetPrivileges.vbs"
"%temp%\OEgetPrivileges.vbs"
exit /B

:gotPrivileges

CD \D %START_DIR%

ECHO TDUCP PATCH HD SETTINGS
ECHO =======================
ECHO.
ECHO 0.0FF
ECHO 1.SD
ECHO 2.HD100
ECHO 3.HD300
ECHO 4.HD500
ECHO 5.HDUnlimited
ECHO 6.Nope, just get me out of here!
ECHO.

CHOICE /C 0123456 /M "Enter your choice:"
SET PATCHOPTION = %ERRORLEVEL%

IF %PATCHOPTION% EQ 6 ( GOTO :EOF )

ECHO.
ECHO .Now configuring HD PATCH, please wait...

CALL TDUCP-PATCHHD-util.cmd >TDUCP-patchhd.log 2>&1

ECHO.
ECHO .All done, installation details in TDUCP-patchhd.log file.
ECHO.

PAUSE

MORE TDUCP-patchhd.log

PAUSE

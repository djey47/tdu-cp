@ECHO OFF

SET START_DIR=%~dp0
SET TDUCP_VERSION=2.00A
SET TDUCP_SCRIPTS_LIB=tducp-scripts-all-%TDUCP_VERSION%.jar


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

CD /D %START_DIR%

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
SET PATCHOPTION=%ERRORLEVEL%

IF %PATCHOPTION% == 7 GOTO :EOF

CLS

ECHO .Now configuring HD PATCH, please wait...
ECHO.

MKDIR logs 2>NUL

java -cp ".\TDUCP-lib\%TDUCP_SCRIPTS_LIB%" fr.tduf.tducp.scripts.install.patchhd.Settings %PATCHOPTION% > logs\TDUCP-PATCHHD.log 2>&1
IF ERRORLEVEL 1 ECHO .Installation failed!

ECHO.
ECHO .Installation details in logs\TDUCP-PATCHHD.log file (will be displayed below).
ECHO.

PAUSE

MORE logs\TDUCP-PATCHHD.log

PAUSE

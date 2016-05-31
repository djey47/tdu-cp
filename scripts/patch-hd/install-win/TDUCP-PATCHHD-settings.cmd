@ECHO OFF

SET START_DIR=%~dp0
SET TDUCP_VERSION=2.00A
SET TDUCP_DIRECTORY=TDUCP-PATCHHD-installer
SET TDUCP_SCRIPTS_LIB=TDUCP-lib\tducp-scripts-all-%TDUCP_VERSION%.jar


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
ECHO By Djey.
ECHO.
ECHO 0.0FF
ECHO 1.SD
ECHO 2.HD100
ECHO 3.HD300
ECHO 4.HD500
ECHO 5.HDUnlimited
ECHO 6.Nope, just get me out of here!
ECHO 7.Same as 6, but delete PATCH HD install files before!
ECHO.

CHOICE /C 01234567 /M "Enter your choice:"
SET PATCHOPTION=%ERRORLEVEL%
IF %PATCHOPTION% == 8 GOTO clean
IF %PATCHOPTION% == 7 GOTO :EOF

CLS

ECHO .Now configuring HD PATCH, please wait...
ECHO.

MKDIR logs 2>NUL

java -cp "%TDUCP_SCRIPTS_LIB%" fr.tduf.tducp.scripts.install.patchhd.Settings %PATCHOPTION% > logs\TDUCP-PATCHHD.log 2>&1
IF ERRORLEVEL 1 ECHO .Installation failed!

ECHO.
ECHO .Installation details in logs\TDUCP-PATCHHD.log file (will be displayed below).
ECHO.

PAUSE

MORE logs\TDUCP-PATCHHD.log

PAUSE

GOTO :EOF

:clean
ECHO.
ECHO .Now cleaning up, please wait...
ECHO.
RMDIR %TDUCP_DIRECTORY% /S /Q
DEL readme-patch-hd.html
DEL TDUCP-PATCHHD-settings.cmd
REM Should be the last command line of the file!

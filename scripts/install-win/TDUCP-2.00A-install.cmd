@ECHO OFF

SET START_DIR=%~dp0
SET TDUCP_DIRECTORY=TDUCP-2.00A-installer
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

ECHO TDUCP 2.00A INSTALLER
ECHO =====================
ECHO By Djey.
ECHO.

PAUSE

CLS

ECHO.
ECHO .Now installing, please wait...
ECHO.

MKDIR logs 2>NUL

java -cp ".\TDUCP-lib\%TDUCP_SCRIPTS_LIB%" fr.tduf.tducp.scripts.install.Update > logs\TDUCP-install.log 2>&1
IF ERRORLEVEL 1 ECHO .Installation failed!

ECHO .Installation details in logs\TDUCP-install.log file (will be displayed below).
ECHO.

PAUSE

CLS

CD /D %START_DIR%

MORE logs\TDUCP-install.log

PAUSE

ECHO.
ECHO .Now cleaning up, please wait...
ECHO.
REM RMDIR %TDUCP_DIRECTORY% /S /Q
DEL TDUCP-no
DEL TDUCP-util.cmd
REM DEL TDUCP-2.00A-install.cmd
REM Should be the last command line of the file!

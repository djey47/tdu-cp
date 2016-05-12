@ECHO OFF

SET START_DIR=%~dp0
SET TDUCP_DIRECTORY=TDUCP-2.00A-installer

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
ECHO.
MORE version.md
ECHO.

PAUSE

CLS

ECHO.
ECHO .Now installing, please wait...
ECHO.

CALL TDUCP-util.cmd >TDUCP-install.log 2>&1
IF ERRORLEVEL 1 ECHO .Installation failed!

ECHO .Installation details in TDUCP-install.log file (will be displayed below).
ECHO.

PAUSE

CLS

CD /D %START_DIR%

MORE TDUCP-install.log

PAUSE

ECHO.
ECHO .Now cleaning up, please wait...
ECHO.
RMDIR %TDUCP_DIRECTORY% /S /Q
DEL TDUCP-no
DEL TDUCP-util.cmd
DEL TDUCP-2.00A-install.cmd
REM Should be the last line of the file!

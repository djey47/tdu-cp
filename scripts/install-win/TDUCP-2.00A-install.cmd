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

CD /D %START_DIR%

ECHO TDUCP 2.00A INSTALLER
ECHO =====================
ECHO.
MORE version.md
ECHO.

PAUSE

ECHO.
ECHO .Now installing, please wait...

CALL TDUCP-util.cmd >TDUCP-install.log 2>&1

ECHO.
ECHO .All done, installation details in TDUCP-install.log file (will be displayed below).
ECHO.

PAUSE

MORE TDUCP-install.log

PAUSE

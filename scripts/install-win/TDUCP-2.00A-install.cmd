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
SET DATABASE_DIR=%START_DIR%\Euro\Bnk\Database
SET JSON_DATABASE_DIR=%START_DIR%\TDUCP-2.00A-installer\database\current
SET TDUMTCLI_EXE=%START_DIR%\TDUCP-2.00A-installer\tduf\tools\tdumt-cli\tdumt-cli.exe

CD /D %START_DIR%
CD TDUCP-2.00A-installer\tduf\cli

ECHO TDUCP 2.00A INSTALLER
ECHO =====================

PAUSE

ECHO .Initializing, please wait...
CALL .\CheckJava.cmd
CALL .\SetVersion.cmd
ECHO.

REM ECHO .Patching game files, please wait...
REM CALL %TDUMTCLI_EXE%
REM ECHO.

ECHO .Patching database, please wait...
CALL .\DatabaseTool.cmd unpack-all -d "%DATABASE_DIR%" -j "%JSON_DATABASE_DIR%"
CALL .\DatabaseTool.cmd apply-patches -j "%JSON_DATABASE_DIR%" -o "%JSON_DATABASE_DIR%" -p "%START_DIR%\TDUCP-2.00A-installer\database\patches"
CALL .\DatabaseTool.cmd repack-all -j "%JSON_DATABASE_DIR%" -o "%DATABASE_DIR%"
ECHO.

ECHO .All done!
ECHO.

PAUSE

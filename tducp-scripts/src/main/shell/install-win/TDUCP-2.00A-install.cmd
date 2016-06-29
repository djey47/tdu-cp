@ECHO OFF

SET START_DIR=%~dp0
SET TDUCP_VERSION=2.00A
SET TDUCP_DIRECTORY=TDUCP-2.00A-installer
SET TDUCP_LIB_DIRECTORY=TDUCP-lib
SET TDUCP_SCRIPTS_LIB=%TDUCP_LIB_DIRECTORY%\tducp-scripts-all-%TDUCP_VERSION%.jar

REM *** Admin mode ***
CD /D %START_DIR%
CALL %TDUCP_LIB_DIRECTORY%\tduf\tools\cli\AdminRun.cmd %0
IF "%ERRORLEVEL%" == "1" (EXIT /B)
REM *** Admin mode ***

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

java -cp "%TDUCP_SCRIPTS_LIB%" fr.tduf.tducp.scripts.install.Update > logs\TDUCP-install.log 2>&1
IF ERRORLEVEL 1 ECHO .Installation failed!

ECHO.
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
REM Removal of obsolete files
DEL TDUCP-no
DEL TDUCP-util.cmd
DEL changelog.md
DEL files.md
DEL version.md
DEL readme-tducp-full.md
DEL readme-tducp-update.md
REM TODO
REM RMDIR %TDUCP_DIRECTORY% /S /Q
REM DEL TDUCP-2.00A-install.cmd
REM Should be the last command line of the file!

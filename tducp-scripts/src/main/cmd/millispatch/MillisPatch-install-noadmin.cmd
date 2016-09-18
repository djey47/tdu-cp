@ECHO OFF

SET START_DIR=%~dp0
SET TDUCP_VERSION=2.00A
SET TDUCP_DIRECTORY=MillisPatch-installer
SET TDUCP_LIB_DIRECTORY=TDUCP-lib
SET TDUCP_SCRIPTS_LIB=%TDUCP_LIB_DIRECTORY%\tducp-scripts-all-%TDUCP_VERSION%.jar
SET LOGS_FILE=logs\MillisPatch-install.log

ECHO MILLI'S PATCH INSTALLER OVER TDUCP
ECHO ==================================
ECHO By Djey.
ECHO.

PAUSE

CLS

ECHO.
ECHO .Now installing, please wait...
ECHO.

MKDIR logs 2>NUL

java -cp "%TDUCP_SCRIPTS_LIB%" fr.tduf.tducp.scripts.install.millispatch.Install > %LOGS_FILE%  2>&1
IF ERRORLEVEL 1 (
    SET MILLIS_FAIL=1
    ECHO .Installation failed!
) ELSE (
    ECHO .Installation succeeded!
)

ECHO.
ECHO .Installation details in %LOGS_FILE% file (will be displayed below).
ECHO.

PAUSE

CLS

CD /D %START_DIR%

MORE %LOGS_FILE%

PAUSE

ECHO.
ECHO .Now cleaning up, please wait...
ECHO.
IF NOT DEFINED MILLIS_FAIL (
    REM Removal of install files
    RMDIR %TDUCP_DIRECTORY% /S /Q
    DEL MillisPatch-install*.cmd
) ELSE (
    REM Should be the last command line of the file!
)

@ECHO OFF

SET START_DIR=%~dp0
SET TDUCP_VERSION=2.00A
SET TDUCP_DIRECTORY=TDUCP-PATCHHD-installer
SET TDUCP_LIB_DIRECTORY=TDUCP-lib
SET TDUCP_SCRIPTS_LIB=%TDUCP_LIB_DIRECTORY%\tducp-scripts-all-%TDUCP_VERSION%.jar

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

CLS

CD /D %START_DIR%

MORE logs\TDUCP-PATCHHD.log

PAUSE

ECHO.
ECHO .Now cleaning up, please wait...
ECHO.
REM Removal of obsolete files
DEL readme-patch-hd.md
DEL TDUCP-PATCHHD-util.cmd

GOTO :EOF

:clean
ECHO.
ECHO .Now cleaning up, please wait...
ECHO.
RMDIR %TDUCP_DIRECTORY% /S /Q
DEL readme-patch-hd.html
DEL TDUCP-PATCHHD-settings.cmd
REM Should be the last command line of the file!

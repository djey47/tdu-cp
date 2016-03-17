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
SET BANKS_DIR=%START_DIR%\Euro\Bnk
SET DATABASE_DIR=%BANKS_DIR%\Database
SET JSON_DATABASE_DIR=%START_DIR%\TDUCP-2.00A-installer\database\current
SET INSTALLER_FILES_DIR=%START_DIR%\TDUCP-2.00A-installer\files
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

REM TODO find packed paths
REM TODO use batch replace feature from TDUMT-CLI

CALL %TDUMTCLI_EXE% BANK-R %BANKS_DIR%\FrontEnd\HiRes\LOG_IN.bnk ??? %INSTALLER_FILES_DIR%\textures-high\fla_0013.2db
CALL %TDUMTCLI_EXE% BANK-R %BANKS_DIR%\FrontEnd\LowRes\LOG_IN.bnk ??? %INSTALLER_FILES_DIR%\textures-low\fla_0013.2db

CALL %TDUMTCLI_EXE% BANK-R %BANKS_DIR%\FrontEnd\AllRes\LogoTexturePage.bnk ??? %INSTALLER_FILES_DIR%\textures-high\icons_map.2db
CALL %TDUMTCLI_EXE% BANK-R %BANKS_DIR%\FrontEnd\AllRes\LogoTexturePage.bnk ??? %INSTALLER_FILES_DIR%\textures-high\logos_brands.2db

CALL %TDUMTCLI_EXE% BANK-R %BANKS_DIR%\Level\Hawai\CommonWorld.bnk ??? %INSTALLER_FILES_DIR%\Library.3DD
CALL %TDUMTCLI_EXE% BANK-R %BANKS_DIR%\Level\Hawai\CommonWorldDiv2.bnk ??? %INSTALLER_FILES_DIR%\Library.3DD


REM ECHO.

ECHO .Patching database, please wait...
CALL .\DatabaseTool.cmd unpack-all -d "%DATABASE_DIR%" -j "%JSON_DATABASE_DIR%"
CALL .\DatabaseTool.cmd apply-patches -j "%JSON_DATABASE_DIR%" -o "%JSON_DATABASE_DIR%" -p "%START_DIR%\TDUCP-2.00A-installer\database\patches"
CALL .\DatabaseTool.cmd repack-all -j "%JSON_DATABASE_DIR%" -o "%DATABASE_DIR%"
ECHO.

ECHO .All done!
ECHO.

PAUSE

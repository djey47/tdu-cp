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
SET INSTALLER_FILES_PATCHES_DIR=%INSTALLER_FILES_DIR%\patches
SET TDUF_DIR=%START_DIR%\TDUCP-2.00A-installer\tduf
SET TDUMTCLI_EXE=%TDUF_DIR%\tools\tdumt-cli\tdumt-cli.exe

ECHO TDUCP 2.00A INSTALLER
ECHO =====================

PAUSE

ECHO .Initializing, please wait...
ECHO %TDUF_DIR%
CD /D "%TDUF_DIR%\cli"
CALL .\CheckJava.cmd
CALL .\SetVersion.cmd
ECHO.

ECHO .Patching game files, please wait...
SET PACKED_PATH="D:\Eden-Prog\Games\TestDrive\Resources\4Build\PC\EURO\FrontEnd\LOG_IN\.2db\fla_0013"

ECHO *1-Menu HI*
CALL %TDUMTCLI_EXE% BANK-R "%BANKS_DIR%\FrontEnd\HiRes\LOG_IN.bnk" %PACKED_PATH% "%INSTALLER_FILES_PATCHES_DIR%\textures-high\fla_0013.2db"

ECHO *2-Menu LO*
CALL %TDUMTCLI_EXE% BANK-R "%BANKS_DIR%\FrontEnd\LowRes\LOG_IN.bnk" %PACKED_PATH% "%INSTALLER_FILES_PATCHES_DIR%\textures-low\fla_0013.2db"

ECHO *3-Brand logos*
CD /D "%INSTALLER_FILES_PATCHES_DIR%"
CALL %TDUMTCLI_EXE% BANK-RX "%BANKS_DIR%\FrontEnd\AllRes\LogoTexturePage.bnk" "%INSTALLER_FILES_PATCHES_DIR%\banksReplace_LOGO_TEX.json"
REM CD -

SET PACKED_PATH="D:\Eden-Prog\Games\TestDrive\Resources\4Build\PC\EURO\Level\Hawai\Common\Library\.3DD\Library"

ECHO *4-Patch HD Level Data HI*
CALL %TDUMTCLI_EXE% BANK-R "%BANKS_DIR%\Level\Hawai\CommonWorld.bnk" %PACKED_PATH% "%INSTALLER_FILES_PATCHES_DIR%\Library.3DD"

ECHO *5-Patch HD Level Data LO*
CALL %TDUMTCLI_EXE% BANK-R "%BANKS_DIR%\Level\Hawai\CommonWorldDiv2.bnk" %PACKED_PATH% "%INSTALLER_FILES_PATCHES_DIR%\Library.3DD"
ECHO.

REM TODO Find cleaner way to copy
ECHO .Copying new game files, please wait...
XCOPY "%INSTALLER_FILES_DIR%\Euro" "%START_DIR%\Euro" /S /-Y /I < "%START_DIR%\no"
ECHO.

CD /D %START_DIR%\TDUCP-2.00A-installer\tduf\cli

ECHO .Patching database, please wait...
CALL .\DatabaseTool.cmd unpack-all -d "%DATABASE_DIR%" -j "%JSON_DATABASE_DIR%"
CALL .\DatabaseTool.cmd apply-patches -j "%JSON_DATABASE_DIR%" -o "%JSON_DATABASE_DIR%" -p "%START_DIR%\TDUCP-2.00A-installer\database\patches"
CALL .\DatabaseTool.cmd repack-all -j "%JSON_DATABASE_DIR%" -o "%DATABASE_DIR%"
ECHO.

ECHO .Cleaning, please wait...
DEL %DATABASE_DIR%\carData.mdb
DEL %DATABASE_DIR%\VehicleSlots.xml
REM Additional cleaning here
ECHO.

ECHO .Updating AwesomeMap, please wait...
CALL .\MappingTool.cmd fix-missing -b "%BANKS_DIR%"
ECHO.

ECHO .All done!
ECHO.

PAUSE

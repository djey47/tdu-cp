@ECHO OFF

SET START_DIR=%~dp0

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto errorPrivileges )

:errorPrivileges
ECHO Please launch TDUCP-xxxx-install.cmd script.
PAUSE
EXIT 1

:gotPrivileges
SET BANKS_DIR=%START_DIR%\Euro\Bnk
SET DATABASE_DIR=%BANKS_DIR%\Database
SET JSON_DATABASE_DIR=%START_DIR%\TDUCP-2.00A-installer\database\current
SET INSTALLER_FILES_DIR=%START_DIR%\TDUCP-2.00A-installer\files
SET INSTALLER_FILES_PATCHES_DIR=%INSTALLER_FILES_DIR%\patches
SET TDUF_DIR=%START_DIR%\TDUCP-2.00A-installer\tduf
SET TDUF_CLI_DIR=%TDUF_DIR%\tools\cli
SET TDUMTCLI_EXE=%TDUF_DIR%\tools\tdumt-cli\tdumt-cli.exe

ECHO .Initializing, please wait...
ECHO TDUF location: %TDUF_DIR%
CD /D "%TDUF_CLI_DIR%"
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

SET PACKED_PATH="D:\Eden-Prog\Games\TestDrive\Resources\4Build\PC\EURO\Level\Hawai\Common\Library\.3DD\Library"

ECHO *4-Patch HD Level Data HI*
CALL %TDUMTCLI_EXE% BANK-R "%BANKS_DIR%\Level\Hawai\CommonWorld.bnk" %PACKED_PATH% "%INSTALLER_FILES_PATCHES_DIR%\Library.3DD"

ECHO *5-Patch HD Level Data LO*
CALL %TDUMTCLI_EXE% BANK-R "%BANKS_DIR%\Level\Hawai\CommonWorldDiv2.bnk" %PACKED_PATH% "%INSTALLER_FILES_PATCHES_DIR%\Library.3DD"
ECHO.

REM TODO Find cleaner way to copy
ECHO .Copying new game files, please wait...
XCOPY "%INSTALLER_FILES_DIR%\Euro" "%START_DIR%\Euro" /S /-Y /I < "%START_DIR%\TDUCP-no"
ECHO.

CD /D "%TDUF_CLI_DIR%"

ECHO .Patching database, please wait...
CALL .\DatabaseTool.cmd unpack-all -d "%DATABASE_DIR%" -j "%JSON_DATABASE_DIR%"
CALL .\DatabaseTool.cmd apply-patches -j "%JSON_DATABASE_DIR%" -o "%JSON_DATABASE_DIR%" -p "%START_DIR%\TDUCP-2.00A-installer\database\patches"
CALL .\DatabaseTool.cmd repack-all -j "%JSON_DATABASE_DIR%" -o "%DATABASE_DIR%"
ECHO.

ECHO .Cleaning, please wait...
REM Additional cleaning here
ECHO.

ECHO .Updating AwesomeMap, please wait...
CALL .\MappingTool.cmd fix-missing -b "%BANKS_DIR%"
ECHO.

CD /D %START_DIR%

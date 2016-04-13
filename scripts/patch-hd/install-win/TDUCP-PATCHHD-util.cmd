@ECHO OFF

SET START_DIR=%~dp0

:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' ( goto gotPrivileges ) else ( goto errorPrivileges )

:errorPrivileges
ECHO Please launch TDUCP-PATCHHD-settings.cmd script.
PAUSE
EXIT 1

:gotPrivileges
SET BANKS_DIR=%START_DIR%\Euro\Bnk
SET INSTALLER_FILES_DIR=%START_DIR%\TDUCP-PATCHHD-installer\files
SET TDUMTCLI_EXE=%START_DIR%\TDUCP-PATCHHD-installer\tduf\tools\tdumt-cli\tdumt-cli.exe

CALL :CASE_%MODE%
IF ERRORLEVEL 1 CALL :DEFAULT_CASE

:CASE_0
  SET MODE="OFF"
  GOTO END_CASE
:CASE_1
  SET MODE="SD"
  GOTO END_CASE
:CASE_2
  SET MODE="HD100"
  GOTO END_CASE
:CASE_3
  SET MODE="HD300"
  GOTO END_CASE
:CASE_4
  SET MODE="HD500"
  GOTO END_CASE
:CASE_5
  SET MODE="HDU"
  GOTO END_CASE
:DEFAULT_CASE
  ECHO Unknown mode "%MODE%"
  GOTO :EOF
:END_CASE

ECHO .Setting mode to %MODE%...
ECHO.

ECHO .Patching game files, please wait...
SET PACKED_PATH="D:\Eden-Prog\Games\TestDrive\Resources\4Build\PC\EURO\Level\Hawai\Common\Library\.3DD\Library"

ECHO *1-Patch HD Level Data HI*
CALL %TDUMTCLI_EXE% BANK-R "%BANKS_DIR%\Level\Hawai\CommonWorld.bnk" %PACKED_PATH% "%INSTALLER_FILES_PATCHES_DIR%\%MODE%\Library.3DD"

ECHO *2-Patch HD Level Data LO*
CALL %TDUMTCLI_EXE% BANK-R "%BANKS_DIR%\Level\Hawai\CommonWorldDiv2.bnk" %PACKED_PATH% "%INSTALLER_FILES_PATCHES_DIR%\%MODE%\Library.3DD"

ECHO *3-Patch HD FX.ini*
COPY "%INSTALLER_FILES_DIR%\%MODE%\FX.ini" "%BANKS_DIR%\FX"

ECHO.

CD /D %START_DIR%

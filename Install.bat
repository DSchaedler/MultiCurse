@echo off

: CURSE PACK INSTALL SCRIPT
: BY DEE S.
: USING MULTIMC AND CMPDL
: See compatibile modpacks in compat.txt

set config=config.txt

: ===START SCRIPT===

setlocal enableextensions
setlocal enabledelayedexpansion

: PULL INFO FROM CONFIG
: %modinfo_0% IS THE MODPACK NAME
: %modinfo_1% IS THE MINECRAFT VERSION NAME
: THIS INFO IS DEFINED IN THE FILE %config%

echo Reading modinfo file

set counter=0
for /F "delims=" %%a in (%config%) do (
	set "modinfo_!counter!=%%a"
	set /a counter+=1
)

: RENAME VARIABLES
set modpackname=%modinfo_0%
set mcversion=%modinfo_1%

echo.
echo %config% read %modpackname%, for MC version %mcversion%

: ENGAGE CMPDL

echo Attempting pack download...
echo.
java -jar cmpdl-1.2.jar https://minecraft.curseforge.com/projects/%modpackname%

: FIND MODPACK FOLDER
set shortname=!modpackname:~0,1!
echo %shortname%

dir /b /A:D > dirlist

findstr /i %shortname% dirlist > packfolder
del dirlist

: STORE FOLDER NAME
for /F "delims=" %%a in (packfolder) do (
	set foldername=%%a
	goto :endread
)
:endread
del packfolder

echo.
echo.
echo Found pack folder %foldername% from CMPDL

echo Copying template files...
xcopy zzz\Templates\%mcversion% %modpackname% /E /I /Y /Q
echo.

: REPLACE THE TEMP NAME WITH THE PACK NAME
echo Renaming profile...
call zzz\searchreplace.bat %mcversion% %modpackname% %modpackname%\ instance.cfg
echo Done.
echo.

echo Copying modpack files to new profile...
xcopy "%foldername%\minecraft" %modpackname%\.minecraft /E /I /Y /Q
echo.

echo Moving profile to MultiMC...
xcopy %modpackname% zzz\MultiMC\instances\%modpackname% /E /I /Y /Q
echo.

echo.
echo Cleaning up...

rmdir /S /Q %modpackname%
rmdir /S /Q "%foldername%"
echo Done
echo.

ECHO Creating Shortcut...
SET LinkName=MultiMC
SET Esc_LinkDest=.\MultiMC.lnk
SET Esc_LinkTarget=%~dp0\zzz\MultiMC\MultiMC.exe
SET Esc_LinkStartIn=%~dp0\zzz\MultiMC\
SET cSctVBS=CreateShortcut.vbs
SET LOG=".\%~N0_runtime.log"
((
  echo Set oWS = WScript.CreateObject^("WScript.Shell"^) 
  echo sLinkFile = oWS.ExpandEnvironmentStrings^("!Esc_LinkDest!"^)
  echo Set oLink = oWS.CreateShortcut^(sLinkFile^) 
  echo oLink.TargetPath = oWS.ExpandEnvironmentStrings^("!Esc_LinkTarget!"^)
  echo oLink.WorkingDirectory = oWS.ExpandEnvironmentStrings^("!Esc_LinkStartIn!"^)
  echo oLink.Save
)1>!cSctVBS!
cscript //nologo .\!cSctVBS!
DEL !cSctVBS! /f /q
)1>>!LOG! 2>>&1
echo Done.
del /Q Install_runtime.log

echo.
echo.
echo --- Profile installed ---
echo === YOU MUST INSTALL FORGE ===
echo.
echo Please install Forge by opening MultiMC, selecting the profile and pressing "edit Instance" on the right hand bar.
echo.
echo Go to "Version" and select "Install Forge" on the right. You may need to try several versions, the most recent is a safe bet.
echo.
echo.
echo === YOU MUST INSTALL FORGE ===
echo.
echo.

PAUSE
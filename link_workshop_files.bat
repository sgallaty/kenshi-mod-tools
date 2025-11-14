@echo on
setlocal enabledelayedexpansion

:: PARENT FOLDER
:: set "parentFolder=C:\Users\Public\Downloads\Steam\steamapps\common\Kenshi\mods"
set "parentFolder=d:\steam\steamapps\workshop\content\233860"
:: set "targetFolder=d:\steam\steamapps\common\Kenshi\mods"
:: set "targetFolder=.\"
set "targetFolder=%cd%"
cd /d "%parentFolder%"

:: Loop through all subfolders within the parent folder, check if there's a .mod file and retrieve name, then set subfolder name to retrieved name, reset modfilename for next loop
for /d %%d in (*) do (
set "folderPath=%%d"
cd "%%d"
set "modFileName="
for %%f in (*.mod) do (
set "modFileName=%%~nf"
)
if defined modFileName (
cd ..
:: ren "%%d" "!modFileName!"
:: echo Folder "%%d" renamed to "!modFileName!"
echo Linking "%targetFolder%\!modFileName!" to "%parentFolder%\%%d" 
mklink /j "%targetFolder%\!modFileName!" "%parentFolder%\%%d" 
) else (
cd ..
echo No .mod file found for mod ID "%%d"
)
)

pause

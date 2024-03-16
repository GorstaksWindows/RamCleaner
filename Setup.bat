@echo off

:: Elevate
>nul 2>&1 fsutil dirty query %systemdrive% || echo CreateObject^("Shell.Application"^).ShellExecute "%~0", "ELEVATED", "", "runas", 1 > "%temp%\uac.vbs" && "%temp%\uac.vbs" && exit /b
DEL /F /Q "%temp%\uac.vbs"

:: Active folder
pushd "%~dp0"
cd Bin

:: RAM Cleaner
md "%systemdrive%\Windows\Ram Cleaner"
copy /y EmptyStandbyList.exe "%systemdrive%\Windows\Ram Cleaner\"
copy /y Ram.bat "%systemdrive%\Windows\Ram Cleaner\"
schtasks /create /xml "Ram Cleaner.xml" /tn "Ram Cleaner" /ru ""

:: Exit
Exit

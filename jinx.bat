@echo off
set user=Hamid
title JINX - Multitool Batch Cli v1.0

:menu
echo.
type C:\Users\%USER%\Documents\code\batch-files\batch-gui\logo.txt                                                                         
echo.
echo.

echo                                           ==============================
echo                                           Type 'help' to get commands :3
echo.
echo.
echo.
echo.

set /p choice="[%user%@user]:- "

if "%choice%"=="start" goto clear
if "%choice%"=="scan files" goto scan-corrupted-files
if "%choice%"=="delete temp files" goto delete-temp-files
if "%choice%"=="battery health" goto battery-health
if "%choice%"=="encrypt" goto encrypt-files
if "%choice%"=="ipconfig" ipconfig /pause & goto clear
if "%choice%"=="ping test" goto ping-test
if "%choice%"=="lock" goto lock-pc
if "%choice%"=="sleep" goto sleep-pc
if "%choice%"=="disk cleanup" goto disk-cleanup
if "%choice%"=="system info" goto sys-info
if "%choice%"=="shutdown" goto shutdown-pc
if "%choice%"=="restart" goto restart-pc
if "%choice%"=="clear" goto clear
if "%choice%"=="exit" goto exit
if "%choice%"=="help" goto help
goto invalid

pause

:restart-pc
echo.
echo Are you sure you want to restart? (y/n)
set /p confirm= "[%user%@user]:- "
if /i "%confirm%"=="y" shutdown /r /t 10 /c "Restarting via JINX..."
if /i "%confirm%"=="n" goto clear
goto clear

:shutdown-pc
echo.
echo Are you sure you want to shut down? (y/n)
set /p confirm= "[%user%@user]:- "
if /i "%confirm%"=="y" shutdown /s /t 10 /c "Shutting down via JINX..."
if /i "%confirm%"=="n" goto clear
goto clear

:sys-info
echo.
echo ==== System Information ====
systeminfo | findstr /C:"OS Name" /C:"OS Version" /C:"System Type" /C:"Total Physical Memory" /C:"Available Physical Memory" /C:"System Up Time"
echo.
pause
goto clear

:ping-test
echo.
echo Enter website or IP to ping (e.g., google.com): 
set /p target="[%user%@user]:- "
ping -n 4 %target%
echo.
pause
goto clear

:disk-cleanup
echo.
echo Running Disk Cleanup...
cleanmgr /sagerun:1 >nul 2>&1
echo Disk Cleanup completed.
pause
goto clear

:scan-corrupted-files
echo.
echo Running System File Checker...
sfc /scannow
echo.
echo Running DISM Repair...
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo Scan complete. Check above logs for issues.
pause
goto clear

:delete-temp-files
del /q /f /s %temp%\*
goto clear

:battery-health
cd C:\Windows\System32
powercfg/energy
pause
echo Battery Health Report generated at C:\Windows\System32\energy-report.html
echo do you want to open it now? (y/n)
set /p battery="[%user%@user]:- "
if %battery%=="y" start C:\Windows\System32\energy-report.html
if %battery%=="n" goto clear
pause
goto clear

:encrypt-files
echo write the path of the file you want to encrypt
set /p filepath="[%user%@user]:- "
cipher /e "%filepath%"
echo File encrypted successfully.
pause
goto clear

:lock-pc
echo.
echo Locking your computer...
rundll32.exe user32.dll,LockWorkStation
goto clear

:sleep-pc
echo.
echo Putting PC to sleep...
rundll32.exe powrprof.dll,SetSuspendState 0,1,0
goto clear

:clear
cls
goto menu

:exit
exit

:invalid
echo.
echo Invalid option. Please try again.
echo Type 'help' to see available commands.
pause
goto clear

:help
echo.
echo ========================================
echo            JINX - AVAILABLE COMMANDS
echo ========================================
echo.
echo start               - Refresh the menu
echo scan files          - Fix corrupted system files
echo delete temp files   - Clean temp folders
echo battery health      - Generate power report
echo encrypt             - Encrypt a file with EFS
echo ipconfig            - Show network details
echo ping test           - Test connection to a site
echo disk cleanup        - Run built-in disk cleaner
echo system info         - Show OS and hardware info
echo shutdown            - Shut down computer
echo restart             - Restart computer
echo lock                - Lock your PC
echo sleep               - Put PC to sleep
echo clear               - Clear screen
echo exit                - Exit JINX
echo help                - Show this message
echo.
pause
goto clear
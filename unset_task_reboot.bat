@echo off
color 2

echo [%date% %time%] UNSET TASK REBOOT >> %~dp0data\_log.txt

schtasks /delete /tn "_reboot" /f >nul 2>&1

echo ====================
echo UNSET TASK REBOOT OK...
timeout /t 10 >nul 2>&1
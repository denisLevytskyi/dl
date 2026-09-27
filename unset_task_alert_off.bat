@echo off
color 2

echo [%date% %time%] UNSET TASK ALERT OFF >> %~dp0data\_log.txt

schtasks /delete /tn "_alert_off" /f >nul 2>&1

echo ====================
echo UNSET TASK ALERT OFF OK...
timeout /t 10 >nul 2>&1
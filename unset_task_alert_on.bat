@echo off
color 2

echo [%date% %time%] UNSET TASK ALERT ON >> %~dp0data\_log.txt

schtasks /delete /tn "_alert_on" /f >nul 2>&1

echo ====================
echo UNSET TASK ALERT ON OK...
timeout /t 10 >nul 2>&1
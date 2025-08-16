@echo off
color 2

echo [%date% %time%] UNSET TASK MINUTE >> %~dp0data\_log.txt

schtasks /delete /tn "_minute" /f >nul 2>&1

echo ====================
echo UNSET TASK MINUTE OK
timeout /t 10 >nul 2>&1
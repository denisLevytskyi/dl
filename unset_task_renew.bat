@echo off
color 2

echo [%date% %time%] UNSET TASK RENEW >> %~dp0data\_log.txt

schtasks /delete /tn "_renew" /f >nul 2>&1

echo ====================
echo UNSET TASK RENEW OK
timeout /t 10 >nul 2>&1
@echo off
color 2

echo [%date% %time%] UNSET TASK RENEW >> %~dp0data\_log.txt

schtasks /delete /tn "_renew" /f

timeout /t 10
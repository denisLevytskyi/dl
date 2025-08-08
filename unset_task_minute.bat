@echo off
color 2

echo [%date% %time%] UNSET TASK MINUTE >> %~dp0data\_log.txt

schtasks /delete /tn "_minute" /f

timeout /t 10
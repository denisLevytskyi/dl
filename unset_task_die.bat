@echo off
color 2

echo [%date% %time%] UNSET TASK DIE >> %~dp0data\_log.txt

schtasks /delete /tn "_die" /f

timeout /t 10
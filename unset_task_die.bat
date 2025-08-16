@echo off
color 2

echo [%date% %time%] UNSET TASK DIE >> %~dp0data\_log.txt

schtasks /delete /tn "_die" /f >nul 2>&1

echo ====================
echo UNSET TASK DIE OK
timeout /t 10 >nul 2>&1
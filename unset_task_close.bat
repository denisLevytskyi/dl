@echo off
color 2

echo [%date% %time%] UNSET TASK CLOSE >> %~dp0data\_log.txt

schtasks /delete /tn "_close1" /f >nul 2>&1
schtasks /delete /tn "_close2" /f >nul 2>&1
schtasks /delete /tn "_close3" /f >nul 2>&1
schtasks /delete /tn "_close4" /f >nul 2>&1
schtasks /delete /tn "_close5" /f >nul 2>&1

echo ====================
echo UNSET TASK CLOSE OK
timeout /t 10 >nul 2>&1
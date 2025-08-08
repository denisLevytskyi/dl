@echo off
color 2

echo [%date% %time%] UNSET TASK CLOSE >> %~dp0data\_log.txt

schtasks /delete /tn "_close1" /f
schtasks /delete /tn "_close2" /f
schtasks /delete /tn "_close3" /f
schtasks /delete /tn "_close4" /f
schtasks /delete /tn "_close5" /f

timeout /t 10
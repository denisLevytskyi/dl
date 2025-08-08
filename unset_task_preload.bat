@echo off
color 2

echo [%date% %time%] UNSET TASK PRELOAD >> %~dp0data\_log.txt

schtasks /delete /tn "_preload1" /f
schtasks /delete /tn "_preload2" /f

timeout /t 10
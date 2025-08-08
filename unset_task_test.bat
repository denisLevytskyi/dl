@echo off
color 2

echo [%date% %time%] UNSET TASK TEST >> %~dp0data\_log.txt

schtasks /delete /tn "_test" /f

timeout /t 10
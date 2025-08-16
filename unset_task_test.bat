@echo off
color 2

echo [%date% %time%] UNSET TASK TEST >> %~dp0data\_log.txt

schtasks /delete /tn "_test" /f >nul 2>&1

echo ====================
echo UNSET TASK TEST OK
timeout /t 10 >nul 2>&1
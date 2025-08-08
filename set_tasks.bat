@echo off
color 2

echo [%date% %time%] SET TASKS >> %~dp0data\_log.txt

schtasks /create /tn "_renew" /tr "%~dp0task_renew.bat" /sc once /st 08:01 /f

schtasks /create /tn "_preload1" /tr "%~dp0task_preload.bat" /sc once /st 08:55 /f
schtasks /create /tn "_preload2" /tr "%~dp0task_preload.bat" /sc once /st 22:30 /f

schtasks /create /tn "_minute" /tr "%~dp0task_minute.bat" /sc once /st 09:00 /f

schtasks /create /tn "_close1" /tr "%~dp0task_close.bat" /sc once /st 22:35 /f
schtasks /create /tn "_close2" /tr "%~dp0task_close.bat" /sc once /st 22:40 /f
schtasks /create /tn "_close3" /tr "%~dp0task_close.bat" /sc once /st 22:45 /f
schtasks /create /tn "_close4" /tr "%~dp0task_close.bat" /sc once /st 22:50 /f
schtasks /create /tn "_close5" /tr "%~dp0task_close.bat" /sc once /st 22:55 /f

schtasks /create /tn "_test" /tr "%~dp0task_test.bat" /sc once /st 23:08 /f
schtasks /create /tn "_die" /tr "%~dp0task_die.bat" /sc once /st 23:10 /f

timeout /t 10
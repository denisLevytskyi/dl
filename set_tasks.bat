@echo off
color 2

schtasks /create /tn "_preload1" /tr "%~dp0task_preload.bat" /sc once /st 08:55 /f
schtasks /create /tn "_preload2" /tr "%~dp0task_preload.bat" /sc once /st 17:55 /f
schtasks /create /tn "_preload3" /tr "%~dp0task_preload.bat" /sc once /st 18:25 /f
schtasks /create /tn "_preload4" /tr "%~dp0task_preload.bat" /sc once /st 18:55 /f
schtasks /create /tn "_preload5" /tr "%~dp0task_preload.bat" /sc once /st 22:30 /f

schtasks /create /tn "_minute" /tr "%~dp0task_minute.bat" /sc once /st 09:00 /f

schtasks /create /tn "_close1" /tr "%~dp0task_close.bat" /sc once /st 22:35 /f
schtasks /create /tn "_close2" /tr "%~dp0task_close.bat" /sc once /st 22:40 /f
schtasks /create /tn "_close3" /tr "%~dp0task_close.bat" /sc once /st 22:45 /f
schtasks /create /tn "_close4" /tr "%~dp0task_close.bat" /sc once /st 22:50 /f
schtasks /create /tn "_close5" /tr "%~dp0task_close.bat" /sc once /st 22:55 /f
schtasks /create /tn "_close6" /tr "%~dp0task_close.bat" /sc once /st 22:57 /f

schtasks /create /tn "_kassa1" /tr "%~dp0task_kassa.bat" /sc once /st 18:00 /f
schtasks /create /tn "_kassa2" /tr "%~dp0task_kassa.bat" /sc once /st 18:30 /f
schtasks /create /tn "_kassa3" /tr "%~dp0task_kassa.bat" /sc once /st 19:00 /f

schtasks /create /tn "_die" /tr "%~dp0task_die.bat" /sc once /st 22:58 /f

timeout /t 10
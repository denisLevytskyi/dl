@echo off
color 2

echo ====================
echo SET TASKS...
echo [%date% %time%] SET TASKS >> %~dp0data\_log.txt

schtasks /create /tn "_renew1" /tr "%~dp0task_renew.bat" /sc once /st 08:01 /f >nul 2>&1
schtasks /create /tn "_renew2" /tr "%~dp0task_renew.bat" /sc once /st 08:55 /f >nul 2>&1

schtasks /create /tn "_minute" /tr "%~dp0task_minute.bat" /sc once /st 09:00 /f >nul 2>&1

schtasks /create /tn "_close1" /tr "%~dp0task_close.bat" /sc once /st 22:35 /f >nul 2>&1
schtasks /create /tn "_close2" /tr "%~dp0task_close.bat" /sc once /st 22:40 /f >nul 2>&1
schtasks /create /tn "_close3" /tr "%~dp0task_close.bat" /sc once /st 22:45 /f >nul 2>&1
schtasks /create /tn "_close4" /tr "%~dp0task_close.bat" /sc once /st 22:50 /f >nul 2>&1
schtasks /create /tn "_close5" /tr "%~dp0task_close.bat" /sc once /st 22:55 /f >nul 2>&1
schtasks /create /tn "_close6" /tr "%~dp0task_close.bat" /sc once /st 23:00 /f >nul 2>&1

schtasks /create /tn "_alert_on" /tr "%~dp0task_alert_on.bat" /sc once /st 22:30 /f >nul 2>&1

schtasks /create /tn "_reboot" /tr "%~dp0task_reboot.bat" /sc daily /st 07:20 /f >nul 2>&1
schtasks /create /tn "_test" /tr "%~dp0task_test.bat" /sc once /st 23:50 /f >nul 2>&1
schtasks /create /tn "_die" /tr "%~dp0task_die.bat" /sc once /st 23:59 /f >nul 2>&1

call %~dp0task_alert_off.bat
call %~dp0task_make_line_free.bat

start "" /min %~dp0task_monitor.bat
start "" %~dp0task_blinker_msg.bat

echo ====================
echo SET TASKS OK...
timeout /t 10 >nul 2>&1
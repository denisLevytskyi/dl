echo [%date% %time%] ALERT ON >> %~dp0_log.txt

set /p alert_on=<%~dp0var_alert_on.txt
set alert_on_path=%~dp0var_alert_on.txt

echo 1 > %alert_on_path%
echo ====================
echo ALERT IS NOW ON...

timeout /t 10 >nul 2>&1
echo [%date% %time%] ALERT OFF >> %~dp0_log.txt

set /p alert_on=<%~dp0var_alert_on.txt
set alert_on_path=%~dp0var_alert_on.txt

echo 0 > %alert_on_path%
echo ====================
echo ALERT IS NOW OFF...

timeout /t 10 >nul 2>&1
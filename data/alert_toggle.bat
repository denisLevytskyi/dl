echo [%date% %time%] ALERT TOGGLE >> %~dp0_log.txt

set /p alert_on=<%~dp0var_alert_on.txt
set alert_on_path=%~dp0var_alert_on.txt
set tg=%~dp0tg.bat

if %alert_on%==1 (
    start "" /min %tg% ALERT_OFF
    echo 0 > %alert_on_path%
    echo ====================
    echo ALERT IS NOW OFF...
) else (
    start "" /min %tg% ALERT_ON
    echo 1 > %alert_on_path%
    echo ====================
    echo ALERT IS NOW ON...
)

timeout /t 10 >nul 2>&1
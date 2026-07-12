rem %1 - включить или отключить

set alert_on_path=%~dp0var_alert_on.txt
set tg=%~dp0tg.bat

if %1==0 (
    start "" /min %tg% ALERT_OFF
    echo [%date% %time%] ALERT OFF >> %~dp0_log.txt
    echo 0 > %alert_on_path%
    echo ====================
    echo ALERT IS NOW OFF...
) else (
    start "" /min %tg% ALERT_ON
    echo [%date% %time%] ALERT ON >> %~dp0_log.txt
    echo 1 > %alert_on_path%
    echo ====================
    echo ALERT IS NOW ON...
)

timeout /t 10 >nul 2>&1
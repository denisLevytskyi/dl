echo [%date% %time%] MONITOR START >> %~dp0_log.txt

set /p region=<%~dp0var_region.txt
set /p token=<%~dp0var_token.txt
set response_path=%~dp0var_response.txt
set status=0
set tg=%~dp0tg.bat
set wget=%~dp0WGET\WGET.exe

start "" /min %tg% MONITOR_START

:loop
set /p alert_on=<%~dp0var_alert_on.txt
if %alert_on%==1 (
    set alert_on_text=ALERT ON
) else (
    set alert_on_text=ALERT OFF
)

%wget% -q -O %response_path% https://api.alerts.in.ua/v1/iot/active_air_raid_alerts/%region%.json?token=%token%
set /p response=<%response_path%

if %response%=="A" (
    if %status%==0 (
        echo [%date% %time%] ALARM SIGNAL RECEIVED - %alert_on_text% >> %~dp0_log.txt
        set status=1
        color 4
        if %alert_on%==1 (
            start "" /min %tg% AIR_ALARM_ALERT_ON
            call %~dp0dl_rep.bat 99.mp3 1 5 1 1
            timeout /t 5 >nul 2>&1
            call %~dp0mute.bat
        ) else (
            start "" /min %tg% AIR_ALARM_ALERT_OFF
            call %~dp0mute.bat
            timeout /t 50 >nul 2>&1
            call %~dp0renew.bat 0
        )
    )
    echo [%date% %time%] - AIR ALARM - %alert_on_text%
) else (
    if %status%==1 (
        start "" /min %tg% CLEAR
        echo [%date% %time%] CLEAR SIGNAL RECEIVED - %alert_on_text% >> %~dp0_log.txt
        set status=0
        color 2
        call %~dp0renew.bat 0
    )
    echo [%date% %time%] - NO AIR ALARM - %alert_on_text%
)

echo [%date% %time%] %status% --- %region% --- %response% --- %alert_on% >> %~dp0_log_monitor.txt

timeout /t 15 >nul 2>&1
goto loop
echo [%date% %time%] MONITOR START >> %~dp0_log.txt

set /p alert_on=<%~dp0var_alert_on.txt
set /p level_stream=<%~dp0var_level_stream.txt
set /p log_on=<%~dp0var_log_on.txt
set /p region=<%~dp0var_region.txt
set /p stream=<%~dp0var_stream.txt
set /p token=<%~dp0var_token.txt
set response_path=%~dp0var_response.txt
set status=0
set svv=%~dp0SVV\SVV.exe
set wget=%~dp0WGET\WGET.exe

:loop
%wget% -q -O %response_path% https://api.alerts.in.ua/v1/iot/active_air_raid_alerts/%region%.json?token=%token%
set /p response=<%response_path%

if %response%=="A" (
    if %status%==0 (
        echo [%date% %time%] ALARM SIGNAL RECEIVED >> %~dp0_log.txt
        set status=1
        color 4
        if %alert_on%==1 (
            echo [%date% %time%] - START AIR ALARM ALERT
            call %~dp0dl_rep.bat 99.mp3 5 3 3 100
        ) else (
            echo [%date% %time%] - START AIR ALARM
            %svv% /Mute "%stream%"
            %svv% /SetVolume "%stream%" 0
            timeout /t 50 >nul 2>&1
            %svv% /Unmute "%stream%"
            %svv% /SetVolume "%stream%" %level_stream%
        )
    ) else (
        color C
        echo [%date% %time%] - AIR ALARM
    )
) else (
    set status=0
    color 2
    echo [%date% %time%] - NO AIR ALARM
)

if %log_on%==1 (
    echo [%date% %time%] %status% --- %region% --- %response% --- %alert_on% >> %~dp0_log_monitor.txt
)

timeout /t 20 >nul 2>&1
goto loop
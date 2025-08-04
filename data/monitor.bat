set wget=%~dp0WGET\WGET.exe
set response_path=%~dp0var_response.txt
set /p region=<%~dp0var_region.txt
set /p token=<%~dp0var_token.txt
set /p alert_on=<%~dp0var_alert_on.txt
set status=0

:loop
%wget% -q -O %response_path% https://api.alerts.in.ua/v1/iot/active_air_raid_alerts/%region%.json?token=%token%
set /p response=<%response_path%
if %response%=="A" (
    if %status%==0 (
        set status=1
        color 4
        if %alert_on%==1 (
            echo [%date% %time%] - START AIR ALARM ALERT
            call %~dp0dl_rep.bat 99.mp3 5 35 3 5 100
        ) else (
            echo [%date% %time%] - START AIR ALARM
            call %~dp0dl.bat 00.mp3 5 60 20
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
timeout /t 30 >nul 2>&1
goto loop
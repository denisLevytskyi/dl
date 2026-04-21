echo [%date% %time%] BLINKER MSG >> %~dp0_log.txt

set /p blinker=<%~dp0var_blinker.txt

if %blinker%==1 (
    echo [%date% %time%] = = = ! ! ! BLINKER MSG ! ! ! = = = >> %~dp0_log.txt
    color 6

    echo = = = = = = = = = = = = = = = = = = = = =
    echo = = = = = = = =  WARNING  = = = = = = = =
    echo = = = = = = =  CHECK CONFIG = = = = = = =
    echo = = = = = = = = = = = = = = = = = = = = =

    :loop
    color 4
    timeout /t 5 >nul 2>&1
    color 6
    timeout /t 5 >nul 2>&1
    goto loop
)

exit
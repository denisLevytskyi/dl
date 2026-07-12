echo [%date% %time%] BLINKER ON DL >> %~dp0_log.txt

set /p blinker=<%~dp0var_blinker.txt
set tg=%~dp0tg.bat

if %blinker%==1 (
    start "" /min %tg% BLINKER_ON_DL

    echo [%date% %time%] = = = ! ! ! WARNING ! ! ! = = = >> %~dp0_log.txt
    echo [%date% %time%] = = = ! ! ! BLINKER ! ! ! = = = >> %~dp0_log.txt
    color 4

    echo = = = = = = = = = = = = = = = = = = = = =
    echo = = = = = = = =  WARNING  = = = = = = = =
    echo = = = = = = =  CHECK CONFIG = = = = = = =
    echo = = = = = = = = = = = = = = = = = = = = =
) else (
    echo ====================
    echo BLINKER OFF...
)
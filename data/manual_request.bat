echo [%date% %time%] MANUAL REQUEST START >> %~dp0_log.txt

echo ====================
set /p file=ENTER RECORD NUMBER:
set file=%file: =%

:repition
echo ====================
set /p repition=ENTER NUMBER OF REPETITION:
echo %repition%|findstr /R "^[0-9][0-9]*$" >nul
if errorlevel=1 (
    echo ====================
    echo ERROR. ENTER ONLY NUMBERS!
    goto repition
)

:pause
echo ====================
set /p pause=ENTER PAUSE DURATION:
echo %pause%|findstr /R "^[0-9][0-9]*$" >nul
if errorlevel=1 (
    echo ====================
    echo ERROR. ENTER ONLY NUMBERS!
    goto pause
)

call %~dp0dl_rep.bat %file%.mp3 5 %repition% %pause% 5

echo [%date% %time%] MANUAL REQUEST STOP >> %~dp0_log.txt
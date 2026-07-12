echo [%date% %time%] MUTE >> %~dp0_log.txt

set /p stream=<%~dp0var_stream.txt
set svv=%~dp0SVV\SVV.exe
set tg=%~dp0tg.bat

%svv% /Mute "%stream%"
%svv% /SetVolume "%stream%" 0

start "" /min %tg% MUTE

echo ====================
echo MUTE...
timeout /t 10 >nul 2>&1
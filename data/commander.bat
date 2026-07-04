echo [%date% %time%] COMMANDER START >> %~dp0_log.txt

set commander=%~dp0COMMANDER\COMMANDER.exe
set tg=%~dp0tg.bat

start "" /min %tg% COMMANDER_START
start "" %commander%

echo ====================
echo COMMANDER START...
timeout /t 10 >nul 2>&1
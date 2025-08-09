@echo off
color 2

echo [%date% %time%] SWITCH START >> %~dp0_log.txt

set /p cursor_block=<%~dp0var_cursor_block.txt
set /p stream=<%~dp0var_stream.txt
set aimp=%~dp0AIMP\AIMP.exe
set nircmd=%~dp0NIRCMD\NIRCMD.exe
set svv=%~dp0SVV\SVV.exe
set switch_path=%~dp0var_switch.txt

if %cursor_block%==1 (
    echo ====================
    echo YOUR CURSOR IS BLOCKED...
)

:loop
set /p switch=<%~dp0var_switch.txt
if %switch%==0 (
    echo 1 > %switch_path%
    %svv% /Unmute "%stream%"
    %svv% /SetVolume "%stream%" 100
    echo [%date% %time%] SWITCH STOP >> %~dp0_log.txt
    exit
)

if %cursor_block%==1 (
    start "" %nircmd% setcursor 0 0
)

%svv% /Mute "%stream%"
%svv% /SetVolume "%stream%" 0
%svv% /Unmute "%aimp%"
%svv% /SetVolume "%aimp%" 100

timeout /t 1 >nul 2>&1
goto loop
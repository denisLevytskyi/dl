@echo off
color 2

echo [%date% %time%] SWITCH START >> %~dp0_log.txt

set /p cursor_block=<%~dp0var_cursor_block.txt
set /p level_mpg123=<%~dp0var_level_mpg123.txt
set /p level_speakers=<%~dp0var_level_speakers.txt
set /p stream=<%~dp0var_stream.txt
set mpg123=%~dp0MPG123\MPG123.exe
set nircmd=%~dp0NIRCMD\NIRCMD.exe
set svv=%~dp0SVV\SVV.exe

:loop
set /p switch=<%~dp0var_switch.txt
if %switch%==0 (
    %svv% /Unmute "%stream%"
    echo [%date% %time%] SWITCH STOP >> %~dp0_log.txt
    exit
)

if %cursor_block%==1 (
    %nircmd% setcursor 0 0
)

%svv% /Mute "%stream%"
%svv% /Unmute "Speakers"
%svv% /SetVolume "Speakers" %level_speakers%
%svv% /Unmute "%mpg123%"
%svv% /SetVolume "%mpg123%" %level_mpg123%

timeout /t 1 >nul 2>&1
goto loop
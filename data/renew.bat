echo [%date% %time%] RENEW >> %~dp0_log.txt

set /p level_speakers=<%~dp0var_level_speakers.txt
set /p level_stream=<%~dp0var_level_stream.txt
set /p stream=<%~dp0var_stream.txt
set blinker_path=%~dp0var_blinker.txt
set cursor_block_path=%~dp0var_cursor_block.txt
set svv=%~dp0SVV\SVV.exe

%svv% /Unmute "Speakers"
%svv% /SetVolume "Speakers" %level_speakers%
%svv% /Unmute "%stream%"
%svv% /SetVolume "%stream%" %level_stream%

%svv% /GetPercent "%stream%
if %errorlevel%==0 (
    color 4
    echo [%date% %time%] CHECK CONTROL FAIL >> %~dp0_log.txt
    echo ====================
    echo CHECK CONTROL FAIL...

    echo 1 > %blinker_path%
    echo [%date% %time%] BLINKER THROWN OUT >> %~dp0_log.txt
    echo ====================
    echo BLINKER THROWN OUT...
    
    echo 0 > %cursor_block_path%
    echo [%date% %time%] CURSOR UNBLOCKED >> %~dp0_log.txt
    echo ====================
    echo CURSOR IS NOW UNBLOCKED...

    call %~dp0reboot.bat
) else (
    echo [%date% %time%] CHECK CONTROL ОК >> %~dp0_log.txt
    echo ====================
    echo CHECK CONTROL OK...
)

echo ====================
echo STREAM RENEW...
timeout /t 10 >nul 2>&1
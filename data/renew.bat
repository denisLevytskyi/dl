echo [%date% %time%] RENEW >> %~dp0_log.txt

set /p level_stream=<%~dp0var_level_stream.txt
set /p stream=<%~dp0var_stream.txt
set svv=%~dp0SVV\SVV.exe

%svv% /Unmute "%stream%"
%svv% /SetVolume "%stream%" %level_stream%

echo ====================
echo STREAM RENEW...
timeout /t 10 >nul 2>&1
echo [%date% %time%] RENEW >> %~dp0_log.txt

set /p stream=<%~dp0var_stream.txt
set svv=%~dp0SVV\SVV.exe

%svv% /Unmute "%stream%"
%svv% /SetVolume "%stream%" 100

echo ====================
echo STREAM RENEW...
timeout /t 10 >nul 2>&1
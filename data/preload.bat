echo [%date% %time%] PRELOAD START >> %~dp0_log.txt

set aimp=%~dp0AIMP\AIMP.exe

rmdir /s /q %~dp0AIMP\Profile >nul 2>&1
start "" "%aimp%"

echo ====================
echo PRELOAD...
timeout /t 30

taskkill /Im AIMP.exe /f /T >nul 2>&1
rmdir /s /q %~dp0AIMP\Profile >nul 2>&1

echo [%date% %time%] PRELOAD STOP >> %~dp0_log.txt
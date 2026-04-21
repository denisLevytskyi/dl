echo [%date% %time%] REBOOT 60s >> %~dp0_log.txt

shutdown -r -f -t 60 >nul 2>&1

echo ====================
echo REBOOT 60s...
timeout /t 10 >nul 2>&1
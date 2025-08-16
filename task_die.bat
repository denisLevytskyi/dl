@echo off
color 2

echo [%date% %time%] DIE 60s >> %~dp0data\_log.txt

shutdown -s -t 60 >nul 2>&1

echo ====================
echo DIE 60s
timeout /t 10 >nul 2>&1
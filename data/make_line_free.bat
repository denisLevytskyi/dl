echo [%date% %time%] MAKE LINE FREE >> %~dp0_log.txt

set switch_path=%~dp0var_switch.txt

echo 0 > %switch_path%

echo ====================
echo LINE IS NOW FREE...
timeout /t 10 >nul 2>&1
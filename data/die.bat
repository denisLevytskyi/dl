echo [%date% %time%] DIE 60s >> %~dp0_log.txt

set switch_path=%~dp0var_switch.txt

:loop
set /p switch_text=<%switch_path%
if %switch_text%==1 (
    echo ====================
    echo LINE IS NOT FREE, WAIT...
    echo [%date% %time%] LINE IS NOT FREE, WAIT >> %~dp0_log.txt
    timeout /t 5 >nul 2>&1
    goto loop
) else (
    echo ====================
    echo LINE IS FREE...
    echo [%date% %time%] LINE IS FREE >> %~dp0_log.txt
)

shutdown -s -t 60 >nul 2>&1

echo ====================
echo DIE 60s
timeout /t 10 >nul 2>&1
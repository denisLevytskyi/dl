set tg=%~dp0tg.bat

start "" /min %tg% CLEAN_LOG
timeout /t 5 >nul 2>&1

echo START LOG> %~dp0_log.txt
echo [TIME --- STATUS --- REGION --- RESPONSE --- ALERT ON/OFF]> %~dp0_log_monitor.txt
echo START LOG>> %~dp0_log_monitor.txt

echo ====================
echo LOG IS NOW CLEAN...
timeout /t 10 >nul 2>&1
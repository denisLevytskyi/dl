echo START LOG> %~dp0_log.txt
echo [TIME --- STATUS --- REGION --- RESPONSE --- ALERT ON/OFF]> %~dp0_log_monitor.txt
echo START LOG>> %~dp0_log_monitor.txt

echo ====================
echo LOG IS NOW CLEAN...
timeout /t 10 >nul 2>&1
echo [%date% %time%] BLINKER RESET >> %~dp0_log.txt

set blinker_path=%~dp0var_blinker.txt
set cursor_block_path=%~dp0var_cursor_block.txt

echo 0 > %blinker_path%
echo [%date% %time%] BLINKER RESTORED >> %~dp0_log.txt
echo ====================
echo BLINKER RESTORED...
    
echo 1 > %cursor_block_path%
echo [%date% %time%] CURSOR BLOCKED >> %~dp0_log.txt
echo ====================
echo CURSOR IS NOW BLOCKED...

echo ====================
echo BLINKER RESET...
timeout /t 10 >nul 2>&1
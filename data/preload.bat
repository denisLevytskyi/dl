echo [%date% %time%] PRELOAD START >> %~dp0_log.txt

set nircmd=%~dp0NIRCMD\NIRCMD.exe

%nircmd% setcursor 0 0
%nircmd% setcursor 50 50
%nircmd% setcursor 100 100
%nircmd% setcursor 50 50
%nircmd% setcursor 0 0

echo [%date% %time%] PRELOAD STOP >> %~dp0_log.txt
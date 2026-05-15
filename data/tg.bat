@echo off
color 2

rem %1 - сообщение

echo [%date% %time%] TG %1 >> %~dp0_log.txt

set /p tg_token=<%~dp0var_tg_token.txt
set /p tg_chat=<%~dp0var_tg_chat.txt
set wget=%~dp0WGET\WGET.exe

%wget% -q -O NUL --no-check-certificate "https://api.telegram.org/bot%tg_token%/sendMessage?chat_id=%tg_chat%&text=%1"

echo ====================
echo TG MSG SEND...
timeout /t 10 >nul 2>&1

exit
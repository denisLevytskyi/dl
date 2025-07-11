echo = = = = = = = = = = = = = = = = = = = = =
echo = = = = = = = =  WARNING  = = = = = = = =
echo = = = =  YOU HAVE TIME TO CANCEL  = = = =
echo = = = = = = = = = = = = = = = = = = = = =

call %~dp0preload.bat
timeout /t 10 >nul 2>&1
color C

echo = = = = = = = = = = = = = = = = = = = = =
echo = = = = = = = LAST WARNING! = = = = = = =
echo = = = =  YOU HAVE TIME TO CANCEL  = = = =
echo = = = = = = = = = = = = = = = = = = = = =

call %~dp0preload.bat
timeout /t 10 >nul 2>&1
color 4

echo = = = = = = = = = = = = = = = = = = = = =
echo = = = = = = = =  WARNING  = = = = = = = =
echo = = = = = = = = AIR ALARM = = = = = = = =
echo = = = = = = = = = = = = = = = = = = = = =
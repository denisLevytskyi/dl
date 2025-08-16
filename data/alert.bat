echo [%date% %time%] ALERT >> %~dp0_log.txt

echo = = = = = = = = = = = = = = = = = = = = =
echo = = = = = = = =  WARNING  = = = = = = = =
echo = = = =  YOU HAVE TIME TO CANCEL  = = = =
echo = = = = = = = = = = = = = = = = = = = = =

timeout /t 10 >nul 2>&1
color C

echo = = = = = = = = = = = = = = = = = = = = =
echo = = = = = = = LAST WARNING! = = = = = = =
echo = = = =  YOU HAVE TIME TO CANCEL  = = = =
echo = = = = = = = = = = = = = = = = = = = = =

timeout /t 10 >nul 2>&1
color 4

echo = = = = = = = = = = = = = = = = = = = = =
echo = = = = = = = =  WARNING  = = = = = = = =
echo = = = = = =  ALARM NOW START  = = = = = =
echo = = = = = = = = = = = = = = = = = = = = =
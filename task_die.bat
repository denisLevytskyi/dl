@echo off
color 2

echo [%date% %time%] DIE 60s >> %~dp0data\_log.txt

shutdown -s -t 60
@echo off
color 2

schtasks /delete /tn "_kassa1" /f
schtasks /delete /tn "_kassa2" /f
schtasks /delete /tn "_kassa3" /f

timeout /t 10
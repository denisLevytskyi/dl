@echo off
color 2

schtasks /delete /tn "_die" /f

timeout /t 10
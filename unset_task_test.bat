@echo off
color 2

schtasks /delete /tn "_test" /f

timeout /t 10

@echo off
color 2

schtasks /delete /tn "_minute" /f

timeout /t 10
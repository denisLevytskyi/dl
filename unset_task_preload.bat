@echo off
color 2

schtasks /delete /tn "_preload1" /f
schtasks /delete /tn "_preload2" /f

timeout /t 10

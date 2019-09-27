@echo off

IF EXIST "%userprofile%\..\%1\" ^
ECHO "The user %1 logged on %computername%" >> ^
"C:\Scripts\log.txt"
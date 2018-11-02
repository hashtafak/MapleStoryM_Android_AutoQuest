@echo off
:loop
adb -s 127.0.0.1:5557 shell "input tap 1279 700;input tap 1279 700;input tap 1279 700;input tap 1279 700;input tap 1279 700;input tap 1279 700;input tap 1279 700"
echo 5557
timeout 7 /nobreak
goto loop
@echo off
adb -s 127.0.0.1:21513 shell screencap -p /sdcard/screen.png && adb -s 127.0.0.1:21513 pull /sdcard/screen.png
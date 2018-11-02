@echo off
:loop
tasklist /fi "PID eq 19764" | find ":" > nul || adb -s 127.0.0.1:21503 shell input tap 0 719 && timeout 1 /nobreak && goto loop
exit
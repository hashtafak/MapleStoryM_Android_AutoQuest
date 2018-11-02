@echo off
:loop
adb -s 127.0.0.1:21513 shell input tap 1088 623
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 1088 623
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 1088 623
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 952 669
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 952 669
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 1088 623
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 1088 623
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 1088 623
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 952 669
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 952 669
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 1088 623
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 1088 623
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 1088 623
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 952 669
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 952 669
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 1088 623
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 1088 623
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 1088 623
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 952 669
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input tap 952 669
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input touchscreen swipe 241 575 241 575 2000
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input touchscreen swipe 74 576 74 576 2000
timeout 1 /nobreak
adb -s 127.0.0.1:21513 shell input touchscreen swipe 241 575 241 575 100
timeout 1 /nobreak
echo 21513
goto loop
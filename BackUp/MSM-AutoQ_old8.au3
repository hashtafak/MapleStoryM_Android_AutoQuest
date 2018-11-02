#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=icon.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include "_ImageSearchEX.au3"
#include <GDIPlus.au3>

; Initialize GDI+ library
_GDIPlus_Startup()
Global $port = InputBox("ADB Port", "ADB Port", 5555)
If @error Then Exit
TrayCreateItem("ADB Port: " & $port)
Global $Bitmap, $hBitmap
RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input tap 2 255', "", @SW_HIDE)

While 1
;~ 	RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell screencap -p /sdcard/' & $port & '.png', "", @SW_HIDE)
;~ 	RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' pull /sdcard/' & $port & '.png "' & @ScriptDir & '\tmp"', @ScriptDir & '\tmp', @SW_HIDE)
	RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' adb shell screencap -p | perl -pe "binmode(STDOUT);s/\r\n/\n/g" > '&$port&'.png', @ScriptDir & '\tmp', @SW_HIDE)


	;Get the hBitmap of the image i want to search for
	$Bitmap = _GDIPlus_BitmapCreateFromFile(@ScriptDir & '\tmp\' & $port & '.png')
	$hBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($Bitmap)

	_searchClick('x')
	_searchClick('x2')
	_searchClick('dong')
	_searchClick('co-san')
	_searchClick('mot-ngum')
	_searchClick('xac-nhan')
	_searchClick('chap-nhan')
	_searchClick('di-ngay')
	_searchClick('hoi-sinh')
	_searchClick('hoan-thanh1')
	_searchClick('hoan-thanh2')
	_searchClick('nhan-thuong')

	_searchClick('mua-ki-nang')
	_searchClick('tang-luc')

	;delete resources
	_GDIPlus_BitmapDispose($Bitmap)
	_WinAPI_DeleteObject($hBitmap)

	Sleep(1000)
WEnd

_GDIPlus_Shutdown()

Func _searchClick($name)
	;Searching for the image
	Local $aCoords = _ImageSearchAreaEX(@ScriptDir & '\image\' & $name & '.bmp', $hBitmap, 0, 0, @DesktopWidth, @DesktopHeight, 10)

	If IsArray($aCoords) Then
		ConsoleWrite(@MDAY & '/' & @MON & ' ' & @HOUR & ':' & @MIN & ':' & @SEC & ' "' & $name & '" found at ' & $aCoords[0] & "," & $aCoords[1] & @CRLF)
		FileWrite(@ScriptDir & '/log-' & $port & '.txt', @MDAY & '/' & @MON & ' ' & @HOUR & ':' & @MIN & ':' & @SEC & ' "' & $name & '" found at ' & $aCoords[0] & "," & $aCoords[1] & @CRLF)
		Run(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input tap ' & $aCoords[0] & ' ' & $aCoords[1], "", @SW_HIDE)
		If $name == 'nhan-thuong' Then
			Sleep(2500)
			RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input tap 5 280', "", @SW_HIDE)
		EndIf

		If $name == 'hoi-sinh' Then
			Sleep(2500)
			RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input tap 5 280', "", @SW_HIDE)
		EndIf
	Else
		Sleep(100)
	EndIf
EndFunc   ;==>_searchClick


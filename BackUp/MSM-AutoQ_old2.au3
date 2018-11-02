#include "_ImageSearchEX.au3"
#include <GDIPlus.au3>

; Initialize GDI+ library
_GDIPlus_Startup()
Global $port = 21513
Global $Bitmap, $hBitmap
RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input tap 2 255', "", @SW_HIDE)

While 1
	RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell screencap -p /sdcard/' & $port & '.png', "", @SW_HIDE)
	RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' pull /sdcard/' & $port & '.png "' & @ScriptDir & '\tmp"', "", @SW_HIDE)

	;Get the hBitmap of the image i want to search for
	$Bitmap = _GDIPlus_BitmapCreateFromFile(@ScriptDir & '\tmp\' & $port & '.png')
	$hBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($Bitmap)

	_searchClick('dong')
	_searchClick('co-san')
	_searchClick('xac-nhan')
	_searchClick('chap-nhan')
	_searchClick('hoan-thanh1')
	_searchClick('hoan-thanh2')
	_searchClick('nhan-thuong')

	;delete resources
	_GDIPlus_BitmapDispose($Bitmap)
	_WinAPI_DeleteObject($hBitmap)
	Sleep(3000)
WEnd

_GDIPlus_Shutdown()

Func _searchClick($name)
	;Searching for the image
	Local $aCoords = _ImageSearchAreaEX(@ScriptDir & '\image\' & $name & '.bmp', $hBitmap, 0, 0, @DesktopWidth, @DesktopHeight, 10)

	If IsArray($aCoords) Then
		ConsoleWrite(@MDAY & ' ' &@MON & ' ' &@HOUR & ' ' & @MIN & ' ' & @SEC & ': "' & $name & '" found at ' & $aCoords[0] & "," & $aCoords[1] & @CRLF)
		RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input tap ' & $aCoords[0] & ' ' & $aCoords[1], "", @SW_HIDE)
		If $name == 'nhan-thuong' Then
			Sleep(2000)
			RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input tap 2 255', "", @SW_HIDE)
		EndIf
	EndIf
EndFunc   ;==>_searchClick

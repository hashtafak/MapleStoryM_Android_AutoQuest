#include "_ImageSearchEX.au3"
#include <GDIPlus.au3>
ConsoleWrite(@AutoItPID)
Opt("TrayMenuMode", 3)

; Initialize GDI+ library
_GDIPlus_Startup()
Global $port = InputBox("ADB Port", "ADB Port", 21503)
If @error Then Exit
TrayCreateItem("ADB Port: " & $port)
Global $State = TrayCreateItem("Pause")
Global $Exit = TrayCreateItem("Exit")
Global $Bitmap, $hBitmap
RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input tap 2 255', "", @SW_HIDE)

While 1
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

		WEnd

		Sleep(3000)

		Switch TrayGetMsg()
			Case $idAbout ; Display a message box about the AutoIt version and installation path of the AutoIt executable.
				MsgBox($MB_SYSTEMMODAL, "", "AutoIt tray menu example." & @CRLF & @CRLF & _
						"Version: " & @AutoItVersion & @CRLF & _
						"Install Path: " & StringLeft(@AutoItExe, StringInStr(@AutoItExe, "\", $STR_NOCASESENSEBASIC, -1) - 1)) ; Find the folder of a full path.

			Case $idExit ; Exit the loop.
				ExitLoop
		EndSwitch

	WEnd

	_GDIPlus_Shutdown()

	Func _searchClick($name)
		;Searching for the image
		Local $aCoords = _ImageSearchAreaEX(@ScriptDir & '\image\' & $name & '.bmp', $hBitmap, 0, 0, @DesktopWidth, @DesktopHeight, 10)

		If IsArray($aCoords) Then
			ConsoleWrite(@MDAY & '/' & @MON & ' ' & @HOUR & ':' & @MIN & ':' & @SEC & ' "' & $name & '" found at ' & $aCoords[0] & "," & $aCoords[1] & @CRLF)
			RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input tap ' & $aCoords[0] & ' ' & $aCoords[1], "", @SW_HIDE)
			If $name == 'nhan-thuong' Then
				Sleep(2000)
				RunWait(@ComSpec & ' /c adb -s 127.0.0.1:' & $port & ' shell input tap 2 255', "", @SW_HIDE)
			EndIf
		EndIf
	EndFunc   ;==>_searchClick


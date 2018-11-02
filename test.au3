#include "_ImageSearchEX.au3"
#include <GDIPlus.au3>
;ConsoleWrite(@AutoItPID)
;Opt("TrayMenuMode", 3)

; Initialize GDI+ library
_GDIPlus_Startup()

Global $Bitmap, $hBitmap

	;Get the hBitmap of the image i want to search for
	$Bitmap = _GDIPlus_BitmapCreateFromFile(@ScriptDir & '\1.png')
	$hBitmap = _GDIPlus_BitmapCreateHBITMAPFromBitmap($Bitmap)

Local $aCoords = _ImageSearchAreaEX(@ScriptDir & '\image\bo-qua.bmp', $hBitmap, 0, 0, @DesktopWidth, @DesktopHeight, 10)

	If IsArray($aCoords) Then ConsoleWrite('found at ' & $aCoords[0] & "," & $aCoords[1] & @CRLF)

		_GDIPlus_BitmapDispose($Bitmap)
	_WinAPI_DeleteObject($hBitmap)


_GDIPlus_Shutdown()
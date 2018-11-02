#AutoIt3Wrapper_UseX64=n
#include-once

Func _ImageSearchAreaEX($findImage, $hHBitmap, $left, $top, $right, $bottom, $Tolerance = 0)
	Local $aReturn[2]

	If $Tolerance > 0 Then $findImage = "*" & $Tolerance & " " & $findImage
	$result = DllCall(@ScriptDir & "\ImageSearch.dll", "str", "ImageSearchEx", "int", $left, "int", $top, "int", $right, "int", $bottom, "str", $findImage, "ptr", $hHBitmap)

	; If error exit
	If Not IsArray($result) Or $result[0] = "0" Then Return SetError(1, 0, 0)

	$Array = StringSplit($result[0], "|")
	If (UBound($Array) >= 4) Then
		$aReturn[0] = Int(Number($Array[2]))
		$aReturn[1] = Int(Number($Array[3]))

		$aReturn[0] = $aReturn[0] + Int(Number($Array[4]) / 2)
		$aReturn[1] = $aReturn[1] + Int(Number($Array[5]) / 2)
		Return $aReturn
	EndIf
EndFunc   ;==>_ImageSearchAreaEX

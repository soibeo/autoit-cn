#include <GUIConstantsEx.au3>
#include <WinAPI.au3>
#include <Date.au3>
#include <WindowsConstants.au3>

Global $iMemo

_Main()

Func _Main()
	Local $hFile, $tFile, $aTime

	; 创建 GUI
	GUICreate("Time", 400, 300)
	$iMemo = GUICtrlCreateEdit("", 2, 2, 396, 296, $WS_VSCROLL)
	GUICtrlSetFont($iMemo, 9, 400, 0, "Courier New")
	GUISetState()

	; 创建测试文件并设置文件时间
	$hFile = _WinAPI_CreateFile(@ScriptDir & "\Test.xyz", 1)
	If $hFile = 0 Then _WinAPI_ShowError("Unable to create file")
	$tFile = _Date_Time_EncodeFileTime(@MON, @MDAY, @YEAR, @HOUR, @MIN, @SEC)
	Local $pFile = DllStructGetPtr($tFile)
	_Date_Time_SetFileTime($hFile, $pFile, $pFile, $pFile)
	_WinAPI_CloseHandle($hFile)

	; 读取文件时间
	$hFile = _WinAPI_CreateFile(@ScriptDir & "\Test.xyz", 2)
	If $hFile = 0 Then _WinAPI_ShowError("Unable to open file")
	$aTime = _Date_Time_GetFileTime($hFile)
	_WinAPI_CloseHandle($hFile)

	MemoWrite("Created ..: " & _Date_Time_FileTimeToStr($aTime[0]))
	MemoWrite("Accessed .: " & _Date_Time_FileTimeToStr($aTime[1]))
	MemoWrite("Modified .: " & _Date_Time_FileTimeToStr($aTime[2]))

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	FileDelete(@ScriptDir & "\Test.xyz")

EndFunc   ;==>_Main

; 写入一行到 memo 控件
Func MemoWrite($sMessage)
	GUICtrlSetData($iMemo, $sMessage & @CRLF, 1)
EndFunc   ;==>MemoWrite

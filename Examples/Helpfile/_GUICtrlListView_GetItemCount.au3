#include <GUIConstantsEx.au3>
#include <GuiListView.au3>

$Debug_LV = False ; 检查传递给 ListView 函数的类名, 设置为True并输出到一个控件的句柄,用于检查它是否工作

_Main()

Func _Main()
	Local $hListView

	GUICreate("ListView Get Item Count", 400, 300)
	$hListView = GUICtrlCreateListView("col1|col2|col3", 2, 2, 394, 268)
	GUISetState()

	GUICtrlCreateListViewItem("line1|data1|more1", $hListView)
	GUICtrlCreateListViewItem("line2|data2|more2", $hListView)
	GUICtrlCreateListViewItem("line3|data3|more3", $hListView)
	GUICtrlCreateListViewItem("line4|data4|more4", $hListView)
	GUICtrlCreateListViewItem("line5|data5|more5", $hListView)

	MsgBox(4160, "信息", "Item Count: " & _GUICtrlListView_GetItemCount($hListView))

	; 循环直到用户退出
	Do
	Until GUIGetMsg() = $GUI_EVENT_CLOSE

	GUIDelete()
EndFunc   ;==>_Main

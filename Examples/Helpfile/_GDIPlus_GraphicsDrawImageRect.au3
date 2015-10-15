#include <GDIPlus.au3>
#include <ScreenCapture.au3>
#include <WinAPI.au3>

_Main()

Func _Main()
	Local $hBitmap1, $hBitmap2, $hImage1, $hImage2, $hGraphic

	; ��ʼ�� GDI+ ��
	_GDIPlus_Startup()

	; ����������Ļ
	$hBitmap1 = _ScreenCapture_Capture("")
	$hImage1 = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap1)

	; ������Ļ����
	$hBitmap2 = _ScreenCapture_Capture("", 0, 0, 400, 300)
	$hImage2 = _GDIPlus_BitmapCreateFromHBITMAP($hBitmap2)

	; ��һ��ͼ���������һ��ͼ��
	$hGraphic = _GDIPlus_ImageGetGraphicsContext($hImage1)
	_GDIPlus_GraphicsDrawImageRect($hGraphic, $hImage2, 100, 100, 400, 300)

	; �ڲ����ͼ����Χ���߿�
	_GDIPlus_GraphicsDrawRect($hGraphic, 100, 100, 400, 300)

	; �����ɴ˲�����ͼ��
	_GDIPlus_ImageSaveToFile($hImage1, @MyDocumentsDir & "\GDIPlus_Image.jpg")

	; ������Դ
	_GDIPlus_ImageDispose($hImage1)
	_GDIPlus_ImageDispose($hImage2)
	_WinAPI_DeleteObject($hBitmap1)
	_WinAPI_DeleteObject($hBitmap2)

	; �ر� GDI+ ��
	_GDIPlus_Shutdown()

EndFunc   ;==>_Main
:�Q�l�@https://www.pixiv.net/novel/show.php?id=6262620
@echo off
cd /d %~dp0

:�ŏ�����ԂŎ��s����
if not "%X_MIMIMIZED%"=="1" (
    set X_MIMIMIZED=1
    start /min cmd /c,"%~0" %*
    exit
)

:RUNAS
whoami /PRIV | FIND "SeLoadDriverPrivilege" > NUL
if not errorlevel 1 GOTO START
ECHO �����𑱍s����ɂ͊Ǘ��Ҍ������K�v�ł��B
ECHO " �Ǘ��҂Ƃ��Ď��s "��I�����Ă��������B
ECHO.
if exist cmd.lnk (START cmd.lnk /K "%0" %~d0 %~p0) else (pause)
exit
:START
CD /D %1\%2

echo ^�i1^/6^�j"Wacom_Tablet.exe"�������I����....
taskkill /IM Wacom_Tablet.exe /F
echo ����
echo ^�i2^/6^�j"Wacom_TabletUser.exe"�������I����....
taskkill /IM Wacom_TabletUser.exe /F
echo ����
echo ^�i3^/6^�j"Wacom_TouchUser.exe"�������I����....
taskkill /IM Wacom_TouchUser.exe /F
echo ����
echo ^�i4^/6^�j"WTabletServicePro.exe"�������I����....
taskkill /IM WTabletServicePro.exe /F
echo ����
echo ^�i5^/6^�jWacom Professional Service�������I����....
net stop WTabletServicePro
echo ����
echo ^�i6^/6^�jWacom Professional Service���N����....
net start WTabletServicePro
echo ����
echo WacomService�̍ċN������
echo.
echo "WacomDesktopCenter.exe"���I�����Ă��܂�....
taskkill /IM WacomDesktopCenter.exe
echo ����
timeout /t 3 > nul
exit
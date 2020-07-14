:参考　https://www.pixiv.net/novel/show.php?id=6262620
@echo off
cd /d %~dp0

:最小化状態で実行する
if not "%X_MIMIMIZED%"=="1" (
    set X_MIMIMIZED=1
    start /min cmd /c,"%~0" %*
    exit
)

:RUNAS
whoami /PRIV | FIND "SeLoadDriverPrivilege" > NUL
if not errorlevel 1 GOTO START
ECHO 処理を続行するには管理者権限が必要です。
ECHO " 管理者として実行 "を選択してください。
ECHO.
if exist cmd.lnk (START cmd.lnk /K "%0" %~d0 %~p0) else (pause)
exit
:START
CD /D %1\%2

echo ^（1^/6^）"Wacom_Tablet.exe"を強制終了中....
taskkill /IM Wacom_Tablet.exe /F
echo 完了
echo ^（2^/6^）"Wacom_TabletUser.exe"を強制終了中....
taskkill /IM Wacom_TabletUser.exe /F
echo 完了
echo ^（3^/6^）"Wacom_TouchUser.exe"を強制終了中....
taskkill /IM Wacom_TouchUser.exe /F
echo 完了
echo ^（4^/6^）"WTabletServicePro.exe"を強制終了中....
taskkill /IM WTabletServicePro.exe /F
echo 完了
echo ^（5^/6^）Wacom Professional Serviceを強制終了中....
net stop WTabletServicePro
echo 完了
echo ^（6^/6^）Wacom Professional Serviceを起動中....
net start WTabletServicePro
echo 完了
echo WacomServiceの再起動完了
echo.
echo "WacomDesktopCenter.exe"を終了しています....
taskkill /IM WacomDesktopCenter.exe
echo 完了
timeout /t 3 > nul
exit
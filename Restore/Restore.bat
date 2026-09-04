@echo off
setlocal

cd /d "%~dp0..\bin"
set "PATH=%~dp0..\bin;%PATH%"

net session >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Please right-click Restore.bat and select "Run as administrator".
    pause
    exit /b
)

if not exist "backup\lk_a.img" (
    echo.
    echo [!] Error: No backup found in bin\backup folder!
    echo [!] Cannot restore because backup\lk_a.img is missing.
    pause
    exit /b 1
)
if not exist "DA.bin" (
    echo.
    echo [!] Error: "DA.bin" is missing from the bin folder!
    pause
    exit /b 1
)
if not exist "preloader.bin" (
    echo.
    echo [!] Error: "preloader.bin" is missing from the bin folder!
    pause
    exit /b 1
)
echo.
echo Installing libusbK driver for BROM bypass...
pnputil /add-driver "%~dp0..\usb_driver\*.inf" /install >nul 2>&1
echo Driver installation finished.

echo.
echo [1/2] Flashing lk_a...
echo If the device rebooted, please power it off again, then reconnect.
antumbra w lk_a backup/lk_a.img --da DA.bin -p preloader.bin

echo.
echo [2/2] Flashing lk_b...
echo If the device rebooted, please power it off again, then reconnect.
antumbra w lk_b backup/lk_b.img --da DA.bin -p preloader.bin

echo.
echo Uninstalling USBlibk...
powershell -NoProfile -Command "$inf = (Get-ChildItem -Path '%~dp0..\usb_driver\*.inf').Name; if ($inf) { Get-WindowsDriver -Online | Where-Object { $_.OriginalFileName -match $inf } | ForEach-Object { & pnputil /delete-driver $_.Driver /uninstall } }"

for /f "tokens=*" %%i in ('powershell -NoProfile -Command "Get-PnpDevice -PresentOnly -ErrorAction SilentlyContinue | Where-Object { $_.InstanceId -match 'USB\\\\VID_0E8D&PID_0003' } | Select-Object -ExpandProperty InstanceId"') do (
    pnputil /remove-device "%%i" >nul 2>&1
)

pnputil /scan-devices >nul 2>&1
echo Driver restore complete.

echo Done...
pause
exit /b 1

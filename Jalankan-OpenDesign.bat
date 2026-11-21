@echo off
title OpenDesign Launcher
cd /d "%~dp0"

:: Pastikan folder PowerShell dan System32 terdaftar di PATH
set "PATH=%SystemRoot%\System32;%SystemRoot%\System32\WindowsPowerShell\v1.0;%PATH%"

echo =======================================================
echo                 OpenDesign Launcher
echo =======================================================
echo.
echo Sedang menyiapkan server lokal OpenDesign...
echo Browser akan terbuka otomatis dalam beberapa detik.
echo.
echo * CATATAN: Biarkan jendela ini tetap terbuka selama
echo   menggunakan aplikasi. Untuk berhenti, tekan Ctrl+C.
echo.
echo =======================================================
echo.

:: Buka browser otomatis setelah jeda 4 detik agar server siap
start "" cmd /c "timeout /t 4 /nobreak >nul && start http://127.0.0.1:49675/"

:: Jalankan server OpenDesign dengan port tetap
pnpm tools-dev run web --web-port 49675 --daemon-port 49674

pause

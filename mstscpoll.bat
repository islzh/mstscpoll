@echo off
@setlocal

if "%~1" == "" exit /b 1
title %~1 MSTSC POLLING...
@echo %~1 MSTSC POLLING...
:polling
ping %1 -n 1 -w 1000 1>nul 2>&1 && (
    start "" /d "%windir%\system32" "%windir%\system32\mstsc.exe" /v:%1
    exit /b
)
ping localhost -n 5 -w 1000 1>nul 2>&1
goto polling

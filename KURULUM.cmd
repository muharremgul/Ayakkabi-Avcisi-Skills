@echo off
chcp 65001 >nul
title Ayakkabı Avcısı Skills Kurulumu
powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1"
echo.
pause

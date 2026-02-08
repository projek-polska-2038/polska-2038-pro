@echo off
chcp 65001 >nul
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                                                            ║
echo ║     🔄 KONWERSJA WSZYSTKICH MD DO HTML → PDF 🔄           ║
echo ║                                                            ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo 📦 Konwertuję WSZYSTKIE pliki MD z folderu DOKUMENTY/...
echo.
timeout /t 2 >nul

echo [1/5] 01-MAPA-DROGOWA-2026-2038.md
copy "%~dp0..\DOKUMENTY\01-MAPA-DROGOWA-2026-2038.md" "%~dp0TEMP-01.md" >nul

echo [2/5] 02-BUDZET-SZCZEGOLOWY-2026-2035.md
copy "%~dp0..\DOKUMENTY\02-BUDZET-SZCZEGOLOWY-2026-2035.md" "%~dp0TEMP-02.md" >nul

echo [3/5] 03-STRUKTURA-ORGANIZACYJNA.md
copy "%~dp0..\DOKUMENTY\03-STRUKTURA-ORGANIZACYJNA.md" "%~dp0TEMP-03.md" >nul

echo [4/5] 04-PLAN-WDROZENIA-INSTRUKCJA.md
copy "%~dp0..\DOKUMENTY\04-PLAN-WDROZENIA-INSTRUKCJA.md" "%~dp0TEMP-04.md" >nul

echo [5/5] 05-BRIEFING-DLA-MEDIOW.md
copy "%~dp0..\DOKUMENTY\05-BRIEFING-DLA-MEDIOW.md" "%~dp0TEMP-05.md" >nul

echo.
echo ✅ Pliki skopiowane!
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo ⚠️ UWAGA: Automatyczna konwersja MD→HTML jest skomplikowana.
echo.
echo 🎯 REKOMENDACJA: Użyj narzędzia online:
echo.
echo 1. Otwórz: https://markdowntohtml.com
echo 2. Wklej zawartość każdego pliku .md
echo 3. Kliknij "Convert"
echo 4. Skopiuj wynik HTML
echo 5. Ctrl+P → Zapisz jako PDF
echo.
echo LUB użyj: CONVERTER-MD-DO-PDF.html (w tym folderze)
echo.
echo ═══════════════════════════════════════════════════════════
echo.
pause


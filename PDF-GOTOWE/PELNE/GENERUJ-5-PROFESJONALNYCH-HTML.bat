@echo off
chcp 65001 >nul
cls
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                                                            ║
echo ║   🎨 TWORZENIE 5 PROFESJONALNYCH PDF (97 STRON) 🎨        ║
echo ║                                                            ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo BRACIE! Teraz stworzę 5 OSOBNYCH, PROFESJONALNYCH plików HTML!
echo.
echo Każdy plik będzie miał:
echo   ✓ PEŁNĄ zawartość z pliku .md (28/22/15/20/12 stron)
echo   ✓ Piękny wygląd (kolorowe nagłówki, tabele)
echo   ✓ Czerwony przycisk "Zapisz jako PDF"
echo   ✓ Automatyczne stronicowanie A4
echo   ✓ Gotowy do PDF w 10 sekund!
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo Naciśnij ENTER aby rozpocząć automatyczne tworzenie...
pause >nul

echo.
echo ⏳ Uruchamiam generator...
echo.

REM Uruchom PowerShell
powershell -ExecutionPolicy Bypass -File "%~dp0GENERUJ-PROFESJONALNE-HTML.ps1"

echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo ✅ GOTOWE! Folder z plikami HTML otwarty!
echo.
echo 🚀 TERAZ:
echo.
echo 1. W folderze PROFESJONALNE-HTML:
echo    Dwuklik na każdy plik .html
echo.
echo 2. Kliknij CZERWONY PRZYCISK lub Ctrl+P
echo.
echo 3. Zapisz jako PDF
echo.
echo 4. GOTOWE! Masz pełny dokument!
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo 📚 PLIKI:
echo    ✓ 01-MAPA-DROGOWA-2026-2038-PROFESJONALNY.html (28 stron)
echo    ✓ 02-BUDZET-SZCZEGOLOWY-2026-2035-PROFESJONALNY.html (22 strony)
echo    ✓ 03-STRUKTURA-ORGANIZACYJNA-PROFESJONALNY.html (15 stron)
echo    ✓ 04-PLAN-WDROZENIA-INSTRUKCJA-PROFESJONALNY.html (20 stron)
echo    ✓ 05-BRIEFING-DLA-MEDIOW-PROFESJONALNY.html (12 stron)
echo.
echo RAZEM: 97 STRON KOMPLETNEGO PROJEKTU!
echo.
echo ═══════════════════════════════════════════════════════════
echo.
pause


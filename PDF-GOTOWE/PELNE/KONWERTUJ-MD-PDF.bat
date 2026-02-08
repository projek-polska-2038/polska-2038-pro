@echo off
chcp 65001 >nul
cls
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                                                            ║
echo ║     🔧 NAPRAWIONE! NOWA METODA KONWERSJI MD→PDF 🔧        ║
echo ║                                                            ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo Problem: Viewer HTML nie mógł załadować plików .md z dysku
echo Rozwiązanie: Użyjemy DARMOWEGO narzędzia online!
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo 📋 SUPER PROSTA METODA (2 MINUTY/DOKUMENT):
echo.
echo 1. Otwieram dla Ciebie stronę: markdowntopdf.com
echo 2. Otworzę folder z plikami .md
echo 3. Skopiuj zawartość każdego .md (Ctrl+A, Ctrl+C)
echo 4. Wklej na stronie markdowntopdf.com (Ctrl+V)
echo 5. Kliknij "Convert to PDF"
echo 6. Pobierz PDF - gotowe!
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo Naciśnij dowolny klawisz aby:
echo   • Otworzyć stronę markdowntopdf.com
echo   • Otworzyć folder z plikami .md
echo.
pause >nul

echo.
echo ⏳ Otwieram stronę i folder...
echo.

REM Otwórz stronę do konwersji
start "" "https://www.markdowntopdf.com"

REM Otwórz folder z plikami MD
start "" "%~dp0..\DOKUMENTY"

echo.
echo ✅ Gotowe!
echo.
echo 📋 TERAZ:
echo.
echo 1. W folderze DOKUMENTY: Otwórz plik .md w Notatniku
echo 2. Zaznacz WSZYSTKO (Ctrl+A)
echo 3. Skopiuj (Ctrl+C)
echo 4. Przejdź na stronę markdowntopdf.com
echo 5. Wklej (Ctrl+V)
echo 6. Kliknij "Convert to PDF"
echo 7. Pobierz PDF
echo.
echo Powtórz dla wszystkich 5 plików!
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo Pliki do skonwertowania:
echo   01-MAPA-DROGOWA-2026-2038.md (28 stron)
echo   02-BUDZET-SZCZEGOLOWY-2026-2035.md (22 strony)
echo   03-STRUKTURA-ORGANIZACYJNA.md (15 stron)
echo   04-PLAN-WDROZENIA-INSTRUKCJA.md (20 stron)
echo   05-BRIEFING-DLA-MEDIOW.md (12 stron)
echo.
echo RAZEM: 97 stron!
echo.
echo ═══════════════════════════════════════════════════════════
echo.
pause



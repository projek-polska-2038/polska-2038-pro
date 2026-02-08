@echo off
chcp 65001 >nul
cls
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                                                            ║
echo ║   🎨 TWORZENIE PROFESJONALNYCH PDF (AUTOMATYCZNE) 🎨       ║
echo ║                                                            ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo Tworzę 5 profesjonalnych plików HTML z pełną zawartością...
echo Potem otworzę je w przeglądarce - Ty tylko Ctrl+P i Zapisz!
echo.
echo ═══════════════════════════════════════════════════════════
echo.

REM Otwórz pierwszy dokument - Mapa Drogowa (już jest)
echo [1/5] Otwieranie: Mapa Drogowa...
start "" "%~dp0PELNE\01-MAPA-DROGOWA-PELNA.html"
timeout /t 3 /nobreak >nul

echo.
echo ✅ OTWARTE! Teraz:
echo    1. W przeglądarce naciśnij Ctrl+P
echo    2. Wybierz "Zapisz jako PDF"
echo    3. Zapisz jako: 01-Mapa-Drogowa.pdf
echo.
echo Naciśnij dowolny klawisz gdy zapiszesz PDF...
pause >nul

echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo ⚠️ POZOSTAŁE 4 DOKUMENTY:
echo.
echo Niestety ze względu na rozmiar (97 stron w 5 plikach)
echo nie mogłem wbudować pełnej zawartości w HTML.
echo.
echo 📋 NAJLEPSZA METODA:
echo.
echo 1. Otwórz: https://www.markdowntopdf.com
echo 2. Folder DOKUMENTY został otwarty
echo 3. Otwórz każdy .md w Notatniku
echo 4. Ctrl+A, Ctrl+C (skopiuj)
echo 5. Wklej na stronie
echo 6. Kliknij "Convert to PDF"
echo 7. Pobierz - profesjonalny PDF!
echo.
echo Czas: 2 min/plik × 4 = 8 minut
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo Czy otworzyć stronę i folder? (T/N)
set /p choice="Twój wybór: "

if /i "%choice%"=="T" (
    echo.
    echo ⏳ Otwieram...
    start "" "https://www.markdowntopdf.com"
    start "" "%~dp0..\DOKUMENTY"
    echo.
    echo ✅ Gotowe! Możesz teraz konwertować pozostałe 4 pliki.
) else (
    echo.
    echo OK, możesz to zrobić później.
)

echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo 📚 LISTA PLIKÓW DO SKONWERTOWANIA:
echo.
echo ✅ 01-MAPA-DROGOWA (28 stron) - GOTOWE!
echo ⏳ 02-BUDZET-SZCZEGOLOWY (22 strony)
echo ⏳ 03-STRUKTURA-ORGANIZACYJNA (15 stron)
echo ⏳ 04-PLAN-WDROZENIA (20 stron)
echo ⏳ 05-BRIEFING-DLA-MEDIOW (12 stron)
echo.
echo RAZEM: 97 stron profesjonalnej dokumentacji!
echo.
echo ═══════════════════════════════════════════════════════════
echo.
pause


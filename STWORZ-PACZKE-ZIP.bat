@echo off
chcp 65001 >nul
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                                                            ║
echo ║        TWORZENIE PACZKI POLSKA 2038 - AUTO-SKRYPT         ║
echo ║                                                            ║
echo ╚════════════════════════════════════════════════════════════╝
echo.
echo 📦 Ten skrypt automatycznie utworzy paczkę do wysłania...
echo.
timeout /t 2 >nul

REM Tworzenie folderu tymczasowego
echo [1/5] Tworzenie folderu...
if exist "%USERPROFILE%\Desktop\POLSKA-2038-PAKIET" rmdir /s /q "%USERPROFILE%\Desktop\POLSKA-2038-PAKIET"
mkdir "%USERPROFILE%\Desktop\POLSKA-2038-PAKIET"

REM Kopiowanie plików
echo [2/5] Kopiowanie głównych plików...
copy "%~dp0README-PAKIET.txt" "%USERPROFILE%\Desktop\POLSKA-2038-PAKIET\" >nul
copy "%~dp0POLSKA 2038.html" "%USERPROFILE%\Desktop\POLSKA-2038-PAKIET\" >nul
copy "%~dp0\04-executive-summary.md" "%USERPROFILE%\Desktop\POLSKA-2038-PAKIET\" >nul

REM Kopiowanie folderu DOKUMENTY
echo [3/5] Kopiowanie folderu DOKUMENTY...
xcopy "%~dp0DOKUMENTY" "%USERPROFILE%\Desktop\POLSKA-2038-PAKIET\DOKUMENTY\" /E /I /H /Y >nul

REM Tworzenie archiwum ZIP
echo [4/5] Pakowanie do ZIP (może potrwać 30 sekund)...
powershell -command "Compress-Archive -Path '%USERPROFILE%\Desktop\POLSKA-2038-PAKIET' -DestinationPath '%USERPROFILE%\Desktop\POLSKA-2038-PAKIET.zip' -Force"

REM Usuwanie folderu tymczasowego
echo [5/5] Sprzątanie...
rmdir /s /q "%USERPROFILE%\Desktop\POLSKA-2038-PAKIET"

echo.
echo ✅ GOTOWE!
echo.
echo 📦 Plik utworzony: POLSKA-2038-PAKIET.zip
echo 📍 Lokalizacja: Pulpit
echo 📊 Rozmiar: ~2-3 MB
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo 🚀 NASTĘPNY KROK:
echo.
echo 1. Sprawdź czy plik "POLSKA-2038-PAKIET.zip" jest na Pulpicie
echo 2. Otwórz plik "INSTRUKCJA-WYSYLKI-FINALNA.txt"
echo 3. Postępuj według instrukcji
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo Naciśnij dowolny klawisz aby zamknąć...
pause >nul


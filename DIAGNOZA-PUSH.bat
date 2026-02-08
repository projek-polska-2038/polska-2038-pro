@echo off
chcp 65001 >nul
echo.
echo ═══════════════════════════════════════════════════════════════════
echo 🔍 DIAGNOSTYKA - DLACZEGO PUSH JEST WOLNY?
echo ═══════════════════════════════════════════════════════════════════
echo.

cd /d "%~dp0"

echo 📊 KROK 1: Sprawdzam rozmiar projektu...
echo.

for /f "tokens=3" %%a in ('dir /s /-c ^| find "File(s)"') do (
    set TOTAL_SIZE=%%a
)

echo ✅ Rozmiar projektu sprawdzony
echo.

echo 📦 KROK 2: Szukam dużych plików...
echo.
for /f "delims=" %%i in ('dir /s /b /a-d ^| findstr /i "\.pdf$ \.zip$ \.rar$ \.mp4$ \.avi$ \.mov$"') do (
    echo ⚠️  Znaleziono duży plik: %%~nxi
)
echo.

echo 🔗 KROK 3: Sprawdzam połączenie z GitHub...
echo.
git remote -v
echo.

echo 📋 KROK 4: Status repozytorium...
echo.
git status --short
echo.

echo ════════════════════════════════════════════════════════════════
echo 💡 MOŻLIWE PRZYCZYNY WOLNEGO PUSH:
echo ════════════════════════════════════════════════════════════════
echo.

echo 1️⃣  DUŻE PLIKI:
echo    GitHub ma limit 100MB na plik
echo    Jeśli widzisz duże pliki powyżej - to problem!
echo.

echo 2️⃣  DUŻO PLIKÓW:
echo    Wiele małych plików też może spowalniać
echo    Sprawdź czy nie wysyłasz node_modules lub innych śmieci
echo.

echo 3️⃣  WOLNE POŁĄCZENIE:
echo    Sprawdź swoje łącze internetowe
echo    Upload może być wolny
echo.

echo 4️⃣  PIERWSZY PUSH:
echo    Pierwszy push zawsze trwa dłużej
echo    Kolejne będą szybsze (tylko zmiany)
echo.

echo ════════════════════════════════════════════════════════════════
echo 🔧 CO MOŻESZ ZROBIĆ?
echo ════════════════════════════════════════════════════════════════
echo.

echo ✅ JEŚLI PUSH TRWA:
echo    - Poczekaj cierpliwie (może to zająć 2-10 minut)
echo    - NIE przerywaj (Ctrl+C zepsuje wysyłanie)
echo    - Sprawdź czy nie masz dużych PDF-ów do wysłania
echo.

echo ✅ JEŚLI PUSH SIĘ ZAWIESIŁ (brak reakcji >5 minut):
echo    - Ctrl+C aby przerwać
echo    - Uruchom: AKTUALIZUJ-GITHUB-BEZ-DUZYCH-PLIKOW.bat
echo.

echo ✅ JEŚLI MASZ DUŻE PLIKI:
echo    - Dodaj je do .gitignore
echo    - Uruchom: git reset HEAD
echo    - Ponów: AKTUALIZUJ-GITHUB.bat
echo.

echo ════════════════════════════════════════════════════════════════
echo.

pause


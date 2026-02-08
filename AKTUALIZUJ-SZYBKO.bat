@echo off
chcp 65001 >nul
echo.
echo ═══════════════════════════════════════════════════════════════════
echo 🚀 SZYBKA AKTUALIZACJA (BEZ DUŻYCH PLIKÓW)
echo ═══════════════════════════════════════════════════════════════════
echo.

cd /d "%~dp0"

echo ⚠️  Ta wersja pomija duże pliki (PDF, obrazy >1MB)
echo    Użyj jej jeśli standardowy push jest za wolny
echo.

REM Sprawdź .gitignore
if not exist .gitignore (
    echo 📝 Tworzę .gitignore z wykluczeniem dużych plików...
    (
        echo # Duże pliki
        echo *.zip
        echo *.rar
        echo *.7z
        echo *.mp4
        echo *.avi
        echo *.mov
        echo.
        echo # Duże PDF-y
        echo **/*PELNE*.pdf
        echo **/PDF-GOTOWE/PELNE/
        echo.
        echo # IDE i systemy
        echo .DS_Store
        echo Thumbs.db
        echo node_modules/
    ) > .gitignore
    echo ✅ Utworzono .gitignore
    echo.
)

echo 📊 Sprawdzam zmiany (bez dużych plików)...
git add . --verbose
echo.

echo 💬 Podaj opis zmian:
set /p COMMIT_MESSAGE="Opis: "

if "%COMMIT_MESSAGE%"=="" (
    set COMMIT_MESSAGE=Szybka aktualizacja (bez dużych plików)
)

echo.
echo 💾 Zatwierdzam...
git commit -m "%COMMIT_MESSAGE%"
echo.

echo 🚀 Wysyłam na GitHub (to powinno być szybkie)...
echo.
git push origin main --verbose --progress

if errorlevel 1 (
    echo.
    echo ❌ Błąd!
    echo.
    echo Spróbuj:
    git pull origin main --rebase
    git push origin main --verbose --progress
)

echo.
echo ✅ Gotowe!
echo.
echo 🌐 Strona zaktualizuje się za 1-2 minuty:
echo    https://polska2038.github.io/polska_projekt_2038/
echo.

pause


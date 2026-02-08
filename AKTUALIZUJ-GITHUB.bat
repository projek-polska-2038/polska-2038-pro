@echo off
chcp 65001 >nul
echo.
echo ═══════════════════════════════════════════════════════════════════
echo 🔄 AKTUALIZACJA PROJEKTU POLSKA 2038 NA GITHUB
echo ═══════════════════════════════════════════════════════════════════
echo.
echo Twoja strona: https://polska2038.github.io/polska_projekt_2038/
echo.

REM Sprawdź czy Git jest zainstalowany
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git nie jest zainstalowany!
    echo.
    echo 📥 Pobierz i zainstaluj Git z: https://git-scm.com/download/win
    echo.
    pause
    exit /b 1
)

echo ✅ Git jest zainstalowany
echo.

REM Sprawdź czy jesteśmy w repozytorium Git
if not exist .git (
    echo ❌ To nie jest repozytorium Git!
    echo.
    echo 🔧 Inicjalizuję lokalne repozytorium...
    git init
    git branch -M main

    echo.
    echo 📋 Podaj nazwę użytkownika GitHub (np. polska2038):
    set /p GITHUB_USERNAME="Nazwa użytkownika: "

    echo.
    echo 🔗 Łączę z istniejącym repozytorium...
    git remote add origin https://github.com/%GITHUB_USERNAME%/polska_projekt_2038.git

    echo.
    echo 📥 Pobieranie aktualnej wersji z GitHub...
    git fetch origin
    git reset --soft origin/main
    echo ✅ Połączono z GitHub
    echo.
)

echo ════════════════════════════════════════════════════════════════
echo KROK 1: SPRAWDZENIE ZMIAN
echo ════════════════════════════════════════════════════════════════
echo.

echo 📊 Sprawdzam co się zmieniło...
git status
echo.

echo ════════════════════════════════════════════════════════════════
echo KROK 2: OPIS AKTUALIZACJI
echo ════════════════════════════════════════════════════════════════
echo.

echo 💬 Podaj krótki opis zmian (np. "Dodano nowe filary 2 i 3"):
set /p COMMIT_MESSAGE="Opis zmian: "

if "%COMMIT_MESSAGE%"=="" (
    set COMMIT_MESSAGE=Aktualizacja projektu POLSKA 2038 - nowe filary
)

echo.
echo 📝 Użyję opisu: %COMMIT_MESSAGE%
echo.

echo ════════════════════════════════════════════════════════════════
echo KROK 3: DODAWANIE ZMIAN
echo ════════════════════════════════════════════════════════════════
echo.

echo 📦 Dodaję wszystkie zmiany...
git add .
echo ✅ Zmiany dodane
echo.

echo 💾 Zatwierdzam zmiany...
git commit -m "%COMMIT_MESSAGE%"
echo ✅ Zmiany zatwierdzone
echo.

echo ════════════════════════════════════════════════════════════════
echo KROK 4: WYSYŁANIE NA GITHUB
echo ════════════════════════════════════════════════════════════════
echo.

echo 🚀 Wysyłam zmiany na GitHub...
echo.
echo ⚠️  UWAGA:
echo    - Pierwszy push może zająć 2-10 minut (zależnie od rozmiaru)
echo    - Widzisz postęp poniżej - NIE przerywaj!
echo    - Jeśli poprosi o logowanie - użyj TOKENU (nie hasła)
echo.
echo 📊 POSTĘP WYSYŁANIA:
echo.

git push origin main --verbose --progress

if errorlevel 1 (
    echo.
    echo ❌ Błąd podczas wysyłania!
    echo.
    echo 🔧 Próbuję alternatywnej metody...
    echo.

    git pull origin main --rebase
    git push origin main

    if errorlevel 1 (
        echo.
        echo ❌ Wciąż nie działa!
        echo.
        echo 💡 Możliwe rozwiązania:
        echo    1. Sprawdź token dostępu
        echo    2. Sprawdź połączenie z internetem
        echo    3. Spróbuj: git push -f origin main (OSTROŻNIE!)
        echo.
        pause
        exit /b 1
    )
)

echo.
echo ✅ Zmiany wysłane na GitHub!
echo.

echo ════════════════════════════════════════════════════════════════
echo ✅ AKTUALIZACJA ZAKOŃCZONA!
echo ════════════════════════════════════════════════════════════════
echo.

echo 🌐 Twoja zaktualizowana strona będzie dostępna za ~1-2 minuty:
echo    https://polska2038.github.io/polska_projekt_2038/
echo.
echo 📰 Press Kit:
echo    https://polska2038.github.io/polska_projekt_2038/press/
echo.
echo 📦 Repozytorium:
echo    https://github.com/polska2038/polska_projekt_2038
echo.

echo ════════════════════════════════════════════════════════════════
echo.
echo 💡 Wskazówki:
echo    - Strona aktualizuje się automatycznie w 1-2 minuty
echo    - Odśwież przeglądarkę (Ctrl+F5) aby zobaczyć zmiany
echo    - Przy kolejnych aktualizacjach użyj ponownie tego skryptu
echo.
echo 🎉 Nowe filary już wkrótce dostępne online! 🇵🇱⚽🏆
echo.

pause


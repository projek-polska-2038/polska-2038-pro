@echo off
chcp 65001 >nul
color 0A
echo.
echo ╔══════════════════════════════════════════════════════════╗
echo ║       🚀 PUSH PROJEKTU NA GITHUB - AUTOMATYCZNY         ║
echo ╚══════════════════════════════════════════════════════════╝
echo.
echo [KROK 1] Otwieram stronę do utworzenia repozytorium...
echo.
start CREATE-GITHUB-REPO.html
timeout /t 3 /nobreak >nul

echo.
echo ┌─────────────────────────────────────────────────────────┐
echo │ INSTRUKCJE:                                             │
echo │                                                         │
echo │ 1. W przeglądarce wypełnij formularz:                  │
echo │    Repository name: polska-2038-pro                    │
echo │    Description: POLSKA 2038 - Reforma polskiego futbolu│
echo │    Public: ✓                                           │
echo │    NIE ZAZNACZAJ: Add a README                         │
echo │                                                         │
echo │ 2. Kliknij "Create repository"                         │
echo │                                                         │
echo │ 3. Po utworzeniu - wciśnij dowolny klawisz tutaj      │
echo └─────────────────────────────────────────────────────────┘
echo.
pause

echo.
echo [KROK 2] Sprawdzam czy repozytorium istnieje...
echo.
git ls-remote https://github.com/tomizna26/polska-2038-pro.git >nul 2>&1
if errorlevel 1 (
    echo ❌ Repozytorium jeszcze nie istnieje!
    echo.
    echo Upewnij się, że:
    echo   - Jesteś zalogowany na konto: tomizna26
    echo   - Utworzyłeś repozytorium: polska-2038-pro
    echo.
    echo Spróbuj ponownie za chwilę...
    timeout /t 5
    exit /b 1
)

echo ✓ Repozytorium znalezione!
echo.
echo [KROK 3] Wykonuję git push...
echo.

git push -u origin main

if errorlevel 1 (
    echo.
    echo ❌ Push nie powiódł się!
    echo.
    echo Możliwe przyczyny:
    echo   1. Brak uwierzytelnienia - musisz podać hasło/token
    echo   2. Repozytorium nieprawidłowo skonfigurowane
    echo.
    echo Spróbuj ręcznie:
    echo   git push -u origin main
    echo.
    pause
    exit /b 1
)

echo.
echo ╔══════════════════════════════════════════════════════════╗
echo ║              ✓ PUSH ZAKOŃCZONY SUKCESEM!               ║
echo ╚══════════════════════════════════════════════════════════╝
echo.
echo Twoja strona będzie dostępna za chwilę pod adresem:
echo https://tomizna26.github.io/polska-2038-pro/
echo.
echo Aby włączyć GitHub Pages:
echo   1. Wejdź na: https://github.com/tomizna26/polska-2038-pro/settings/pages
echo   2. W "Source" wybierz: main branch
echo   3. Kliknij "Save"
echo.
echo Czy otworzyć ustawienia GitHub Pages? (T/N)
choice /c TN /n /m "Wybór: "
if errorlevel 2 goto end
if errorlevel 1 start https://github.com/tomizna26/polska-2038-pro/settings/pages

:end
echo.
echo Gotowe! Możesz zamknąć to okno.
pause


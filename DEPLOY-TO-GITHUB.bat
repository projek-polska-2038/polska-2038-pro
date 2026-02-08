@echo off
chcp 65001 >nul
echo.
echo ═══════════════════════════════════════════════════════════════════
echo 🚀 WDROŻENIE PROJEKTU POLSKA 2038 NA GITHUB PAGES
echo ═══════════════════════════════════════════════════════════════════
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

REM Pobierz dane od użytkownika
echo ════════════════════════════════════════════════════════════════
echo KROK 1: KONFIGURACJA
echo ════════════════════════════════════════════════════════════════
echo.

set /p GITHUB_USERNAME="Podaj swoją nazwę użytkownika GitHub: "
echo.

set /p GITHUB_EMAIL="Podaj swój email GitHub: "
echo.

set /p REPO_NAME="Podaj nazwę repozytorium (domyślnie: polska-2038): "
if "%REPO_NAME%"=="" set REPO_NAME=polska-2038
echo.

echo ════════════════════════════════════════════════════════════════
echo KROK 2: PRZYGOTOWANIE REPOZYTORIUM
echo ════════════════════════════════════════════════════════════════
echo.

echo 🔧 Konfiguracja Git...
git config --global user.name "%GITHUB_USERNAME%"
git config --global user.email "%GITHUB_EMAIL%"
echo ✅ Git skonfigurowany
echo.

echo 🗑️  Usuwanie starego repozytorium (jeśli istnieje)...
if exist .git (
    rmdir /s /q .git
    echo ✅ Stare repozytorium usunięte
) else (
    echo ℹ️  Brak starego repozytorium
)
echo.

echo 🆕 Inicjalizacja nowego repozytorium...
git init
git branch -M main
echo ✅ Nowe repozytorium utworzone
echo.

echo ════════════════════════════════════════════════════════════════
echo KROK 3: DODAWANIE PLIKÓW
echo ════════════════════════════════════════════════════════════════
echo.

echo 📦 Dodawanie plików projektu...
git add .
echo ✅ Pliki dodane
echo.

echo 💾 Zatwierdzanie zmian...
git commit -m "Initial commit: POLSKA 2038 - reforma piłki nożnej"
echo ✅ Zmiany zatwierdzone
echo.

echo ════════════════════════════════════════════════════════════════
echo KROK 4: POŁĄCZENIE Z GITHUB
echo ════════════════════════════════════════════════════════════════
echo.

set REPO_URL=https://github.com/%GITHUB_USERNAME%/%REPO_NAME%.git

echo 🔗 Dodawanie zdalnego repozytorium...
echo URL: %REPO_URL%
echo.

git remote add origin %REPO_URL%

echo.
echo ⚠️  WAŻNE: PRZERWIJ TERAZ (Ctrl+C) jeśli:
echo    1. NIE utworzyłeś jeszcze repozytorium na GitHub
echo    2. URL repozytorium jest nieprawidłowy
echo.
echo 📋 Instrukcja tworzenia repozytorium na GitHub:
echo    1. Wejdź na: https://github.com/new
echo    2. Repository name: %REPO_NAME%
echo    3. Zaznacz: Public
echo    4. NIE inicjalizuj z README
echo    5. Kliknij "Create repository"
echo.
echo Jeśli repozytorium jest gotowe, naciśnij dowolny klawisz...
pause >nul
echo.

echo ════════════════════════════════════════════════════════════════
echo KROK 5: WYSYŁANIE KODU NA GITHUB
echo ════════════════════════════════════════════════════════════════
echo.

echo 🚀 Wysyłanie kodu...
echo.
echo ⚠️  GitHub może poprosić o logowanie:
echo    - Username: %GITHUB_USERNAME%
echo    - Password: użyj PERSONAL ACCESS TOKEN (nie hasła!)
echo.
echo 🔑 Jak stworzyć token:
echo    https://github.com/settings/tokens/new
echo    (zaznacz scope: repo)
echo.

git push -u origin main

if errorlevel 1 (
    echo.
    echo ❌ Błąd podczas wysyłania kodu!
    echo.
    echo 🔍 Możliwe przyczyny:
    echo    1. Repozytorium nie istnieje na GitHub
    echo    2. Nieprawidłowa nazwa użytkownika
    echo    3. Nieprawidłowy token dostępu
    echo    4. Brak połączenia z internetem
    echo.
    pause
    exit /b 1
)

echo.
echo ✅ Kod wysłany na GitHub!
echo.

echo ════════════════════════════════════════════════════════════════
echo KROK 6: KONFIGURACJA GITHUB PAGES
echo ════════════════════════════════════════════════════════════════
echo.

echo 📄 Teraz musisz ręcznie włączyć GitHub Pages:
echo.
echo 1. Wejdź na: https://github.com/%GITHUB_USERNAME%/%REPO_NAME%/settings/pages
echo.
echo 2. W sekcji "Source":
echo    - Branch: main
echo    - Folder: / (root)
echo.
echo 3. Kliknij "Save"
echo.
echo 4. Poczekaj 1-3 minuty
echo.
echo 5. Twoja strona będzie dostępna pod adresem:
echo    https://%GITHUB_USERNAME%.github.io/%REPO_NAME%/
echo.

echo ════════════════════════════════════════════════════════════════
echo ✅ WDROŻENIE ZAKOŃCZONE!
echo ════════════════════════════════════════════════════════════════
echo.
echo 🌐 Twoje linki:
echo.
echo 📦 Repozytorium:
echo    https://github.com/%GITHUB_USERNAME%/%REPO_NAME%
echo.
echo 🌍 Strona WWW (dostępna po włączeniu GitHub Pages):
echo    https://%GITHUB_USERNAME%.github.io/%REPO_NAME%/
echo.
echo 📰 Materiały dla prasy:
echo    https://%GITHUB_USERNAME%.github.io/%REPO_NAME%/press/
echo.
echo ════════════════════════════════════════════════════════════════
echo.
echo 💡 Wskazówki:
echo    - Włącz GitHub Pages w ustawieniach repozytorium
echo    - Pierwsze wdrożenie trwa 1-3 minuty
echo    - Zmiany w kodzie: git add . → git commit -m "opis" → git push
echo.
echo 🎉 Powodzenia z projektem POLSKA 2038! 🇵🇱⚽🏆
echo.
pause


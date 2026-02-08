# PUSH NA GITHUB - AUTOMATYCZNY SKRYPT
# Wykonaj ten skrypt po utworzeniu repozytorium na GitHubie

Write-Host "`n" -NoNewline
Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Cyan
Write-Host "║          PUSH PROJEKTU NA GITHUB - AUTOMATYCZNY           ║" -ForegroundColor Cyan
Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Cyan
Write-Host ""

# Sprawdzenie czy jesteśmy w prawidłowym katalogu
if (!(Test-Path "index.html")) {
    Write-Host "❌ Błąd: Nie znaleziono index.html" -ForegroundColor Red
    Write-Host "   Uruchom skrypt z folderu projektu!" -ForegroundColor Yellow
    Read-Host "Naciśnij Enter aby zakończyć"
    exit 1
}

Write-Host "[1/4] Sprawdzam konfigurację git..." -ForegroundColor Yellow
$gitUser = git config user.name
$gitEmail = git config user.email
Write-Host "      ✓ User: $gitUser" -ForegroundColor Green
Write-Host "      ✓ Email: $gitEmail" -ForegroundColor Green
Write-Host ""

Write-Host "[2/4] Sprawdzam remote repository..." -ForegroundColor Yellow
$remote = git remote get-url origin 2>$null
if ($remote) {
    Write-Host "      ✓ Remote: $remote" -ForegroundColor Green
} else {
    Write-Host "      ⚠ Remote nie skonfigurowane" -ForegroundColor Yellow
    Write-Host "      Konfiguruję..." -ForegroundColor Gray
    git remote add origin https://github.com/tomizna26/polska-2038-pro.git
    Write-Host "      ✓ Remote dodany" -ForegroundColor Green
}
Write-Host ""

Write-Host "[3/4] Sprawdzam czy repozytorium istnieje na GitHubie..." -ForegroundColor Yellow
$repoExists = git ls-remote https://github.com/tomizna26/polska-2038-pro.git 2>$null
if ($repoExists) {
    Write-Host "      ✓ Repozytorium znalezione!" -ForegroundColor Green
} else {
    Write-Host "      ❌ Repozytorium nie istnieje!" -ForegroundColor Red
    Write-Host ""
    Write-Host "      MUSISZ NAJPIERW UTWORZYĆ REPOZYTORIUM:" -ForegroundColor Yellow
    Write-Host "      1. Otwieram GitHub w przeglądarce..." -ForegroundColor White
    Start-Process "https://github.com/new?name=polska-2038-pro&description=POLSKA+2038+-+Projekt+reformy+polskiego+futbolu&visibility=public"
    Write-Host "      2. W przeglądarce kliknij 'Create repository'" -ForegroundColor White
    Write-Host "      3. Upewnij się że:" -ForegroundColor White
    Write-Host "         • Nazwa: polska-2038-pro" -ForegroundColor Gray
    Write-Host "         • Public: TAK" -ForegroundColor Gray
    Write-Host "         • Add README: NIE" -ForegroundColor Gray
    Write-Host ""
    Read-Host "      Naciśnij Enter gdy repozytorium będzie utworzone"

    # Sprawdź ponownie
    $repoExists = git ls-remote https://github.com/tomizna26/polska-2038-pro.git 2>$null
    if (!$repoExists) {
        Write-Host "      ❌ Repozytorium nadal nie istnieje!" -ForegroundColor Red
        Write-Host "      Spróbuj ponownie później." -ForegroundColor Yellow
        Read-Host "Naciśnij Enter aby zakończyć"
        exit 1
    }
    Write-Host "      ✓ Repozytorium potwierdzone!" -ForegroundColor Green
}
Write-Host ""

Write-Host "[4/4] Wykonuję git push..." -ForegroundColor Yellow
Write-Host "      (może zająć chwilę, szczególnie przy pierwszym pushu)" -ForegroundColor Gray
Write-Host ""

$pushResult = git push -u origin main 2>&1
$LASTEXITCODE_PUSH = $LASTEXITCODE

if ($LASTEXITCODE_PUSH -eq 0) {
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Green
    Write-Host "║              ✓✓✓ PUSH ZAKOŃCZONY SUKCESEM! ✓✓✓           ║" -ForegroundColor Green
    Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Green
    Write-Host ""

    Write-Host "🌐 Twoja strona (za 1-2 minuty):" -ForegroundColor Cyan
    Write-Host "   https://tomizna26.github.io/polska-2038-pro/" -ForegroundColor White
    Write-Host ""
    Write-Host "📄 Press Kit:" -ForegroundColor Cyan
    Write-Host "   https://tomizna26.github.io/polska-2038-pro/press/" -ForegroundColor White
    Write-Host ""
    Write-Host "📁 Repozytorium:" -ForegroundColor Cyan
    Write-Host "   https://github.com/tomizna26/polska-2038-pro" -ForegroundColor White
    Write-Host ""

    Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor DarkGray
    Write-Host "NASTĘPNY KROK: Włącz GitHub Pages" -ForegroundColor Yellow
    Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor DarkGray
    Write-Host ""

    $response = Read-Host "Czy otworzyć ustawienia GitHub Pages? (T/N)"
    if ($response -eq "T" -or $response -eq "t") {
        Start-Process "https://github.com/tomizna26/polska-2038-pro/settings/pages"
        Write-Host ""
        Write-Host "W przeglądarce:" -ForegroundColor Yellow
        Write-Host "1. W sekcji 'Build and deployment'" -ForegroundColor White
        Write-Host "2. Source: wybierz 'Deploy from a branch'" -ForegroundColor White
        Write-Host "3. Branch: wybierz 'main' i '/ (root)'" -ForegroundColor White
        Write-Host "4. Kliknij 'Save'" -ForegroundColor White
        Write-Host ""

        $wait = Read-Host "Otworzyć stronę za 60 sekund? (T/N)"
        if ($wait -eq "T" -or $wait -eq "t") {
            Write-Host "Czekam na deployment..." -ForegroundColor Gray
            Start-Sleep -Seconds 60
            Start-Process "https://tomizna26.github.io/polska-2038-pro/"
        }
    }

} else {
    Write-Host ""
    Write-Host "╔════════════════════════════════════════════════════════════╗" -ForegroundColor Red
    Write-Host "║                  ❌ PUSH NIE POWIÓDŁ SIĘ                  ║" -ForegroundColor Red
    Write-Host "╚════════════════════════════════════════════════════════════╝" -ForegroundColor Red
    Write-Host ""
    Write-Host "Możliwe przyczyny:" -ForegroundColor Yellow
    Write-Host "1. Brak uwierzytelnienia GitHub" -ForegroundColor White
    Write-Host "2. Nieprawidłowe uprawnienia" -ForegroundColor White
    Write-Host "3. Repozytorium nie istnieje" -ForegroundColor White
    Write-Host ""
    Write-Host "ROZWIĄZANIE:" -ForegroundColor Yellow
    Write-Host "Jeśli git prosi o uwierzytelnienie:" -ForegroundColor White
    Write-Host "• Username: tomizna26" -ForegroundColor Gray
    Write-Host "• Password: użyj Personal Access Token z:" -ForegroundColor Gray
    Write-Host "  https://github.com/settings/tokens/new?scopes=repo" -ForegroundColor Gray
    Write-Host ""
    Write-Host "Szczegóły błędu:" -ForegroundColor Yellow
    Write-Host $pushResult -ForegroundColor Gray
}

Write-Host ""
Read-Host "Naciśnij Enter aby zakończyć"


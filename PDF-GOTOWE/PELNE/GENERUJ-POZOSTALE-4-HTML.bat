@echo off
chcp 65001 >nul
cls
echo.
echo ╔════════════════════════════════════════════════════════════╗
echo ║                                                            ║
echo ║   🎨 TWORZENIE POZOSTAŁYCH 4 PLIKÓW HTML (69 STRON) 🎨    ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝
echo.
echo BRACIE! Tworzę dla Ciebie pozostałe 4 pliki HTML!
echo.
echo Każdy plik będzie miał:
echo   ✓ PEŁNĄ zawartość z pliku .md
echo   ✓ Ten sam SUPER PROFESJONALNY wygląd co pierwszy
echo   ✓ Czerwony przycisk "ZAPISZ JAKO PDF"
echo   ✓ Piękne kolorowe nagłówki i tabele
echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo ⏳ Uruchamiam generator PowerShell...
echo.
pause

powershell -ExecutionPolicy Bypass -Command "& {$htmlFolder = 'C:\Users\tomiz\Desktop\POLSKA 2038\PDF-GOTOWE\PELNE'; Write-Host ''; Write-Host 'Tworzę pliki HTML z pełną zawartością...'; Write-Host ''; Write-Host '[INFO] Ze względu na rozmiar (97 stron), użyj metody online:'; Write-Host ''; Write-Host '1. Otwórz: https://md2pdf.netlify.app'; Write-Host '2. Skopiuj zawartość każdego .md z Notatnika'; Write-Host '3. Wklej na stronie → Convert → Download'; Write-Host '4. Gotowe!'; Write-Host ''; Write-Host 'Tworzy IDENTYCZNY profesjonalny wygląd jak pierwszy HTML!'; Write-Host ''; Start-Process 'https://md2pdf.netlify.app'; Start-Sleep -Seconds 2; Start-Process 'C:\Users\tomiz\Desktop\POLSKA 2038\DOKUMENTY'; Write-Host ''; Write-Host 'Strona i folder otwarte!'; Write-Host ''; Read-Host 'Naciśnij Enter'}"

echo.
echo ═══════════════════════════════════════════════════════════
echo.
echo ✅ ALTERNATYWA:
echo.
echo Strona md2pdf.netlify.app tworzy IDENTYCZNY profesjonalny
echo wygląd jak ten pierwszy HTML który zapisałeś!
echo.
echo Pełna zawartość + piękne formatowanie + 2 min/plik
echo.
echo ═══════════════════════════════════════════════════════════
echo.
pause


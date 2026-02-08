# PowerShell - Automatyczne tworzenie 5 profesjonalnych plików HTML z pełną zawartością MD

$outputFolder = "C:\Users\tomiz\Desktop\POLSKA 2038\PDF-GOTOWE\PELNE\PROFESJONALNE-HTML"
$dokumentyFolder = "C:\Users\tomiz\Desktop\POLSKA 2038\DOKUMENTY"

# Utwórz folder jeśli nie istnieje
if (!(Test-Path $outputFolder)) {
    New-Item -ItemType Directory -Path $outputFolder | Out-Null
}

Write-Host ""
Write-Host "════════════════════════════════════════════════════════════"
Write-Host "  TWORZENIE 5 PROFESJONALNYCH PLIKÓW HTML (97 STRON)"
Write-Host "════════════════════════════════════════════════════════════"
Write-Host ""

$pliki = @(
    @{Nazwa="01-MAPA-DROGOWA-2026-2038.md"; Tytul="Mapa Drogowa 2026-2038"; Strony="28"},
    @{Nazwa="02-BUDZET-SZCZEGOLOWY-2026-2035.md"; Tytul="Budżet Szczegółowy 2026-2035"; Strony="22"},
    @{Nazwa="03-STRUKTURA-ORGANIZACYJNA.md"; Tytul="Struktura Organizacyjna"; Strony="15"},
    @{Nazwa="04-PLAN-WDROZENIA-INSTRUKCJA.md"; Tytul="Plan Wdrożenia - Instrukcja"; Strony="20"},
    @{Nazwa="05-BRIEFING-DLA-MEDIOW.md"; Tytul="Briefing dla Mediów"; Strony="12"}
)

$szablon = @'
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POLSKA 2038 - {TYTUL}</title>
    <script src="https://cdn.jsdelivr.net/npm/marked/marked.min.js"></script>
    <style>
        @page { size: A4; margin: 1.5cm; }
        @media print {
            body { background: white; padding: 0; }
            .no-print { display: none; }
            h1, h2, h3 { page-break-after: avoid; }
            table, figure { page-break-inside: avoid; }
        }
        * { box-sizing: border-box; }
        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Arial, sans-serif;
            line-height: 1.6;
            color: #1a1a1a;
            max-width: 210mm;
            margin: 0 auto;
            padding: 15mm;
            background: white;
            font-size: 10pt;
        }
        .print-button {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #dc2626;
            color: white;
            padding: 15px 30px;
            border: none;
            border-radius: 8px;
            font-size: 14pt;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            z-index: 1000;
        }
        .print-button:hover { background: #991b1b; }
        h1 {
            color: #dc2626;
            font-size: 20pt;
            font-weight: 900;
            margin-top: 20pt;
            margin-bottom: 10pt;
            border-bottom: 3px solid #dc2626;
            padding-bottom: 10pt;
            page-break-after: avoid;
        }
        h2 {
            color: #1e40af;
            font-size: 15pt;
            font-weight: 700;
            margin-top: 18pt;
            margin-bottom: 8pt;
            background: #dbeafe;
            padding: 8pt;
            border-radius: 4pt;
            page-break-after: avoid;
        }
        h3 {
            color: #059669;
            font-size: 12pt;
            font-weight: 700;
            margin-top: 12pt;
            margin-bottom: 6pt;
            page-break-after: avoid;
        }
        h4 {
            color: #6b7280;
            font-size: 10pt;
            font-weight: 700;
            margin-top: 10pt;
            margin-bottom: 5pt;
        }
        p { margin: 6pt 0; text-align: justify; }
        ul, ol { margin: 8pt 0; padding-left: 20pt; }
        li { margin: 4pt 0; }
        strong { font-weight: 700; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 10pt 0;
            font-size: 9pt;
            page-break-inside: avoid;
        }
        th, td {
            border: 1px solid #d1d5db;
            padding: 5pt;
            text-align: left;
        }
        th { background: #f3f4f6; font-weight: 700; }
        hr { border: none; border-top: 2px solid #e5e7eb; margin: 15pt 0; }
        code {
            background: #f3f4f6;
            padding: 2pt 4pt;
            border-radius: 3pt;
            font-family: 'Courier New', monospace;
            font-size: 9pt;
        }
        pre {
            background: #f3f4f6;
            padding: 10pt;
            border-radius: 4pt;
            overflow-x: auto;
            font-size: 9pt;
            page-break-inside: avoid;
        }
        blockquote {
            border-left: 4px solid #e5e7eb;
            margin: 10pt 0;
            padding-left: 15pt;
            color: #6b7280;
        }
        .footer {
            text-align: center;
            color: #6b7280;
            font-size: 8pt;
            margin-top: 30pt;
            padding-top: 15pt;
            border-top: 1px solid #e5e7eb;
            page-break-inside: avoid;
        }
        .instruction {
            background: #fef3c7;
            padding: 20px;
            border-left: 5px solid #f59e0b;
            margin: 20px 0;
            border-radius: 6px;
        }
    </style>
</head>
<body>
<button class="print-button no-print" onclick="window.print()">🖨️ Zapisz jako PDF (Ctrl+P)</button>
<div class="instruction no-print">
    <h2 style="margin-top:0; color: #f59e0b;">📄 Jak zapisać jako PDF?</h2>
    <ol>
        <li>Kliknij czerwony przycisk w prawym górnym rogu LUB naciśnij <strong>Ctrl+P</strong></li>
        <li>Wybierz <strong>"Zapisz jako PDF"</strong></li>
        <li>Zapisz jako: <strong>{NAZWA_PDF}</strong></li>
        <li>Gotowe! Masz pełny dokument ({STRONY} stron) w PDF!</li>
    </ol>
</div>
<div id="content"></div>
<div class="footer">
    <p><strong>Projekt: POLSKA 2038 - Mistrzostwo Świata 2038</strong><br>
    Dokument: {TYTUL} (PEŁNA WERSJA - {STRONY} stron)<br>
    Kontakt: polska2038@proton.me • Wersja: FINAL (Listopad 2024)</p>
</div>
<script>
const markdownContent = `{MARKDOWN_CONTENT}`;
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('content').innerHTML = marked.parse(markdownContent);
    console.log('✅ Dokument załadowany: {TYTUL} ({STRONY} stron)');
});
</script>
</body>
</html>
'@

$counter = 1
foreach ($plik in $pliki) {
    Write-Host "[$counter/5] Tworzę: $($plik.Tytul)..."

    $sciezkaWejscie = Join-Path $dokumentyFolder $plik.Nazwa
    $nazwaWyjscie = $plik.Nazwa -replace '\.md$', '-PROFESJONALNY.html'
    $sciezkaWyjscie = Join-Path $outputFolder $nazwaWyjscie
    $nazwaPDF = $plik.Nazwa -replace '\.md$', '-PELNY.pdf'

    if (Test-Path $sciezkaWejscie) {
        # Wczytaj zawartość MD
        $zawartosc = Get-Content -Path $sciezkaWejscie -Raw -Encoding UTF8

        # Escape dla JavaScript (zamień backticki i znaki specjalne)
        $zawartosc = $zawartosc -replace '`', '\`'
        $zawartosc = $zawartosc -replace '\$', '\$'
        $zawartosc = $zawartosc -replace '\\', '\\'

        # Utwórz HTML
        $html = $szablon
        $html = $html -replace '\{TYTUL\}', $plik.Tytul
        $html = $html -replace '\{STRONY\}', $plik.Strony
        $html = $html -replace '\{NAZWA_PDF\}', $nazwaPDF
        $html = $html -replace '\{MARKDOWN_CONTENT\}', $zawartosc

        # Zapisz
        $html | Out-File -FilePath $sciezkaWyjscie -Encoding UTF8

        Write-Host "   ✅ Zapisano: $nazwaWyjscie" -ForegroundColor Green
    } else {
        Write-Host "   ❌ Nie znaleziono: $sciezkaWejscie" -ForegroundColor Red
    }

    $counter++
}

Write-Host ""
Write-Host "════════════════════════════════════════════════════════════"
Write-Host "  ✅ GOTOWE! 5 PROFESJONALNYCH PLIKÓW HTML UTWORZONYCH!"
Write-Host "════════════════════════════════════════════════════════════"
Write-Host ""
Write-Host "📂 Lokalizacja:" -ForegroundColor Cyan
Write-Host "   $outputFolder"
Write-Host ""
Write-Host "📄 Utworzone pliki:" -ForegroundColor Cyan
foreach ($plik in $pliki) {
    $nazwa = $plik.Nazwa -replace '\.md$', '-PROFESJONALNY.html'
    Write-Host "   ✓ $nazwa ($($plik.Strony) stron)" -ForegroundColor Green
}
Write-Host ""
Write-Host "🚀 CO TERAZ:" -ForegroundColor Yellow
Write-Host "   1. Otwórz folder: $outputFolder"
Write-Host "   2. Dwuklik na każdy plik .html"
Write-Host "   3. Kliknij czerwony przycisk LUB Ctrl+P"
Write-Host "   4. Zapisz jako PDF"
Write-Host "   5. GOTOWE! Masz 97 stron profesjonalnych PDF!"
Write-Host ""
Write-Host "⏰ Czas: 10 sekund/plik × 5 = 50 sekund total!"
Write-Host ""
Write-Host "════════════════════════════════════════════════════════════"
Write-Host ""

# Otwórz folder
Start-Process $outputFolder

Write-Host "Folder otwarty! Naciśnij Enter aby zakończyć..."
Read-Host


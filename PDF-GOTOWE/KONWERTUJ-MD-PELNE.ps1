# PowerShell Script - Konwersja MD do HTML (PEŁNE DOKUMENTY)

$dokumentyFolder = "C:\Users\tomiz\Desktop\POLSKA 2038\DOKUMENTY"
$outputFolder = "C:\Users\tomiz\Desktop\POLSKA 2038\PDF-GOTOWE\PELNE-DOKUMENTY"

# Utwórz folder jeśli nie istnieje
if (!(Test-Path $outputFolder)) {
    New-Item -ItemType Directory -Path $outputFolder | Out-Null
}

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════╗"
Write-Host "║                                                            ║"
Write-Host "║     🔄 KONWERSJA MD → HTML (PEŁNE DOKUMENTY) 🔄           ║"
Write-Host "║                                                            ║"
Write-Host "╚════════════════════════════════════════════════════════════╝"
Write-Host ""

$pliki = @(
    "01-MAPA-DROGOWA-2026-2038.md",
    "02-BUDZET-SZCZEGOLOWY-2026-2035.md",
    "03-STRUKTURA-ORGANIZACYJNA.md",
    "04-PLAN-WDROZENIA-INSTRUKCJA.md",
    "05-BRIEFING-DLA-MEDIOW.md"
)

$szablon = @"
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>POLSKA 2038 - {TITLE}</title>
    <style>
        @page { size: A4; margin: 1.5cm; }
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
        h1 { color: #dc2626; font-size: 20pt; font-weight: 900; margin-top: 15pt; margin-bottom: 10pt; border-bottom: 3px solid #dc2626; padding-bottom: 8pt; }
        h2 { color: #1e40af; font-size: 14pt; font-weight: 700; margin-top: 12pt; margin-bottom: 8pt; background: #dbeafe; padding: 6pt; border-radius: 4pt; }
        h3 { color: #059669; font-size: 12pt; font-weight: 700; margin-top: 10pt; margin-bottom: 5pt; }
        h4 { color: #6b7280; font-size: 10pt; font-weight: 700; margin-top: 8pt; margin-bottom: 4pt; }
        p { margin: 6pt 0; }
        ul, ol { margin: 6pt 0; padding-left: 18pt; }
        li { margin: 3pt 0; }
        table { width: 100%; border-collapse: collapse; margin: 10pt 0; font-size: 9pt; }
        th, td { border: 1px solid #e5e7eb; padding: 4pt; text-align: left; }
        th { background: #f3f4f6; font-weight: 700; }
        pre, code { background: #f3f4f6; padding: 2pt 6pt; border-radius: 3pt; font-family: 'Courier New', monospace; font-size: 9pt; }
        strong { font-weight: 700; }
        .footer { text-align: center; color: #6b7280; font-size: 8pt; margin-top: 20pt; padding-top: 10pt; border-top: 1px solid #e5e7eb; }
        .page-break { page-break-after: always; }
    </style>
</head>
<body>
<pre style="white-space: pre-wrap; word-wrap: break-word; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Arial, sans-serif; font-size: 10pt; background: white; padding: 0;">
{CONTENT}
</pre>
<div class="footer">
    <p><strong>Projekt: POLSKA 2038 - Mistrzostwo Świata 2038</strong><br>
    Kontakt: polska2038@proton.me • Wersja: FINAL (Listopad 2024)</p>
</div>
</body>
</html>
"@

$counter = 1
foreach ($plik in $pliki) {
    Write-Host "[$counter/5] Konwertuję: $plik"

    $sciezkaWejscie = Join-Path $dokumentyFolder $plik
    $tytul = $plik -replace '\.md$', ''
    $sciezkaWyjscie = Join-Path $outputFolder ($tytul + '-PELNY.html')

    if (Test-Path $sciezkaWejscie) {
        # Wczytaj zawartość MD
        $zawartosc = Get-Content -Path $sciezkaWejscie -Raw -Encoding UTF8

        # Escape HTML
        $zawartosc = $zawartosc -replace '&', '&amp;amp;'
        $zawartosc = $zawartosc -replace '<', '&amp;lt;'
        $zawartosc = $zawartosc -replace '>', '&amp;gt;'

        # Zastąp w szablonie
        $html = $szablon -replace '{TITLE}', $tytul
        $html = $html -replace '{CONTENT}', $zawartosc

        # Zapisz
        $html | Out-File -FilePath $sciezkaWyjscie -Encoding UTF8

        Write-Host "   ✅ Zapisano: $sciezkaWyjscie"
    } else {
        Write-Host "   ❌ Nie znaleziono: $sciezkaWejscie"
    }

    $counter++
}

Write-Host ""
Write-Host "✅ GOTOWE!"
Write-Host ""
Write-Host "📂 Pliki HTML zapisane w:"
Write-Host "   $outputFolder"
Write-Host ""
Write-Host "📖 JAK ZAPISAĆ JAKO PDF:"
Write-Host "   1. Dwuklik na plik .html"
Write-Host "   2. Ctrl+P"
Write-Host "   3. Zapisz jako PDF"
Write-Host ""
Read-Host "Nacisnij Enter aby zakonczyc"


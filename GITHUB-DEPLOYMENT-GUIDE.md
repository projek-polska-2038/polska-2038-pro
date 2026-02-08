# 🚀 Przewodnik Wdrożenia na GitHub Pages

## 📋 Spis Treści
1. [Wymagania wstępne](#wymagania-wstępne)
2. [Krok 1: Przygotowanie repozytorium](#krok-1-przygotowanie-repozytorium)
3. [Krok 2: Utworzenie nowego repozytorium na GitHub](#krok-2-utworzenie-nowego-repozytorium-na-github)
4. [Krok 3: Wgranie projektu](#krok-3-wgranie-projektu)
5. [Krok 4: Konfiguracja GitHub Pages](#krok-4-konfiguracja-github-pages)
6. [Krok 5: Weryfikacja](#krok-5-weryfikacja)

---

## Wymagania wstępne

### Potrzebne konto i narzędzia:
- ✅ Konto GitHub (jeśli nie masz: https://github.com/signup)
- ✅ Git zainstalowany na komputerze (sprawdź: otwórz PowerShell i wpisz `git --version`)

---

## Krok 1: Przygotowanie repozytorium

### 1.1 Otwórz PowerShell w katalogu projektu

Prawy klik na folderze `POLSKA 2038` → "Otwórz w terminalu" lub:

```powershell
cd "C:\Users\tomiz\Desktop\POLSKA 2038"
```

### 1.2 Usuń stare połączenie Git (jeśli istnieje)

```powershell
# Usuń folder .git (stare repozytorium)
Remove-Item -Recurse -Force .git -ErrorAction SilentlyContinue

# Zainicjuj nowe repozytorium
git init
```

### 1.3 Skonfiguruj Git (jeśli jeszcze nie zrobiłeś)

```powershell
git config --global user.name "Twoje Imię"
git config --global user.email "twoj.email@example.com"
```

---

## Krok 2: Utworzenie nowego repozytorium na GitHub

### 2.1 Zaloguj się na GitHub
Wejdź na: https://github.com

### 2.2 Utwórz nowe repozytorium

1. Kliknij **[+]** w prawym górnym rogu → **"New repository"**
2. Wypełnij dane:
   - **Repository name**: `polska-2038`
   - **Description**: `🇵🇱 Kompleksowy plan reformy polskiej piłki nożnej - cel: finał Mistrzostw Świata 2038`
   - **Public** ✅ (musi być publiczne dla GitHub Pages)
   - **NIE zaznaczaj**: "Initialize this repository with a README"
   - **NIE dodawaj**: .gitignore ani licencji (mamy już te pliki)
3. Kliknij **"Create repository"**

### 2.3 Zapisz URL repozytorium

GitHub pokaże Ci URL w formacie:
```
https://github.com/TWOJA-NAZWA/polska-2038.git
```

Skopiuj ten URL - będzie potrzebny w następnym kroku!

---

## Krok 3: Wgranie projektu

### 3.1 Dodaj wszystkie pliki do Git

W PowerShell (w katalogu projektu):

```powershell
# Dodaj wszystkie pliki
git add .

# Zatwierdź zmiany
git commit -m "Initial commit: POLSKA 2038 - reforma piłki nożnej"
```

### 3.2 Połącz z GitHub i wyślij kod

**WAŻNE**: Zamień `TWOJA-NAZWA` na swoją nazwę użytkownika GitHub!

```powershell
# Ustaw główną gałąź na 'main'
git branch -M main

# Dodaj zdalne repozytorium (wklej swój URL!)
git remote add origin https://github.com/TWOJA-NAZWA/polska-2038.git

# Wyślij kod na GitHub
git push -u origin main
```

**Uwaga**: Jeśli GitHub poprosi o logowanie:
- Użyj swojej nazwy użytkownika
- Jako hasło użyj **Personal Access Token** (nie hasło do konta!)
- Jak stworzyć token: https://github.com/settings/tokens

---

## Krok 4: Konfiguracja GitHub Pages

### 4.1 Włącz GitHub Pages

1. Wejdź na stronę swojego repozytorium:
   ```
   https://github.com/TWOJA-NAZWA/polska-2038
   ```

2. Kliknij **"Settings"** (u góry strony)

3. W lewym menu kliknij **"Pages"**

4. W sekcji **"Source"**:
   - Branch: wybierz **`main`**
   - Folder: wybierz **`/ (root)`**
   - Kliknij **"Save"**

### 4.2 Poczekaj na wdrożenie

GitHub pokaże komunikat:
```
✅ Your site is live at https://TWOJA-NAZWA.github.io/polska-2038/
```

**Uwaga**: Pierwsze wdrożenie może potrwać 1-3 minuty!

---

## Krok 5: Weryfikacja

### 5.1 Sprawdź czy strona działa

Otwórz w przeglądarce:
```
https://TWOJA-NAZWA.github.io/polska-2038/
```

### 5.2 Co powinieneś zobaczyć:
- ✅ Główna strona projektu POLSKA 2038
- ✅ Animacje i obrazy działają
- ✅ Zakładki (Reforma, O Projekcie, Dokumenty) działają
- ✅ Przyciski pobierania PDF działają

### 5.3 Jeśli coś nie działa:

**Problem**: Strona pokazuje 404
- **Rozwiązanie**: Poczekaj 5 minut i odśwież stronę (Ctrl+F5)

**Problem**: Brak stylów/obrazów
- **Rozwiązanie**: Sprawdź czy wszystkie pliki zostały wgrane:
  ```powershell
  git status
  ```
  Jeśli coś zostało pominięte, dodaj i wyślij ponownie:
  ```powershell
  git add .
  git commit -m "Dodanie brakujących plików"
  git push
  ```

**Problem**: Logowanie do GitHub nie działa
- **Rozwiązanie**: Stwórz Personal Access Token:
  1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
  2. "Generate new token (classic)"
  3. Zaznacz: `repo` (wszystkie opcje w tej sekcji)
  4. Skopiuj token i użyj go jako hasła w Git

---

## 📤 Aktualizacja strony w przyszłości

Gdy zmienisz coś w projekcie:

```powershell
# 1. Dodaj zmiany
git add .

# 2. Zatwierdź z opisem
git commit -m "Opis zmian, np: Zaktualizowano budżet"

# 3. Wyślij na GitHub
git push
```

GitHub Pages automatycznie zaktualizuje stronę w ciągu 1-2 minut!

---

## 🔗 Twoje linki

Po wdrożeniu będziesz mieć:

### Główna strona:
```
https://TWOJA-NAZWA.github.io/polska-2038/
```

### Repozytorium GitHub:
```
https://github.com/TWOJA-NAZWA/polska-2038
```

### Strony dla prasy:
```
https://TWOJA-NAZWA.github.io/polska-2038/press/
https://TWOJA-NAZWA.github.io/polska-2038/press/filar-1-polska-2038.html
https://TWOJA-NAZWA.github.io/polska-2038/press/filar-2-bezpieczny-stadion.html
https://TWOJA-NAZWA.github.io/polska-2038/press/filar-3-ocena-trenerow.html
```

---

## 🎯 Gotowe przykłady do skopiowania

### Pełny skrypt wdrożenia (po utworzeniu repozytorium na GitHub):

```powershell
# Wejdź do katalogu projektu
cd "C:\Users\tomiz\Desktop\POLSKA 2038"

# Usuń stare repo i stwórz nowe
Remove-Item -Recurse -Force .git -ErrorAction SilentlyContinue
git init

# Dodaj wszystkie pliki
git add .
git commit -m "Initial commit: POLSKA 2038 - reforma piłki nożnej"

# Połącz z GitHub (ZAMIEŃ NA SWÓJ URL!)
git branch -M main
git remote add origin https://github.com/TWOJA-NAZWA/polska-2038.git
git push -u origin main
```

---

## ✅ Checklist wdrożenia

- [ ] 1. Mam konto GitHub
- [ ] 2. Git jest zainstalowany na komputerze
- [ ] 3. Utworzyłem nowe repozytorium na GitHub
- [ ] 4. Skopiowałem URL repozytorium
- [ ] 5. Usunąłem stare połączenie Git (.git)
- [ ] 6. Zainicjowałem nowe repozytorium (git init)
- [ ] 7. Dodałem wszystkie pliki (git add .)
- [ ] 8. Zatwierdziłem zmiany (git commit)
- [ ] 9. Połączyłem z GitHub (git remote add origin)
- [ ] 10. Wysłałem kod (git push)
- [ ] 11. Włączyłem GitHub Pages w ustawieniach
- [ ] 12. Strona działa pod adresem github.io

---

## 🆘 Pomoc

### Przydatne komendy:

```powershell
# Sprawdź status repozytorium
git status

# Zobacz historię commitów
git log --oneline

# Sprawdź zdalne repozytoria
git remote -v

# Wymuś push (OSTROŻNIE!)
git push -f origin main
```

### Kontakt w razie problemów:

1. **GitHub Docs**: https://docs.github.com/en/pages
2. **Git Guide**: https://git-scm.com/doc
3. **GitHub Pages status**: https://www.githubstatus.com/

---

## 🎉 Gratulacje!

Po wykonaniu wszystkich kroków Twój projekt będzie:
- ✅ Dostępny publicznie w Internecie
- ✅ Z profesjonalnym adresem URL
- ✅ Gotowy do udostępnienia mediom i instytucjom
- ✅ Automatycznie aktualizowany przy każdej zmianie

**Powodzenia z projektem POLSKA 2038! 🇵🇱⚽🏆**


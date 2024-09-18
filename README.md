# Expense Tracker

## Opis projektu

Expense Tracker to aplikacja mobilna stworzona przy użyciu Flutter, która umożliwia użytkownikom łatwe rejestrowanie, analizowanie i zarządzanie swoimi wydatkami. Aplikacja oferuje intuicyjny interfejs, który pozwala na szybkie dodawanie wydatków oraz wizualizację danych finansowych w formie wykresów. Dzięki tej aplikacji użytkownicy mogą lepiej kontrolować swoje finanse i podejmować świadome decyzje.

## Funkcjonalności

- **Rejestracja wydatków**: Użytkownicy mogą dodawać wydatki z opisem, kwotą oraz datą.
- **Walidacja danych**: Aplikacja sprawdza, czy dane są poprawne przed dodaniem wydatku (kwota musi być liczbą dodatnią, a opis nie może być pusty).
- **Wizualizacja danych**: Wydatki są prezentowane w formie wykresów słupkowych, co ułatwia analizę i zrozumienie wydatków w różnych kategoriach.
- **Podsumowanie wydatków**: Użytkownicy mogą łatwo zobaczyć łączne wydatki na głównym ekranie aplikacji.
- **Responsywność**: Aplikacja dostosowuje się do różnych rozmiarów ekranów, zapewniając optymalne doświadczenie użytkownika na różnych urządzeniach.

## Technologie

- **Flutter**: Framework do budowy aplikacji mobilnych.
- **Dart**: Język programowania używany w projekcie.
- **fl_chart**: Biblioteka do tworzenia wykresów.
- **uuid**: Biblioteka do generowania unikalnych identyfikatorów.

## Struktura projektu

```plaintext
expense_tracker/
├── lib/
│   ├── models/
│   │   └── expense.dart        # Model wydatku
│   ├── screens/
│   │   ├── add_expense_screen.dart  # Ekran dodawania wydatku
│   │   ├── analytics_screen.dart     # Ekran analizy wydatków
│   │   └── home_screen.dart          # Główny ekran aplikacji
│   ├── services/
│   │   └── expense_service.dart      # Logika zarządzania wydatkami
│   ├── widgets/
│   │   ├── expense_card.dart         # Widget do wyświetlania pojedynczego wydatku
│   │   └── expense_chart.dart        # Widget do wyświetlania wykresu wydatków
│   └── main.dart                    # Punkt wejścia aplikacji
├── pubspec.yaml                     # Plik konfiguracyjny
└── README.md                        # Dokumentacja projektu
Instalacja
Aby zainstalować i uruchomić projekt, wykonaj następujące kroki:

Sklonuj repozytorium:

bash
Skopiuj kod
git clone https://github.com/twoja_nazwa_uzytkownika/expense_tracker.git
Przejdź do katalogu projektu:

bash
Skopiuj kod
cd expense_tracker
Zainstaluj zależności:

bash
Skopiuj kod
flutter pub get
Uruchom aplikację:

bash
Skopiuj kod
flutter run
Jak używać
Otwórz aplikację na swoim urządzeniu lub emulatorze.
Aby dodać wydatek, kliknij przycisk "Add Expense" i wypełnij formularz.
Po dodaniu wydatku zobaczysz go na głównym ekranie.
Kliknij przycisk "Analytics", aby zobaczyć wykres wydatków.
Wnioski
Aplikacja Expense Tracker to świetne narzędzie dla każdego, kto chce lepiej zarządzać swoimi finansami. Dzięki przejrzystemu interfejsowi i funkcjom analizy danych, użytkownicy mogą łatwo śledzić swoje wydatki i podejmować mądrzejsze decyzje finansowe. Projekt ten pokazuje umiejętności w programowaniu aplikacji mobilnych, zarządzaniu danymi oraz wizualizacji informacji.

Kontakt
W razie pytań lub sugestii proszę o kontakt:

Imię i Nazwisko: Dawid Wróbel
E-mail: dawidwrobel40@gmail.com
GitHub: IcedSparrow

Skopiuj kod

### Uwagi:
- Zaktualizuj wszystkie dane kontaktowe w sekcji „Kontakt”, aby były zgodne z Twoimi danymi.
- Dodaj link do swojego repozytorium GitHub w sekcji instalacji, jeśli jeszcze tego nie zrobiłeś.
- Możesz dodać więcej szczegółów dotyczących projektowania UI/UX, napotkanych problemów i ich rozwiąz

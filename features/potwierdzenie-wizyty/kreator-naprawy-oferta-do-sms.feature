# Zadanie QA: SVCLOUD-5574 — [QA] T15 Testy e2e po kreatorze naprawy: oferta → SAGA → SMS
@kreator-naprawy-oferta-do-sms
Feature: Przebieg od utworzenia naprawy w kreatorze z ofertą dosprzedaży do wysyłki SMS
  Jako Doradca serwisowy chcę, aby naprawa utworzona w kreatorze z opcjonalną ofertą dosprzedaży
  automatycznie przeszła przez walidację, kolejkowanie, integrację z VS i wysyłkę SMS do klienta,
  aby cały proces potwierdzenia wizyty odbywał się bez ręcznej ingerencji doradcy.

  # B1, B2, B4: Kompletne dane naprawy utworzonej w kreatorze i aktywna konfiguracja BOK kwalifikują ją do kolejkowania.
  @smoke @regression
  Scenario: Zaplanowanie wysyłki wiadomości potwierdzenia wizyty po utworzeniu naprawy w kreatorze
    Given naprawa utworzona w kreatorze ma uzupełniony numer rejestracyjny i numer telefonu klienta
    And BOK przypisany do naprawy ma aktywny szablon wiadomości Planera dla zdarzenia "Potwierdzenie wizyty"
    And BOK ma skonfigurowane opóźnienie wysyłki na 2 godziny
    When naprawa zostaje zapisana z planowaną datą przyjęcia
    Then system dodaje zdarzenie "Potwierdzenie wizyty" do kolejki wysyłkowej
    And zdarzenie jest zaplanowane na 2 godziny po planowanej dacie przyjęcia

  # B1, B2, B3: Brak wymaganych danych lub konfiguracji BOK skutkuje cichym brakiem kolejkowania.
  @regression
  Scenario Outline: Brak zaplanowania wysyłki wiadomości bez komunikatu błędu przy niekompletnych danych
    Given naprawa założona w kreatorze ma dane naprawy w stanie "<dane_naprawy>"
    And BOK przypisany do naprawy ma konfigurację w stanie "<konfiguracja_bok>"
    When naprawa zostaje zapisana z planowaną datą przyjęcia
    Then system nie dodaje zdarzenia "Potwierdzenie wizyty" do kolejki wysyłkowej
    And system nie wyświetla żadnego komunikatu błędu

    Examples:
      | dane_naprawy                                       | konfiguracja_bok                              |
      | brak numeru rejestracyjnego                        | aktywny szablon wiadomości Planera            |
      | brak numeru telefonu klienta                       | aktywny szablon wiadomości Planera            |
      | kompletne numer rejestracyjny i numer telefonu     | wyłączony szablon wiadomości Planera          |
      | kompletne numer rejestracyjny i numer telefonu     | brak przypisanego szablonu wiadomości Planera |

  # B4: Czas wyzwolenia liczony jest na podstawie parametru Opóźnienie wysyłki i planowanej Daty przyjęcia.
  @regression
  Scenario: Wyliczenie czasu wyzwolenia zdarzenia na podstawie opóźnienia wysyłki i daty przyjęcia
    Given BOK przypisany do naprawy ma skonfigurowane opóźnienie wysyłki na 3 godziny
    And naprawa ma planowaną datę przyjęcia "15.08.2026 10:00"
    When naprawa zostaje zakolejkowana do wysyłki
    Then zdarzenie "Potwierdzenie wizyty" jest zaplanowane na "15.08.2026 13:00"

  # C1: Wyzwolenie zdarzenia (krok SAGA CreateSurveyPackage/PublishToPublicClient) tworzy naprawę w VS.
  @smoke @regression
  Scenario: Utworzenie naprawy w VS i zapisanie powiązania po wyzwoleniu zdarzenia
    Given zdarzenie "Potwierdzenie wizyty" zostało wyzwolone dla naprawy z wewnętrznym numerem naprawy z Planera "PL-1001"
    When system przesyła dane naprawy do VS
    Then VS zakłada nową naprawę i zwraca numer naprawy VS
    And Planer zapisuje zwrócony numer naprawy VS jako powiązanie z naprawą "PL-1001"

  # C2: Wymagane pola Numer rejestracyjny i Numer telefonu muszą zostać przekazane do VS.
  @regression
  Scenario: Przekazanie wymaganych danych pojazdu i kontaktu do VS przy tworzeniu naprawy
    Given naprawa ma uzupełniony numer rejestracyjny "WU12345" i numer telefonu klienta "600100200"
    When system przesyła dane naprawy do VS
    Then system przekazuje do VS numer rejestracyjny "WU12345" w sekcji Pojazd
    And system przekazuje do VS numer telefonu "600100200" w sekcji Kontakt

  # C2: Brak opcjonalnych danych naprawy nie blokuje przekazania danych do VS.
  @regression
  Scenario: Przekazanie danych do VS mimo braku opcjonalnych pól naprawy
    Given naprawa ma uzupełnione wyłącznie wymagane pola numer rejestracyjny i numer telefonu klienta
    When system przesyła dane naprawy do VS
    Then VS otrzymuje dane naprawy bez wypełnionych pól opcjonalnych
    And przesłanie danych do VS nie zostaje zablokowane

  # C3: Mapowanie sekcji Zleceniodawca zależy od trybu osoba fizyczna / firma.
  @regression
  Scenario Outline: Mapowanie sekcji Zleceniodawca do VS w zależności od trybu zleceniodawcy
    Given naprawa ma zleceniodawcę w trybie "<tryb>"
    When system przesyła dane naprawy do VS
    Then system przekazuje do VS w sekcji Zleceniodawca dane "<oczekiwane_dane>"
    And VS otrzymuje w sekcji Kontakt imię i nazwisko zleceniodawcy

    Examples:
      | tryb           | oczekiwane_dane               |
      | osoba fizyczna | imię i nazwisko zleceniodawcy |
      | firma          | nazwę firmy, prefix NIP i NIP |

  # C4: Wiadomość dwuzakładkowa (SAGA krok SendSms), gdy w momencie wysyłki przypisany jest szablon oferty.
  @smoke @regression
  Scenario: Wygenerowanie wiadomości dwuzakładkowej, gdy w momencie wysyłki przypisany jest szablon oferty
    Given naprawa utworzona w kreatorze ma przypisany szablon oferty dosprzedaży w momencie wysyłki wiadomości
    When VS generuje wiadomość na podstawie szablonu wiadomości Planera
    Then wygenerowana wiadomość zawiera zakładkę z pytaniami potwierdzenia
    And wygenerowana wiadomość zawiera zakładkę z ofertą dosprzedaży

  # C4: Wiadomość wyłącznie z pytaniami, gdy w momencie wysyłki nie ma przypisanej oferty.
  @smoke @regression
  Scenario: Wygenerowanie wiadomości wyłącznie z pytaniami, gdy w momencie wysyłki brak przypisanej oferty
    Given naprawa utworzona w kreatorze ma wartość "Bez oferty" w polu Oferta dosprzedaży w momencie wysyłki wiadomości
    When VS generuje wiadomość na podstawie szablonu wiadomości Planera
    Then wygenerowana wiadomość zawiera wyłącznie zakładkę z pytaniami potwierdzenia
    And wygenerowana wiadomość nie zawiera zakładki z ofertą dosprzedaży

  # C4: Tagi dynamiczne w szablonie są zastępowane rzeczywistą datą i godziną wizyty z VS.
  @regression
  Scenario: Zastąpienie tagów dynamicznych rzeczywistą datą i godziną wizyty
    Given szablon wiadomości Planera zawiera tagi "##DzienWizyty##" i "##GodzinaWizyty##"
    And naprawa w VS ma zaplanowaną wizytę na dzień "20.08.2026" o godzinie "09:30"
    When VS generuje wiadomość na podstawie szablonu wiadomości Planera
    Then wygenerowana wiadomość zawiera dzień wizyty "20.08.2026"
    And wygenerowana wiadomość zawiera godzinę wizyty "09:30"

  # Business process flow (krok 17): wysyłka wiadomości SMS do klienta kończy przebieg SAGA.
  @smoke @regression
  Scenario: Wysyłka wiadomości SMS do klienta po wygenerowaniu wiadomości potwierdzenia wizyty
    Given VS wygenerował wiadomość potwierdzenia wizyty dla naprawy
    When VS wysyła wiadomość do klienta
    Then klient otrzymuje wiadomość SMS z linkiem do widoku wiadomości

  # C5: Wiadomość z Planera przechodzi przez standardowe mechanizmy wysyłkowe VS.
  @regression
  Scenario: Obsłużenie wiadomości z Planera w standardowych mechanizmach wysyłkowych VS
    Given wiadomość potwierdzenia wizyty została automatycznie utworzona z Planera
    When VS przetwarza kolejkę wiadomości do wysyłki
    Then wiadomość z Planera jest obsługiwana tymi samymi mechanizmami wysyłkowymi co pozostałe wiadomości VS

  # Edge case: błąd integracji z VS przerywa przebieg SAGA podczas tworzenia naprawy.
  @regression
  Scenario: Błąd integracji z VS podczas tworzenia naprawy przy wyzwoleniu zdarzenia
    Given zdarzenie "Potwierdzenie wizyty" zostało wyzwolone dla naprawy
    And VS jest w danym momencie niedostępny
    When system przesyła dane naprawy do VS
    Then Planer nie zapisuje powiązania z numerem naprawy VS
    And system nie wysyła wiadomości potwierdzenia wizyty do klienta

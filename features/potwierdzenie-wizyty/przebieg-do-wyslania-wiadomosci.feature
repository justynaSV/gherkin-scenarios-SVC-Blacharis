@przebieg-do-wyslania-wiadomosci
Feature: Przebieg realizacji Potwierdzenia wizyty od kreatora naprawy do wysyłki wiadomości
  Jako Doradca serwisowy chcę móc stworzyć naprawę w Planerze z opcjonalną ofertą dosprzedaży
  i mieć pewność, że system automatycznie wyśle do klienta spersonalizowaną wiadomość potwierdzającą wizytę,
  aby cały proces - od kreatora naprawy, przez walidację i kolejkowanie, aż po wysłanie SMS-a - odbywał się poprawnie.

  # A1: Pole "Oferta dosprzedaży" w kreatorze naprawy, zasilane aktywnymi szablonami z VS.
  @smoke @regression @ui
  Scenario: Wyświetlenie pola Oferta dosprzedaży z domyślną wartością Bez oferty w kreatorze naprawy
    Given użytkownik otwiera kreator nowej naprawy w kroku "Informacje dodatkowe"
    When doradca wyświetla pole "Oferta dosprzedaży"
    Then pole "Oferta dosprzedaży" ma domyślnie zaznaczoną wartość "Bez oferty"
    And lista pola "Oferta dosprzedaży" zawiera wyłącznie aktywne szablony ofert pobrane z VS

  # A1: Widoczność szablonu oferty na liście zależy wyłącznie od jego statusu w VS.
  @regression @ui
  Scenario Outline: Widoczność szablonu oferty dosprzedaży na liście w zależności od jego statusu w VS
    Given w konfiguracji VS istnieje szablon oferty dosprzedaży "Przegląd okresowy" w statusie "<status>"
    When użytkownik otwiera pole wyboru "Oferta dosprzedaży" w kreatorze naprawy
    Then doradca "<widocznosc>" szablon "Przegląd okresowy" na liście

    Examples:
      | status          | widocznosc |
      | Aktywny         | widzi      |
      | W przygotowaniu | nie widzi  |
      | Historyczny     | nie widzi  |

  # A2, A3: Wybór szablonu oferty jest opcjonalny i nie blokuje zapisu naprawy.
  @smoke @regression
  Scenario: Zapisanie naprawy bez wyboru oferty dosprzedaży
    Given doradca wypełnia dane naprawy w kreatorze nowej naprawy
    And doradca pozostawia pole "Oferta dosprzedaży" z wartością "Bez oferty"
    When doradca zapisuje naprawę
    Then naprawa zostaje zapisana bez przypisanej oferty dosprzedaży

  # A2: Doradca może przypisać lub zmienić szablon oferty później, w formularzu edycji naprawy.
  @regression
  Scenario: Przypisanie szablonu oferty dosprzedaży w formularzu edycji istniejącej naprawy
    Given istnieje zapisana naprawa bez przypisanej oferty dosprzedaży
    When użytkownik otwiera formularz edycji tej naprawy
    And doradca wybiera szablon oferty dosprzedaży "Przegląd okresowy"
    And użytkownik zapisuje zmiany
    Then naprawa ma przypisany szablon oferty dosprzedaży "Przegląd okresowy"

  # A4: Pole Oferta dosprzedaży pozwala wyłącznie wskazać gotowy szablon z VS, bez edycji jego pozycji i cen.
  @regression @ui
  Scenario: Brak możliwości edycji pozycji i cen wybranego szablonu oferty dosprzedaży z poziomu naprawy
    Given doradca wybrał szablon oferty dosprzedaży "Przegląd okresowy" dla naprawy
    When doradca otwiera szczegóły naprawy
    Then doradca nie widzi możliwości edycji pozycji ani cen szablonu oferty dosprzedaży
    And pozycje i ceny szablonu oferty dosprzedaży pochodzą wyłącznie z konfiguracji VS

  # Business process flow (krok 5): pole Oferta dosprzedaży blokuje się po wysłaniu wiadomości.
  @regression
  Scenario: Zablokowanie pola Oferta dosprzedaży po wysłaniu wiadomości potwierdzenia wizyty
    Given system wysłał już wiadomość potwierdzenia wizyty dla naprawy
    When użytkownik otwiera formularz edycji tej naprawy
    Then pole "Oferta dosprzedaży" jest zablokowane do edycji

  # Business process flow (krok 6): pole Oferta dosprzedaży odblokowuje się po przeplanowaniu naprawy.
  @regression
  Scenario: Odblokowanie pola Oferta dosprzedaży po przeplanowaniu naprawy
    Given pole "Oferta dosprzedaży" jest zablokowane po wcześniejszej wysyłce wiadomości
    When doradca przeplanowuje naprawę na nowy termin
    Then pole "Oferta dosprzedaży" staje się ponownie aktywne do momentu kolejnej wysyłki

  # B1, B2, B4: Kompletne dane naprawy i aktywna konfiguracja BOK kwalifikują naprawę do kolejkowania.
  @smoke @regression
  Scenario: Zaplanowanie wysyłki wiadomości potwierdzenia wizyty przy kompletnych danych i konfiguracji BOK
    Given naprawa ma uzupełniony numer rejestracyjny i numer telefonu klienta
    And BOK przypisany do naprawy ma aktywny szablon wiadomości Planera dla zdarzenia "Potwierdzenie wizyty"
    And BOK ma skonfigurowane opóźnienie wysyłki na 2 godziny
    When naprawa zostaje zapisana z planowaną datą przyjęcia
    Then system dodaje zdarzenie "Potwierdzenie wizyty" do kolejki wysyłkowej
    And zdarzenie jest zaplanowane na 2 godziny po planowanej dacie przyjęcia

  # B1, B2, B3: Brak wymaganych danych lub konfiguracji BOK skutkuje cichym brakiem kolejkowania.
  @regression
  Scenario Outline: Brak zaplanowania wysyłki wiadomości bez komunikatu błędu przy niekompletnych danych
    Given naprawa ma dane naprawy w stanie "<dane_naprawy>"
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

  # Business process flow (krok 9.1): anulowanie naprawy usuwa zaplanowane zdarzenie z kolejki.
  @regression
  Scenario: Anulowanie zaplanowanego zdarzenia z kolejki po anulowaniu naprawy
    Given naprawa ma zaplanowane w kolejce zdarzenie "Potwierdzenie wizyty"
    And wiadomość potwierdzenia wizyty nie została jeszcze wysłana
    When doradca anuluje naprawę
    Then system usuwa zaplanowane zdarzenie "Potwierdzenie wizyty" z kolejki wysyłkowej

  # Business process flow (krok 9.3): zmiana daty przyjęcia przeplanowuje zdarzenie w kolejce.
  @regression
  Scenario: Przeplanowanie zdarzenia w kolejce po zmianie planowanej daty przyjęcia
    Given naprawa ma zaplanowane w kolejce zdarzenie "Potwierdzenie wizyty" na podstawie dotychczasowej daty przyjęcia
    When doradca zmienia planowaną datę przyjęcia naprawy
    Then system aktualizuje termin zaplanowanego zdarzenia "Potwierdzenie wizyty" zgodnie z nową datą przyjęcia

  # Business process flow (krok 9.4): zmiana numeru telefonu lub oferty nie zmienia już zakolejkowanego zdarzenia.
  @regression
  Scenario: Brak zmiany zakolejkowanego zdarzenia po zmianie numeru telefonu lub oferty dosprzedaży
    Given naprawa ma zaplanowane w kolejce zdarzenie "Potwierdzenie wizyty"
    When doradca zmienia numer telefonu klienta lub wybraną ofertę dosprzedaży na naprawie
    Then system pozostawia zaplanowany termin zdarzenia "Potwierdzenie wizyty" bez zmian
    And system pobiera aktualne dane naprawy dopiero w momencie realizacji zdarzenia

  # Business process flow (krok 9.5): usunięcie zadania z kalendarza usuwa zdarzenie z kolejki.
  @regression
  Scenario: Usunięcie zaplanowanego zdarzenia z kolejki po usunięciu zadania przyjęcia z kalendarza
    Given naprawa ma zaplanowane w kolejce zdarzenie "Potwierdzenie wizyty"
    When doradca usuwa zadanie przyjęcia tej naprawy z kalendarza
    Then system usuwa zaplanowane zdarzenie "Potwierdzenie wizyty" z kolejki wysyłkowej

  # C1: Wyzwolenie zdarzenia tworzy naprawę w VS i zapisuje powiązanie numerem naprawy VS.
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

  # C4: Wiadomość dwuzakładkowa, gdy w momencie wysyłki przypisany jest szablon oferty.
  @smoke @regression
  Scenario: Wygenerowanie wiadomości dwuzakładkowej, gdy w momencie wysyłki przypisany jest szablon oferty
    Given naprawa ma przypisany szablon oferty dosprzedaży w momencie wysyłki wiadomości
    When VS generuje wiadomość na podstawie szablonu wiadomości Planera
    Then wygenerowana wiadomość zawiera zakładkę z pytaniami potwierdzenia
    And wygenerowana wiadomość zawiera zakładkę z ofertą dosprzedaży

  # C4: Wiadomość wyłącznie z pytaniami, gdy w momencie wysyłki nie ma przypisanej oferty.
  @smoke @regression
  Scenario: Wygenerowanie wiadomości wyłącznie z pytaniami, gdy w momencie wysyłki brak przypisanej oferty
    Given naprawa ma wartość "Bez oferty" w polu Oferta dosprzedaży w momencie wysyłki wiadomości
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

  # Business process flow (krok 17): wysyłka wiadomości SMS do klienta.
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

  # Edge case: błąd integracji z VS podczas tworzenia naprawy przy wyzwoleniu zdarzenia.
  @regression
  Scenario: Błąd integracji z VS podczas tworzenia naprawy przy wyzwoleniu zdarzenia
    Given zdarzenie "Potwierdzenie wizyty" zostało wyzwolone dla naprawy
    And VS jest w danym momencie niedostępny
    When system przesyła dane naprawy do VS
    Then Planer nie zapisuje powiązania z numerem naprawy VS
    And system nie wysyła wiadomości potwierdzenia wizyty do klienta

# Zadanie: SVCLOUD-5529 — S8 - Dosprzedaż - Lista napraw - wymaga reakcji
@kolumna-dosprzedaz-lista-napraw
Feature: Kolumna "Dosprzedaż" i checkbox "Oferta obsłużona" na liście napraw
  Jako Doradca serwisowy chcę widzieć na liście napraw informację, czy klient odpowiedział na ofertę
  dosprzedaży oraz czy zapoznałem się z tą odpowiedzią, aby nie przeoczać napraw z decyzją klienta
  i nie tracić czasu na otwieranie każdej teczki z osobna.

  # AC1: lokalizacja i nazwa kolumny na liście napraw
  @smoke @regression @ui
  Scenario: Wyświetlenie kolumny "Dosprzedaż" bezpośrednio przed kolumną "Status Online Booking"
    Given doradca serwisowy przegląda listę napraw
    Then na liście napraw widoczna jest kolumna "Dosprzedaż"
    And kolumna "Dosprzedaż" znajduje się bezpośrednio przed kolumną "Status Online Booking"

  # AC2: pusta wartość w kolumnie, gdy pole "Dosprzedaż" jest puste
  @regression
  Scenario: Wyświetlenie pustej komórki w kolumnie "Dosprzedaż", gdy pole jest puste
    Given naprawa na liście napraw ma puste pole "Dosprzedaż"
    When doradca serwisowy przegląda listę napraw
    Then komórka w kolumnie "Dosprzedaż" dla tej naprawy jest pusta

  # AC2: wartość komórki zależna od checkboxa "Oferta obsłużona"
  @smoke @regression
  Scenario Outline: Wyświetlenie statusu w kolumnie "Dosprzedaż" w zależności od wartości checkboxa "Oferta obsłużona"
    Given naprawa na liście napraw ma pole "Dosprzedaż" z wpisem od klienta
    And pole "Oferta obsłużona" tej naprawy ma wartość "<oferta_obsluzona>"
    When doradca serwisowy przegląda listę napraw
    Then komórka w kolumnie "Dosprzedaż" dla tej naprawy pokazuje wartość "<wartosc_komorki>"

    Examples:
      | oferta_obsluzona | wartosc_komorki |
      | false            | Zapoznaj się    |
      | true             | Obsłużone       |

  # AC3: dokładnie trzy opcje filtra w nagłówku kolumny
  @regression @ui
  Scenario: Dostępność dokładnie trzech opcji filtra w nagłówku kolumny "Dosprzedaż"
    Given doradca serwisowy przegląda listę napraw
    When doradca serwisowy otwiera filtr w nagłówku kolumny "Dosprzedaż"
    Then filtr zawiera dokładnie trzy opcje "Brak", "Zapoznaj się" i "Obsłużone"

  # AC3: filtrowanie listy po wybranej opcji
  @regression
  Scenario Outline: Filtrowanie listy napraw po wybraniu opcji w kolumnie "Dosprzedaż"
    Given lista napraw zawiera naprawy ze wszystkimi wartościami w kolumnie "Dosprzedaż"
    When doradca serwisowy wybiera w filtrze kolumny "Dosprzedaż" opcję "<opcja>"
    Then lista napraw pokazuje wyłącznie naprawy z wartością "<opcja>" w kolumnie "Dosprzedaż"

    Examples:
      | opcja        |
      | Brak         |
      | Zapoznaj się |
      | Obsłużone    |

  # Przepływ biznesowy krok 4: przełącznik "Wymaga działania" jako skrót filtra "Zapoznaj się"
  @regression @ui
  Scenario: Filtrowanie listy napraw wymagających reakcji za pomocą przełącznika "Wymaga działania"
    Given lista napraw zawiera naprawy ze wszystkimi wartościami w kolumnie "Dosprzedaż"
    When doradca serwisowy włącza przełącznik "Wymaga działania"
    Then lista napraw pokazuje wyłącznie naprawy z wartością "Zapoznaj się" w kolumnie "Dosprzedaż"

  # AC4: checkbox nieaktywny, gdy pole "Dosprzedaż" jest puste
  @regression @ui
  Scenario: Zablokowanie checkboxa "Oferta obsłużona", gdy pole "Dosprzedaż" jest puste
    Given doradca serwisowy otwiera teczkę naprawy z pustym polem "Dosprzedaż"
    Then checkbox "Oferta obsłużona" jest wyszarzony
    And checkbox "Oferta obsłużona" jest nieaktywny

  # AC4: checkbox aktywny, gdy pole "Dosprzedaż" zawiera wpis z VS
  @smoke @regression @ui
  Scenario: Aktywacja checkboxa "Oferta obsłużona", gdy pole "Dosprzedaż" zawiera wpis odebrany z systemu VS
    Given doradca serwisowy otwiera teczkę naprawy, której pole "Dosprzedaż" zawiera wpis odebrany z systemu VS
    Then checkbox "Oferta obsłużona" jest aktywny
    And checkbox "Oferta obsłużona" jest edytowalny

  # AC4: domyślna wartość checkboxa dla nowego wpisu
  @regression
  Scenario: Domyślna wartość checkboxa "Oferta obsłużona" dla nowego wpisu w polu "Dosprzedaż"
    Given klient odpowiedział na ofertę dosprzedaży po raz pierwszy dla tej naprawy
    When system zapisuje odpowiedź w polu "Dosprzedaż"
    Then checkbox "Oferta obsłużona" ma domyślną wartość "false"

  # AC5: zaznaczenie checkboxa zmienia status na "Obsłużone"
  @smoke @regression @ui
  Scenario: Zmiana statusu na "Obsłużone" po zaznaczeniu i zapisaniu checkboxa "Oferta obsłużona"
    Given naprawa na liście napraw ma w kolumnie "Dosprzedaż" wartość "Zapoznaj się"
    When doradca serwisowy zaznacza checkbox "Oferta obsłużona" w teczce naprawy
    And doradca serwisowy zapisuje teczkę naprawy
    Then po odświeżeniu listy napraw kolumna "Dosprzedaż" dla tej naprawy pokazuje wartość "Obsłużone"

  # AC5: odznaczenie checkboxa przywraca status "Zapoznaj się"
  @regression @ui
  Scenario: Przywrócenie statusu "Zapoznaj się" po odznaczeniu i zapisaniu checkboxa "Oferta obsłużona"
    Given naprawa na liście napraw ma w kolumnie "Dosprzedaż" wartość "Obsłużone"
    When doradca serwisowy odznacza checkbox "Oferta obsłużona" w teczce naprawy
    And doradca serwisowy zapisuje teczkę naprawy
    Then po odświeżeniu listy napraw kolumna "Dosprzedaż" dla tej naprawy pokazuje wartość "Zapoznaj się"

  # AC6: podgląd statusu pola "Oferta obsłużona" w pełnej teczce naprawy
  @regression @ui
  Scenario Outline: Wyświetlenie statusu pola "Oferta obsłużona" w podglądzie pełnej teczki naprawy
    Given checkbox "Oferta obsłużona" w teczce naprawy ma wartość "<oferta_obsluzona>"
    When doradca serwisowy wyświetla podgląd pełnej teczki naprawy
    Then podgląd teczki pokazuje status pola "Oferta obsłużona" jako "<status>"

    Examples:
      | oferta_obsluzona | status |
      | true             | TAK    |
      | false            | NIE    |

  # Przypadek negatywny: brak możliwości zmiany statusu bez wpisu od klienta
  @regression @ui
  Scenario: Brak możliwości zmiany statusu, gdy pole "Dosprzedaż" jest puste
    Given naprawa na liście napraw ma puste pole "Dosprzedaż"
    When doradca serwisowy otwiera teczkę tej naprawy
    Then doradca serwisowy nie może zaznaczyć nieaktywnego checkboxa "Oferta obsłużona"
    And komórka w kolumnie "Dosprzedaż" dla tej naprawy pozostaje pusta

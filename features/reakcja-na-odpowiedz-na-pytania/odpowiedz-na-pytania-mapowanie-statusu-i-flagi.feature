# Zadanie QA: SVCLOUD-5609 — [QA] T9 (placeholder) odpowiedź → notyfikacja → mapowanie na Workshop (AC1/AC2)
# Uwaga: obejmuje też zakres usuniętych zadań QA — dawne T10 (SVCLOUD-5613, AC1/AC2, AC4 usunięte)
# oraz T12 (SVCLOUD-5611, AC3, zależność S11), scalone tu po restrukturyzacji zadań QA dla SVCLOUD-5515.
@odpowiedz-na-pytania-mapowanie-statusu-i-flagi
Feature: Automatyczne mapowanie odpowiedzi klienta na status, flagę i Historię zmian naprawy
  Jako Doradca serwisowy chcę, aby odpowiedzi klienta na pytania potwierdzenia wizyty
  były automatycznie odzwierciedlane w teczce naprawy w Planerze i widoczne w Historii zmian,
  aby mieć aktualną informację o statusie wizyty i preferencjach klienta bez ręcznej weryfikacji w VS.

  # AC1: mapowanie odpowiedzi na pytanie "Czy potwierdzasz wizytę?" na status potwierdzenia
  @smoke @regression
  Scenario Outline: Aktualizacja statusu potwierdzenia wizyty po odpowiedzi klienta na pytanie pierwsze
    Given naprawa w Planerze ma status "Otwarta"
    When Planer otrzymuje z VS odpowiedź klienta "<odpowiedz>" na pytanie "Czy potwierdzasz wizytę?"
    Then system aktualizuje status "Potwierdzenie wizyty" na naprawie na wartość "<status>"

    Examples:
      | odpowiedz            | status         |
      | Potwierdzam          | Potwierdzona   |
      | Chcę zmienić termin  | Zmiana terminu |
      | Rezygnuję z naprawy  | Odwołana       |

  # AC1: brak odpowiedzi zachowuje stan początkowy statusu potwierdzenia
  @regression
  Scenario: Zachowanie domyślnego statusu Do potwierdzenia przy braku odpowiedzi klienta
    Given naprawa została nowo utworzona i nie otrzymała jeszcze odpowiedzi klienta
    Then status "Potwierdzenie wizyty" na naprawie pozostaje ustawiony na wartość "Do potwierdzenia"

  # AC2: mapowanie odpowiedzi na pytanie "Czy będziesz czekał na miejscu?" na flagę Klient czeka
  @smoke @regression
  Scenario Outline: Aktualizacja flagi Klient czeka po odpowiedzi klienta na pytanie drugie
    Given naprawa w Planerze ma status "Otwarta"
    When Planer otrzymuje z VS odpowiedź klienta "<odpowiedz>" na pytanie "Czy będziesz czekał na miejscu?"
    Then system aktualizuje flagę "Klient czeka" na wartość "<flaga>"

    Examples:
      | odpowiedz | flaga         |
      | Tak       | zaznaczona    |
      | Nie       | niezaznaczona |

  # AC2: brak odpowiedzi na pytanie drugie zachowuje dotychczasową wartość flagi
  @regression
  Scenario: Zachowanie dotychczasowej wartości flagi Klient czeka przy braku odpowiedzi
    Given flaga "Klient czeka" ma aktualnie wartość "zaznaczona" po wcześniejszej odpowiedzi klienta
    When Planer otrzymuje z VS informację bez odpowiedzi na pytanie "Czy będziesz czekał na miejscu?"
    Then flaga "Klient czeka" pozostaje niezmieniona na wartości "zaznaczona"

  # AC6: brak jakiejkolwiek reakcji Planera, gdy VS nie wysyła powiadomienia o odpowiedzi
  @regression
  Scenario: Brak akcji Planera przy wygasłym lub już użytym linku formularza odpowiedzi
    Given link do formularza odpowiedzi na pytania potwierdzenia wizyty jest wygasły lub został już wcześniej użyty
    When klient próbuje otworzyć wygasły lub użyty link
    Then VS wyświetla klientowi stronę formularza jako nieaktywną
    And system nie otrzymuje żadnego powiadomienia o odpowiedzi od VS
    And Planer nie zmienia żadnych danych naprawy

  # AC1, AC4 usunięte (dawne T10 - SVCLOUD-5613): brak blokady aktualizacji statusu wg statusu naprawy w Planerze
  @smoke @regression
  Scenario Outline: Aktualizacja statusu potwierdzenia wizyty niezależnie od statusu naprawy w Planerze
    Given naprawa w Planerze ma status "<status_naprawy>"
    When Planer otrzymuje z VS odpowiedź klienta "Potwierdzam" na pytanie "Czy potwierdzasz wizytę?"
    Then system aktualizuje status "Potwierdzenie wizyty" na naprawie na wartość "Potwierdzona"

    Examples:
      | status_naprawy |
      | Otwarta        |
      | Anulowana      |
      | Zakończona     |
      | Zmiana terminu |

  # AC1 (dawne T10 - SVCLOUD-5613): kolejna odpowiedź klienta nadpisuje wcześniej ustawiony status potwierdzenia
  @regression
  Scenario: Nadpisanie wcześniejszego statusu potwierdzenia przez kolejną odpowiedź klienta
    Given naprawa ma status "Potwierdzenie wizyty" ustawiony na wartość "Potwierdzona" po wcześniejszej odpowiedzi
    When Planer otrzymuje z VS kolejną odpowiedź klienta "Rezygnuję z naprawy" na pytanie "Czy potwierdzasz wizytę?"
    Then system nadpisuje status "Potwierdzenie wizyty" na naprawie na wartość "Odwołana"

  # AC2 (dawne T10 - SVCLOUD-5613): kolejna odpowiedź klienta nadpisuje wcześniej ustawioną flagę Klient czeka
  @regression
  Scenario: Nadpisanie wcześniejszej wartości flagi Klient czeka przez kolejną odpowiedź klienta
    Given flaga "Klient czeka" ma aktualnie wartość "zaznaczona" po wcześniejszej odpowiedzi klienta
    When Planer otrzymuje z VS kolejną odpowiedź klienta "Nie" na pytanie "Czy będziesz czekał na miejscu?"
    Then system nadpisuje flagę "Klient czeka" na wartość "niezaznaczona"

  # AC3 (dawne T12 - SVCLOUD-5611, zależność: S11): zmiana statusu potwierdzenia wizyty jest rejestrowana w Historii zmian
  @smoke @regression
  Scenario: Zarejestrowanie w Historii zmian aktualizacji statusu potwierdzenia wizyty
    Given Planer otrzymał z VS odpowiedź klienta powodującą zmianę statusu "Potwierdzenie wizyty"
    When system zapisuje zmianę za pomocą standardowego mechanizmu aktualizacji naprawy
    Then w Historii zmian pojawia się nowy wpis dotyczący pola "Potwierdzenie wizyty"

  # AC3 (dawne T12 - SVCLOUD-5611, zależność: S11): zmiana flagi Klient czeka jest rejestrowana w Historii zmian
  @smoke @regression
  Scenario: Zarejestrowanie przez system zmiany wartości flagi Klient czeka w Historii zmian
    Given Planer otrzymał z VS odpowiedź klienta powodującą zmianę flagi "Klient czeka"
    When system zapisuje zmianę za pomocą standardowego mechanizmu aktualizacji naprawy
    Then w Historii zmian pojawia się nowy wpis dotyczący pola "Klient czeka"

  # AC3 (dawne T12 - SVCLOUD-5611): brak zmiany wartości nie powinien tworzyć zbędnego wpisu w Historii zmian
  @regression
  Scenario: Brak nowego wpisu w Historii zmian, gdy odpowiedź klienta nie zmienia wartości
    Given wartość flagi "Klient czeka" jest już zgodna z odpowiedzią klienta na pytanie "Czy będziesz czekał na miejscu?"
    When system przetwarza otrzymaną odpowiedź klienta
    Then w Historii zmian nie pojawia się nowy wpis dotyczący pola "Klient czeka"

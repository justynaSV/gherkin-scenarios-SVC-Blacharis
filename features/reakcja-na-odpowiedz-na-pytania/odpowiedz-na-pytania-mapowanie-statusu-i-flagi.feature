# Zadanie QA: SVCLOUD-5609 — [QA] T9 (placeholder) odpowiedź → notyfikacja → mapowanie na Workshop (AC1/AC2)
@odpowiedz-na-pytania-mapowanie-statusu-i-flagi
Feature: Automatyczne mapowanie odpowiedzi klienta na status i flagę „Klient czeka”
  Jako Doradca serwisowy chcę, aby odpowiedzi klienta na pytania potwierdzenia wizyty
  były automatycznie odzwierciedlane w teczce naprawy w Planerze,
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
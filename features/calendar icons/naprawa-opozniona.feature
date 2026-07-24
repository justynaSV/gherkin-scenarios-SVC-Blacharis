@naprawa-opozniona @ui @calendar @regression @pl
Feature: Ikona naprawy opóźnionej w kalendarzu
  Jako mistrz warsztatu lub doradca serwisowy
  chcę widzieć ikonę informacyjną o tym, że naprawa jest opóźniona, bezpośrednio na zadaniu w kalendarzu BOK i Warsztatu
  aby nie musieć otwierać każdej naprawy w celu weryfikacji tej informacji.

  Background:
    Given obowiązują ogólne zasady logiczne i graficzne ikon z epiku "IKONY KALENDARZA"
    And istnieje wizyta niepotwierdzona w serwisie z zaplanowanym zadaniem w kalendarzu BOK i Warsztatu
    And konfiguracja ikony "Naprawa opóźniona" jest dostępna

  # AC: Ikona "Naprawa opóźniona" jest wyświetlana, gdy data zakończenia prac jest większa niż ustalona data wydania
  @smoke @regression
  Scenario: Wyświetlenie ikony dla naprawy opóźnionej
    Given istnieje naprawa z zaplanowanym zadaniem w kalendarzu
    And naprawa ma ustaloną datę wydania "2026-07-10 16:00"
    And naprawa ma datę zakończenia prac w serwisie "2026-07-10 17:00"
    When użytkownik otwiera widok kalendarza
    Then na zadaniu naprawy widoczna jest ikona "Naprawa opóźniona"
    And ikona "Naprawa opóźniona" jest widoczna na tooltipie zadania

  # AC: Ikona jest widoczna bezpośrednio na zadaniach w kalendarzu BOK i Warsztatu
  @regression
  Scenario Outline: Wyświetlenie ikony w dostępnych widokach kalendarza
    Given istnieje naprawa z zaplanowanym zadaniem w kalendarzu
    And naprawa ma ustaloną datę wydania "2026-07-10 16:00"
    And naprawa ma datę zakończenia prac w serwisie "2026-07-10 17:00"
    When użytkownik otwiera widok kalendarza "<widok>"
    Then na zadaniu naprawy widoczna jest ikona "Naprawa opóźniona"

    Examples:
      | widok     |
      | BOK       |
      | Warsztatu |

  # AC: Ikona używa skonfigurowanej nazwy i symbolu
  @regression
  Scenario: Wyświetlenie skonfigurowanej nazwy i symbolu ikony
    Given istnieje naprawa z zaplanowanym zadaniem w kalendarzu
    And naprawa ma ustaloną datę wydania "2026-07-10 16:00"
    And naprawa ma datę zakończenia prac w serwisie "2026-07-10 17:00"
    When użytkownik otwiera widok kalendarza
    Then na zadaniu naprawy widoczna jest ikona "Naprawa opóźniona"
    And ikona używa symbolu "alarm-exclamation"

  # AC: Ikona jest ukrywana, gdy data zakończenia prac jest mniejsza niż ustalona data wydania
  @regression
  Scenario: Ukrycie ikony dla naprawy nieopóźnionej
    Given istnieje naprawa z zaplanowanym zadaniem w kalendarzu
    And naprawa ma ustaloną datę wydania "2026-07-10 16:00"
    And naprawa ma datę zakończenia prac w serwisie "2026-07-10 15:00"
    When użytkownik otwiera widok kalendarza
    Then na zadaniu naprawy nie jest widoczna ikona "Naprawa opóźniona"

  # AC: Naprawa nie jest opóźniona, gdy daty graniczne są równe
  @regression
  Scenario: Brak ikony, gdy data zakończenia prac jest równa ustalonej dacie wydania
    Given istnieje naprawa z zaplanowanym zadaniem w kalendarzu
    And naprawa ma ustaloną datę wydania "2026-07-10 16:00"
    And naprawa ma datę zakończenia prac w serwisie "2026-07-10 16:00"
    When użytkownik otwiera widok kalendarza
    Then na zadaniu naprawy nie jest widoczna ikona "Naprawa opóźniona"

  # AC: Wyświetlanie ikony następuje automatycznie w czasie rzeczywistym po wystąpieniu zdarzenia
  @smoke @regression
  Scenario: Automatyczne pokazanie ikony po przesunięciu zakończenia prac poza ustaloną datę wydania
    Given użytkownik widzi w kalendarzu zadanie naprawy
    And naprawa ma ustaloną datę wydania "2026-07-10 16:00"
    And naprawa ma datę zakończenia prac w serwisie "2026-07-10 15:00"
    And na zadaniu naprawy nie jest widoczna ikona "Naprawa opóźniona"
    When użytkownik przesuwa zadanie mechanika tak, że zakończenie prac wypada o "2026-07-10 17:00"
    Then widok kalendarza zostaje automatycznie odświeżony
    And na zadaniu naprawy widoczna jest ikona "Naprawa opóźniona"

  # AC: Ukrywanie ikony następuje automatycznie w czasie rzeczywistym po zniknięciu zdarzenia
  @smoke @regression
  Scenario: Automatyczne ukrycie ikony po zmianie ustalonej daty wydania
    Given użytkownik widzi w kalendarzu zadanie naprawy
    And naprawa ma ustaloną datę wydania "2026-07-10 16:00"
    And naprawa ma datę zakończenia prac w serwisie "2026-07-10 17:00"
    And na zadaniu naprawy widoczna jest ikona "Naprawa opóźniona"
    When ustalona data wydania zostaje zmieniona na "2026-07-10 18:00"
    Then widok kalendarza zostaje automatycznie odświeżony
    And na zadaniu naprawy nie jest widoczna ikona "Naprawa opóźniona"

  # AC: Ukrywanie ikony następuje automatycznie w czasie rzeczywistym po zmianie zakończenia prac
  @regression
  Scenario: Automatyczne ukrycie ikony po przesunięciu zakończenia prac przed ustaloną datę wydania
    Given użytkownik widzi w kalendarzu zadanie naprawy
    And naprawa ma ustaloną datę wydania "2026-07-10 16:00"
    And naprawa ma datę zakończenia prac w serwisie "2026-07-10 17:00"
    And na zadaniu naprawy widoczna jest ikona "Naprawa opóźniona"
    When użytkownik przesuwa zadanie mechanika tak, że zakończenie prac wypada o "2026-07-10 15:00"
    Then widok kalendarza zostaje automatycznie odświeżony
    And na zadaniu naprawy nie jest widoczna ikona "Naprawa opóźniona"

  # AC: Ikona jest wyświetlana wyłącznie dla zadań napraw spełniających warunek opóźnienia
  @regression
  Scenario: Brak ikony na zadaniu innej naprawy w tym samym widoku kalendarza
    Given istnieje opóźniona naprawa z zaplanowanym zadaniem w kalendarzu
    And istnieje nieopóźniona naprawa z zaplanowanym zadaniem w kalendarzu
    When użytkownik otwiera widok kalendarza
    Then na zadaniu opóźnionej naprawy widoczna jest ikona "Naprawa opóźniona"
    And na zadaniu nieopóźnionej naprawy nie jest widoczna ikona "Naprawa opóźniona"

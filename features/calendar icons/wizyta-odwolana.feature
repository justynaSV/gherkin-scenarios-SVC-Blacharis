# Zadanie: SVCLOUD-5248 — SX — Zdarzenie - Wizyta odwołana
@wizyta-odwolana @ui @calendar @regression @pl
Feature: Ikona "Wizyta odwołana" na zadaniu kalendarza BOK i Warsztatu
  Jako doradca serwisowy lub mistrz warsztatu
  chcę widzieć ikonę informacyjną o tym, że klient odwołał wizytę w serwisie bezpośrednio na zadaniu w kalendarzu BOK i Warsztatu
  aby nie musieć otwierać każdej naprawy w celu weryfikacji tej informacji.

  Background:
    Given obowiązują ogólne zasady logiczne i graficzne ikon z epiku "IKONY KALENDARZA"
    And istnieje wizyta niepotwierdzona w serwisie z zaplanowanym zadaniem w kalendarzu BOK i Warsztatu
    And konfiguracja ikony "Wizyta odwołana" jest dostępna

  @display
  # AC: Ikona "Wizyta odwołana" jest wyświetlana, gdy status potwierdzenia wizyty ma wartość "Odwołana"
  Scenario: Wyświetlenie ikony dla odwołanej wizyty
    Given istnieje naprawa z zaplanowanym zadaniem w kalendarzu
    When naprawa ma status wizyty "Odwołana"
    Then na zadaniu naprawy widoczna jest ikona "Wizyta odwołana"
    And ikona "Wizyta odwołana" jest widoczna na tooltipie zadania
    
  @translations
  # AC: Konfiguracja nazwy, tłumaczeń i symbolu ikony jest dostępna dla zdarzenia WS_VISIT_CANCELLED
  Scenario Outline: Wyświetlenie poprawnego tłumaczenia nazwy ikony "Wizyta odwołana" w zależności od języka
    Given ikona "Wizyta odwołana" jest widoczna na zadaniu w kalendarzu BOK i Warsztatu
    And użytkownik ma ustawiony język interfejsu "<jezyk>"
    When użytkownik wyświetla tooltip zadania
    Then użytkownik widzi przetłumaczoną nazwę ikony

    Examples:
      | jezyk | tlumaczenie           |
      | pl-PL | Wizyta odwołana       |
      | en    | Appointment cancelled |
      | cz    | Návštěva zrušena      |

  @hide
  # AC: Ikona "Wizyta odwołana" jest ukrywana, jeśli status potwierdzenia wizyty jest różny od "Odwołana"
  Scenario Outline: Ukrycie ikony dla wizyty o statusie innym niż "Odwołana"
    Given istnieje naprawa z zaplanowanym zadaniem w kalendarzu
    When naprawa ma status wizyty "Potwierdzona"
    Then ikona "Wizyta odwołana" nie jest widoczna na zadaniu naprawy
    And ikona "Wizyta odwołana" nie jest widoczna na tooltipie zadania

    Examples:
      | status          |
      | Niepotwierdzona |
      | Potwierdzona    |
      | Zmiana terminu  |

  @smoke
  # AC: Wyświetlanie ikony następuje automatycznie w czasie rzeczywistym po wystąpieniu zdarzenia
  Scenario: Automatyczne pokazanie ikony po zmianie statusu na "Odwołana"
    Given użytkownik widzi w kalendarzu zadanie naprawy
    And naprawa ma status potwierdzenia wizyty "Niepotwierdzona"
    And ikona "Wizyta odwołana" nie jest widoczna na zadaniu naprawy
    When status potwierdzenia wizyty zostaje zmieniony na "Odwołana"
    Then widok kalendarza zostaje automatycznie odświeżony
    And na zadaniu naprawy widoczna jest ikona "Wizyta odwołana"

  @smoke
  # AC: Ukrywanie ikony następuje automatycznie w czasie rzeczywistym po zniknięciu zdarzenia
  Scenario: Automatyczne ukrycie ikony po zmianie statusu na inny niż "Odwołana"
    Given użytkownik widzi w kalendarzu zadanie naprawy
    And naprawa ma status potwierdzenia wizyty "Odwołana"
    And na zadaniu naprawy widoczna jest ikona "Wizyta odwołana"
    When status potwierdzenia wizyty zostaje zmieniony na "Niepotwierdzona"
    Then widok kalendarza zostaje automatycznie odświeżony
    And na zadaniu naprawy nie jest widoczna ikona "Wizyta odwołana"

  # AC: Ikona nie jest pokazywana, jeśli zdarzenie nie jest aktywne w konfiguracji planera serwisu
  Scenario: Brak ikony przy nieaktywnej konfiguracji zdarzenia
    Given zdarzenie ikony "Wizyta odwołana" jest nieaktywne w konfiguracji planera serwisu
    And istnieje naprawa z zaplanowanym zadaniem w kalendarzu
    And naprawa ma status potwierdzenia wizyty "Odwołana"
    Then na zadaniu naprawy nie jest widoczna ikona "Wizyta odwołana"
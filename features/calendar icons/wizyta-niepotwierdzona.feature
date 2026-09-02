# Zadanie: SVCLOUD-5269 — SX — Zdarzenie - Wizyta niepotwierdzona
@wizyta-niepotwierdzona @ui @calendar @regression @pl
Feature: Ikona "Wizyta niepotwierdzona" na zadaniu kalendarza BOK i Warsztatu
  Jako doradca serwisowy lub mistrz warsztatu
  chcę widzieć ikonę informacyjną o tym, że wizyta nie została potwierdzona w serwisie bezpośrednio na zadaniu w kalendarzu BOK i Warsztatu
  aby nie musieć otwierać każdej naprawy w celu weryfikacji tej informacji.

  Background:
    Given obowiązują ogólne zasady logiczne i graficzne ikon z epiku "IKONY KALENDARZA"
    And istnieje wizyta niepotwierdzona w serwisie z zaplanowanym zadaniem w kalendarzu BOK i Warsztatu
    And konfiguracja ikony "Wizyta niepotwierdzona" jest dostępna

  @display
  # AC: Ikona "Wizyta niepotwierdzona" jest wyświetlana, gdy status potwierdzenia wizyty ma wartość "Niepotwierdzona"
  Scenario: Wyświetlenie ikony dla wizyty niepotwierdzonej
    Given istnieje naprawa z zaplanowanym zadaniem w kalendarzu
    When naprawa ma status wizyty "Niepotwierdzona"
    Then na zadaniu naprawy widoczna jest ikona "Wizyta niepotwierdzona"
    And ikona "Wizyta niepotwierdzona" jest widoczna na tooltipie zadania

  @translations
  # AC: Konfiguracja nazwy, tłumaczeń i symbolu ikony jest dostępna dla zdarzenia WS_VISIT_UNCONFIRMED
  Scenario Outline: Wyświetlenie poprawnego tłumaczenia nazwy ikony "Wizyta niepotwierdzona" w zależności od języka
    Given ikona "Wizyta niepotwierdzona" jest widoczna na zadaniu w kalendarzu BOK i Warsztatu
    And użytkownik ma ustawiony język interfejsu "<jezyk>"
    When użytkownik wyświetla tooltip zadania
    Then użytkownik widzi przetłumaczoną nazwę ikony

    Examples:
      | jezyk | tlumaczenie             |
      | pl-PL | Wizyta niepotwierdzona  |
      | en    | Unconfirmed appointment |
      | cz    | Nepotvrzená návštěva    |

  @hide
  # AC: Ikona jest ukrywana, gdy status potwierdzenia wizyty jest różny od "Niepotwierdzona"
  Scenario Outline: Ukrycie ikony gdy wizyta jest potwierdzona
    Given istnieje naprawa z zaplanowanym zadaniem w kalendarzu
    When naprawa ma status wizyty "Potwierdzona"
    Then ikona "Wizyta niepotwierdzona" nie jest widoczna na zadaniu naprawy
    And ikona "Wizyta niepotwierdzona" nie jest widoczna na tooltipie zadania

    Examples:
      | status          |
      | Zmiana terminu  |
      | Potwierdzona    |
      | Odwołana        |

  # AC: Wyświetlanie ikony następuje automatycznie w czasie rzeczywistym po wystąpieniu zdarzenia
  @smoke
  Scenario: Automatyczne pokazanie ikony po zmianie statusu na "Niepotwierdzona"
    Given użytkownik widzi w kalendarzu zadanie naprawy
    And naprawa ma status potwierdzenia wizyty "Zmiana terminu"
    And ikona "Wizyta niepotwierdzona" nie jest widoczna na zadaniu naprawy
    When status potwierdzenia wizyty zostaje zmieniony na "Niepotwierdzona"
    Then widok kalendarza zostaje automatycznie odświeżony
    And na zadaniu naprawy widoczna jest ikona "Wizyta niepotwierdzona"

  # AC: Ukrywanie ikony następuje automatycznie w czasie rzeczywistym po zniknięciu zdarzenia
  @smoke
  Scenario: Automatyczne ukrycie ikony po zmianie statusu na inny niż "Niepotwierdzona"
    Given użytkownik widzi w kalendarzu zadanie naprawy
    And naprawa ma status potwierdzenia wizyty "Niepotwierdzona"
    And na zadaniu naprawy widoczna jest ikona "Wizyta niepotwierdzona"
    When status potwierdzenia wizyty zostaje zmieniony na "Zmiana terminu"
    Then widok kalendarza zostaje automatycznie odświeżony
    And na zadaniu naprawy nie jest widoczna ikona "Wizyta niepotwierdzona"

  # AC: Ikona nie jest pokazywana, jeśli zdarzenie nie jest aktywne w konfiguracji planera serwisu
  Scenario: Brak ikony przy nieaktywnej konfiguracji zdarzenia
    Given zdarzenie ikony "Wizyta niepotwierdzona" jest nieaktywne w konfiguracji planera serwisu
    And istnieje naprawa z zaplanowanym zadaniem w kalendarzu
    And naprawa ma status potwierdzenia wizyty "Niepotwierdzona"
    When użytkownik otwiera widok kalendarza
    Then na zadaniu naprawy nie jest widoczna ikona "Wizyta niepotwierdzona"
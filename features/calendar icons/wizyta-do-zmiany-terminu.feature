# Zadanie: SVCLOUD-4978 — SX — Zdarzenie - Wizyta do zmiany terminu
@wizyta-do-zmiany-terminu @ui @calendar
Feature: Ikona "Wizyta do zmiany terminu" na zadaniu kalendarza BOK i Warsztatu
  Jako doradca serwisowy lub mistrz warsztatu
  chcę widzieć ikonę informacyjną o tym, że klient chce zmienić termin wizyty w serwisie bezpośrednio na zadaniu w kalendarzu BOK i Warsztatu
  aby nie musieć podnosić każdej naprawy do kontekstu w celu weryfikacji tej informacji.

  Background:
    Given obowiązują ogólne zasady logiczne i graficzne ikon z epiku "IKONY KALENDARZA"
    And istnieje wizyta niepotwierdzona w serwisie z zaplanowanym zadaniem w kalendarzu BOK i Warsztatu
    And konfiguracja ikony "Wizyta do zmiany terminu" jest dostępna

  @display
  # AC: Ikona "Wizyta do zmiany terminu" jest wyświetlana na zadaniu, jeśli status potwierdzenia wizyty ma wartość "Zmiana terminu"
  Scenario: Wyświetlenie ikony dla wizyty do zmiany terminu
    Given istnieje naprawa z zaplanowanym zadaniem w kalendarzu
    When naprawa ma status potwierdzenia wizyty "Zmiana terminu"
    Then na zadaniu naprawy widoczna jest ikona "Wizyta do zmiany terminu"
    And ikona "Wizyta do zmiany terminu" jest widoczna na tooltipie zadania

  @translations
  # AC: Konfiguracja zawiera tłumaczenia nazwy zdarzenia WS_VISIT_RESCHEDULED
  Scenario Outline: Wyświetlenie poprawnego tłumaczenia nazwy ikony "Wizyta do zmiany terminu" w zależności od języka
    Given ikona "Wizyta do zmiany terminu" jest widoczna na zadaniu w kalendarzu BOK i Warsztatu
    And użytkownik ma ustawiony język interfejsu "<jezyk>"
    When użytkownik wyświetla tooltip zadania
    Then użytkownik widzi przetłumaczoną nazwę ikony

    Examples:
      | jezyk | tlumaczenie                   |
      | pl-PL | Wizyta do zmiany terminu      |
      | en    | Appointment to be rescheduled |
      | cz    | Návštěva k přeobjednání       |

  @hide
  # AC: Ikona "Wizyta do zmiany terminu" jest ukrywana, jeśli status potwierdzenia wizyty jest różny od "Zmiana terminu"
  Scenario Outline: Ukrycie ikony dla wizyty o statusie innym niż "Zmiana terminu"
    Given istnieje naprawa z zaplanowanym zadaniem w kalendarzu
    When naprawa ma status wizyty inny niż "Zmiana terminu"
    Then ikona "Wizyta do zmiany terminu" nie jest widoczna na zadaniu naprawy
    And ikona "Wizyta do zmiany terminu" nie jest widoczna na tooltipie zadania

    Examples:
      | status          |
      | Niepotwierdzona |
      | Potwierdzona    |
      | Odwołana        |

  @smoke
  # AC: Wyświetlanie ikony następuje automatycznie w czasie rzeczywistym po wystąpieniu zdarzenia
  Scenario: Automatyczne pokazanie ikony po zmianie statusu na "Zmiana terminu"
    Given użytkownik widzi w kalendarzu zadanie naprawy
    And naprawa ma status wizyty "Niepotwierdzona"
    And na zadaniu naprawy nie jest widoczna ikona "Wizyta do zmiany terminu"
    When status potwierdzenia wizyty zostaje zmieniony na "Zmiana terminu"
    Then widok kalendarza zostaje automatycznie odświeżony
    And na zadaniu naprawy widoczna jest ikona "Wizyta do zmiany terminu"

  @smoke
  # AC: Ukrywanie ikony następuje automatycznie w czasie rzeczywistym po zniknięciu zdarzenia
  Scenario: Automatyczne ukrycie ikony po zmianie statusu na inny niż "Zmiana terminu"
    Given użytkownik widzi w kalendarzu zadanie naprawy
    And naprawa ma status wizyty "Zmiana terminu"
    And na zadaniu naprawy widoczna jest ikona "Wizyta do zmiany terminu"
    When status potwierdzenia wizyty zostaje zmieniony na "Niepotwierdzona"
    Then widok kalendarza zostaje automatycznie odświeżony
    And na zadaniu naprawy nie jest widoczna ikona "Wizyta do zmiany terminu"

  # AC: Ikona nie jest pokazywana, jeśli zdarzenie nie jest aktywne w konfiguracji planera serwisu
  @regression
  Scenario: Brak ikony przy nieaktywnej konfiguracji zdarzenia
    Given zdarzenie ikony "Wizyta do zmiany terminu" jest nieaktywne w konfiguracji planera serwisu
    And istnieje naprawa z zaplanowanym zadaniem w kalendarzu
    And naprawa ma status wizyty "Zmiana terminu"
    When zadanie naprawy jest widoczne w kalendarzu BOK i Warsztatu
    Then na zadaniu naprawy nie jest widoczna ikona "Wizyta do zmiany terminu"
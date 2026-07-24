@rezerwacja-online-zaplanowana @ui @regression @pl
Feature: Ikona zaplanowanej rezerwacji online w kalendarzu
  Jako doradca serwisowy lub mistrz warsztatu
  chcę widzieć ikonę informacyjną o zaplanowanej naprawie z Online Booking bezpośrednio na zadaniu w kalendarzu
  aby nie musieć otwierać każdej naprawy w celu weryfikacji tej informacji.

  Background:
    Given użytkownik jest zalogowany jako pracownik serwisu
    And użytkownik ma dostęp do widoku kalendarza BOK i Warsztatu

  # AC: Ikona "Rezerwacja online Zaplanowana" jest wyświetlana dla naprawy z Online Booking ze statusem "Zaplanowana"
  @smoke
  Scenario: Wyświetlenie ikony dla zaplanowanej naprawy z Online Booking
    Given istnieje naprawa pochodząca z Online Booking
    And naprawa ma status Online Booking "Zaplanowana"
    And naprawa ma zaplanowane zadanie w kalendarzu
    When użytkownik otwiera widok kalendarza
    Then na zadaniu naprawy widoczna jest ikona "Rezerwacja online Zaplanowana"
    And ikona "Rezerwacja online Zaplanowana" jest widoczna na tooltipie zadania

  # AC: Ikona jest widoczna bezpośrednio na zadaniach w kalendarzu BOK i Warsztatu
  Scenario Outline: Wyświetlenie ikony w dostępnych widokach kalendarza
    Given istnieje naprawa pochodząca z Online Booking
    And naprawa ma status Online Booking "Zaplanowana"
    And naprawa ma zaplanowane zadanie w kalendarzu
    When użytkownik otwiera widok kalendarza "<widok>"
    Then na zadaniu naprawy widoczna jest ikona "Rezerwacja online Zaplanowana"

    Examples:
      | widok     |
      | BOK       |
      | Warsztatu |

  # AC: Ikona jest ukrywana, gdy naprawa z Online Booking ma status "Do podjęcia"
  Scenario: Ukrycie ikony dla naprawy z Online Booking ze statusem Do podjęcia
    Given istnieje naprawa pochodząca z Online Booking
    And naprawa ma status Online Booking "Do podjęcia"
    And naprawa ma zaplanowane zadanie w kalendarzu
    When użytkownik otwiera widok kalendarza
    Then na zadaniu naprawy nie jest widoczna ikona "Rezerwacja online Zaplanowana"

  # AC: Ikona jest wyświetlana tylko po spełnieniu obu warunków biznesowych
  Scenario Outline: Brak ikony, gdy naprawa nie spełnia warunków wyświetlenia
    Given istnieje naprawa z wartością pochodzenia Online Booking "<pochodzenie_online_booking>"
    And naprawa ma status Online Booking "<status_online_booking>"
    And naprawa ma zaplanowane zadanie w kalendarzu
    When użytkownik otwiera widok kalendarza
    Then na zadaniu naprawy nie jest widoczna ikona "Rezerwacja online Zaplanowana"

    Examples:
      | pochodzenie_online_booking | status_online_booking |
      | nie                        | Zaplanowana           |
      | nie                        | Do podjęcia           |
      | tak                        | Do podjęcia           |

  # AC: Wyświetlanie i ukrywanie ikony następuje automatycznie w czasie rzeczywistym
  @smoke
  Scenario: Automatyczne pokazanie ikony po zmianie statusu na Zaplanowana
    Given użytkownik widzi w kalendarzu zadanie naprawy pochodzącej z Online Booking
    And naprawa ma status Online Booking "Do podjęcia"
    And na zadaniu naprawy nie jest widoczna ikona "Rezerwacja online Zaplanowana"
    When status Online Booking naprawy zostaje zmieniony na "Zaplanowana"
    Then widok kalendarza zostaje automatycznie odświeżony
    And na zadaniu naprawy widoczna jest ikona "Rezerwacja online Zaplanowana"

  # AC: Wyświetlanie i ukrywanie ikony następuje automatycznie w czasie rzeczywistym
  @smoke
  Scenario: Automatyczne ukrycie ikony po zmianie statusu na Do podjęcia
    Given użytkownik widzi w kalendarzu zadanie naprawy pochodzącej z Online Booking
    And naprawa ma status Online Booking "Zaplanowana"
    And na zadaniu naprawy widoczna jest ikona "Rezerwacja online Zaplanowana"
    When status Online Booking naprawy zostaje zmieniony na "Do podjęcia"
    Then widok kalendarza zostaje automatycznie odświeżony
    And na zadaniu naprawy nie jest widoczna ikona "Rezerwacja online Zaplanowana"

  # AC: Status można zmienić ręcznie w menu w oba stany
  Scenario: Ręczna zmiana statusu z Do podjęcia na Zaplanowana pokazuje ikonę
    Given użytkownik widzi w kalendarzu zadanie naprawy pochodzącej z Online Booking
    And naprawa ma status Online Booking "Do podjęcia"
    When użytkownik zmienia status Online Booking na "Zaplanowana"
    Then na zadaniu naprawy widoczna jest ikona "Rezerwacja online Zaplanowana"

  # AC: Status można zmienić ręcznie w menu w oba stany
  Scenario: Ręczna zmiana statusu z Zaplanowana na Do podjęcia ukrywa ikonę
    Given użytkownik widzi w kalendarzu zadanie naprawy pochodzącej z Online Booking
    And naprawa ma status Online Booking "Zaplanowana"
    And na zadaniu naprawy widoczna jest ikona "Rezerwacja online Zaplanowana"
    When użytkownik zmienia status Online Booking na "Do podjęcia"
    Then na zadaniu naprawy nie jest widoczna ikona "Rezerwacja online Zaplanowana"

  # AC: Funkcja Przeplanuj ustawia status Zaplanowana
  Scenario: Użycie funkcji Przeplanuj pokazuje ikonę zaplanowanej rezerwacji online
    Given istnieje naprawa pochodząca z Online Booking
    And naprawa ma status Online Booking "Do podjęcia"
    And naprawa ma zadanie w kalendarzu
    When użytkownik używa funkcji "Przeplanuj" dla tej naprawy
    Then status Online Booking naprawy zostaje ustawiony na "Zaplanowana"
    And na zadaniu naprawy widoczna jest ikona "Rezerwacja online Zaplanowana"

  # AC: Ręczne planowanie nie ma wpływu na zmianę statusu
  Scenario: Ręczne planowanie zasobów nie zmienia statusu Online Booking
    Given istnieje naprawa pochodząca z Online Booking
    And naprawa ma status Online Booking "Do podjęcia"
    And naprawa ma zadanie w kalendarzu
    When użytkownik ręcznie planuje zasób warsztatu dla tej naprawy
    Then status Online Booking naprawy nadal ma wartość "Do podjęcia"
    And na zadaniu naprawy nie jest widoczna ikona "Rezerwacja online Zaplanowana"

  # AC: Dla napraw bez wpisu w tabeli dodanie rezerwacji na mechaniku powoduje pokazanie ikony
  Scenario: Dodanie rezerwacji mechanika dla naprawy bez wpisu pokazuje ikonę
    Given istnieje naprawa pochodząca z Online Booking bez wpisu w tabeli statusów
    And naprawa ma zadanie w kalendarzu
    And naprawa nie ma rezerwacji na mechaniku
    When użytkownik dodaje rezerwację na mechaniku dla tej naprawy
    Then status Online Booking naprawy zostaje rozpoznany jako "Zaplanowana"
    And na zadaniu naprawy widoczna jest ikona "Rezerwacja online Zaplanowana"

  # AC: Dla napraw bez wpisu w tabeli usunięcie wszystkich rezerwacji na mechanikach powoduje ukrycie ikony
  Scenario: Usunięcie wszystkich rezerwacji mechaników ukrywa ikonę
    Given istnieje naprawa pochodząca z Online Booking bez wpisu w tabeli statusów
    And naprawa ma zadanie w kalendarzu
    And naprawa ma rezerwację na mechaniku
    And na zadaniu naprawy widoczna jest ikona "Rezerwacja online Zaplanowana"
    When użytkownik usuwa wszystkie rezerwacje na mechanikach dla tej naprawy
    Then status Online Booking naprawy przestaje być rozpoznany jako "Zaplanowana"
    And na zadaniu naprawy nie jest widoczna ikona "Rezerwacja online Zaplanowana"

  # AC: Statusy Do podjęcia i Zaplanowana są dostępne tylko dla napraw pochodzących z Online Booking
  Scenario: Brak statusów Online Booking dla naprawy spoza Online Booking
    Given istnieje naprawa, która nie pochodzi z Online Booking
    And naprawa ma zadanie w kalendarzu
    When użytkownik otwiera menu statusu Online Booking dla tej naprawy
    Then status "Do podjęcia" nie jest dostępny
    And opcja zmiany statusu na "Zaplanowana" nie jest dostępna
    And na zadaniu naprawy nie jest widoczna ikona "Rezerwacja online Zaplanowana"

  # AC: Ikona jest ukrywana, gdy zdarzenie przestaje występować
  Scenario: Ukrycie ikony po utracie warunku pochodzenia z Online Booking
    Given użytkownik widzi w kalendarzu zadanie naprawy pochodzącej z Online Booking
    And naprawa ma status Online Booking "Zaplanowana"
    And na zadaniu naprawy widoczna jest ikona "Rezerwacja online Zaplanowana"
    When naprawa przestaje spełniać warunek pochodzenia z Online Booking
    Then widok kalendarza zostaje automatycznie odświeżony
    And na zadaniu naprawy nie jest widoczna ikona "Rezerwacja online Zaplanowana"
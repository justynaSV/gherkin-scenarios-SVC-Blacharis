# Zadanie: SVCLOUD-4682 — S18 — Zdarzenie - części niepotwierdzone
@czesci-niepotwierdzone @ui @regression @pl
Feature: Ikona części niepotwierdzonych na zadaniu w kalendarzu
  Jako doradca serwisowy lub mistrz warsztatu
  chcę widzieć ikonę informacyjną o niepotwierdzeniu części do naprawy bezpośrednio na zadaniu w kalendarzu BOK i Warsztatu,
  aby nie musieć otwierać każdej naprawy w celu weryfikacji tej informacji.

  Background:
    Given użytkownik jest zalogowany jako pracownik serwisu
    And w kalendarzu istnieje zadanie powiązane z naprawą

  # AC: Wyświetlenie ikony dla naprawy, w której części są wymagane i nie zostały potwierdzone
  @smoke
  Scenario Outline: Wyświetlenie ikony części niepotwierdzonych w kalendarzu
    Given użytkownik przegląda kalendarz "<kalendarz>"
    And naprawa powiązana z zadaniem ma części oznaczone jako "Wymagane"
    And części do naprawy nie zostały potwierdzone
    When system weryfikuje zadanie w kalendarzu
    Then na zadaniu widoczna jest ikona "Części niepotwierdzone"
    And ikona używa symbolu "box-open"

    Examples:
      | kalendarz |
      | BOK       |
      | Warsztatu |

  # AC: Ukrycie ikony dla naprawy, w której części są wymagane i zostały potwierdzone
  Scenario Outline: Ukrycie ikony po potwierdzeniu części
    Given użytkownik przegląda kalendarz "<kalendarz>"
    And naprawa powiązana z zadaniem ma części oznaczone jako "Wymagane"
    And części do naprawy zostały potwierdzone
    When system weryfikuje zadanie w kalendarzu
    Then na zadaniu nie jest widoczna ikona "Części niepotwierdzone"

    Examples:
      | kalendarz |
      | BOK       |
      | Warsztatu |

  # AC: Reakcja w czasie rzeczywistym po wystąpieniu zdarzenia
  Scenario Outline: Automatyczne pokazanie ikony po cofnięciu potwierdzenia części
    Given użytkownik przegląda kalendarz "<kalendarz>"
    And naprawa powiązana z zadaniem ma części oznaczone jako "Wymagane"
    And części do naprawy zostały potwierdzone
    And na zadaniu nie jest widoczna ikona "Części niepotwierdzone"
    When potwierdzenie części zostaje cofnięte
    Then widok kalendarza zostaje automatycznie zaktualizowany
    And na zadaniu widoczna jest ikona "Części niepotwierdzone"

    Examples:
      | kalendarz |
      | BOK       |
      | Warsztatu |

  # AC: Reakcja w czasie rzeczywistym po zniknięciu zdarzenia
  Scenario Outline: Automatyczne ukrycie ikony po potwierdzeniu części
    Given użytkownik przegląda kalendarz "<kalendarz>"
    And naprawa powiązana z zadaniem ma części oznaczone jako "Wymagane"
    And części do naprawy nie zostały potwierdzone
    And na zadaniu widoczna jest ikona "Części niepotwierdzone"
    When części do naprawy zostają potwierdzone
    Then widok kalendarza zostaje automatycznie zaktualizowany
    And na zadaniu nie jest widoczna ikona "Części niepotwierdzone"

    Examples:
      | kalendarz |
      | BOK       |
      | Warsztatu |

  # AC: Ikona jest wyświetlana wyłącznie dla zdarzenia "Części wymagane i niepotwierdzone"
  Scenario Outline: Brak ikony, gdy części nie wymagają potwierdzenia
    Given użytkownik przegląda kalendarz "<kalendarz>"
    And naprawa powiązana z zadaniem ma części oznaczone jako "<wartosc_czesci>"
    And części do naprawy nie zostały potwierdzone
    When system weryfikuje zadanie w kalendarzu
    Then na zadaniu nie jest widoczna ikona "Części niepotwierdzone"

    Examples:
      | kalendarz | wartosc_czesci |
      | BOK       | Niewymagane    |
      | Warsztatu | Niewymagane    |
      | BOK       | Brak           |
      | Warsztatu | Brak           |

  # AC: Konfiguracja nazwy i tłumaczeń ikony
  Scenario: Prezentacja nazwy ikony części niepotwierdzonych
    Given użytkownik przegląda kalendarz BOK
    And naprawa powiązana z zadaniem ma części oznaczone jako "Wymagane"
    And części do naprawy nie zostały potwierdzone
    When użytkownik sprawdza informację prezentowaną dla ikony
    Then prezentowana nazwa ikony to "Części niepotwierdzone"
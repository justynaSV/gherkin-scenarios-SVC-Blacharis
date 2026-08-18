# Zadanie QA: SVCLOUD-5613 — [QA] T10 (placeholder) brak blokady / ostatnia odpowiedź wygrywa (AC1/AC2, AC4 usunięte)
@brak-blokady-wg-statusu-ostatnia-odpowiedz
Feature: Brak blokady statusu naprawy i priorytet ostatniej odpowiedzi klienta
  Jako Doradca serwisowy chcę, aby odpowiedź klienta była zawsze przetwarzana niezależnie od statusu naprawy,
  aby żadna odpowiedź nie została utracona z powodu usuniętej blokady wg statusu naprawy.

  # AC1, AC4 usunięte: brak blokady aktualizacji statusu wg statusu naprawy w Planerze
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

  # AC1: kolejna odpowiedź klienta nadpisuje wcześniej ustawiony status potwierdzenia
  @regression
  Scenario: Nadpisanie wcześniejszego statusu potwierdzenia przez kolejną odpowiedź klienta
    Given naprawa ma status "Potwierdzenie wizyty" ustawiony na wartość "Potwierdzona" po wcześniejszej odpowiedzi
    When Planer otrzymuje z VS kolejną odpowiedź klienta "Rezygnuję z naprawy" na pytanie "Czy potwierdzasz wizytę?"
    Then system nadpisuje status "Potwierdzenie wizyty" na naprawie na wartość "Odwołana"

  # AC2: kolejna odpowiedź klienta nadpisuje wcześniej ustawioną flagę Klient czeka
  @regression
  Scenario: Nadpisanie wcześniejszej wartości flagi Klient czeka przez kolejną odpowiedź klienta
    Given flaga "Klient czeka" ma aktualnie wartość "zaznaczona" po wcześniejszej odpowiedzi klienta
    When Planer otrzymuje z VS kolejną odpowiedź klienta "Nie" na pytanie "Czy będziesz czekał na miejscu?"
    Then system nadpisuje flagę "Klient czeka" na wartość "niezaznaczona"
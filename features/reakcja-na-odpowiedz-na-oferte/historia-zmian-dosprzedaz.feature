# Zadanie QA: SVCLOUD-5634 — [QA] T5 (placeholder) Dosprzedaż — akceptacja/odrzucenie/brak oferty/anulowanie/przeplanowanie
@historia-zmian-dosprzedaz
Feature: Rejestracja w Historii naprawy odpowiedzi klienta na ofertę dosprzedaży
  Jako Doradca serwisowy chcę, aby odpowiedź klienta na ofertę dosprzedaży była widoczna w Historii naprawy,
  aby mieć pełny ślad audytowy decyzji klienta bez potrzeby otwierania wiadomości w VS.

  # AC5: wpis w Historii naprawy przy akceptacji co najmniej jednej pozycji (zależność: S11)
  @smoke @regression @api
  Scenario: Zarejestrowanie w Historii naprawy odpowiedzi klienta po akceptacji części pozycji oferty
    Given Planer otrzymał z VS pakiet decyzji klienta zawierający co najmniej jedną zaakceptowaną pozycję oferty
    When system zapisuje odpowiedź klienta w teczce naprawy
    Then w Historii naprawy pojawia się wpis z datą i godziną odebrania pakietu
    And wpis zawiera tekst "Klient udzielił odpowiedzi na ofertę"
    And wpis zawiera nazwy zaakceptowanych i odrzuconych pozycji

  # AC5: wpis w Historii naprawy przy odrzuceniu wszystkich pozycji (zależność: S11)
  @regression @api
  Scenario: Zarejestrowanie w Historii naprawy odrzucenia wszystkich pozycji oferty przez klienta
    Given Planer otrzymał z VS pakiet decyzji klienta odrzucający wszystkie pozycje oferty
    When system zapisuje odpowiedź klienta w teczce naprawy
    Then w Historii naprawy pojawia się wpis z datą i godziną odebrania pakietu
    And wpis zawiera tekst "Klient odrzucił wszystkie pozycje oferty"
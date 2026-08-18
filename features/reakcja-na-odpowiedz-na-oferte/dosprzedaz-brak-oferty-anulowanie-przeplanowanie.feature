# Zadanie QA: SVCLOUD-5634 — [QA] T5 (placeholder) Dosprzedaż — akceptacja/odrzucenie/brak oferty/anulowanie/przeplanowanie
@dosprzedaz-brak-oferty-anulowanie-przeplanowanie
Feature: Obsługa braku oferty, anulowania i przeplanowania naprawy w kontekście odpowiedzi na ofertę
  Jako Doradca serwisowy chcę, aby Planer poprawnie obsługiwał sytuacje bez oferty, po anulowaniu
  i po przeplanowaniu naprawy, aby pole „Dosprzedaż” i Historia naprawy odzwierciedlały wyłącznie
  wiarygodne decyzje klienta powiązane z aktywną naprawą.

  # AC6: brak wysłania pakietu, gdy wiadomość nie zawiera oferty
  @smoke @regression @api
  Scenario: Brak zmian w polu Dosprzedaż, gdy wiadomość wysłano bez oferty
    Given wiadomość do klienta wysłano z szablonem "— bez oferty —"
    When klient otwiera wiadomość w VS
    Then VS nie przesyła do Planera pakietu decyzji klienta
    And pole "Dosprzedaż" pozostaje puste
    And w Historii naprawy nie powstaje żaden wpis

  # AC6: brak wysłania pakietu, gdy klient nie wszedł w interakcję z zakładką Oferta
  @regression @api
  Scenario: Brak zmian w polu Dosprzedaż, gdy klient nie otworzył zakładki Oferta
    Given wiadomość do klienta zawiera ofertę dosprzedaży
    When klient nie wchodzi w interakcję z zakładką Oferta w VS
    Then VS nie przesyła do Planera pakietu decyzji klienta
    And pole "Dosprzedaż" pozostaje puste
    And w Historii naprawy nie powstaje żaden wpis

  # AC7: ignorowanie pakietu decyzji, gdy naprawa ma status Anulowana
  @regression @api
  Scenario: Zignorowanie pakietu decyzji klienta, gdy naprawa jest już anulowana
    Given naprawa w Planerze ma status "Anulowana"
    When Planer otrzymuje z VS pakiet decyzji klienta dotyczący tej naprawy
    Then system ignoruje odebrany pakiet
    And pole "Dosprzedaż" pozostaje bez zmian
    And w Historii naprawy nie powstaje żaden wpis

  # AC8: niezależny wpis po przeplanowaniu naprawy i odpowiedzi na nową ofertę
  @regression @api
  Scenario: Dopisanie niezależnego wpisu w polu Dosprzedaż po przeplanowaniu naprawy i odpowiedzi na nową ofertę
    Given naprawa została przeplanowana i posiada nową wiadomość z ofertą dosprzedaży
    When klient odpowiada na nową ofertę przypisaną do nowej wiadomości
    Then Planer traktuje odpowiedź jako niezależne zdarzenie
    And system dopisuje nowy blok danych z datą i treścią w polu "Dosprzedaż" zgodnie z zasadą kumulacji
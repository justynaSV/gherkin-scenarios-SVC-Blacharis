# Zadanie QA: SVCLOUD-5575 — [QA] T18 Weryfikacja edycji naprawy — edytowalność/blokada pola Oferta dosprzedaży
@edycja-naprawy-blokada-oferty
Feature: Edytowalność i blokada pola Oferta dosprzedaży w formularzu edycji naprawy
  Jako Doradca serwisowy chcę móc przypisać lub zmienić ofertę dosprzedaży w dowolnym momencie do chwili wysyłki wiadomości,
  aby pole było dostępne do edycji tylko wtedy, gdy ma to jeszcze znaczenie dla klienta.

  # A2: Doradca może przypisać lub zmienić szablon oferty później, w formularzu edycji naprawy.
  @regression
  Scenario: Przypisanie szablonu oferty dosprzedaży w formularzu edycji istniejącej naprawy
    Given istnieje zapisana naprawa bez przypisanej oferty dosprzedaży
    When użytkownik otwiera formularz edycji tej naprawy
    And doradca wybiera szablon oferty dosprzedaży "Przegląd okresowy"
    And użytkownik zapisuje zmiany
    Then naprawa ma przypisany szablon oferty dosprzedaży "Przegląd okresowy"

  # A4: Pole Oferta dosprzedaży pozwala wyłącznie wskazać gotowy szablon z VS, bez edycji jego pozycji i cen.
  @regression @ui
  Scenario: Brak możliwości edycji pozycji i cen wybranego szablonu oferty dosprzedaży z poziomu naprawy
    Given doradca wybrał szablon oferty dosprzedaży "Przegląd okresowy" dla naprawy
    When doradca otwiera szczegóły naprawy
    Then doradca nie widzi możliwości edycji pozycji ani cen szablonu oferty dosprzedaży
    And pozycje i ceny szablonu oferty dosprzedaży pochodzą wyłącznie z konfiguracji VS

  # Business process flow (krok 5): pole Oferta dosprzedaży blokuje się po wysłaniu wiadomości.
  @regression
  Scenario: Zablokowanie pola Oferta dosprzedaży po wysłaniu wiadomości potwierdzenia wizyty
    Given system wysłał już wiadomość potwierdzenia wizyty dla naprawy
    When użytkownik otwiera formularz edycji tej naprawy
    Then pole "Oferta dosprzedaży" jest zablokowane do edycji

  # Business process flow (krok 6): pole Oferta dosprzedaży odblokowuje się po przeplanowaniu naprawy.
  @regression
  Scenario: Odblokowanie pola Oferta dosprzedaży po przeplanowaniu naprawy
    Given pole "Oferta dosprzedaży" jest zablokowane po wcześniejszej wysyłce wiadomości
    When doradca przeplanowuje naprawę na nowy termin
    Then pole "Oferta dosprzedaży" staje się ponownie aktywne do momentu kolejnej wysyłki

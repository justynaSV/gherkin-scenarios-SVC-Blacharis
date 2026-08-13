# Zadanie QA: SVCLOUD-5576 — [QA] T17 Weryfikacja teczki naprawy — pole Oferta dosprzedaży
@teczka-naprawy-oferta-dosprzedazy
Feature: Pole Oferta dosprzedaży w teczce i kreatorze naprawy
  Jako Doradca serwisowy chcę widzieć i opcjonalnie wybrać ofertę dosprzedaży dla naprawy,
  aby móc skorzystać z gotowego szablonu oferty bez blokowania procesu zapisu naprawy.

  # A1: Pole "Oferta dosprzedaży" w kreatorze naprawy, zasilane aktywnymi szablonami z VS.
  @smoke @regression @ui
  Scenario: Wyświetlenie pola Oferta dosprzedaży z domyślną wartością Bez oferty w kreatorze naprawy
    Given użytkownik otwiera kreator nowej naprawy w kroku "Informacje dodatkowe"
    When doradca wyświetla pole "Oferta dosprzedaży"
    Then pole "Oferta dosprzedaży" ma domyślnie zaznaczoną wartość "Bez oferty"
    And lista pola "Oferta dosprzedaży" zawiera wyłącznie aktywne szablony ofert pobrane z VS

  # A1: Widoczność szablonu oferty na liście zależy wyłącznie od jego statusu w VS.
  @regression @ui
  Scenario Outline: Widoczność szablonu oferty dosprzedaży na liście w zależności od jego statusu w VS
    Given w konfiguracji VS istnieje szablon oferty dosprzedaży "Przegląd okresowy" w statusie "<status>"
    When użytkownik otwiera pole wyboru "Oferta dosprzedaży" w kreatorze naprawy
    Then doradca "<widocznosc>" szablon "Przegląd okresowy" na liście

    Examples:
      | status          | widocznosc |
      | Aktywny         | widzi      |
      | W przygotowaniu | nie widzi  |
      | Historyczny     | nie widzi  |

  # A2, A3: Wybór szablonu oferty jest opcjonalny i nie blokuje zapisu naprawy.
  @smoke @regression
  Scenario: Zapisanie naprawy bez wyboru oferty dosprzedaży
    Given doradca wypełnia dane naprawy w kreatorze nowej naprawy
    And doradca pozostawia pole "Oferta dosprzedaży" z wartością "Bez oferty"
    When doradca zapisuje naprawę
    Then naprawa zostaje zapisana bez przypisanej oferty dosprzedaży

# Zadanie QA: SVCLOUD-5614 — [QA] T13 Anulowanie/przeplanowanie → RO w Public Client (AC8)
@tryb-ro-public-client-po-anulowaniu-przeplanowaniu
Feature: Tryb tylko do odczytu w Public Client po anulowaniu lub przeplanowaniu naprawy
  Jako Doradca serwisowy chcę, aby Public Client klienta przechodził w tryb tylko do odczytu po zmianie naprawy,
  aby klient nie mógł już odpowiadać na nieaktualne pytania, ankiety i oferty dosprzedaży.

  # AC8: przełączenie Public Clienta w tryb RO po anulowaniu naprawy
  @smoke @regression @ui
  Scenario: Przełączenie Public Clienta w tryb tylko do odczytu po anulowaniu naprawy
    Given klient otrzymał aktywny link do formularza potwierdzenia wizyty
    When doradca anuluje naprawę w Service Plannerze
    Then Public Client przechodzi w tryb tylko do odczytu
    And Public Client wyświetla u góry komunikat informujący, że wiadomość jest nieaktualna

  # AC8: przełączenie Public Clienta w tryb RO po przeplanowaniu naprawy
  @smoke @regression @ui
  Scenario: Przełączenie Public Clienta w tryb tylko do odczytu po przeplanowaniu naprawy
    Given klient otrzymał aktywny link do formularza potwierdzenia wizyty
    When doradca przeplanowuje naprawę w Service Plannerze
    Then Public Client przechodzi w tryb tylko do odczytu
    And Public Client wyświetla u góry komunikat informujący, że wiadomość jest nieaktualna

  # AC8: brak możliwości odpowiedzi na pytania potwierdzenia wizyty w trybie RO
  @regression @ui
  Scenario: Brak możliwości udzielenia odpowiedzi na pytania potwierdzenia wizyty w trybie RO
    Given Public Client znajduje się w trybie tylko do odczytu po anulowaniu naprawy
    When klient próbuje odpowiedzieć na pytania potwierdzenia wizyty
    Then system nie zapisuje udzielonej odpowiedzi
    And Public Client wyświetla przy pytaniach komunikat "Upłynął czas na udzielenie odpowiedzi"

  # AC8: brak możliwości odpowiedzi na ankietę i ofertę dosprzedaży w trybie RO
  @regression @ui
  Scenario: Brak możliwości udzielenia odpowiedzi na ankietę i ofertę dosprzedaży w trybie RO
    Given Public Client znajduje się w trybie tylko do odczytu po przeplanowaniu naprawy
    When klient próbuje odpowiedzieć na ankietę lub ofertę dosprzedaży
    Then system nie zapisuje udzielonej odpowiedzi
    And Public Client wyświetla przy ankiecie i ofercie komunikat "Upłynął czas na udzielenie odpowiedzi"

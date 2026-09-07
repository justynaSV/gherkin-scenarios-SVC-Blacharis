# Zadanie: SVCLOUD-2299 (QA: SVCLOUD-2320) — Przypisany blacharz - Weryfikacja teczki naprawy
@blacharz-teczka-naprawy
Feature: Prezentacja przypisanego blacharza w teczce naprawy
  Jako pracownik BOK lub warsztatu chcę widzieć przypisanego blacharza w pełnej teczce naprawy,
  aby mieć pewność, kto zrealizuje naprawę w późniejszym terminie.

  # AC3: w pełnej teczce naprawy w sekcji 'Naprawa' widoczne jest pole 'Przypisany blacharz'.
  @smoke @regression
  Scenario: Prezentacja przypisanego blacharza w pełnej teczce naprawy
    Given naprawa ma przypisanego blacharza "Jan Kowalski"
    When użytkownik otwiera pełną teczkę naprawy
    And użytkownik przechodzi do sekcji 'Naprawa' w menu 'Naprawa'
    Then w sekcji 'Naprawa' widoczne jest pole 'Przypisany blacharz'
    And pole 'Przypisany blacharz' pokazuje nazwę "Jan Kowalski"

  # AC3: nazwa w teczce odpowiada osobie wskazanej podczas edycji sekcji 'Naprawa'.
  @regression
  Scenario: Zgodność nazwy blacharza w teczce z wyborem z edycji sekcji Naprawa
    Given użytkownik edytuje sekcję 'Naprawa' w pełnej teczce naprawy
    When użytkownik wybiera w polu 'Przypisany blacharz' osobę "Adam Nowak"
    And użytkownik zapisuje zmiany
    Then pole 'Przypisany blacharz' w sekcji 'Naprawa' pokazuje nazwę "Adam Nowak"

  # AC4: po przekazaniu naprawy do innego warsztatu pole nadal pokazuje pierwotnie wybranego blacharza.
  @regression
  Scenario: Zachowanie historycznego blacharza po przekazaniu naprawy do innego warsztatu
    Given w BOK przypisano do naprawy blacharza "Jan Kowalski" z warsztatu "Warsztat Śródmieście"
    When naprawa zostaje przekazana do warsztatu "Warsztat Mokotów"
    And użytkownik warsztatu "Warsztat Mokotów" otwiera pełną teczkę naprawy
    Then pole 'Przypisany blacharz' pokazuje nazwę "Jan Kowalski"

  # AC6: brak przypisania blacharza skutkuje pustym polem w teczce naprawy.
  @regression
  Scenario: Puste pole blacharza w teczce naprawy dla naprawy bez przypisanej osoby
    Given naprawa nie ma przypisanego blacharza
    When użytkownik otwiera pełną teczkę naprawy
    Then pole 'Przypisany blacharz' w sekcji 'Naprawa' jest puste

  # Opis: tooltip z nazwą pola wyświetlany po najechaniu myszą na pola blacharza i kosztorysanta.
  @regression @ui
  Scenario Outline: Tooltip z nazwą pola po najechaniu myszą w sekcji Naprawa
    Given użytkownik otwiera pełną teczkę naprawy w sekcji 'Naprawa'
    When użytkownik najeżdża wskaźnikiem myszy na pole „<pole>"
    Then pojawia się tooltip z tekstem „<pole>"

    Examples:
      | pole                       |
      | Blacharz przypisany        |
      | Kosztorysant odpowiedzialny |

  # Opis: ikona klucza przy przypisanym blacharzu oraz ikona doradcy przy kosztorysancie.
  @regression @ui
  Scenario: Ikony rozróżniające pola przypisanego blacharza i kosztorysanta
    Given użytkownik otwiera pełną teczkę naprawy w sekcji 'Naprawa'
    Then pole 'Przypisany blacharz' jest oznaczone ikoną klucza
    And pole „Kosztorysant odpowiedzialny" jest oznaczone ikoną doradcy

  # Opis: tłumaczenie etykiety pola blacharza zależnie od języka interfejsu (wartości en/cz do potwierdzenia).
  @translations @regression
  Scenario Outline: Wyświetlenie poprawnego tłumaczenia nazwy pola Blacharz przypisany w zależności od języka
    Given pole 'Przypisany blacharz' jest widoczne dla użytkownika
    And użytkownik ma ustawiony język interfejsu "<jezyk>"
    When użytkownik wyświetla tekst etykiety pola 'Przypisany blacharz'
    Then użytkownik widzi nazwę pola "<tlumaczenie>"

    Examples:
      | jezyk | tlumaczenie           |
      | pl-PL | Blacharz przypisany   |
      | en    | Assigned panel beater |
      | cz    | Přiřazený klempíř     |

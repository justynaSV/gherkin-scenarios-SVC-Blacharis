# Zadanie: SVCLOUD-2299 — Przypisany blacharz - Przypisanie blacharza do naprawy
@przypisany-blacharz
Feature: Przypisanie blacharza do naprawy
  Jako pracownik BOK lub warsztatu chcę przypisać konkretnego blacharza do naprawy,
  aby odpowiednia osoba zrealizowała naprawę w późniejszym terminie.

  # AC1: W oknie „Edycja naprawy" dodano pole „Przypisany blacharz" (lista rozwijana).
  @smoke @regression
  Scenario: Przypisanie blacharza do naprawy w oknie Edycja naprawy
    Given użytkownik pracuje w BOK powiązanym z warsztatem "Warsztat Śródmieście"
    And naprawa nie ma przypisanego blacharza
    When użytkownik otwiera okno „Edycja naprawy"
    And użytkownik wybiera w polu „Przypisany blacharz" osobę "Jan Kowalski"
    And użytkownik zapisuje zmiany
    Then naprawa ma przypisanego blacharza "Jan Kowalski"

  # AC1: pole „Przypisany blacharz" jest listą rozwijaną wyboru osoby w oknie edycji naprawy BL.
  @regression @ui
  Scenario: Pole „Przypisany blacharz" jest dostępne jako lista rozwijana wyboru osoby
    Given użytkownik edytuje naprawę prowadzoną w kontekście blacharskim
    When użytkownik otwiera okno „Edycja naprawy"
    Then pole „Przypisany blacharz" jest widoczne w oknie edycji naprawy
    And pole „Przypisany blacharz" pozwala wybrać jedną osobę z rozwijanej listy

  # AC1: możliwość zmiany wcześniej przypisanego blacharza.
  @regression
  Scenario: Zmiana wcześniej przypisanego blacharza na inną osobę
    Given do naprawy przypisano wcześniej blacharza "Jan Kowalski"
    When użytkownik otwiera okno „Edycja naprawy"
    And użytkownik wybiera w polu „Przypisany blacharz" osobę "Adam Nowak"
    And użytkownik zapisuje zmiany
    Then naprawa ma przypisanego blacharza "Adam Nowak"
    And naprawa nie ma już przypisanego blacharza "Jan Kowalski"

  # AC1, AC6: wyczyszczenie przypisania blacharza.
  @regression
  Scenario: Usunięcie przypisania blacharza z naprawy
    Given naprawa ma przypisanego blacharza "Jan Kowalski"
    When użytkownik otwiera okno „Edycja naprawy"
    And użytkownik czyści pole „Przypisany blacharz"
    And użytkownik zapisuje zmiany
    Then pole „Przypisany blacharz" dla naprawy jest puste

  # AC2: lista zawiera tylko blacharzy z warsztatu właściwego dla kontekstu edycji.
  @regression
  Scenario Outline: Zawartość listy „Przypisany blacharz" zależnie od kontekstu edycji
    Given użytkownik edytuje naprawę w kontekście "<kontekst>"
    And z tym kontekstem powiązany jest warsztat "Warsztat Śródmieście"
    And w warsztacie "Warsztat Śródmieście" pracują blacharze "Jan Kowalski, Adam Nowak"
    When użytkownik rozwija pole „Przypisany blacharz"
    Then lista zawiera osoby "Jan Kowalski, Adam Nowak"

    Examples:
      | kontekst    |
      | BOK         |
      | warsztat BL |

  # AC2: osoby o innym rodzaju zasobu niż „Blacharz" nie trafiają na listę.
  @regression
  Scenario: Pominięcie na liście osób o innym rodzaju zasobu niż „Blacharz"
    Given użytkownik edytuje naprawę w kontekście BOK powiązanym z warsztatem "Warsztat Śródmieście"
    And w warsztacie "Warsztat Śródmieście" pracuje blacharz "Jan Kowalski"
    And w warsztacie "Warsztat Śródmieście" pracuje doradca "Piotr Zieliński"
    When użytkownik rozwija pole „Przypisany blacharz"
    Then lista zawiera osobę "Jan Kowalski"
    And lista nie zawiera osoby "Piotr Zieliński"

  # AC2: blacharze spoza właściwego warsztatu nie trafiają na listę.
  @regression
  Scenario: Pominięcie na liście blacharzy z innego warsztatu niż powiązany z kontekstem
    Given użytkownik edytuje naprawę w kontekście BOK powiązanym z warsztatem "Warsztat Śródmieście"
    And w powiązanym warsztacie pracuje blacharz "Jan Kowalski"
    And w innym warsztacie "Warsztat Mokotów" pracuje blacharz "Marek Wójcik"
    When użytkownik rozwija pole „Przypisany blacharz"
    Then lista zawiera osobę "Jan Kowalski"
    And lista nie zawiera osoby "Marek Wójcik"

  # AC3: w pełnej teczce naprawy w sekcji „Naprawa" widoczne jest pole „Blacharz przypisany".
  @smoke @regression
  Scenario: Prezentacja przypisanego blacharza w pełnej teczce naprawy
    Given naprawa ma przypisanego blacharza "Jan Kowalski"
    When użytkownik otwiera pełną teczkę naprawy
    And użytkownik przechodzi do sekcji „Naprawa" w menu „Naprawa"
    Then w sekcji „Naprawa" widoczne jest pole „Blacharz przypisany"
    And pole „Blacharz przypisany" pokazuje nazwę "Jan Kowalski"

  # AC3: nazwa w teczce odpowiada osobie wskazanej podczas edycji sekcji „Naprawa".
  @regression
  Scenario: Zgodność nazwy blacharza w teczce z wyborem z edycji sekcji Naprawa
    Given użytkownik edytuje sekcję „Naprawa" w pełnej teczce naprawy
    When użytkownik wybiera w polu „Przypisany blacharz" osobę "Adam Nowak"
    And użytkownik zapisuje zmiany
    Then pole „Blacharz przypisany" w sekcji „Naprawa" pokazuje nazwę "Adam Nowak"

  # AC4: po przekazaniu naprawy do innego warsztatu pole nadal pokazuje pierwotnie wybranego blacharza.
  @regression
  Scenario: Zachowanie historycznego blacharza po przekazaniu naprawy do innego warsztatu
    Given w BOK przypisano do naprawy blacharza "Jan Kowalski" z warsztatu "Warsztat Śródmieście"
    When naprawa zostaje przekazana do warsztatu "Warsztat Mokotów"
    And użytkownik warsztatu "Warsztat Mokotów" otwiera naprawę
    Then pole „Blacharz przypisany" pokazuje nazwę "Jan Kowalski"

  # AC4: podczas edycji w nowym warsztacie dotychczasowa wartość pozostaje widoczna mimo innej listy.
  @regression
  Scenario: Widoczność historycznego blacharza podczas edycji naprawy w nowym warsztacie
    Given naprawa ma przypisanego blacharza "Jan Kowalski" z warsztatu "Warsztat Śródmieście"
    And naprawa jest obsługiwana przez warsztat "Warsztat Mokotów"
    When użytkownik warsztatu "Warsztat Mokotów" otwiera okno „Edycja naprawy"
    Then pole „Przypisany blacharz" nadal pokazuje "Jan Kowalski"
    And rozwinięta lista „Przypisany blacharz" zawiera blacharzy warsztatu "Warsztat Mokotów"

  # AC5: w kontekście naprawy widoczne są nazwy przypisanego blacharza i kosztorysanta.
  @smoke @regression
  Scenario: Prezentacja blacharza i kosztorysanta w kontekście naprawy
    Given naprawa ma przypisanego blacharza "Jan Kowalski"
    And naprawa ma przypisanego kosztorysanta "Ewa Lewandowska"
    When użytkownik otwiera kontekst naprawy
    And użytkownik przechodzi do sekcji „Naprawa"
    Then w sekcji „Naprawa" widoczna jest nazwa blacharza "Jan Kowalski"
    And w sekcji „Naprawa" widoczna jest nazwa kosztorysanta "Ewa Lewandowska"

  # AC6: brak przypisania blacharza skutkuje pustym polem w każdym widoku.
  @regression
  Scenario Outline: Puste pole blacharza dla naprawy bez przypisanej osoby
    Given naprawa nie ma przypisanego blacharza
    When użytkownik otwiera widok "<widok>"
    Then pole blacharza w tym widoku jest puste

    Examples:
      | widok                |
      | Edycja naprawy       |
      | pełna teczka naprawy |
      | kontekst naprawy     |

  # Opis: tooltip z nazwą pola wyświetlany po najechaniu myszą na pola blacharza i kosztorysanta.
  @regression @ui
  Scenario Outline: Tooltip z nazwą pola po najechaniu myszą w sekcji Naprawa
    Given użytkownik otwiera pełną teczkę naprawy w sekcji „Naprawa"
    When użytkownik najeżdża wskaźnikiem myszy na pole „<pole>"
    Then pojawia się tooltip z tekstem „<pole>"

    Examples:
      | pole                       |
      | Blacharz przypisany        |
      | Kosztorysant odpowiedzialny |

  # Opis: ikona klucza przy przypisanym blacharzu oraz ikona doradcy przy kosztorysancie.
  @regression @ui
  Scenario: Ikony rozróżniające pola przypisanego blacharza i kosztorysanta
    Given użytkownik otwiera pełną teczkę naprawy w sekcji „Naprawa"
    Then pole „Blacharz przypisany" jest oznaczone ikoną klucza
    And pole „Kosztorysant odpowiedzialny" jest oznaczone ikoną doradcy

  # Opis: tłumaczenie etykiety pola blacharza zależnie od języka interfejsu (wartości en/cz do potwierdzenia).
  @translations @regression
  Scenario Outline: Wyświetlenie poprawnego tłumaczenia nazwy pola Blacharz przypisany w zależności od języka
    Given pole „Blacharz przypisany" jest widoczne dla użytkownika
    And użytkownik ma ustawiony język interfejsu "<jezyk>"
    When użytkownik wyświetla tekst etykiety pola „Blacharz przypisany"
    Then użytkownik widzi nazwę pola "<tlumaczenie>"

    Examples:
      | jezyk | tlumaczenie           |
      | pl-PL | Blacharz przypisany   |
      | en    | Assigned panel beater |
      | cz    | Přiřazený klempíř     |

# Zadanie: SVCLOUD-2299 (QA: SVCLOUD-2319) — Przypisany blacharz - Weryfikacja edycji naprawy
@blacharz-edycja-naprawy
Feature: Przypisanie blacharza do naprawy w oknie edycji
  Jako pracownik BOK lub warsztatu chcę przypisać konkretnego blacharza do naprawy w oknie
  „Edycja naprawy", aby odpowiednia osoba zrealizowała naprawę w późniejszym terminie.

  # AC1: W oknie „Edycja naprawy" dodano pole 'Przypisany blacharz' (lista rozwijana).
  @smoke @regression
  Scenario: Przypisanie blacharza do naprawy w oknie Edycja naprawy
    Given użytkownik pracuje w BOK powiązanym z warsztatem "Warsztat Śródmieście"
    And naprawa nie ma przypisanego blacharza
    When użytkownik otwiera okno „Edycja naprawy"
    And użytkownik wybiera w polu 'Przypisany blacharz' osobę "Jan Kowalski"
    And użytkownik zapisuje zmiany
    Then naprawa ma przypisanego blacharza "Jan Kowalski"

  # AC1: pole 'Przypisany blacharz' jest listą rozwijaną wyboru osoby w oknie edycji naprawy BL.
  @regression @ui
  Scenario: Pole 'Przypisany blacharz' jest dostępne jako lista rozwijana wyboru osoby
    Given użytkownik edytuje naprawę prowadzoną w kontekście blacharskim
    When użytkownik otwiera okno „Edycja naprawy"
    Then pole 'Przypisany blacharz' jest widoczne w oknie edycji naprawy
    And pole 'Przypisany blacharz' pozwala wybrać jedną osobę z rozwijanej listy

  # AC1: możliwość zmiany wcześniej przypisanego blacharza.
  @regression
  Scenario: Zmiana wcześniej przypisanego blacharza na inną osobę
    Given do naprawy przypisano wcześniej blacharza "Jan Kowalski"
    When użytkownik otwiera okno „Edycja naprawy"
    And użytkownik wybiera w polu 'Przypisany blacharz' osobę "Adam Nowak"
    And użytkownik zapisuje zmiany
    Then naprawa ma przypisanego blacharza "Adam Nowak"
    And naprawa nie ma już przypisanego blacharza "Jan Kowalski"

  # AC1, AC6: wyczyszczenie przypisania blacharza.
  @regression
  Scenario: Usunięcie przypisania blacharza z naprawy
    Given naprawa ma przypisanego blacharza "Jan Kowalski"
    When użytkownik otwiera okno „Edycja naprawy"
    And użytkownik czyści pole 'Przypisany blacharz'
    And użytkownik zapisuje zmiany
    Then pole 'Przypisany blacharz' dla naprawy jest puste

  # AC2: lista zawiera tylko blacharzy z warsztatu właściwego dla kontekstu edycji.
  @regression
  Scenario Outline: Zawartość listy 'Przypisany blacharz' zależnie od kontekstu edycji
    Given użytkownik edytuje naprawę w kontekście "<kontekst>"
    And z tym kontekstem powiązany jest warsztat "Warsztat Śródmieście"
    And w warsztacie "Warsztat Śródmieście" pracują blacharze "Jan Kowalski, Adam Nowak"
    When użytkownik rozwija pole 'Przypisany blacharz'
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
    When użytkownik rozwija pole 'Przypisany blacharz'
    Then lista zawiera osobę "Jan Kowalski"
    And lista nie zawiera osoby "Piotr Zieliński"

  # AC2: blacharze spoza właściwego warsztatu nie trafiają na listę.
  @regression
  Scenario: Pominięcie na liście blacharzy z innego warsztatu niż powiązany z kontekstem
    Given użytkownik edytuje naprawę w kontekście BOK powiązanym z warsztatem "Warsztat Śródmieście"
    And w powiązanym warsztacie pracuje blacharz "Jan Kowalski"
    And w innym warsztacie "Warsztat Mokotów" pracuje blacharz "Marek Wójcik"
    When użytkownik rozwija pole 'Przypisany blacharz'
    Then lista zawiera osobę "Jan Kowalski"
    And lista nie zawiera osoby "Marek Wójcik"

  # AC4: podczas edycji w nowym warsztacie dotychczasowa wartość pozostaje widoczna mimo innej listy.
  @regression
  Scenario: Widoczność historycznego blacharza podczas edycji naprawy w nowym warsztacie
    Given naprawa ma przypisanego blacharza "Jan Kowalski" z warsztatu "Warsztat Śródmieście"
    And naprawa jest obsługiwana przez warsztat "Warsztat Mokotów"
    When użytkownik warsztatu "Warsztat Mokotów" otwiera okno „Edycja naprawy"
    Then pole 'Przypisany blacharz' nadal pokazuje "Jan Kowalski"
    And rozwinięta lista 'Przypisany blacharz' zawiera blacharzy warsztatu "Warsztat Mokotów"

  # AC6: brak przypisania blacharza skutkuje pustym polem w oknie edycji naprawy.
  @regression
  Scenario: Puste pole blacharza w oknie Edycja naprawy dla naprawy bez przypisanej osoby
    Given naprawa nie ma przypisanego blacharza
    When użytkownik otwiera okno „Edycja naprawy"
    Then pole 'Przypisany blacharz' jest puste

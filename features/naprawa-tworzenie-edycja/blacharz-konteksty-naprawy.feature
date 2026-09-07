# Zadanie: SVCLOUD-2299 (QA: SVCLOUD-2323) — Przypisany blacharz - Weryfikacja kontekstów naprawy
@blacharz-konteksty-naprawy
Feature: Prezentacja przypisanego blacharza w kontekście naprawy
  Jako pracownik BOK lub warsztatu chcę widzieć przypisanego blacharza i kosztorysanta w kontekście
  naprawy (blacharnia, warsztat, dział części), aby szybko zorientować się kto realizuje naprawę.

  # AC5: w kontekście naprawy widoczne są nazwy przypisanego blacharza i kosztorysanta.
  @smoke @regression
  Scenario: Prezentacja blacharza i kosztorysanta w kontekście naprawy
    Given naprawa ma przypisanego blacharza "Jan Kowalski"
    And naprawa ma przypisanego kosztorysanta "Ewa Lewandowska"
    When użytkownik otwiera kontekst naprawy
    And użytkownik przechodzi do sekcji 'Naprawa'
    Then w sekcji 'Naprawa' widoczna jest nazwa blacharza "Jan Kowalski"
    And w sekcji 'Naprawa' widoczna jest nazwa kosztorysanta "Ewa Lewandowska"

  # AC5: kontekst naprawy jest dostępny w blacharni, warsztacie i dziale części.
  @regression
  Scenario Outline: Prezentacja przypisanego blacharza w kontekście naprawy w różnych działach
    Given naprawa ma przypisanego blacharza "Jan Kowalski"
    When użytkownik działu "<dzial>" otwiera kontekst naprawy
    And użytkownik przechodzi do sekcji 'Naprawa'
    Then w sekcji 'Naprawa' widoczna jest nazwa blacharza "Jan Kowalski"

    Examples:
      | dzial          |
      | blacharnia      |
      | warsztat        |
      | dział części    |

  # AC6: brak przypisania blacharza skutkuje pustym polem w kontekście naprawy.
  @regression
  Scenario: Puste pole blacharza w kontekście naprawy dla naprawy bez przypisanej osoby
    Given naprawa nie ma przypisanego blacharza
    When użytkownik otwiera kontekst naprawy
    And użytkownik przechodzi do sekcji 'Naprawa'
    Then pole blacharza w sekcji 'Naprawa' jest puste

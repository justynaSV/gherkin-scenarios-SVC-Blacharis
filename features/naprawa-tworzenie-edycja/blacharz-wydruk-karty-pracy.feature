# Zadanie: SVCLOUD-2300 (QA: SVCLOUD-2349) — Przypisany blacharz - Wydruk karty pracy

@blacharz-wydruk-karty-pracy
Feature: Prezentacja przypisanego blacharza na wydruku karty pracy
  Jako pracownik warsztatu chcę widzieć przypisanego blacharza na wydruku karty pracy,
  aby wiedzieć, kto jest odpowiedzialny za wykonanie naprawy.

  # AC1, AC2: pole zmienione na 'Przypisany BL' pokazuje wartość z pola 'Przypisany blacharz'.
  @smoke @regression
  Scenario: Prezentacja przypisanego blacharza w polu 'Przypisany BL' na wydruku karty pracy
    Given naprawa ma przypisanego blacharza "Jan Kowalski"
    When użytkownik drukuje kartę pracy z sekcji 'Szkody'
    Then wydruk karty pracy zawiera pole 'Przypisany BL'
    And pole 'Przypisany BL' na wydruku pokazuje wartość "Jan Kowalski"

  # AC2: pole na wydruku nie nosi już poprzedniej nazwy 'Zaplanowany'.
  @regression
  Scenario: Brak starej etykiety 'Zaplanowany' na wydruku karty pracy
    Given naprawa ma przypisanego blacharza "Jan Kowalski"
    When użytkownik drukuje kartę pracy z sekcji 'Szkody'
    Then wydruk karty pracy nie zawiera pola 'Zaplanowany'

  # AC3: brak przypisania blacharza skutkuje pustym polem na wydruku.
  @regression
  Scenario: Puste pole 'Przypisany BL' na wydruku dla naprawy bez przypisanego blacharza
    Given naprawa nie ma przypisanego blacharza
    When użytkownik drukuje kartę pracy z sekcji 'Szkody'
    Then pole 'Przypisany BL' na wydruku jest puste

  # AC4: wartość na wydruku odpowiada osobie aktualnie wybranej w polu 'Przypisany blacharz'.
  @regression
  Scenario: Zgodność wartości na wydruku z polem 'Przypisany blacharz' wybranym w edycji naprawy
    Given użytkownik wybrał w polu 'Przypisany blacharz' osobę "Adam Nowak" podczas edycji naprawy
    When użytkownik drukuje kartę pracy z sekcji 'Szkody'
    Then pole 'Przypisany BL' na wydruku pokazuje wartość "Adam Nowak"

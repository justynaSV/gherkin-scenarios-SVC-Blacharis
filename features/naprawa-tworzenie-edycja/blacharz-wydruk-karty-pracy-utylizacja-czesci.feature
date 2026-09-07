# Zadanie: SVCLOUD-2302 (QA: SVCLOUD-2356) — Karta pracy - utylizacja części

@blacharz-wydruk-karty-pracy-utylizacja-czesci
Feature: Prezentacja rodzaju utylizacji części na wydruku karty pracy
  Jako pracownik warsztatu chcę widzieć na wydruku karty pracy informację o rodzaju utylizacji części,
  aby wiedzieć, jak postępować z wymienionymi częściami.

  # AC1, AC2: pole 'Części' w sekcji 'Dodatkowe informacje' pokazuje wartość z pola 'Rodzaj utylizacji części'.
  @smoke @regression
  Scenario Outline: Prezentacja wybranego rodzaju utylizacji części w polu 'Części' na wydruku karty pracy
    Given naprawa ma w polu 'Rodzaj utylizacji części' wybraną wartość "<rodzaj_utylizacji>"
    When użytkownik drukuje kartę pracy z sekcji 'Szkody'
    Then wydruk karty pracy zawiera w sekcji 'Dodatkowe informacje' pole 'Części'
    And pole 'Części' na wydruku pokazuje wartość "<rodzaj_utylizacji>"

    Examples:
      | rodzaj_utylizacji          |
      | utylizacja przez serwis    |
      | udokumentowanie złomowanie |
      | zwrot do klienta           |

  # AC2: brak wybranej wartości nie powoduje wyświetlenia żadnego tekstu w polu 'Części'.
  @regression
  Scenario: Puste pole 'Części' na wydruku dla naprawy bez wybranego rodzaju utylizacji części
    Given naprawa ma puste pole 'Rodzaj utylizacji części'
    When użytkownik drukuje kartę pracy z sekcji 'Szkody'
    Then wydruk karty pracy zawiera w sekcji 'Dodatkowe informacje' pole 'Części'
    And pole 'Części' na wydruku jest puste

  # AC1: zgodność wartości na wydruku z polem wybranym podczas edycji szkody.
  @regression
  Scenario: Zgodność wartości na wydruku z polem 'Rodzaj utylizacji części' wybranym w edycji szkody
    Given użytkownik wybrał w polu 'Rodzaj utylizacji części' wartość "zwrot do klienta" podczas edycji szkody
    When użytkownik drukuje kartę pracy z sekcji 'Szkody'
    Then pole 'Części' na wydruku pokazuje wartość "zwrot do klienta"

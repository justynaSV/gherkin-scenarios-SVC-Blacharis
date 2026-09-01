# Zadanie: SVCLOUD-5532 — S10 — Podgląd wiadomości VS z listy wiadomości w Planerze
@podglad-wiadomosci-vs @pl
Feature: Ikona linku do wiadomości VS na liście wiadomości w Planerze
  Jako Doradca serwisowy chcę otworzyć wiadomość wysłaną do klienta bezpośrednio z listy
  wiadomości w Planerze, aby bez zbędnych kroków sprawdzić treść i ofertę, które klient
  otrzymał, przed rozmową przy przyjęciu pojazdu.

  Background:
    Given doradca serwisowy otworzył listę wiadomości w teczce naprawy

  # AC1: Ikona linku w nowej kolumnie Operacje wyłącznie dla wiadomości typu Wiadomość VS.
  @smoke @regression @ui
  Scenario: Wyświetlenie ikony linku w kolumnie Operacje dla wiadomości typu Wiadomość VS
    Given lista wiadomości zawiera wiadomość typu "Wiadomość VS"
    Then w kolumnie "Operacje" dla tej wiadomości widoczna jest ikona linku

  # AC1: Brak ikony dla wierszy innych typów wiadomości.
  @regression @ui
  Scenario Outline: Brak ikony linku w kolumnie Operacje dla innych typów wiadomości
    Given lista wiadomości zawiera wiadomość typu "<typ_wiadomosci>"
    Then w kolumnie "Operacje" dla tej wiadomości ikona linku nie jest widoczna

    Examples:
      | typ_wiadomosci |
      | SMS            |
      | E-mail         |

  # AC2: Widoczność i klikalność ikony niezależna od uprawnień doradcy do VS.
  @regression @permissions
  Scenario Outline: Widoczność i klikalność ikony linku niezależnie od uprawnień doradcy do VS
    Given lista wiadomości zawiera wiadomość typu "Wiadomość VS"
    And doradca "<posiada_uprawnienia>" uprawnienia do przeglądania wiadomości w VS
    Then ikona linku dla tej wiadomości jest widoczna
    And ikona linku dla tej wiadomości jest klikalna

    Examples:
      | posiada_uprawnienia |
      | posiada             |
      | nie posiada         |

  # AC3: Kliknięcie ikony otwiera wiadomość w panelu VS w nowym oknie/karcie, Planer pozostaje otwarty.
  @smoke @regression @ui
  Scenario: Otwarcie wiadomości VS w nowym oknie przeglądarki po kliknięciu ikony linku
    Given lista wiadomości zawiera wiadomość typu "Wiadomość VS"
    When doradca klika ikonę linku dla tej wiadomości
    Then system otwiera wiadomość w panelu VS w nowym oknie przeglądarki
    And lista wiadomości w Planerze pozostaje otwarta i niezakłócona

  # AC4: Brak uprawnień do VS skutkuje standardowym komunikatem VS, bez własnego komunikatu Planera.
  @regression @security
  Scenario: Wyświetlenie standardowego komunikatu VS o braku dostępu po kliknięciu ikony bez uprawnień
    Given lista wiadomości zawiera wiadomość typu "Wiadomość VS"
    And doradca nie posiada uprawnień do przeglądania wiadomości w VS
    When doradca klika ikonę linku dla tej wiadomości
    Then nowe okno przeglądarki wyświetla standardowy komunikat VS o braku dostępu
    And Planer nie wyświetla żadnego własnego komunikatu błędu ani ostrzeżenia

  # AC5: Ikona linku nie zastępuje istniejącego wskaźnika statusu wysyłki, tylko go uzupełnia w tej samej komórce.
  @regression @ui
  Scenario Outline: Zachowanie wskaźnika statusu wysyłki wiadomości VS obok nowej ikony linku
    Given wiadomość typu "Wiadomość VS" ma wskaźnik statusu wysyłki "<status_wysylki>"
    Then wskaźnik statusu wysyłki "<status_wysylki>" jest nadal widoczny dla tej wiadomości
    And ikona linku jest widoczna obok tego wskaźnika w tej samej komórce

    Examples:
      | status_wysylki |
      | sukces         |
      | błąd           |

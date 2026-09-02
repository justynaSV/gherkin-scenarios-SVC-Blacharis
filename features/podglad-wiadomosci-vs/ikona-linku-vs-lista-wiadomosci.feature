# Zadanie: SVCLOUD-5532 — S10 — Podgląd wiadomości VS z listy wiadomości w Planerze
@ikona-linku-vs-lista-wiadomosci
Feature: Ikona linku do wiadomości VS na liście wiadomości w Planerze
  Jako Doradca serwisowy chcę mieć możliwość otwarcia wiadomości wysłanej do klienta
  bezpośrednio z listy wiadomości w Planerze, aby bez zbędnych kroków sprawdzić
  dokładną treść i ofertę, które klient otrzymał, przed rozmową przy przyjęciu pojazdu.

  Background:
    Given doradca serwisowy przegląda listę wiadomości w teczce naprawy

  # AC1: Ikona linku w nowej kolumnie "Operacje" tylko dla wiadomości typu "Wiadomość VS".
  @smoke @regression @ui
  Scenario: Wyświetlenie ikony linku w kolumnie "Operacje" dla wiadomości typu "Wiadomość VS"
    Given lista wiadomości zawiera wiadomość typu "Wiadomość VS"
    When doradca serwisowy przegląda kolumnę "Operacje" dla tej wiadomości
    Then użytkownik widzi ikonę linku w kolumnie "Operacje"

  # AC1: Brak ikony linku dla wiadomości innych typów niż "Wiadomość VS".
  @regression @ui
  Scenario Outline: Brak ikony linku w kolumnie "Operacje" dla wiadomości innych typów
    Given lista wiadomości zawiera wiadomość typu "<typ_wiadomosci>"
    When doradca serwisowy przegląda kolumnę "Operacje" dla tej wiadomości
    Then użytkownik nie widzi ikony linku w kolumnie "Operacje"

    Examples:
      | typ_wiadomosci               |
      | SMS z potwierdzeniem wizyty  |
      | Wiadomość e-mail             |

  # AC2: Ikona zawsze widoczna i klikalna niezależnie od uprawnień doradcy do VS.
  @regression
  Scenario: Widoczność i klikalność ikony niezależnie od uprawnień doradcy do VS
    Given doradca serwisowy nie posiada uprawnień do VS
    And lista wiadomości zawiera wiadomość typu "Wiadomość VS"
    When doradca serwisowy przegląda kolumnę "Operacje" dla tej wiadomości
    Then użytkownik widzi aktywną ikonę linku w kolumnie "Operacje"
    And system nie weryfikuje uprawnień doradcy przed wyświetleniem ikony

  # AC3: Kliknięcie ikony otwiera wiadomość w VS w nowym oknie, Planer pozostaje niezakłócony.
  @smoke @regression
  Scenario: Otwarcie wiadomości VS w nowym oknie po kliknięciu ikony
    Given lista wiadomości zawiera wiadomość typu "Wiadomość VS"
    When doradca serwisowy klika ikonę linku w kolumnie "Operacje"
    Then system otwiera wiadomość w panelu VS w nowym oknie przeglądarki
    And widok listy wiadomości w Planerze pozostaje otwarty i niezakłócony

  # AC4: Standardowy komunikat VS o braku dostępu, bez własnego błędu Planera.
  @regression
  Scenario: Komunikat o braku dostępu do VS po kliknięciu ikony bez uprawnień
    Given doradca serwisowy nie posiada uprawnień do przeglądania wiadomości w VS
    And lista wiadomości zawiera wiadomość typu "Wiadomość VS"
    When doradca serwisowy klika ikonę linku w kolumnie "Operacje"
    Then nowe okno wyświetla standardowy komunikat VS o braku dostępu
    And Planer nie wyświetla żadnego własnego komunikatu błędu

  # AC5: Istniejący wskaźnik statusu wysyłki pozostaje bez zmian obok ikony linku.
  @regression @ui
  Scenario Outline: Zachowanie istniejącego wskaźnika statusu wysyłki obok ikony linku
    Given wiadomość typu "Wiadomość VS" ma status wysyłki "<status_wysylki>"
    When doradca serwisowy przegląda kolumnę "Operacje" dla tej wiadomości
    Then użytkownik widzi wskaźnik statusu wysyłki "<status_wysylki>" w tej samej komórce
    And użytkownik widzi ikonę linku obok wskaźnika statusu wysyłki

    Examples:
      | status_wysylki |
      | Sukces         |
      | Błąd           |

@wiadomosci-vs-potwierdzenie-wizyty
Feature: Aktywacja wiadomości VS dla zdarzenia Potwierdzenie wizyty w Planerze Serwisu
  Jako Administrator Systemu chcę powiązać szablon Planera ze zdarzeniem "Potwierdzenie wizyty"
  na poziomie globalnym i skonfigurować parametry wysyłki dla wybranego BOK,
  aby system automatycznie wysyłał odpowiednie wiadomości potwierdzenia wizyty.

  Background:
    Given użytkownik jest zalogowany jako "Administrator Systemu"
    And użytkownik ma dostęp do konfiguracji Planera Serwisu

  # AC1: Nowa zakładka "Wiadomości VS" na ekranie Wiadomości (konfiguracja globalna).
  @smoke @regression @ui
  Scenario: Wyświetlenie zakładki Wiadomości VS w globalnej konfiguracji Planera Serwisu
    Given użytkownik otwiera konfigurację Planera Serwisu
    When użytkownik przechodzi do ekranu "Wiadomości"
    Then użytkownik widzi zakładkę "Wiadomości VS"

  # AC2: Widok dodawania konfiguracji Wiadomości VS zawiera wymagane pola i pozwala ją aktywować.
  @smoke @regression @ui
  Scenario: Utworzenie nowej konfiguracji Wiadomości VS dla zdarzenia Potwierdzenie wizyty
    Given w konfiguracji VS jest dostępny aktywny szablon Planera "Potwierdzenie wizyty"
    And użytkownik otwiera zakładkę "Wiadomości VS" na ekranie "Wiadomości"
    When użytkownik dodaje nową konfigurację Wiadomości VS
    Then pole "Typ" jest zablokowane i ma wartość "Wiadomość VS"
    When użytkownik wybiera zdarzenie "Potwierdzenie wizyty"
    And użytkownik nadaje konfiguracji nazwę "Wiadomości VS Warszawa"
    And użytkownik wybiera szablon wiadomości Planera "Potwierdzenie wizyty"
    And użytkownik włącza przełącznik "Aktywna"
    And użytkownik zapisuje konfigurację Wiadomości VS
    Then system zapisuje konfigurację Wiadomości VS jako aktywną
    And konfiguracja jest widoczna na liście konfiguracji Wiadomości VS

  # AC2: Lista szablonów Planera jest zasilana wyłącznie aktywnymi szablonami z VS.
  @regression @ui
  Scenario Outline: Widoczność szablonu Planera na liście wyboru w zależności od jego statusu
    Given w konfiguracji VS jest dostępny szablon Planera "Potwierdzenie wizyty - Standard" w statusie "<status>"
    When użytkownik otwiera pole wyboru "Szablon wiadomości Planera" w nowej konfiguracji Wiadomości VS
    Then użytkownik "<widocznosc>" szablon "Potwierdzenie wizyty - Standard" na liście

    Examples:
      | status          | widocznosc  |
      | Aktywny         | widzi       |
      | W przygotowaniu | nie widzi   |
      | Historyczny     | nie widzi   |

  # AC3: Brak mechanizmu podglądu lub edycji treści wiadomości w konfiguracji globalnej.
  @regression @ui
  Scenario: Brak pól edycji treści wiadomości w globalnej konfiguracji Wiadomości VS
    Given użytkownik otwiera konfigurację Wiadomości VS dla zdarzenia "Potwierdzenie wizyty"
    Then użytkownik nie widzi pola treści wiadomości
    And użytkownik nie widzi podglądu treści wiadomości
    And treść wysyłanej wiadomości pochodzi wyłącznie z przypiętego szablonu Planera

  # AC4: Wiele konfiguracji tego samego zdarzenia z różnymi szablonami i nazwami.
  @regression
  Scenario: Utworzenie wielu konfiguracji Wiadomości VS dla tego samego zdarzenia z różnymi szablonami
    Given w konfiguracji VS istnieją aktywne szablony Planera "Szablon Warszawa" i "Szablon Kraków"
    And użytkownik wybiera zdarzenie "Potwierdzenie wizyty"
    When użytkownik tworzy konfigurację Wiadomości VS "Wiadomości VS Warszawa" z szablonem "Szablon Warszawa"
    And użytkownik tworzy kolejną konfigurację Wiadomości VS "Wiadomości VS Kraków" z szablonem "Szablon Kraków"
    Then obie konfiguracje Wiadomości VS są zapisane dla zdarzenia "Potwierdzenie wizyty"
    And każda konfiguracja jest przypięta do innego szablonu Planera

  # AC2: Walidacja wymaganego pola szablonu przy zapisie konfiguracji globalnej.
  @regression @ui
  Scenario: Brak możliwości zapisania konfiguracji Wiadomości VS bez wybranego szablonu
    Given użytkownik dodaje nową konfigurację Wiadomości VS dla zdarzenia "Potwierdzenie wizyty"
    When użytkownik zapisuje konfigurację bez wybrania szablonu wiadomości Planera
    Then system blokuje zapis konfiguracji
    And system wyświetla komunikat o wymaganym polu "Szablon wiadomości Planera"

  # AC2: Pusta lista szablonów, gdy w VS brak aktywnych szablonów Planera.
  @regression
  Scenario: Brak dostępnych szablonów Planera do wyboru, gdy żaden nie jest aktywny
    Given w konfiguracji VS nie istnieje żaden aktywny szablon Planera
    When użytkownik otwiera pole wyboru "Szablon wiadomości Planera" w nowej konfiguracji Wiadomości VS
    Then lista szablonów wiadomości Planera jest pusta
    And użytkownik nie może zapisać aktywnej konfiguracji Wiadomości VS

  # AC5: Nowa zakładka Wiadomości VS w oknie edycji BOK.
  @smoke @regression @ui
  Scenario: Wyświetlenie zakładki Wiadomości VS w oknie edycji BOK
    Given użytkownik otwiera ekran "Lista BOK"
    When użytkownik edytuje wybrany BOK
    Then użytkownik widzi zakładkę "Wiadomości VS" obok zakładki "Wiadomości"

  # AC6: Konfiguracja lokalna Wiadomości VS dla BOK - ścieżka podstawowa.
  @smoke @regression @ui
  Scenario: Skonfigurowanie lokalnych parametrów wysyłki Wiadomości VS dla BOK
    Given w konfiguracji Wiadomości VS istnieje aktywna konfiguracja "Wiadomości VS Warszawa"
    And konfiguracja jest przypisana do zdarzenia "Potwierdzenie wizyty"
    And użytkownik edytuje BOK "Warszawa Mokotów"
    When użytkownik otwiera zakładkę "Wiadomości VS"
    And użytkownik konfiguruje zdarzenie "Potwierdzenie wizyty"
    And użytkownik wybiera szablon "Wiadomości VS Warszawa"
    And użytkownik wybiera kanał wysyłki "SMS"
    And użytkownik ustawia opóźnienie wysyłki na 2 godziny
    And użytkownik zapisuje konfigurację BOK
    Then system zapisuje lokalną konfigurację Wiadomości VS dla BOK "Warszawa Mokotów"
    And konfiguracja jest aktywna dla zdarzenia "Potwierdzenie wizyty"

  # AC6: Lista szablonów w BOK jest zawężona wyłącznie do aktywnych konfiguracji Wiadomości VS.
  @regression @ui
  Scenario Outline: Widoczność konfiguracji Wiadomości VS na liście wyboru szablonu w BOK
    Given w konfiguracji Wiadomości VS istnieje konfiguracja "Wiadomości VS Warszawa" w statusie "<status>"
    When użytkownik otwiera pole wyboru szablonu w zakładce "Wiadomości VS" dla BOK "Warszawa Mokotów"
    Then użytkownik "<widocznosc>" konfigurację "Wiadomości VS Warszawa" na liście

    Examples:
      | status     | widocznosc |
      | Aktywna    | widzi      |
      | Nieaktywna | nie widzi  |

  # AC6: Jedna konfiguracja zdarzenia Potwierdzenie wizyty na BOK.
  @regression
  Scenario: Brak możliwości dodania drugiej konfiguracji zdarzenia Potwierdzenie wizyty dla tego samego BOK
    Given BOK "Warszawa Mokotów" ma już skonfigurowane zdarzenie "Potwierdzenie wizyty" w zakładce "Wiadomości VS"
    When użytkownik próbuje dodać kolejną konfigurację zdarzenia "Potwierdzenie wizyty" dla tego samego BOK
    Then system blokuje dodanie drugiej konfiguracji zdarzenia "Potwierdzenie wizyty"
    And system informuje, że zdarzenie "Potwierdzenie wizyty" jest już skonfigurowane dla tego BOK

  # AC6: Walidacja wartości opóźnienia wysyłki w godzinach, w tym wartości granicznych.
  @regression @ui
  Scenario Outline: Walidacja opóźnienia wysyłki w konfiguracji lokalnej BOK
    Given użytkownik konfiguruje zdarzenie "Potwierdzenie wizyty" w zakładce "Wiadomości VS" dla BOK "Warszawa Mokotów"
    When użytkownik ustawia opóźnienie wysyłki na wartość "<wartosc>"
    And użytkownik zapisuje konfigurację BOK
    Then system "<wynik>"

    Examples:
      | wartosc | wynik                                                            |
      | 0       | zapisuje konfigurację z opóźnieniem wysyłki 0 godzin             |
      | 24      | zapisuje konfigurację z opóźnieniem wysyłki 24 godzin            |
      | -1      | blokuje zapis i wyświetla komunikat o nieprawidłowej wartości    |
      | abc     | blokuje zapis i wyświetla komunikat o nieprawidłowym formacie    |

  # AC6: Kanał wysyłki ograniczony do opcji SMS zgodnych z innymi zdarzeniami BOK.
  @regression
  Scenario: Ograniczenie kanału wysyłki do dostępnych opcji SMS w konfiguracji BOK
    Given użytkownik konfiguruje zdarzenie "Potwierdzenie wizyty" w zakładce "Wiadomości VS" dla BOK "Warszawa Mokotów"
    When użytkownik otwiera pole wyboru "Kanał wysyłki"
    Then lista kanałów wysyłki zawiera wyłącznie opcje SMS dostępne dla innych zdarzeń BOK

  # Business process flow (kroki 5-6): kompletna konfiguracja skutkuje wysyłką wiadomości.
  @regression
  Scenario: Wysyłka wiadomości potwierdzenia wizyty zgodnie ze skonfigurowanym szablonem, kanałem i opóźnieniem
    Given administrator skonfigurował globalnie konfigurację Wiadomości VS "Wiadomości VS Warszawa"
    And konfiguracja jest aktywna dla zdarzenia "Potwierdzenie wizyty"
    And administrator skonfigurował dla BOK "Warszawa Mokotów" kanał wysyłki "SMS" i opóźnienie wysyłki 2 godziny
    When w BOK "Warszawa Mokotów" zostanie zaplanowana naprawa z wizytą wymagającą potwierdzenia
    Then system wysyła wiadomość potwierdzenia wizyty kanałem "SMS" po 2 godzinach od zaplanowania wizyty
    And treść wysłanej wiadomości pochodzi z szablonu Planera "Potwierdzenie wizyty - Standard"
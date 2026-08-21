@konfiguracja-ofert-planera
Feature: Konfiguracja Szablonów Ofert Planera
  Jako Administrator Systemu chcę zarządzać Szablonami Ofert Planera w dedykowanej, uproszczonej sekcji menu,
  wykorzystując istniejącą strukturę bazy danych ankiet,
  aby szybko i bez zbędnych kroków konfigurować gotową listę usług dosprzedaży dla klientów.

  Background:
    Given użytkownik jest zalogowany do konfiguracji VS
    And użytkownik ma dostęp do sekcji "Ankiety -> Szablony ankiet"

  # AC1: nowa podsekcja Oferty Planera w lewym menu
  @smoke @regression @ui
  Scenario: Wyświetlenie podsekcji Oferty Planera w konfiguracji VS
    Given użytkownik ma rolę "Administrator Systemu"
    When użytkownik przechodzi do sekcji "Ankiety"
    And użytkownik wybiera podsekcję "Szablony ankiet"
    Then użytkownik widzi w lewym menu podsekcję "Oferty Planera"

  # AC3: brak akcji zarządzania formularzami w edytorze Oferty Planera
  @regression @ui
  Scenario: Brak akcji Nowy formularz i Wybierz formularz w edytorze Oferty Planera
    Given użytkownik ma rolę "Administrator Systemu"
    And użytkownik edytuje szablon Oferty Planera
    Then użytkownik nie widzi akcji "Nowy formularz" ani "Wybierz formularz"

  # AC4: automatyczne utworzenie formularza i grupy przy nowej Ofercie Planera
  @smoke @regression @ui
  Scenario: Automatyczne utworzenie formularza i grupy dla nowej Oferty Planera
    Given użytkownik ma rolę "Administrator Systemu"
    And użytkownik znajduje się w podsekcji "Oferty Planera"
    When użytkownik wybiera przycisk "Nowa Oferta"
    Then system automatycznie tworzy formularz o nazwie "Edycja oferty"
    And system automatycznie tworzy grupę o nazwie "Oferta"
    And formularz i grupa posiadają domyślne tłumaczenia systemowe

  # AC5: brak możliwości zmiany nazwy lub usunięcia predefiniowanej grupy
  @regression @ui
  Scenario: Brak możliwości zmiany nazwy lub usunięcia grupy Oferta
    Given użytkownik edytuje szablon Oferty Planera
    Then użytkownik nie może zmienić nazwy grupy "Oferta"
    And użytkownik nie może usunąć grupy "Oferta"

  # AC5: brak możliwości dodania kolejnej grupy do szablonu
  @regression @ui
  Scenario: Brak możliwości dodania kolejnej grupy do szablonu Oferty Planera
    Given użytkownik edytuje szablon Oferty Planera
    Then użytkownik nie widzi opcji dodania nowej grupy

  # AC6: formularz pozycji ogranicza pola do Uwagi i Cena
  @smoke @regression @ui
  Scenario: Dodanie pozycji oferty z polami Uwagi i Cena
    Given użytkownik edytuje szablon Oferty Planera
    When użytkownik dodaje nową pozycję do grupy "Oferta"
    Then formularz pozycji zawiera wymagane pola "Uwagi" i "Cena"
    And formularz pozycji nie zawiera pól "Nazwa", "Stan" ani "Zdjęcia"

  # AC6: pole Cena przyjmuje wyłącznie wartości liczbowe
  @regression @ui
  Scenario Outline: Walidacja typu pola Cena podczas dodawania pozycji oferty
    Given użytkownik dodaje nową pozycję do grupy "Oferta"
    When użytkownik wprowadza w polu "Cena" wartość "<wartosc>"
    Then system pokazuje wynik walidacji "<wynik>"

    Examples:
      | wartosc | wynik                       |
      | 250     | zapisano poprawnie          |
      | 99.90   | zapisano poprawnie          |
      | abc     | wartość ceny musi być liczbą |

  # AC7: usuwanie pozycji za pomocą ikony kosza
  @regression @ui
  Scenario: Usunięcie pozycji oferty za pomocą ikony kosza
    Given użytkownik edytuje szablon Oferty Planera z dodaną pozycją "Wymiana klocków hamulcowych"
    When użytkownik wybiera ikonę kosza przy pozycji "Wymiana klocków hamulcowych"
    Then pozycja "Wymiana klocków hamulcowych" zostaje usunięta z grupy "Oferta"

  # AC8: przeciąganie i upuszczanie grup jest zablokowane
  @regression @ui
  Scenario: Zablokowanie zmiany kolejności grup w szablonie Oferty Planera
    Given użytkownik edytuje szablon Oferty Planera
    Then użytkownik nie może przeciągnąć i upuścić grupy w celu zmiany jej kolejności

  # AC8: przeciąganie i upuszczanie pozycji w obrębie grupy Oferta jest aktywne
  @smoke @regression @ui
  Scenario: Zmiana kolejności pozycji w grupie Oferta za pomocą Drag & Drop
    Given użytkownik edytuje szablon Oferty Planera z co najmniej dwiema pozycjami w grupie "Oferta"
    When użytkownik przeciąga i upuszcza pozycję na nową pozycję w kolejności w obrębie grupy "Oferta"
    Then system zapisuje nową kolejność pozycji w grupie "Oferta"

  # AC9: checkbox potwierdzenia klienta jest ukryty na formularzu pozycji
  @regression @ui
  Scenario: Ukrycie checkboxa potwierdzenia klienta na formularzu pozycji oferty
    Given użytkownik edytuje szablon Oferty Planera
    When użytkownik otwiera formularz dodania pozycji do grupy "Oferta"
    Then użytkownik nie widzi checkboxa wymagania potwierdzenia klienta

  # AC9: system automatycznie ustawia flagę potwierdzenia klienta na true
  @smoke @regression
  Scenario: Automatyczne ustawienie flagi potwierdzenia klienta podczas zapisu pozycji oferty
    Given użytkownik dodaje pozycję "Wymiana klocków hamulcowych" z ceną "250" do grupy "Oferta"
    When użytkownik zapisuje pozycję
    Then system ustawia flagę potwierdzenia klienta na wartość "true" dla zapisanej pozycji

  # AC10: cykl życia szablonu Oferty Planera obsługuje standardowe statusy
  @regression @ui
  Scenario Outline: Obsługa statusów szablonu Oferty Planera
    Given dostępny jest szablon Oferty Planera w statusie "<status>"
    When użytkownik otwiera szczegóły szablonu Oferty Planera
    Then użytkownik widzi status szablonu "<status>"

    Examples:
      | status          |
      | Aktywny         |
      | W przygotowaniu |
      | Historyczny     |

  # AC10: tworzenie nowej wersji działa analogicznie do bazowych szablonów ankiet
  @regression @ui
  Scenario: Utworzenie nowej wersji istniejącego aktywnego szablonu Oferty Planera
    Given dostępny jest aktywny szablon Oferty Planera "Wiosenny przegląd"
    When użytkownik wybiera akcję utworzenia nowej wersji szablonu
    Then system tworzy nową wersję szablonu w statusie "W przygotowaniu"
    And aktywna wersja szablonu pozostaje dostępna
    And historyczna wersja szablonu pozostaje dostępna do podglądu

  # AC10: przypisanie szablonu Oferty Planera do jednostki organizacyjnej działa jak w bazowych szablonach
  @regression @ui
  Scenario: Przypisanie szablonu Oferty Planera do jednostki organizacyjnej
    Given użytkownik edytuje szablon Oferty Planera
    When użytkownik przypisuje szablon do jednostki organizacyjnej "Serwis Centralny"
    Then szablon Oferty Planera jest dostępny dla jednostki "Serwis Centralny"
@szablony-wiadomosci-planera
Feature: Konfiguracja szablonów wiadomości Planera
  Jako Administrator Systemu chcę konfigurować dedykowane szablony wiadomości Planera,
  aby określić treść pytań potwierdzających i zautomatyzować obsługę potwierdzania wizyt.

  Background:
    Given użytkownik jest zalogowany do konfiguracji VS
    And użytkownik ma dostęp do sekcji "Szablony wiadomości"

  # AC1: Dostępna jest nowa podsekcja dla szablonów Planera i zapisuje szablony jako nowy typ.
  @smoke @regression @ui
  Scenario: Wyświetlenie podsekcji Szablony Planera w konfiguracji VS
    Given użytkownik ma rolę "Administrator Systemu"
    When użytkownik przechodzi do menu "Wiadomości"
    And użytkownik wybiera sekcję "Szablony wiadomości"
    Then użytkownik widzi podsekcję "Szablony Planera"
    When użytkownik wybiera podsekcję "Szablony Planera"
    Then użytkownik widzi listę szablonów Planera
    And szablony na liście mają typ "Szablon wiadomości Planera"

  # AC2, AC5, AC8, AC9, AC10: Nowy szablon zawiera pytania potwierdzenia i standardowe zakładki.
  @smoke @regression @ui
  Scenario: Utworzenie nowego szablonu Potwierdzenie wizyty z pytaniami dotyczącymi wizyty
    Given użytkownik ma rolę "Administrator Systemu"
    And użytkownik znajduje się w podsekcji "Szablony Planera"
    When użytkownik wybiera przycisk "Nowy Szablon"
    And użytkownik wybiera szablon "Potwierdzenie wizyty"
    Then system tworzy nowy szablon Planera w statusie "W przygotowaniu"
    And użytkownik widzi standardową zakładkę wiadomości
    And użytkownik widzi standardową zakładkę ustawień wysyłki
    And użytkownik widzi sekcję "Pytania potwierdzenia"
    And pytanie o potwierdzenie wizyty ma domyślną treść z tagami dnia i godziny wizyty
    And pytanie o potwierdzenie wizyty udostępnia 3 odpowiedzi systemowe
    And pytanie o oczekiwanie na miejscu ma domyślną treść "Czy będziesz czekał na miejscu na naprawę?"
    And pytanie o oczekiwanie na miejscu udostępnia 2 odpowiedzi systemowe

  # AC3: Szablony Planera wspierają statusy i mechanizm nowej wersji.
  @regression @ui
  Scenario Outline: Obsługa statusów szablonu Planera
    Given użytkownik ma rolę "Administrator Systemu"
    And dostępny jest szablon Planera w statusie "<status>"
    When użytkownik otwiera szczegóły szablonu Planera
    Then użytkownik widzi status szablonu "<status>"

    Examples:
      | status          |
      | Aktywny         |
      | W przygotowaniu |
      | Historyczny     |

  # AC3: Tworzenie nowej wersji działa analogicznie do istniejących szablonów.
  @regression @ui
  Scenario: Utworzenie nowej wersji istniejącego aktywnego szablonu Planera
    Given użytkownik ma rolę "Administrator Systemu"
    And dostępny jest aktywny szablon Planera "Potwierdzenie wizyty"
    When użytkownik wybiera akcję utworzenia nowej wersji szablonu
    Then system tworzy nową wersję szablonu w statusie "W przygotowaniu"
    And aktywna wersja szablonu pozostaje dostępna
    And historyczna wersja szablonu pozostaje dostępna do podglądu

  # AC4: Szablony Planera nie mają przypisania do jednostek.
  @regression @ui
  Scenario: Brak wyboru jednostki dla szablonu Planera
    Given użytkownik ma rolę "Administrator Systemu"
    And użytkownik edytuje szablon Planera
    Then użytkownik nie widzi pola wyboru jednostki
    When użytkownik wraca na listę szablonów Planera
    Then użytkownik nie widzi kolumny jednostki
    And użytkownik nie widzi listy jednostek dla szablonów Planera

  # AC5: Zakładka Wiadomość zawiera standardowe elementy wiadomości.
  @regression @ui
  Scenario: Konfiguracja standardowych elementów wiadomości w szablonie Planera
    Given użytkownik ma rolę "Administrator Systemu"
    And użytkownik edytuje szablon Planera
    When użytkownik otwiera zakładkę "Wiadomość"
    Then użytkownik może skonfigurować logotyp
    And użytkownik może skonfigurować treść wiadomości
    And użytkownik może skonfigurować stopkę wiadomości

  # AC5, AC7: Ustawienia wysyłki nie zawierają powiadamiania doradcy o odpowiedzi klienta.
  @regression @ui
  Scenario: Brak mechanizmu powiadamiania doradcy w ustawieniach wysyłki
    Given użytkownik ma rolę "Administrator Systemu"
    And użytkownik edytuje szablon Planera
    When użytkownik otwiera zakładkę "Ustawienia wysyłki"
    Then użytkownik może skonfigurować parametry wysyłki
    And użytkownik nie widzi ustawienia powiadamiania doradcy przez SMS
    And użytkownik nie widzi ustawienia powiadamiania doradcy przez e-mail
    And użytkownik nie może włączyć powiadamiania doradcy o odpowiedzi klienta

  # AC6: Zakładka Ponaglenia SMS jest niewidoczna.
  @regression @ui
  Scenario: Ukrycie zakładki Ponaglenia SMS dla szablonu Planera
    Given użytkownik ma rolę "Administrator Systemu"
    And użytkownik edytuje szablon Planera
    Then użytkownik nie widzi zakładki "Ponaglenia SMS"

  # AC8: Administrator widzi pytania w trybie read-only.
  @regression @ui @security
  Scenario: Zwykły administrator widzi pytania potwierdzenia bez możliwości edycji
    Given użytkownik ma rolę "Administrator Systemu"
    And użytkownik edytuje szablon Planera
    When użytkownik otwiera zakładkę "Wiadomość"
    Then użytkownik widzi sekcję "Pytania potwierdzenia"
    And użytkownik widzi treść pierwszego pytania w trybie tylko do odczytu
    And użytkownik widzi treść drugiego pytania w trybie tylko do odczytu
    And użytkownik widzi odpowiedzi pierwszego pytania w trybie tylko do odczytu
    And użytkownik widzi odpowiedzi drugiego pytania w trybie tylko do odczytu
    And użytkownik nie może zmienić treści pytań
    And użytkownik nie może zmienić treści odpowiedzi
    And użytkownik nie może zmienić kodów odpowiedzi

  # AC8, AC9, AC10: Superadmin może edytować treści pytań i odpowiedzi, ale nie kody odpowiedzi.
  @regression @ui @security
  Scenario: Superadmin edytuje treści pytań i odpowiedzi bez zmiany kodów
    Given użytkownik ma rolę "Superadmin"
    And użytkownik edytuje szablon Planera
    And użytkownik otwiera zakładkę "Wiadomość"
    When użytkownik zmienia treść pierwszego pytania z prawidłowymi tagami dynamicznymi
    And użytkownik zmienia treść drugiego pytania na "Czy planujesz czekać na zakończenie naprawy?"
    And użytkownik zmienia treść odpowiedzi "Tak" na "Tak, będę czekać"
    And użytkownik zapisuje szablon
    Then system zapisuje zmienioną treść pierwszego pytania
    And system zapisuje zmienioną treść drugiego pytania
    And system zapisuje zmienioną treść odpowiedzi
    And system zachowuje dotychczasowe kody odpowiedzi

  # AC9, AC10: Pytania systemowe mają wymagane odpowiedzi i kody do mapowania statusów w Planerze.
  @regression
  Scenario Outline: Odpowiedzi pytań potwierdzenia posiadają kody mapowania statusów
    Given użytkownik ma rolę "Superadmin"
    And użytkownik edytuje nowy szablon Planera "Potwierdzenie wizyty"
    When użytkownik otwiera sekcję "Pytania potwierdzenia"
    And użytkownik sprawdza odpowiedź "<odpowiedz>"
    Then odpowiedź posiada kod odpowiedzi
    And kod odpowiedzi jest dostępny tylko do odczytu

    Examples:
      | odpowiedz                |
      | Potwierdzam wizytę       |
      | Chcę zmienić termin      |
      | Rezygnuję z naprawy      |
      | Tak                      |
      | Nie                      |

  # AC11: Edycja pytań waliduje tagi dynamiczne.
  @regression @ui
  Scenario Outline: Walidacja tagów dynamicznych podczas edycji pytania
    Given użytkownik ma rolę "Superadmin"
    And użytkownik edytuje szablon Planera
    And użytkownik otwiera sekcję "Pytania potwierdzenia"
    When użytkownik ustawia treść pytania 1 dla wariantu "<wariant>"
    And użytkownik zapisuje szablon
    Then system pokazuje wynik walidacji "<wynik>"

    Examples:
      | wariant                              | wynik                                |
      | prawidłowe tagi dnia i godziny wizyty | zapisano poprawnie                   |
      | nieznany tag dynamiczny              | tag dynamiczny jest niepoprawny      |
      | niedomknięty tag dynamiczny          | format tagu dynamicznego jest błędny |

  # AC11: Nie można wyłączyć sekcji pytań potwierdzenia.
  @regression @ui
  Scenario: Brak możliwości wyłączenia pytań potwierdzenia
    Given użytkownik ma rolę "Superadmin"
    And użytkownik edytuje szablon Planera
    When użytkownik otwiera sekcję "Pytania potwierdzenia"
    Then użytkownik nie widzi opcji wyłączenia pytań potwierdzenia
    And użytkownik nie widzi pola wyboru dezaktywacji sekcji pytań
    And sekcja "Pytania potwierdzenia" pozostaje wymagana dla szablonu Planera

  # AC9: Pytanie 1 ma trzy systemowe odpowiedzi.
  @regression
  Scenario Outline: Pytanie o potwierdzenie wizyty zawiera dokładnie trzy odpowiedzi
    Given użytkownik ma rolę "Administrator Systemu"
    And użytkownik podgląda szablon Planera "Potwierdzenie wizyty"
    When użytkownik wyświetla pytanie "Czy potwierdzasz wizytę w dniu ##DzienWizyty## o godzinie ##GodzinaWizyty##?"
    Then użytkownik widzi dokładnie 3 odpowiedzi
    And odpowiedź pytania o potwierdzenie wizyty "<odpowiedz>" jest widoczna

    Examples:
      | odpowiedz                |
      | Potwierdzam wizytę       |
      | Chcę zmienić termin      |
      | Rezygnuję z naprawy      |

  # AC10: Pytanie 2 ma dwie systemowe odpowiedzi.
  @regression
  Scenario Outline: Pytanie o oczekiwanie na miejscu zawiera dokładnie dwie odpowiedzi
    Given użytkownik ma rolę "Administrator Systemu"
    And użytkownik podgląda szablon Planera "Potwierdzenie wizyty"
    When użytkownik wyświetla pytanie "Czy będziesz czekał na miejscu na naprawę?"
    Then użytkownik widzi dokładnie 2 odpowiedzi
    And odpowiedź pytania o oczekiwanie na miejscu "<odpowiedz>" jest widoczna

    Examples:
      | odpowiedz |
      | Tak       |
      | Nie       |

  # AC1, AC9: Nowy typ szablonu nie jest dostępny w standardowym użyciu Video Service.
  @regression @ui
  Scenario: Szablony Planera nie są widoczne na liście standardowych szablonów wiadomości Video Service
    Given dostępny jest szablon Planera "Potwierdzenie wizyty"
    When użytkownik przechodzi do listy standardowych szablonów wiadomości Video Service
    Then użytkownik nie widzi szablonu "Potwierdzenie wizyty"
    And użytkownik nie może wybrać szablonu Planera jako standardowego szablonu wiadomości

  # AC1, AC9: Szablony Planera nie mogą zostać użyte ręcznie w VS.
  @regression @ui
  Scenario: Brak możliwości ręcznego użycia szablonu Planera w VS
    Given dostępny jest szablon Planera "Potwierdzenie wizyty"
    And użytkownik znajduje się w Video Service
    When użytkownik wybiera ręczne wysłanie wiadomości
    Then użytkownik nie widzi szablonu "Potwierdzenie wizyty" na liście dostępnych szablonów
    And użytkownik nie może ręcznie użyć szablonu Planera

# Zadanie QA: SVCLOUD-5749 — [QA] T2 Ręczna weryfikacja zestawień statystyk „Potwierdzenia wizyty” (ProcSpConfirmationStats)
@statystyki-sql-potwierdzenia-wizyty
Feature: Zestawienia statystyczne funkcji Potwierdzenie wizyty
  Jako Product Manager / zespół produktowy chcę móc na żądanie uzyskać zestawienia z danych generowanych
  przez funkcję Potwierdzenie wizyty,
  aby ocenić, czy doradcy dołączają oferty, czy klienci reagują na SMS-y oraz ile ofert kończy się akceptacją.

  # AC1: obowiązkowy zakres dat dla każdego zestawienia
  @regression
  Scenario Outline: Błąd walidacji przy braku parametru zakresu dat dla zestawienia <zestawienie>
    Given uprawniony użytkownik chce wygenerować zestawienie "<zestawienie>"
    When wywołuje zestawienie bez podania parametru "<brakujacy_parametr>"
    Then system zwraca błąd walidacji zakresu dat
    And system nie zwraca żadnych danych zestawienia

    Examples:
      | zestawienie                       | brakujacy_parametr |
      | adopcja oferty                    | Data_od             |
      | adopcja oferty                    | Data_do             |
      | reakcja klientów na SMS           | Data_od             |
      | odpowiedzi na pytania             | Data_do             |
      | skuteczność ofert dosprzedażowych | Data_od             |

  @regression
  Scenario: Błąd walidacji, gdy Data_od jest późniejsza niż Data_do
    Given uprawniony użytkownik definiuje zakres dat, w którym Data_od jest późniejsza niż Data_do
    When wywołuje dowolne zestawienie statystyk funkcji Potwierdzenie wizyty
    Then system zwraca błąd walidacji zakresu dat

  @smoke @regression
  Scenario: Poprawne wygenerowanie zestawienia po podaniu wymaganego zakresu dat
    Given uprawniony użytkownik definiuje poprawny zakres dat Data_od i Data_do
    When wywołuje dowolne zestawienie statystyk funkcji Potwierdzenie wizyty
    Then system zwraca zestawienie danych spełniające kryteria filtrowania

  # AC2: filtr BOK_ID dostępny wyłącznie dla adopcji oferty i odpowiedzi na pytania
  @regression
  Scenario Outline: Filtrowanie zestawienia po identyfikatorze BOK dla obszaru <zestawienie>
    Given uprawniony użytkownik definiuje poprawny zakres dat Data_od i Data_do
    And podaje dodatkowy filtr BOK_ID o wartości "BOK-001"
    When wywołuje zestawienie "<zestawienie>"
    Then system zwraca dane ograniczone wyłącznie do BOK o identyfikatorze "BOK-001"

    Examples:
      | zestawienie           |
      | adopcja oferty        |
      | odpowiedzi na pytania |

  @regression
  Scenario: Puste wyniki zestawienia dla identyfikatora BOK, dla którego nie zarejestrowano zdarzeń
    Given uprawniony użytkownik definiuje poprawny zakres dat Data_od i Data_do
    And podaje dodatkowy filtr BOK_ID o wartości nieistniejącego BOK "BOK-999"
    When wywołuje zestawienie "adopcja oferty"
    Then system zwraca zestawienie z zerowymi wartościami zamiast błędu

  # AC3: odsetek SMS-ów z ofertą w zestawieniu adopcji
  @smoke @regression
  Scenario: Wyliczenie liczby i odsetka napraw z ofertą dosprzedaży w zestawieniu adopcji
    Given w zadanym zakresie dat zarejestrowano 100 napraw z wysłanym SMS-em potwierdzającym
    And 40 z tych napraw zawierało ofertę dosprzedaży w SMS-ie
    When wywołuje zestawienie adopcji oferty
    Then system zwraca liczbę napraw z ofertą równą 40
    And system zwraca odsetek napraw z ofertą równy 40%

  @regression
  Scenario: Zestawienie adopcji oferty przy braku jakichkolwiek napraw z ofertą
    Given w zadanym zakresie dat zarejestrowano 100 napraw z wysłanym SMS-em potwierdzającym
    And żadna z tych napraw nie zawierała oferty dosprzedaży w SMS-ie
    When wywołuje zestawienie adopcji oferty
    Then system zwraca liczbę napraw z ofertą równą 0
    And system zwraca odsetek napraw z ofertą równy 0%

  # AC4: mediana czasu reakcji i rozróżnienie dwóch grup braku odpowiedzi
  @smoke @regression
  Scenario: Wyliczenie mediany czasu reakcji klientów, którzy otworzyli link z SMS-a
    Given klienci otworzyli link z SMS-a w różnych odstępach czasu od jego wysłania
    When wywołuje zestawienie reakcji klientów na SMS
    Then system zwraca medianę czasu reakcji liczoną od wysłania SMS-a do otwarcia linku

  @regression
  Scenario: Klasyfikacja klientów, którzy w ogóle nie kliknęli w link z SMS-a
    Given część klientów nie zarejestrowała żadnego zdarzenia otwarcia linku z SMS-a
    When wywołuje zestawienie reakcji klientów na SMS
    Then system klasyfikuje tych klientów w grupie brak kliknięcia w link

  @regression
  Scenario: Klasyfikacja klientów, którzy otworzyli formularz, ale go nie zatwierdzili
    Given część klientów otworzyła formularz potwierdzenia wizyty, ale nie zatwierdziła go
    When wywołuje zestawienie reakcji klientów na SMS
    Then system klasyfikuje tych klientów w grupie formularz otwarty bez zatwierdzenia

  # AC5: rozkład odpowiedzi na pytania w rozbiciu na BOK
  @smoke @regression
  Scenario Outline: Rozkład odpowiedzi na pytanie o termin wizyty w rozbiciu na BOK
    Given klienci w danym BOK udzielili odpowiedzi "<odpowiedz>" na pytanie o termin wizyty
    When wywołuje zestawienie odpowiedzi na pytania
    Then system zwraca liczbę i procent odpowiedzi "<odpowiedz>" w rozbiciu na BOK

    Examples:
      | odpowiedz       |
      | potwierdzony    |
      | prośba o zmianę |
      | rezygnacja      |

  @regression
  Scenario Outline: Rozkład odpowiedzi na pytanie o oczekiwanie na miejscu w rozbiciu na BOK
    Given klienci w danym BOK udzielili odpowiedzi "<odpowiedz>" na pytanie o oczekiwanie na miejscu
    When wywołuje zestawienie odpowiedzi na pytania
    Then system zwraca liczbę i procent odpowiedzi "<odpowiedz>" w rozbiciu na BOK

    Examples:
      | odpowiedz |
      | tak       |
      | nie       |

  # AC6: skuteczność ofert dosprzedażowych
  @smoke @regression
  Scenario: Wyliczenie odsetka napraw z ofertą zakończonych akceptacją co najmniej jednej pozycji
    Given wysłano SMS z ofertą dosprzedaży dla zadanej liczby napraw w zakresie dat
    And klient zaakceptował co najmniej jedną pozycję oferty w części z tych napraw
    When wywołuje zestawienie skuteczności ofert dosprzedażowych
    Then system zwraca odsetek napraw zakończonych akceptacją co najmniej jednej pozycji

  @regression
  Scenario: Ranking pozycji ze wszystkich szablonów wraz ze współczynnikiem akceptacji
    Given pozycje z różnych szablonów ofert otrzymały różną liczbę odpowiedzi i akceptacji
    When wywołuje zestawienie skuteczności ofert dosprzedażowych
    Then system zwraca ranking pozycji z liczbą odpowiedzi, akceptacji i współczynnikiem akceptacji

  @regression
  Scenario: Ranking szablonów ofert według odsetka napraw zakończonych akceptacją
    Given szablony ofert różnią się odsetkiem napraw zakończonych akceptacją co najmniej jednej pozycji
    When wywołuje zestawienie skuteczności ofert dosprzedażowych
    Then system zwraca ranking szablonów uporządkowany malejąco według tego odsetka

  @regression
  Scenario: Zerowe wartości zestawienia, gdy w zakresie dat nie zarejestrowano żadnych zdarzeń
    Given w zadanym zakresie dat nie zarejestrowano żadnych zdarzeń funkcji Potwierdzenie wizyty
    When wywołuje dowolne zestawienie statystyk funkcji Potwierdzenie wizyty
    Then system zwraca zestawienie z zerowymi wartościami zamiast błędu

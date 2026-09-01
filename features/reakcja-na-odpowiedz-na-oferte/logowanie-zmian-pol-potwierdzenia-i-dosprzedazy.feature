# Zadanie: SVCLOUD-5533 — S11 — Logowanie zmian pól potwierdzenia wizyty i dosprzedaży w Historii zmian
@logowanie-zmian-pol-potwierdzenia-i-dosprzedazy
Feature: Logowanie zmian pól potwierdzenia wizyty i dosprzedaży w Historii zmian
  Jako Doradca serwisowy chcę widzieć w Historii zmian teczki naprawy pełny zapis zmian pól związanych
  z potwierdzeniem wizyty i dosprzedażą, aby prześledzić kto i kiedy wprowadził daną zmianę — niezależnie
  od tego, czy była to akcja manualna czy automatyczna.

  # AC3: manualna zmiana wartości pola "Oferta dosprzedaży" jest logowana
  @smoke @regression @ui
  Scenario: Zarejestrowanie w Historii zmian wyboru szablonu oferty dosprzedaży w teczce naprawy
    Given w teczce naprawy pole "Oferta dosprzedaży" ma wartość "— bez oferty —"
    When doradca wybiera szablon oferty "Przegląd okresowy" w polu "Oferta dosprzedaży"
    Then w Historii zmian pojawia się wpis dla pola "Oferta dosprzedaży"
    And wpis zawiera wartość poprzednią "— bez oferty —" i wartość nową "Przegląd okresowy"
    And wpis zawiera datę i godzinę zmiany oraz imię i nazwisko doradcy

  # AC3: warianty zmiany pola "Oferta dosprzedaży" w teczce naprawy i w kreatorze naprawy
  @regression @ui
  Scenario Outline: Zarejestrowanie w Historii zmian zmiany pola Oferta dosprzedaży w "<miejsce_zmiany>"
    Given w teczce naprawy pole "Oferta dosprzedaży" ma wartość "<wartosc_poprzednia>"
    When doradca zmienia wartość pola "Oferta dosprzedaży" na "<wartosc_nowa>" w "<miejsce_zmiany>"
    Then w Historii zmian pojawia się wpis z wartością poprzednią "<wartosc_poprzednia>" i wartością nową "<wartosc_nowa>"

    Examples:
      | wartosc_poprzednia          | wartosc_nowa                 | miejsce_zmiany    |
      | Przegląd okresowy           | Wymiana klocków hamulcowych   | teczce naprawy    |
      | Wymiana klocków hamulcowych | — bez oferty —                | teczce naprawy    |
      | — bez oferty —              | Przegląd okresowy             | kreatorze naprawy |

  # AC3: zmiana stanu blokady pola nie jest logowana
  @regression @api
  Scenario Outline: Brak wpisu w Historii zmian przy automatycznej zmianie stanu blokady pola Oferta dosprzedaży
    Given pole "Oferta dosprzedaży" zmienia stan blokady w wyniku "<zdarzenie_systemowe>"
    When system aktualizuje stan blokady pola
    Then w Historii zmian nie pojawia się nowy wpis dotyczący stanu blokady pola

    Examples:
      | zdarzenie_systemowe          |
      | wysłania wiadomości do klienta |
      | przeplanowania wizyty          |

  # AC4: logowanie informacji o szablonie oferty wysłanym w wiadomości VS
  @smoke @regression @api
  Scenario: Zarejestrowanie w Historii zmian informacji o wysłanym szablonie oferty w wiadomości VS
    Given doradca wysyła do klienta wiadomość typu "Wiadomość VS" zawierającą ofertę dosprzedaży "Przegląd okresowy"
    When system wysyła wiadomość
    Then w Historii zmian pojawia się wpis z nazwą wysłanego szablonu oferty "Przegląd okresowy"
    And wpis zawiera datę i godzinę wysyłki oraz autora "Video Service"

  # AC4: logowanie wysyłki wiadomości VS bez oferty dosprzedaży
  @regression @api
  Scenario: Zarejestrowanie w Historii zmian wysyłki wiadomości VS bez oferty dosprzedaży
    Given doradca wysyła do klienta wiadomość typu "Wiadomość VS" bez oferty dosprzedaży
    When system wysyła wiadomość
    Then w Historii zmian pojawia się wpis z informacją o braku oferty w wysłanej wiadomości
    And wpis zawiera datę i godzinę wysyłki oraz autora "Video Service"

  # AC6: manualna zmiana checkboxa "Oferta obsłużona" jest logowana
  @smoke @regression @ui
  Scenario Outline: Zarejestrowanie w Historii zmian zmiany checkboxa Oferta obsłużona z "<wartosc_poprzednia>" na "<wartosc_nowa>"
    Given w teczce naprawy checkbox "Oferta obsłużona" ma wartość "<wartosc_poprzednia>"
    When doradca zmienia wartość checkboxa "Oferta obsłużona" na "<wartosc_nowa>"
    Then w Historii zmian pojawia się wpis z wartością poprzednią "<wartosc_poprzednia>" i wartością nową "<wartosc_nowa>"
    And wpis zawiera datę i godzinę zmiany oraz imię i nazwisko doradcy

    Examples:
      | wartosc_poprzednia | wartosc_nowa |
      | NIE                | TAK          |
      | TAK                | NIE          |

  # AC7: nowe wpisy zachowują format istniejącej Historii zmian
  @regression
  Scenario: Spójność formatu nowego wpisu z istniejącymi wpisami Historii zmian
    Given w Historii zmian istnieją wpisy dotyczące innych pól teczki naprawy
    When doradca dokonuje zmiany pola "Oferta obsłużona"
    Then nowy wpis jest wyświetlany w tej samej sekcji i w tym samym formacie co istniejące wpisy Historii zmian
    And nie powstaje nowy widok ani osobna sekcja dla tego wpisu

  # AC8: wpisy generowane automatycznie są oznaczone autorem "Video Service"
  @regression @api
  Scenario Outline: Oznaczenie autora Video Service dla automatycznie generowanego wpisu "<zdarzenie>"
    Given system automatycznie rejestruje zdarzenie "<zdarzenie>" w Historii zmian
    When wpis zostaje zapisany
    Then autorem wpisu jest "Video Service"

    Examples:
      | zdarzenie                                          |
      | wysłanie szablonu oferty w wiadomości VS            |
      | wysłanie wiadomości VS bez oferty dosprzedaży       |

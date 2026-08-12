@widok-wiadomosci-sms @ui @regression @pl
Feature: Widok wiadomości SMS z potwierdzeniem wizyty i ofertą dosprzedaży
  Jako Klient serwisu chcę otworzyć link z wiadomości SMS, aby potwierdzić wizytę
  oraz przejrzeć ofertę dosprzedaży i przekazać swoje decyzje serwisowi
  bez konieczności kontaktu telefonicznego.

  Background:
    Given klient otrzymał wiadomość SMS z unikalnym linkiem do widoku wiadomości

  # AC1: Struktura i oprawa widoku - dane Klienta/Pojazdu, logo i stopka.
  @smoke @regression @ui
  Scenario: Wyświetlenie sekcji danych Klienta i Pojazdu, logotypu oraz stopki
    When klient otwiera unikalny link z wiadomości SMS
    Then użytkownik widzi sekcję z danymi Klienta i Pojazdu na górze widoku
    And użytkownik widzi logotyp serwisu w widoku
    And użytkownik widzi stopkę zgodną z szablonem na dole widoku

  # AC2: Dynamika komunikatu nagłówkowego w zależności od obecności oferty dosprzedaży.
  @smoke @regression
  Scenario Outline: Wyświetlenie komunikatu nagłówkowego w zależności od zawartości wiadomości
    Given wiadomość Planera "<zawartosc>"
    When klient otwiera unikalny link z wiadomości SMS
    Then użytkownik widzi w nagłówku tekst "<tekst_naglowka>"

    Examples:
      | zawartosc                               | tekst_naglowka                                                                                     |
      | zawiera wyłącznie pytania                | Uprzejmie prosimy o udzielenie odpowiedzi na poniższe pytania                                       |
      | zawiera pytania oraz ofertę dosprzedaży  | Uprzejmie prosimy o udzielenie odpowiedzi na poniższe pytania oraz o podjęcie decyzji do oferty.    |

  @translations
  # AC2: Konfiguracja tłumaczeń komunikatu nagłówkowego widoku wiadomości.
  Scenario Outline: Wyświetlenie poprawnego tłumaczenia komunikatu nagłówkowego w zależności od języka
    Given wiadomość Planera zawiera wyłącznie pytania
    And użytkownik ma ustawiony język interfejsu "<jezyk>"
    When klient otwiera unikalny link z wiadomości SMS
    Then użytkownik widzi w nagłówku tekst "<tlumaczenie>"

    Examples:
      | jezyk | tlumaczenie                                                    |
      | pl-PL | Uprzejmie prosimy o udzielenie odpowiedzi na poniższe pytania  |
      | en    | <to translate>                                                 |
      | cz    | <to translate>                                                 |

  # AC3: Widoczność zakładek - "Pytania" zawsze widoczna i domyślna, "Oferta" tylko z pozycjami ankiety.
  @smoke @regression @ui
  Scenario Outline: Widoczność zakładki "Oferta" w zależności od zawartości wiadomości
    Given wiadomość Planera "<zawartosc>"
    When klient otwiera unikalny link z wiadomości SMS
    Then zakładka "Pytania" jest widoczna i domyślnie aktywna
    And użytkownik "<widocznosc_oferty>" zakładkę "Oferta"

    Examples:
      | zawartosc                               | widocznosc_oferty |
      | zawiera wyłącznie pytania                | nie widzi          |
      | zawiera pytania oraz ofertę dosprzedaży  | widzi               |

  # AC4: Zakładka "Pytania" - treść Pytania 1 i Pytania 2 wraz z przyciskami odpowiedzi.
  @smoke @regression @ui
  Scenario: Wyświetlenie pytań i przycisków odpowiedzi w zakładce "Pytania"
    Given klient otworzył widok wiadomości dla wizyty w dniu "12.08.2026" o godzinie "10:00"
    When klient przechodzi do zakładki "Pytania"
    Then użytkownik widzi pytanie "Czy potwierdzasz wizytę w dniu 12.08.2026 o godzinie 10:00?"
    And użytkownik widzi przyciski odpowiedzi "Potwierdzam", "Chcę zmienić termin" oraz "Rezygnuję z naprawy"
    And użytkownik widzi pytanie "Czy będziesz czekał na naprawę na miejscu?"
    And użytkownik widzi przyciski odpowiedzi "Tak" oraz "Nie"

  # AC4: Zakładka "Pytania" nie zawiera żadnych elementów ankiety dosprzedaży.
  @regression @ui
  Scenario: Brak elementów oferty dosprzedaży w zakładce "Pytania"
    Given wiadomość Planera zawiera pytania oraz ofertę dosprzedaży
    When klient przechodzi do zakładki "Pytania"
    Then użytkownik nie widzi pozycji ankiety dosprzedaży w zakładce "Pytania"
    And użytkownik nie widzi tytułów ani skrótów ankiety dosprzedaży w zakładce "Pytania"

  # AC4: Klient wybiera odpowiedź na Pytanie 1 (potwierdzenie wizyty).
  @smoke @regression
  Scenario Outline: Wybór odpowiedzi na pytanie o potwierdzenie wizyty
    Given klient otworzył widok wiadomości i zakładkę "Pytania"
    When klient wybiera odpowiedź "<odpowiedz>" na pytanie o potwierdzenie wizyty
    Then system zapisuje decyzję klienta jako "<odpowiedz>" dla pytania o potwierdzenie wizyty

    Examples:
      | odpowiedz            |
      | Potwierdzam          |
      | Chcę zmienić termin  |
      | Rezygnuję z naprawy  |

  # AC4: Klient wybiera odpowiedź na Pytanie 2 (oczekiwanie na naprawę).
  @smoke @regression
  Scenario Outline: Wybór odpowiedzi na pytanie o oczekiwanie na naprawę
    Given klient otworzył widok wiadomości i zakładkę "Pytania"
    When klient wybiera odpowiedź "<odpowiedz>" na pytanie o oczekiwanie na naprawę
    Then system zapisuje decyzję klienta jako "<odpowiedz>" dla pytania o oczekiwanie na naprawę

    Examples:
      | odpowiedz |
      | Tak       |
      | Nie       |

  # AC5: Zakładka "Oferta" - pozycje z opisem, ceną i przyciskami decyzji.
  @smoke @regression @ui
  Scenario: Wyświetlenie pozycji oferty dosprzedaży w zakładce "Oferta"
    Given wiadomość Planera zawiera pozycję oferty dosprzedaży "Wymiana klocków hamulcowych" w cenie "350 zł"
    When klient przechodzi do zakładki "Oferta"
    Then użytkownik widzi opis pozycji "Wymiana klocków hamulcowych"
    And użytkownik widzi cenę pozycji "350 zł"
    And użytkownik widzi przyciski decyzji "Zgoda" oraz "Odmowa" dla tej pozycji

  # AC5: Etykiety stanu technicznego są ukryte przed klientem.
  @regression @ui
  Scenario Outline: Ukrycie etykiet stanu technicznego pozycji oferty przed klientem
    Given wiadomość Planera zawiera pozycję oferty dosprzedaży z etykietą stanu technicznego "<etykieta>"
    When klient przechodzi do zakładki "Oferta"
    Then użytkownik nie widzi etykiety stanu technicznego "<etykieta>" przy pozycji

    Examples:
      | etykieta   |
      | Brak uwag  |
      | Zalecane   |
      | Pilne      |

  # AC5: Klient podejmuje decyzję dla pozycji oferty dosprzedaży.
  @smoke @regression
  Scenario Outline: Podjęcie decyzji dla pozycji oferty dosprzedaży
    Given wiadomość Planera zawiera pozycję oferty dosprzedaży "Wymiana klocków hamulcowych" w cenie "350 zł"
    And klient przechodzi do zakładki "Oferta"
    When klient wybiera decyzję "<decyzja>" dla pozycji "Wymiana klocków hamulcowych"
    Then system zapisuje decyzję klienta jako "<decyzja>" dla pozycji "Wymiana klocków hamulcowych"

    Examples:
      | decyzja |
      | Zgoda   |
      | Odmowa  |

  # AC6: Brak elementów umożliwiających kontakt telefoniczny w widoku wiadomości.
  @regression @ui
  Scenario: Brak elementów kontaktowych w widoku wiadomości
    When klient otwiera unikalny link z wiadomości SMS
    Then użytkownik nie widzi sekcji "W razie pytań zapraszamy do kontaktu:"
    And użytkownik nie widzi przycisku "Wyślij prośbę o kontakt"
    And użytkownik nie widzi przycisku "Zadzwoń do..."

  # Edge case: link z wiadomości SMS jest nieprawidłowy lub wygasł.
  @regression @security
  Scenario: Próba otwarcia nieprawidłowego lub wygasłego linku z wiadomości SMS
    Given link z wiadomości SMS jest nieprawidłowy lub wygasł
    When klient otwiera ten link
    Then system wyświetla komunikat o niedostępności widoku wiadomości
    And system nie wyświetla danych Klienta ani Pojazdu

  # Edge case: klient ponownie otwiera link po przekazaniu wszystkich decyzji.
  @regression
  Scenario: Ponowne otwarcie linku po przekazaniu wszystkich decyzji
    Given klient przekazał już decyzje dla wszystkich pytań i pozycji oferty
    When klient ponownie otwiera unikalny link z wiadomości SMS
    Then użytkownik widzi wcześniej przekazane decyzje jako tylko do odczytu
    And użytkownik nie może zmienić przekazanych decyzji

  # Edge case: błąd komunikacji z systemem podczas wczytywania widoku wiadomości.
  @regression
  Scenario: Błąd wczytywania danych Klienta i Pojazdu w widoku wiadomości
    Given wystąpił błąd komunikacji z systemem podczas otwierania linku
    When klient otwiera unikalny link z wiadomości SMS
    Then system wyświetla komunikat o błędzie wczytywania widoku wiadomości
    And użytkownik nie widzi niekompletnych danych Klienta ani Pojazdu

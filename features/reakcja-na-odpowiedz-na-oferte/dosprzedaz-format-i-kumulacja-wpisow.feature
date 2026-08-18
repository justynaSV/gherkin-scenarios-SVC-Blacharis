# Zadanie QA: SVCLOUD-5634 — [QA] T5 (placeholder) Dosprzedaż — akceptacja/odrzucenie/brak oferty/anulowanie/przeplanowanie
@dosprzedaz-format-i-kumulacja-wpisow
Feature: Formatowanie i kumulacja wpisów w polu Dosprzedaż po odpowiedzi klienta na ofertę
  Jako Doradca serwisowy chcę, aby decyzje klienta dotyczące oferty dosprzedaży były automatycznie
  zapisywane w polu „Dosprzedaż” teczki naprawy w ustandaryzowanym formacie,
  aby wiedzieć, czym zainteresował się klient i jak odniósł się do oferty bez otwierania wiadomości w VS.

  # AC1: formatowanie wpisu przy akceptacji co najmniej jednej pozycji oferty
  @smoke @regression @api
  Scenario: Zapisanie wpisu z datą i listą zaakceptowanych oraz odrzuconych pozycji po częściowej akceptacji oferty
    Given naprawa w Planerze ma status "Otwarta"
    When Planer otrzymuje z VS pakiet decyzji klienta z dnia "2026-07-10" zawierający zaakceptowane pozycje "Wymiana opon na zimowe, Wymiana oleju" i odrzucone pozycje "Wymiana filtra powietrza, Kontrola układu hamulcowego"
    Then system dopisuje w polu "Dosprzedaż" wpis z datą "2026-07-10"
    And wpis zawiera w pierwszej kolumnie zaakceptowane pozycje "Wymiana opon na zimowe, Wymiana oleju"
    And wpis zawiera w drugiej kolumnie odrzucone pozycje "Wymiana filtra powietrza, Kontrola układu hamulcowego"

  # AC2: formatowanie wpisu przy odrzuceniu wszystkich pozycji oferty
  @smoke @regression @api
  Scenario: Zapisanie wpisu z komunikatem Brak akceptacji oferty po odrzuceniu wszystkich pozycji
    Given naprawa w Planerze ma status "Otwarta"
    When Planer otrzymuje z VS pakiet decyzji klienta z dnia "2026-07-10" zawierający wyłącznie odrzucone pozycje oferty
    Then system dopisuje w polu "Dosprzedaż" wpis z datą "2026-07-10"
    And wpis zawiera w kolejnej linii stały tekst "Brak akceptacji oferty"

  # AC3: kumulowanie kolejnych wpisów bez nadpisywania wcześniejszej treści
  @regression @api
  Scenario: Dopisanie nowego wpisu na końcu pola Dosprzedaż z zachowaniem wcześniejszych wpisów
    Given pole "Dosprzedaż" zawiera już wcześniejszy wpis z dnia "2026-06-01"
    When Planer otrzymuje z VS kolejny pakiet decyzji klienta z dnia "2026-07-10"
    Then system dopisuje nowy wpis na końcu pola "Dosprzedaż"
    And nowy wpis jest oddzielony od poprzedniego dokładnie jedną pustą linią
    And wcześniejszy wpis z dnia "2026-06-01" pozostaje niezmieniony

  # AC4: pole Dosprzedaż jest tylko do odczytu dla doradcy serwisowego
  @regression @ui
  Scenario: Zablokowanie pola Dosprzedaż przed ręczną edycją przez doradcę serwisowego
    Given doradca serwisowy otwiera teczkę naprawy zawierającą wpisy w polu "Dosprzedaż"
    When doradca próbuje edytować pole "Dosprzedaż"
    Then pole "Dosprzedaż" pozostaje niedostępne do ręcznej edycji

  # AC4: nazwy odrzuconych pozycji nie są ujawniane w teczce naprawy
  @regression
  Scenario: Brak nazw odrzuconych pozycji w teczce naprawy poza polem Dosprzedaż
    Given klient odrzucił pozycję oferty "Wymiana filtra powietrza"
    When doradca przegląda teczkę naprawy w Planerze
    Then nazwa odrzuconej pozycji "Wymiana filtra powietrza" nie jest widoczna w teczce naprawy
    And doradca może zobaczyć odrzucone pozycje wyłącznie po przejściu przez link do wiadomości w VS
const assert = require('node:assert/strict');
const { Given, When, Then, world } = require('@cucumber/cucumber');

Given('wiadomość do klienta wysłano z szablonem {string}', async (value) => {
  // TODO: implement this step (from feature step: "wiadomość do klienta wysłano z szablonem "— bez oferty —"")
  return 'pending';
});

When('klient otwiera wiadomość w VS', async () => {
  // TODO: implement this step (from feature step: "klient otwiera wiadomość w VS")
  return 'pending';
});

Then('VS nie przesyła do Planera pakietu decyzji klienta', async () => {
  // TODO: implement this step (from feature step: "VS nie przesyła do Planera pakietu decyzji klienta")
  return 'pending';
});

Then('pole {string} pozostaje puste', async (value) => {
  // TODO: implement this step (from feature step: "pole "Dosprzedaż" pozostaje puste")
  return 'pending';
});

Then('w Historii naprawy nie powstaje żaden wpis', async () => {
  // TODO: implement this step (from feature step: "w Historii naprawy nie powstaje żaden wpis")
  return 'pending';
});

Given('wiadomość do klienta zawiera ofertę dosprzedaży', async () => {
  // TODO: implement this step (from feature step: "wiadomość do klienta zawiera ofertę dosprzedaży")
  return 'pending';
});

When('klient nie wchodzi w interakcję z zakładką Oferta w VS', async () => {
  // TODO: implement this step (from feature step: "klient nie wchodzi w interakcję z zakładką Oferta w VS")
  return 'pending';
});

Given('naprawa w Planerze ma status {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa w Planerze ma status "Anulowana"")
  return 'pending';
});

When('Planer otrzymuje z VS pakiet decyzji klienta dotyczący tej naprawy', async () => {
  // TODO: implement this step (from feature step: "Planer otrzymuje z VS pakiet decyzji klienta dotyczący tej naprawy")
  return 'pending';
});

Then('system ignoruje odebrany pakiet', async () => {
  // TODO: implement this step (from feature step: "system ignoruje odebrany pakiet")
  return 'pending';
});

Then('pole {string} pozostaje bez zmian', async (value) => {
  // TODO: implement this step (from feature step: "pole "Dosprzedaż" pozostaje bez zmian")
  return 'pending';
});

Given('naprawa została przeplanowana i posiada nową wiadomość z ofertą dosprzedaży', async () => {
  // TODO: implement this step (from feature step: "naprawa została przeplanowana i posiada nową wiadomość z ofertą dosprzedaży")
  return 'pending';
});

When('klient odpowiada na nową ofertę przypisaną do nowej wiadomości', async () => {
  // TODO: implement this step (from feature step: "klient odpowiada na nową ofertę przypisaną do nowej wiadomości")
  return 'pending';
});

Then('Planer traktuje odpowiedź jako niezależne zdarzenie', async () => {
  // TODO: implement this step (from feature step: "Planer traktuje odpowiedź jako niezależne zdarzenie")
  return 'pending';
});

Then('system dopisuje nowy blok danych z datą i treścią w polu {string} zgodnie z zasadą kumulacji', async (value) => {
  // TODO: implement this step (from feature step: "system dopisuje nowy blok danych z datą i treścią w polu "Dosprzedaż" zgodnie z zasadą kumulacji")
  return 'pending';
});

When('Planer otrzymuje z VS pakiet decyzji klienta z dnia {string} zawierający zaakceptowane pozycje {string} i odrzucone pozycje {string}', async (value1, value2, value3) => {
  // TODO: implement this step (from feature step: "Planer otrzymuje z VS pakiet decyzji klienta z dnia "2026-07-10" zawierający zaakceptowane pozycje "Wymiana opon na zimowe, Wymiana oleju" i odrzucone pozycje "Wymiana filtra powietrza, Kontrola układu hamulcowego"")
  return 'pending';
});

Then('system dopisuje w polu {string} wpis z datą {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "system dopisuje w polu "Dosprzedaż" wpis z datą "2026-07-10"")
  return 'pending';
});

Then('wpis zawiera w pierwszej kolumnie zaakceptowane pozycje {string}', async (value) => {
  // TODO: implement this step (from feature step: "wpis zawiera w pierwszej kolumnie zaakceptowane pozycje "Wymiana opon na zimowe, Wymiana oleju"")
  return 'pending';
});

Then('wpis zawiera w drugiej kolumnie odrzucone pozycje {string}', async (value) => {
  // TODO: implement this step (from feature step: "wpis zawiera w drugiej kolumnie odrzucone pozycje "Wymiana filtra powietrza, Kontrola układu hamulcowego"")
  return 'pending';
});

When('Planer otrzymuje z VS pakiet decyzji klienta z dnia {string} zawierający wyłącznie odrzucone pozycje oferty', async (value) => {
  // TODO: implement this step (from feature step: "Planer otrzymuje z VS pakiet decyzji klienta z dnia "2026-07-10" zawierający wyłącznie odrzucone pozycje oferty")
  return 'pending';
});

Then('wpis zawiera w kolejnej linii stały tekst {string}', async (value) => {
  // TODO: implement this step (from feature step: "wpis zawiera w kolejnej linii stały tekst "Brak akceptacji oferty"")
  return 'pending';
});

Given('pole {string} zawiera już wcześniejszy wpis z dnia {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "pole "Dosprzedaż" zawiera już wcześniejszy wpis z dnia "2026-06-01"")
  return 'pending';
});

When('Planer otrzymuje z VS kolejny pakiet decyzji klienta z dnia {string}', async (value) => {
  // TODO: implement this step (from feature step: "Planer otrzymuje z VS kolejny pakiet decyzji klienta z dnia "2026-07-10"")
  return 'pending';
});

Then('system dopisuje nowy wpis na końcu pola {string}', async (value) => {
  // TODO: implement this step (from feature step: "system dopisuje nowy wpis na końcu pola "Dosprzedaż"")
  return 'pending';
});

Then('nowy wpis jest oddzielony od poprzedniego dokładnie jedną pustą linią', async () => {
  // TODO: implement this step (from feature step: "nowy wpis jest oddzielony od poprzedniego dokładnie jedną pustą linią")
  return 'pending';
});

Then('wcześniejszy wpis z dnia {string} pozostaje niezmieniony', async (value) => {
  // TODO: implement this step (from feature step: "wcześniejszy wpis z dnia "2026-06-01" pozostaje niezmieniony")
  return 'pending';
});

Given('doradca serwisowy otwiera teczkę naprawy zawierającą wpisy w polu {string}', async (value) => {
  // TODO: implement this step (from feature step: "doradca serwisowy otwiera teczkę naprawy zawierającą wpisy w polu "Dosprzedaż"")
  return 'pending';
});

When('doradca próbuje edytować pole {string}', async (value) => {
  // TODO: implement this step (from feature step: "doradca próbuje edytować pole "Dosprzedaż"")
  return 'pending';
});

Then('pole {string} pozostaje niedostępne do ręcznej edycji', async (value) => {
  // TODO: implement this step (from feature step: "pole "Dosprzedaż" pozostaje niedostępne do ręcznej edycji")
  return 'pending';
});

Given('klient odrzucił pozycję oferty {string}', async (value) => {
  // TODO: implement this step (from feature step: "klient odrzucił pozycję oferty "Wymiana filtra powietrza"")
  return 'pending';
});

When('doradca przegląda teczkę naprawy w Planerze', async () => {
  // TODO: implement this step (from feature step: "doradca przegląda teczkę naprawy w Planerze")
  return 'pending';
});

Then('nazwa odrzuconej pozycji {string} nie jest widoczna w teczce naprawy', async (value) => {
  // TODO: implement this step (from feature step: "nazwa odrzuconej pozycji "Wymiana filtra powietrza" nie jest widoczna w teczce naprawy")
  return 'pending';
});

Then('doradca może zobaczyć odrzucone pozycje wyłącznie po przejściu przez link do wiadomości w VS', async () => {
  // TODO: implement this step (from feature step: "doradca może zobaczyć odrzucone pozycje wyłącznie po przejściu przez link do wiadomości w VS")
  return 'pending';
});

Given('Planer otrzymał z VS pakiet decyzji klienta zawierający co najmniej jedną zaakceptowaną pozycję oferty', async () => {
  // TODO: implement this step (from feature step: "Planer otrzymał z VS pakiet decyzji klienta zawierający co najmniej jedną zaakceptowaną pozycję oferty")
  return 'pending';
});

When('system zapisuje odpowiedź klienta w teczce naprawy', async () => {
  // TODO: implement this step (from feature step: "system zapisuje odpowiedź klienta w teczce naprawy")
  return 'pending';
});

Then('w Historii naprawy pojawia się wpis z datą i godziną odebrania pakietu', async () => {
  // TODO: implement this step (from feature step: "w Historii naprawy pojawia się wpis z datą i godziną odebrania pakietu")
  return 'pending';
});

Then('wpis zawiera tekst {string}', async (value) => {
  // TODO: implement this step (from feature step: "wpis zawiera tekst "Klient udzielił odpowiedzi na ofertę"")
  return 'pending';
});

Then('wpis zawiera nazwy zaakceptowanych i odrzuconych pozycji', async () => {
  // TODO: implement this step (from feature step: "wpis zawiera nazwy zaakceptowanych i odrzuconych pozycji")
  return 'pending';
});

Given('Planer otrzymał z VS pakiet decyzji klienta odrzucający wszystkie pozycje oferty', async () => {
  // TODO: implement this step (from feature step: "Planer otrzymał z VS pakiet decyzji klienta odrzucający wszystkie pozycje oferty")
  return 'pending';
});

Given('doradca serwisowy przegląda listę napraw', async () => {
  // TODO: implement this step (from feature step: "doradca serwisowy przegląda listę napraw")
  return 'pending';
});

Then('na liście napraw widoczna jest kolumna {string}', async (value) => {
  // TODO: implement this step (from feature step: "na liście napraw widoczna jest kolumna "Dosprzedaż"")
  return 'pending';
});

Then('kolumna {string} znajduje się bezpośrednio przed kolumną {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "kolumna "Dosprzedaż" znajduje się bezpośrednio przed kolumną "Status Online Booking"")
  return 'pending';
});

Given('naprawa na liście napraw ma puste pole {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa na liście napraw ma puste pole "Dosprzedaż"")
  return 'pending';
});

Then('komórka w kolumnie {string} dla tej naprawy jest pusta', async (value) => {
  // TODO: implement this step (from feature step: "komórka w kolumnie "Dosprzedaż" dla tej naprawy jest pusta")
  return 'pending';
});

Given('naprawa na liście napraw ma pole {string} z wpisem od klienta', async (value) => {
  // TODO: implement this step (from feature step: "naprawa na liście napraw ma pole "Dosprzedaż" z wpisem od klienta")
  return 'pending';
});

Given('pole {string} tej naprawy ma wartość {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "pole "Oferta obsłużona" tej naprawy ma wartość "<oferta_obsluzona>"")
  return 'pending';
});

Then('komórka w kolumnie {string} dla tej naprawy pokazuje wartość {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "komórka w kolumnie "Dosprzedaż" dla tej naprawy pokazuje wartość "<wartosc_komorki>"")
  return 'pending';
});

When('doradca serwisowy otwiera filtr w nagłówku kolumny {string}', async (value) => {
  // TODO: implement this step (from feature step: "doradca serwisowy otwiera filtr w nagłówku kolumny "Dosprzedaż"")
  return 'pending';
});

Then('filtr zawiera dokładnie trzy opcje {string}, {string} i {string}', async (value1, value2, value3) => {
  // TODO: implement this step (from feature step: "filtr zawiera dokładnie trzy opcje "Brak", "Zapoznaj się" i "Obsłużone"")
  return 'pending';
});

Given('lista napraw zawiera naprawy ze wszystkimi wartościami w kolumnie {string}', async (value) => {
  // TODO: implement this step (from feature step: "lista napraw zawiera naprawy ze wszystkimi wartościami w kolumnie "Dosprzedaż"")
  return 'pending';
});

When('doradca serwisowy wybiera w filtrze kolumny {string} opcję {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "doradca serwisowy wybiera w filtrze kolumny "Dosprzedaż" opcję "<opcja>"")
  return 'pending';
});

Then('lista napraw pokazuje wyłącznie naprawy z wartością {string} w kolumnie {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "lista napraw pokazuje wyłącznie naprawy z wartością "<opcja>" w kolumnie "Dosprzedaż"")
  return 'pending';
});

When('doradca serwisowy włącza przełącznik {string}', async (value) => {
  // TODO: implement this step (from feature step: "doradca serwisowy włącza przełącznik "Wymaga działania"")
  return 'pending';
});

Given('doradca serwisowy otwiera teczkę naprawy z pustym polem {string}', async (value) => {
  // TODO: implement this step (from feature step: "doradca serwisowy otwiera teczkę naprawy z pustym polem "Dosprzedaż"")
  return 'pending';
});

Then('checkbox {string} jest wyszarzony', async (value) => {
  // TODO: implement this step (from feature step: "checkbox "Oferta obsłużona" jest wyszarzony")
  return 'pending';
});

Then('checkbox {string} jest nieaktywny', async (value) => {
  // TODO: implement this step (from feature step: "checkbox "Oferta obsłużona" jest nieaktywny")
  return 'pending';
});

Given('doradca serwisowy otwiera teczkę naprawy, której pole {string} zawiera wpis odebrany z systemu VS', async (value) => {
  // TODO: implement this step (from feature step: "doradca serwisowy otwiera teczkę naprawy, której pole "Dosprzedaż" zawiera wpis odebrany z systemu VS")
  return 'pending';
});

Then('checkbox {string} jest aktywny', async (value) => {
  // TODO: implement this step (from feature step: "checkbox "Oferta obsłużona" jest aktywny")
  return 'pending';
});

Then('checkbox {string} jest edytowalny', async (value) => {
  // TODO: implement this step (from feature step: "checkbox "Oferta obsłużona" jest edytowalny")
  return 'pending';
});

Given('klient odpowiedział na ofertę dosprzedaży po raz pierwszy dla tej naprawy', async () => {
  // TODO: implement this step (from feature step: "klient odpowiedział na ofertę dosprzedaży po raz pierwszy dla tej naprawy")
  return 'pending';
});

When('system zapisuje odpowiedź w polu {string}', async (value) => {
  // TODO: implement this step (from feature step: "system zapisuje odpowiedź w polu "Dosprzedaż"")
  return 'pending';
});

Then('checkbox {string} ma domyślną wartość {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "checkbox "Oferta obsłużona" ma domyślną wartość "false"")
  return 'pending';
});

Given('naprawa na liście napraw ma w kolumnie {string} wartość {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "naprawa na liście napraw ma w kolumnie "Dosprzedaż" wartość "Zapoznaj się"")
  return 'pending';
});

When('doradca serwisowy zaznacza checkbox {string} w teczce naprawy', async (value) => {
  // TODO: implement this step (from feature step: "doradca serwisowy zaznacza checkbox "Oferta obsłużona" w teczce naprawy")
  return 'pending';
});

When('doradca serwisowy zapisuje teczkę naprawy', async () => {
  // TODO: implement this step (from feature step: "doradca serwisowy zapisuje teczkę naprawy")
  return 'pending';
});

Then('po odświeżeniu listy napraw kolumna {string} dla tej naprawy pokazuje wartość {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "po odświeżeniu listy napraw kolumna "Dosprzedaż" dla tej naprawy pokazuje wartość "Obsłużone"")
  return 'pending';
});

When('doradca serwisowy odznacza checkbox {string} w teczce naprawy', async (value) => {
  // TODO: implement this step (from feature step: "doradca serwisowy odznacza checkbox "Oferta obsłużona" w teczce naprawy")
  return 'pending';
});

When('doradca serwisowy otwiera teczkę tej naprawy', async () => {
  // TODO: implement this step (from feature step: "doradca serwisowy otwiera teczkę tej naprawy")
  return 'pending';
});

Then('doradca serwisowy nie może zaznaczyć nieaktywnego checkboxa {string}', async (value) => {
  // TODO: implement this step (from feature step: "doradca serwisowy nie może zaznaczyć nieaktywnego checkboxa "Oferta obsłużona"")
  return 'pending';
});

Then('komórka w kolumnie {string} dla tej naprawy pozostaje pusta', async (value) => {
  // TODO: implement this step (from feature step: "komórka w kolumnie "Dosprzedaż" dla tej naprawy pozostaje pusta")
  return 'pending';
});

When('Planer otrzymuje z VS pakiet decyzji klienta z dnia {string}', async (value) => {
  // TODO: implement this step (from feature step: "Planer otrzymuje z VS pakiet decyzji klienta z dnia "2026-07-10"")
  return 'pending';
});

When('pakiet zawiera zaakceptowane pozycje {string}', async (value) => {
  // TODO: implement this step (from feature step: "pakiet zawiera zaakceptowane pozycje "Wymiana opon na zimowe, Wymiana oleju"")
  return 'pending';
});

When('pakiet zawiera odrzucone pozycje {string}', async (value) => {
  // TODO: implement this step (from feature step: "pakiet zawiera odrzucone pozycje "Wymiana filtra powietrza, Kontrola układu hamulcowego"")
  return 'pending';
});

Given('w teczce naprawy pole {string} ma wartość {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "w teczce naprawy pole "Oferta dosprzedaży" ma wartość "— bez oferty —"")
  return 'pending';
});

When('doradca wybiera szablon oferty {string} w polu {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "doradca wybiera szablon oferty "Przegląd okresowy" w polu "Oferta dosprzedaży"")
  return 'pending';
});

Then('w Historii zmian pojawia się wpis dla pola {string}', async (value) => {
  // TODO: implement this step (from feature step: "w Historii zmian pojawia się wpis dla pola "Oferta dosprzedaży"")
  return 'pending';
});

Then('wpis zawiera wartość poprzednią {string} i wartość nową {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "wpis zawiera wartość poprzednią "— bez oferty —" i wartość nową "Przegląd okresowy"")
  return 'pending';
});

Then('wpis zawiera datę i godzinę zmiany oraz imię i nazwisko doradcy', async () => {
  // TODO: implement this step (from feature step: "wpis zawiera datę i godzinę zmiany oraz imię i nazwisko doradcy")
  return 'pending';
});

When('doradca zmienia wartość pola {string} na {string} w {string}', async (value1, value2, value3) => {
  // TODO: implement this step (from feature step: "doradca zmienia wartość pola "Oferta dosprzedaży" na "<wartosc_nowa>" w "<miejsce_zmiany>"")
  return 'pending';
});

Then('w Historii zmian pojawia się wpis z wartością poprzednią {string} i wartością nową {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "w Historii zmian pojawia się wpis z wartością poprzednią "<wartosc_poprzednia>" i wartością nową "<wartosc_nowa>"")
  return 'pending';
});

Given('pole {string} zmienia stan blokady w wyniku {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "pole "Oferta dosprzedaży" zmienia stan blokady w wyniku "<zdarzenie_systemowe>"")
  return 'pending';
});

When('system aktualizuje stan blokady pola', async () => {
  // TODO: implement this step (from feature step: "system aktualizuje stan blokady pola")
  return 'pending';
});

Then('w Historii zmian nie pojawia się nowy wpis dotyczący stanu blokady pola', async () => {
  // TODO: implement this step (from feature step: "w Historii zmian nie pojawia się nowy wpis dotyczący stanu blokady pola")
  return 'pending';
});

Given('doradca wysyła do klienta wiadomość typu {string} zawierającą ofertę dosprzedaży {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "doradca wysyła do klienta wiadomość typu "Wiadomość VS" zawierającą ofertę dosprzedaży "Przegląd okresowy"")
  return 'pending';
});

When('system wysyła wiadomość', async () => {
  // TODO: implement this step (from feature step: "system wysyła wiadomość")
  return 'pending';
});

Then('w Historii zmian pojawia się wpis z nazwą wysłanego szablonu oferty {string}', async (value) => {
  // TODO: implement this step (from feature step: "w Historii zmian pojawia się wpis z nazwą wysłanego szablonu oferty "Przegląd okresowy"")
  return 'pending';
});

Then('wpis zawiera datę i godzinę wysyłki oraz autora {string}', async (value) => {
  // TODO: implement this step (from feature step: "wpis zawiera datę i godzinę wysyłki oraz autora "Video Service"")
  return 'pending';
});

Given('doradca wysyła do klienta wiadomość typu {string} bez oferty dosprzedaży', async (value) => {
  // TODO: implement this step (from feature step: "doradca wysyła do klienta wiadomość typu "Wiadomość VS" bez oferty dosprzedaży")
  return 'pending';
});

Then('w Historii zmian pojawia się wpis z informacją o braku oferty w wysłanej wiadomości', async () => {
  // TODO: implement this step (from feature step: "w Historii zmian pojawia się wpis z informacją o braku oferty w wysłanej wiadomości")
  return 'pending';
});

Given('w teczce naprawy checkbox {string} ma wartość {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "w teczce naprawy checkbox "Oferta obsłużona" ma wartość "<wartosc_poprzednia>"")
  return 'pending';
});

When('doradca zmienia wartość checkboxa {string} na {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "doradca zmienia wartość checkboxa "Oferta obsłużona" na "<wartosc_nowa>"")
  return 'pending';
});

Given('w Historii zmian istnieją wpisy dotyczące innych pól teczki naprawy', async () => {
  // TODO: implement this step (from feature step: "w Historii zmian istnieją wpisy dotyczące innych pól teczki naprawy")
  return 'pending';
});

When('doradca dokonuje zmiany pola {string}', async (value) => {
  // TODO: implement this step (from feature step: "doradca dokonuje zmiany pola "Oferta obsłużona"")
  return 'pending';
});

Then('nowy wpis jest wyświetlany w tej samej sekcji i w tym samym formacie co istniejące wpisy Historii zmian', async () => {
  // TODO: implement this step (from feature step: "nowy wpis jest wyświetlany w tej samej sekcji i w tym samym formacie co istniejące wpisy Historii zmian")
  return 'pending';
});

Then('nie powstaje nowy widok ani osobna sekcja dla tego wpisu', async () => {
  // TODO: implement this step (from feature step: "nie powstaje nowy widok ani osobna sekcja dla tego wpisu")
  return 'pending';
});

Given('system automatycznie rejestruje zdarzenie {string} w Historii zmian', async (value) => {
  // TODO: implement this step (from feature step: "system automatycznie rejestruje zdarzenie "<zdarzenie>" w Historii zmian")
  return 'pending';
});

When('wpis zostaje zapisany', async () => {
  // TODO: implement this step (from feature step: "wpis zostaje zapisany")
  return 'pending';
});

Then('autorem wpisu jest {string}', async (value) => {
  // TODO: implement this step (from feature step: "autorem wpisu jest "Video Service"")
  return 'pending';
});

const assert = require('node:assert/strict');
const { Given, When, Then, world } = require('@cucumber/cucumber');

Given('użytkownik otwiera kreator nowej naprawy w kroku {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik otwiera kreator nowej naprawy w kroku "Informacje dodatkowe"")
  return 'pending';
});

When('doradca wyświetla pole {string}', async (value) => {
  // TODO: implement this step (from feature step: "doradca wyświetla pole "Oferta dosprzedaży"")
  return 'pending';
});

Then('pole {string} ma domyślnie zaznaczoną wartość {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "pole "Oferta dosprzedaży" ma domyślnie zaznaczoną wartość "Bez oferty"")
  return 'pending';
});

Then('lista pola {string} zawiera wyłącznie aktywne szablony ofert pobrane z VS', async (value) => {
  // TODO: implement this step (from feature step: "lista pola "Oferta dosprzedaży" zawiera wyłącznie aktywne szablony ofert pobrane z VS")
  return 'pending';
});

Given('w konfiguracji VS istnieje szablon oferty dosprzedaży {string} w statusie {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "w konfiguracji VS istnieje szablon oferty dosprzedaży "Przegląd okresowy" w statusie "<status>"")
  return 'pending';
});

When('użytkownik otwiera pole wyboru {string} w kreatorze naprawy', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik otwiera pole wyboru "Oferta dosprzedaży" w kreatorze naprawy")
  return 'pending';
});

Then('doradca {string} szablon {string} na liście', async (value1, value2) => {
  // TODO: implement this step (from feature step: "doradca "<widocznosc>" szablon "Przegląd okresowy" na liście")
  return 'pending';
});

Given('doradca wypełnia dane naprawy w kreatorze nowej naprawy', async () => {
  // TODO: implement this step (from feature step: "doradca wypełnia dane naprawy w kreatorze nowej naprawy")
  return 'pending';
});

Given('doradca pozostawia pole {string} z wartością {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "doradca pozostawia pole "Oferta dosprzedaży" z wartością "Bez oferty"")
  return 'pending';
});

When('doradca zapisuje naprawę', async () => {
  // TODO: implement this step (from feature step: "doradca zapisuje naprawę")
  return 'pending';
});

Then('naprawa zostaje zapisana bez przypisanej oferty dosprzedaży', async () => {
  // TODO: implement this step (from feature step: "naprawa zostaje zapisana bez przypisanej oferty dosprzedaży")
  return 'pending';
});

Given('istnieje zapisana naprawa bez przypisanej oferty dosprzedaży', async () => {
  // TODO: implement this step (from feature step: "istnieje zapisana naprawa bez przypisanej oferty dosprzedaży")
  return 'pending';
});

When('użytkownik otwiera formularz edycji tej naprawy', async () => {
  // TODO: implement this step (from feature step: "użytkownik otwiera formularz edycji tej naprawy")
  return 'pending';
});

When('doradca wybiera szablon oferty dosprzedaży {string}', async (value) => {
  // TODO: implement this step (from feature step: "doradca wybiera szablon oferty dosprzedaży "Przegląd okresowy"")
  return 'pending';
});

When('użytkownik zapisuje zmiany', async () => {
  // TODO: implement this step (from feature step: "użytkownik zapisuje zmiany")
  return 'pending';
});

Then('naprawa ma przypisany szablon oferty dosprzedaży {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa ma przypisany szablon oferty dosprzedaży "Przegląd okresowy"")
  return 'pending';
});

Given('doradca wybrał szablon oferty dosprzedaży {string} dla naprawy', async (value) => {
  // TODO: implement this step (from feature step: "doradca wybrał szablon oferty dosprzedaży "Przegląd okresowy" dla naprawy")
  return 'pending';
});

When('doradca otwiera szczegóły naprawy', async () => {
  // TODO: implement this step (from feature step: "doradca otwiera szczegóły naprawy")
  return 'pending';
});

Then('doradca nie widzi możliwości edycji pozycji ani cen szablonu oferty dosprzedaży', async () => {
  // TODO: implement this step (from feature step: "doradca nie widzi możliwości edycji pozycji ani cen szablonu oferty dosprzedaży")
  return 'pending';
});

Then('pozycje i ceny szablonu oferty dosprzedaży pochodzą wyłącznie z konfiguracji VS', async () => {
  // TODO: implement this step (from feature step: "pozycje i ceny szablonu oferty dosprzedaży pochodzą wyłącznie z konfiguracji VS")
  return 'pending';
});

Given('system wysłał już wiadomość potwierdzenia wizyty dla naprawy', async () => {
  // TODO: implement this step (from feature step: "system wysłał już wiadomość potwierdzenia wizyty dla naprawy")
  return 'pending';
});

Then('pole {string} jest zablokowane do edycji', async (value) => {
  // TODO: implement this step (from feature step: "pole "Oferta dosprzedaży" jest zablokowane do edycji")
  return 'pending';
});

Given('pole {string} jest zablokowane po wcześniejszej wysyłce wiadomości', async (value) => {
  // TODO: implement this step (from feature step: "pole "Oferta dosprzedaży" jest zablokowane po wcześniejszej wysyłce wiadomości")
  return 'pending';
});

When('doradca przeplanowuje naprawę na nowy termin', async () => {
  // TODO: implement this step (from feature step: "doradca przeplanowuje naprawę na nowy termin")
  return 'pending';
});

Then('pole {string} staje się ponownie aktywne do momentu kolejnej wysyłki', async (value) => {
  // TODO: implement this step (from feature step: "pole "Oferta dosprzedaży" staje się ponownie aktywne do momentu kolejnej wysyłki")
  return 'pending';
});

Given('naprawa ma uzupełniony numer rejestracyjny i numer telefonu klienta', async () => {
  // TODO: implement this step (from feature step: "naprawa ma uzupełniony numer rejestracyjny i numer telefonu klienta")
  return 'pending';
});

Given('BOK przypisany do naprawy ma aktywny szablon wiadomości Planera dla zdarzenia {string}', async (value) => {
  // TODO: implement this step (from feature step: "BOK przypisany do naprawy ma aktywny szablon wiadomości Planera dla zdarzenia "Potwierdzenie wizyty"")
  return 'pending';
});

Given('BOK ma skonfigurowane opóźnienie wysyłki na {int} godziny', async (value) => {
  // TODO: implement this step (from feature step: "BOK ma skonfigurowane opóźnienie wysyłki na 2 godziny")
  return 'pending';
});

When('naprawa zostaje zapisana z planowaną datą przyjęcia', async () => {
  // TODO: implement this step (from feature step: "naprawa zostaje zapisana z planowaną datą przyjęcia")
  return 'pending';
});

Then('system dodaje zdarzenie {string} do kolejki wysyłkowej', async (value) => {
  // TODO: implement this step (from feature step: "system dodaje zdarzenie "Potwierdzenie wizyty" do kolejki wysyłkowej")
  return 'pending';
});

Then('zdarzenie jest zaplanowane na {int} godziny po planowanej dacie przyjęcia', async (value) => {
  // TODO: implement this step (from feature step: "zdarzenie jest zaplanowane na 2 godziny po planowanej dacie przyjęcia")
  return 'pending';
});

Given('naprawa ma dane naprawy w stanie {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa ma dane naprawy w stanie "<dane_naprawy>"")
  return 'pending';
});

Given('BOK przypisany do naprawy ma konfigurację w stanie {string}', async (value) => {
  // TODO: implement this step (from feature step: "BOK przypisany do naprawy ma konfigurację w stanie "<konfiguracja_bok>"")
  return 'pending';
});

Then('system nie dodaje zdarzenia {string} do kolejki wysyłkowej', async (value) => {
  // TODO: implement this step (from feature step: "system nie dodaje zdarzenia "Potwierdzenie wizyty" do kolejki wysyłkowej")
  return 'pending';
});

Then('system nie wyświetla żadnego komunikatu błędu', async () => {
  // TODO: implement this step (from feature step: "system nie wyświetla żadnego komunikatu błędu")
  return 'pending';
});

Given('BOK przypisany do naprawy ma skonfigurowane opóźnienie wysyłki na {int} godziny', async (value) => {
  // TODO: implement this step (from feature step: "BOK przypisany do naprawy ma skonfigurowane opóźnienie wysyłki na 3 godziny")
  return 'pending';
});

Given('naprawa ma planowaną datę przyjęcia {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa ma planowaną datę przyjęcia "15.08.2026 10:00"")
  return 'pending';
});

When('naprawa zostaje zakolejkowana do wysyłki', async () => {
  // TODO: implement this step (from feature step: "naprawa zostaje zakolejkowana do wysyłki")
  return 'pending';
});

Then('zdarzenie {string} jest zaplanowane na {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "zdarzenie "Potwierdzenie wizyty" jest zaplanowane na "15.08.2026 13:00"")
  return 'pending';
});

Given('naprawa ma zaplanowane w kolejce zdarzenie {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa ma zaplanowane w kolejce zdarzenie "Potwierdzenie wizyty"")
  return 'pending';
});

Given('wiadomość potwierdzenia wizyty nie została jeszcze wysłana', async () => {
  // TODO: implement this step (from feature step: "wiadomość potwierdzenia wizyty nie została jeszcze wysłana")
  return 'pending';
});

When('doradca anuluje naprawę', async () => {
  // TODO: implement this step (from feature step: "doradca anuluje naprawę")
  return 'pending';
});

Then('system usuwa zaplanowane zdarzenie {string} z kolejki wysyłkowej', async (value) => {
  // TODO: implement this step (from feature step: "system usuwa zaplanowane zdarzenie "Potwierdzenie wizyty" z kolejki wysyłkowej")
  return 'pending';
});

Given('naprawa ma zaplanowane w kolejce zdarzenie {string} na podstawie dotychczasowej daty przyjęcia', async (value) => {
  // TODO: implement this step (from feature step: "naprawa ma zaplanowane w kolejce zdarzenie "Potwierdzenie wizyty" na podstawie dotychczasowej daty przyjęcia")
  return 'pending';
});

When('doradca zmienia planowaną datę przyjęcia naprawy', async () => {
  // TODO: implement this step (from feature step: "doradca zmienia planowaną datę przyjęcia naprawy")
  return 'pending';
});

Then('system aktualizuje termin zaplanowanego zdarzenia {string} zgodnie z nową datą przyjęcia', async (value) => {
  // TODO: implement this step (from feature step: "system aktualizuje termin zaplanowanego zdarzenia "Potwierdzenie wizyty" zgodnie z nową datą przyjęcia")
  return 'pending';
});

When('doradca zmienia numer telefonu klienta lub wybraną ofertę dosprzedaży na naprawie', async () => {
  // TODO: implement this step (from feature step: "doradca zmienia numer telefonu klienta lub wybraną ofertę dosprzedaży na naprawie")
  return 'pending';
});

Then('system pozostawia zaplanowany termin zdarzenia {string} bez zmian', async (value) => {
  // TODO: implement this step (from feature step: "system pozostawia zaplanowany termin zdarzenia "Potwierdzenie wizyty" bez zmian")
  return 'pending';
});

Then('system pobiera aktualne dane naprawy dopiero w momencie realizacji zdarzenia', async () => {
  // TODO: implement this step (from feature step: "system pobiera aktualne dane naprawy dopiero w momencie realizacji zdarzenia")
  return 'pending';
});

When('doradca usuwa zadanie przyjęcia tej naprawy z kalendarza', async () => {
  // TODO: implement this step (from feature step: "doradca usuwa zadanie przyjęcia tej naprawy z kalendarza")
  return 'pending';
});

Given('zdarzenie {string} zostało wyzwolone dla naprawy z wewnętrznym numerem naprawy z Planera {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "zdarzenie "Potwierdzenie wizyty" zostało wyzwolone dla naprawy z wewnętrznym numerem naprawy z Planera "PL-1001"")
  return 'pending';
});

When('system przesyła dane naprawy do VS', async () => {
  // TODO: implement this step (from feature step: "system przesyła dane naprawy do VS")
  return 'pending';
});

Then('VS zakłada nową naprawę i zwraca numer naprawy VS', async () => {
  // TODO: implement this step (from feature step: "VS zakłada nową naprawę i zwraca numer naprawy VS")
  return 'pending';
});

Then('Planer zapisuje zwrócony numer naprawy VS jako powiązanie z naprawą {string}', async (value) => {
  // TODO: implement this step (from feature step: "Planer zapisuje zwrócony numer naprawy VS jako powiązanie z naprawą "PL-1001"")
  return 'pending';
});

Given('naprawa ma uzupełniony numer rejestracyjny {string} i numer telefonu klienta {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "naprawa ma uzupełniony numer rejestracyjny "WU12345" i numer telefonu klienta "600100200"")
  return 'pending';
});

Then('system przekazuje do VS numer rejestracyjny {string} w sekcji Pojazd', async (value) => {
  // TODO: implement this step (from feature step: "system przekazuje do VS numer rejestracyjny "WU12345" w sekcji Pojazd")
  return 'pending';
});

Then('system przekazuje do VS numer telefonu {string} w sekcji Kontakt', async (value) => {
  // TODO: implement this step (from feature step: "system przekazuje do VS numer telefonu "600100200" w sekcji Kontakt")
  return 'pending';
});

Given('naprawa ma uzupełnione wyłącznie wymagane pola numer rejestracyjny i numer telefonu klienta', async () => {
  // TODO: implement this step (from feature step: "naprawa ma uzupełnione wyłącznie wymagane pola numer rejestracyjny i numer telefonu klienta")
  return 'pending';
});

Then('VS otrzymuje dane naprawy bez wypełnionych pól opcjonalnych', async () => {
  // TODO: implement this step (from feature step: "VS otrzymuje dane naprawy bez wypełnionych pól opcjonalnych")
  return 'pending';
});

Then('przesłanie danych do VS nie zostaje zablokowane', async () => {
  // TODO: implement this step (from feature step: "przesłanie danych do VS nie zostaje zablokowane")
  return 'pending';
});

Given('naprawa ma zleceniodawcę w trybie {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa ma zleceniodawcę w trybie "<tryb>"")
  return 'pending';
});

Then('system przekazuje do VS w sekcji Zleceniodawca dane {string}', async (value) => {
  // TODO: implement this step (from feature step: "system przekazuje do VS w sekcji Zleceniodawca dane "<oczekiwane_dane>"")
  return 'pending';
});

Then('VS otrzymuje w sekcji Kontakt imię i nazwisko zleceniodawcy', async () => {
  // TODO: implement this step (from feature step: "VS otrzymuje w sekcji Kontakt imię i nazwisko zleceniodawcy")
  return 'pending';
});

Given('naprawa ma przypisany szablon oferty dosprzedaży w momencie wysyłki wiadomości', async () => {
  // TODO: implement this step (from feature step: "naprawa ma przypisany szablon oferty dosprzedaży w momencie wysyłki wiadomości")
  return 'pending';
});

When('VS generuje wiadomość na podstawie szablonu wiadomości Planera', async () => {
  // TODO: implement this step (from feature step: "VS generuje wiadomość na podstawie szablonu wiadomości Planera")
  return 'pending';
});

Then('wygenerowana wiadomość zawiera zakładkę z pytaniami potwierdzenia', async () => {
  // TODO: implement this step (from feature step: "wygenerowana wiadomość zawiera zakładkę z pytaniami potwierdzenia")
  return 'pending';
});

Then('wygenerowana wiadomość zawiera zakładkę z ofertą dosprzedaży', async () => {
  // TODO: implement this step (from feature step: "wygenerowana wiadomość zawiera zakładkę z ofertą dosprzedaży")
  return 'pending';
});

Given('naprawa ma wartość {string} w polu Oferta dosprzedaży w momencie wysyłki wiadomości', async (value) => {
  // TODO: implement this step (from feature step: "naprawa ma wartość "Bez oferty" w polu Oferta dosprzedaży w momencie wysyłki wiadomości")
  return 'pending';
});

Then('wygenerowana wiadomość zawiera wyłącznie zakładkę z pytaniami potwierdzenia', async () => {
  // TODO: implement this step (from feature step: "wygenerowana wiadomość zawiera wyłącznie zakładkę z pytaniami potwierdzenia")
  return 'pending';
});

Then('wygenerowana wiadomość nie zawiera zakładki z ofertą dosprzedaży', async () => {
  // TODO: implement this step (from feature step: "wygenerowana wiadomość nie zawiera zakładki z ofertą dosprzedaży")
  return 'pending';
});

Given('szablon wiadomości Planera zawiera tagi {string} i {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "szablon wiadomości Planera zawiera tagi "##DzienWizyty##" i "##GodzinaWizyty##"")
  return 'pending';
});

Given('naprawa w VS ma zaplanowaną wizytę na dzień {string} o godzinie {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "naprawa w VS ma zaplanowaną wizytę na dzień "20.08.2026" o godzinie "09:30"")
  return 'pending';
});

Then('wygenerowana wiadomość zawiera dzień wizyty {string}', async (value) => {
  // TODO: implement this step (from feature step: "wygenerowana wiadomość zawiera dzień wizyty "20.08.2026"")
  return 'pending';
});

Then('wygenerowana wiadomość zawiera godzinę wizyty {string}', async (value) => {
  // TODO: implement this step (from feature step: "wygenerowana wiadomość zawiera godzinę wizyty "09:30"")
  return 'pending';
});

Given('VS wygenerował wiadomość potwierdzenia wizyty dla naprawy', async () => {
  // TODO: implement this step (from feature step: "VS wygenerował wiadomość potwierdzenia wizyty dla naprawy")
  return 'pending';
});

When('VS wysyła wiadomość do klienta', async () => {
  // TODO: implement this step (from feature step: "VS wysyła wiadomość do klienta")
  return 'pending';
});

Then('klient otrzymuje wiadomość SMS z linkiem do widoku wiadomości', async () => {
  // TODO: implement this step (from feature step: "klient otrzymuje wiadomość SMS z linkiem do widoku wiadomości")
  return 'pending';
});

Given('wiadomość potwierdzenia wizyty została automatycznie utworzona z Planera', async () => {
  // TODO: implement this step (from feature step: "wiadomość potwierdzenia wizyty została automatycznie utworzona z Planera")
  return 'pending';
});

When('VS przetwarza kolejkę wiadomości do wysyłki', async () => {
  // TODO: implement this step (from feature step: "VS przetwarza kolejkę wiadomości do wysyłki")
  return 'pending';
});

Then('wiadomość z Planera jest obsługiwana tymi samymi mechanizmami wysyłkowymi co pozostałe wiadomości VS', async () => {
  // TODO: implement this step (from feature step: "wiadomość z Planera jest obsługiwana tymi samymi mechanizmami wysyłkowymi co pozostałe wiadomości VS")
  return 'pending';
});

Given('zdarzenie {string} zostało wyzwolone dla naprawy', async (value) => {
  // TODO: implement this step (from feature step: "zdarzenie "Potwierdzenie wizyty" zostało wyzwolone dla naprawy")
  return 'pending';
});

Given('VS jest w danym momencie niedostępny', async () => {
  // TODO: implement this step (from feature step: "VS jest w danym momencie niedostępny")
  return 'pending';
});

Then('Planer nie zapisuje powiązania z numerem naprawy VS', async () => {
  // TODO: implement this step (from feature step: "Planer nie zapisuje powiązania z numerem naprawy VS")
  return 'pending';
});

Then('system nie wysyła wiadomości potwierdzenia wizyty do klienta', async () => {
  // TODO: implement this step (from feature step: "system nie wysyła wiadomości potwierdzenia wizyty do klienta")
  return 'pending';
});

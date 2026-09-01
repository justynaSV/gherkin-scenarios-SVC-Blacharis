const assert = require('node:assert/strict');
const { Given, When, Then, world } = require('@cucumber/cucumber');

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

Given('naprawa utworzona w kreatorze ma uzupełniony numer rejestracyjny i numer telefonu klienta', async () => {
  // TODO: implement this step (from feature step: "naprawa utworzona w kreatorze ma uzupełniony numer rejestracyjny i numer telefonu klienta")
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

Given('naprawa założona w kreatorze ma dane naprawy w stanie {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa założona w kreatorze ma dane naprawy w stanie "<dane_naprawy>"")
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

Given('naprawa utworzona w kreatorze ma przypisany szablon oferty dosprzedaży w momencie wysyłki wiadomości', async () => {
  // TODO: implement this step (from feature step: "naprawa utworzona w kreatorze ma przypisany szablon oferty dosprzedaży w momencie wysyłki wiadomości")
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

Given('naprawa utworzona w kreatorze ma wartość {string} w polu Oferta dosprzedaży w momencie wysyłki wiadomości', async (value) => {
  // TODO: implement this step (from feature step: "naprawa utworzona w kreatorze ma wartość "Bez oferty" w polu Oferta dosprzedaży w momencie wysyłki wiadomości")
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

Given('naprawa założona w formularzu {string} ma uzupełniony numer rejestracyjny i numer telefonu klienta', async (value) => {
  // TODO: implement this step (from feature step: "naprawa założona w formularzu "Nowa naprawa" ma uzupełniony numer rejestracyjny i numer telefonu klienta")
  return 'pending';
});

Given('doradca wybrał szablon oferty dosprzedaży {string} w formularzu {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "doradca wybrał szablon oferty dosprzedaży "Przegląd okresowy" w formularzu "Nowa naprawa"")
  return 'pending';
});

When('następuje wyzwolenie zaplanowanego zdarzenia', async () => {
  // TODO: implement this step (from feature step: "następuje wyzwolenie zaplanowanego zdarzenia")
  return 'pending';
});

Then('VS generuje wiadomość zawierającą zakładkę z pytaniami potwierdzenia i zakładkę z ofertą dosprzedaży', async () => {
  // TODO: implement this step (from feature step: "VS generuje wiadomość zawierającą zakładkę z pytaniami potwierdzenia i zakładkę z ofertą dosprzedaży")
  return 'pending';
});

Given('doradca pozostawił pole {string} z wartością {string} w formularzu {string}', async (value1, value2, value3) => {
  // TODO: implement this step (from feature step: "doradca pozostawił pole "Oferta dosprzedaży" z wartością "Bez oferty" w formularzu "Nowa naprawa"")
  return 'pending';
});

Then('VS generuje wiadomość zawierającą wyłącznie zakładkę z pytaniami potwierdzenia', async () => {
  // TODO: implement this step (from feature step: "VS generuje wiadomość zawierającą wyłącznie zakładkę z pytaniami potwierdzenia")
  return 'pending';
});

Given('naprawa została założona w formularzu {string} z wewnętrznym numerem naprawy z Planera {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "naprawa została założona w formularzu "Nowa naprawa" z wewnętrznym numerem naprawy z Planera "PL-2002"")
  return 'pending';
});

Given('zdarzenie {string} zostało wyzwolone dla tej naprawy', async (value) => {
  // TODO: implement this step (from feature step: "zdarzenie "Potwierdzenie wizyty" zostało wyzwolone dla tej naprawy")
  return 'pending';
});

Given('zdarzenie {string} zostało wyzwolone dla naprawy założonej w formularzu {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "zdarzenie "Potwierdzenie wizyty" zostało wyzwolone dla naprawy założonej w formularzu "Nowa naprawa"")
  return 'pending';
});

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

Given('uprawniony użytkownik chce wygenerować zestawienie {string}', async (value) => {
  // TODO: implement this step (from feature step: "uprawniony użytkownik chce wygenerować zestawienie "<zestawienie>"")
  return 'pending';
});

When('wywołuje zestawienie bez podania parametru {string}', async (value) => {
  // TODO: implement this step (from feature step: "wywołuje zestawienie bez podania parametru "<brakujacy_parametr>"")
  return 'pending';
});

Then('system zwraca błąd walidacji zakresu dat', async () => {
  // TODO: implement this step (from feature step: "system zwraca błąd walidacji zakresu dat")
  return 'pending';
});

Then('system nie zwraca żadnych danych zestawienia', async () => {
  // TODO: implement this step (from feature step: "system nie zwraca żadnych danych zestawienia")
  return 'pending';
});

Given('uprawniony użytkownik definiuje zakres dat, w którym Data_od jest późniejsza niż Data_do', async () => {
  // TODO: implement this step (from feature step: "uprawniony użytkownik definiuje zakres dat, w którym Data_od jest późniejsza niż Data_do")
  return 'pending';
});

When('wywołuje dowolne zestawienie statystyk funkcji Potwierdzenie wizyty', async () => {
  // TODO: implement this step (from feature step: "wywołuje dowolne zestawienie statystyk funkcji Potwierdzenie wizyty")
  return 'pending';
});

Given('uprawniony użytkownik definiuje poprawny zakres dat Data_od i Data_do', async () => {
  // TODO: implement this step (from feature step: "uprawniony użytkownik definiuje poprawny zakres dat Data_od i Data_do")
  return 'pending';
});

Then('system zwraca zestawienie danych spełniające kryteria filtrowania', async () => {
  // TODO: implement this step (from feature step: "system zwraca zestawienie danych spełniające kryteria filtrowania")
  return 'pending';
});

Given('podaje dodatkowy filtr BOK_ID o wartości {string}', async (value) => {
  // TODO: implement this step (from feature step: "podaje dodatkowy filtr BOK_ID o wartości "BOK-001"")
  return 'pending';
});

When('wywołuje zestawienie {string}', async (value) => {
  // TODO: implement this step (from feature step: "wywołuje zestawienie "<zestawienie>"")
  return 'pending';
});

Then('system zwraca dane ograniczone wyłącznie do BOK o identyfikatorze {string}', async (value) => {
  // TODO: implement this step (from feature step: "system zwraca dane ograniczone wyłącznie do BOK o identyfikatorze "BOK-001"")
  return 'pending';
});

Given('podaje dodatkowy filtr BOK_ID o wartości nieistniejącego BOK {string}', async (value) => {
  // TODO: implement this step (from feature step: "podaje dodatkowy filtr BOK_ID o wartości nieistniejącego BOK "BOK-999"")
  return 'pending';
});

Then('system zwraca zestawienie z zerowymi wartościami zamiast błędu', async () => {
  // TODO: implement this step (from feature step: "system zwraca zestawienie z zerowymi wartościami zamiast błędu")
  return 'pending';
});

Given('w zadanym zakresie dat zarejestrowano {int} napraw z wysłanym SMS-em potwierdzającym', async (value) => {
  // TODO: implement this step (from feature step: "w zadanym zakresie dat zarejestrowano 100 napraw z wysłanym SMS-em potwierdzającym")
  return 'pending';
});

Given('{int} z tych napraw zawierało ofertę dosprzedaży w SMS-ie', async (value) => {
  // TODO: implement this step (from feature step: "40 z tych napraw zawierało ofertę dosprzedaży w SMS-ie")
  return 'pending';
});

When('wywołuje zestawienie adopcji oferty', async () => {
  // TODO: implement this step (from feature step: "wywołuje zestawienie adopcji oferty")
  return 'pending';
});

Then('system zwraca liczbę napraw z ofertą równą {int}', async (value) => {
  // TODO: implement this step (from feature step: "system zwraca liczbę napraw z ofertą równą 40")
  return 'pending';
});

Then('system zwraca odsetek napraw z ofertą równy {int}%', async (value) => {
  // TODO: implement this step (from feature step: "system zwraca odsetek napraw z ofertą równy 40%")
  return 'pending';
});

Given('żadna z tych napraw nie zawierała oferty dosprzedaży w SMS-ie', async () => {
  // TODO: implement this step (from feature step: "żadna z tych napraw nie zawierała oferty dosprzedaży w SMS-ie")
  return 'pending';
});

Given('klienci otworzyli link z SMS-a w różnych odstępach czasu od jego wysłania', async () => {
  // TODO: implement this step (from feature step: "klienci otworzyli link z SMS-a w różnych odstępach czasu od jego wysłania")
  return 'pending';
});

When('wywołuje zestawienie reakcji klientów na SMS', async () => {
  // TODO: implement this step (from feature step: "wywołuje zestawienie reakcji klientów na SMS")
  return 'pending';
});

Then('system zwraca medianę czasu reakcji liczoną od wysłania SMS-a do otwarcia linku', async () => {
  // TODO: implement this step (from feature step: "system zwraca medianę czasu reakcji liczoną od wysłania SMS-a do otwarcia linku")
  return 'pending';
});

Given('część klientów nie zarejestrowała żadnego zdarzenia otwarcia linku z SMS-a', async () => {
  // TODO: implement this step (from feature step: "część klientów nie zarejestrowała żadnego zdarzenia otwarcia linku z SMS-a")
  return 'pending';
});

Then('system klasyfikuje tych klientów w grupie brak kliknięcia w link', async () => {
  // TODO: implement this step (from feature step: "system klasyfikuje tych klientów w grupie brak kliknięcia w link")
  return 'pending';
});

Given('część klientów otworzyła formularz potwierdzenia wizyty, ale nie zatwierdziła go', async () => {
  // TODO: implement this step (from feature step: "część klientów otworzyła formularz potwierdzenia wizyty, ale nie zatwierdziła go")
  return 'pending';
});

Then('system klasyfikuje tych klientów w grupie formularz otwarty bez zatwierdzenia', async () => {
  // TODO: implement this step (from feature step: "system klasyfikuje tych klientów w grupie formularz otwarty bez zatwierdzenia")
  return 'pending';
});

Given('klienci w danym BOK udzielili odpowiedzi {string} na pytanie o termin wizyty', async (value) => {
  // TODO: implement this step (from feature step: "klienci w danym BOK udzielili odpowiedzi "<odpowiedz>" na pytanie o termin wizyty")
  return 'pending';
});

When('wywołuje zestawienie odpowiedzi na pytania', async () => {
  // TODO: implement this step (from feature step: "wywołuje zestawienie odpowiedzi na pytania")
  return 'pending';
});

Then('system zwraca liczbę i procent odpowiedzi {string} w rozbiciu na BOK', async (value) => {
  // TODO: implement this step (from feature step: "system zwraca liczbę i procent odpowiedzi "<odpowiedz>" w rozbiciu na BOK")
  return 'pending';
});

Given('klienci w danym BOK udzielili odpowiedzi {string} na pytanie o oczekiwanie na miejscu', async (value) => {
  // TODO: implement this step (from feature step: "klienci w danym BOK udzielili odpowiedzi "<odpowiedz>" na pytanie o oczekiwanie na miejscu")
  return 'pending';
});

Given('wysłano SMS z ofertą dosprzedaży dla zadanej liczby napraw w zakresie dat', async () => {
  // TODO: implement this step (from feature step: "wysłano SMS z ofertą dosprzedaży dla zadanej liczby napraw w zakresie dat")
  return 'pending';
});

Given('klient zaakceptował co najmniej jedną pozycję oferty w części z tych napraw', async () => {
  // TODO: implement this step (from feature step: "klient zaakceptował co najmniej jedną pozycję oferty w części z tych napraw")
  return 'pending';
});

When('wywołuje zestawienie skuteczności ofert dosprzedażowych', async () => {
  // TODO: implement this step (from feature step: "wywołuje zestawienie skuteczności ofert dosprzedażowych")
  return 'pending';
});

Then('system zwraca odsetek napraw zakończonych akceptacją co najmniej jednej pozycji', async () => {
  // TODO: implement this step (from feature step: "system zwraca odsetek napraw zakończonych akceptacją co najmniej jednej pozycji")
  return 'pending';
});

Given('pozycje z różnych szablonów ofert otrzymały różną liczbę odpowiedzi i akceptacji', async () => {
  // TODO: implement this step (from feature step: "pozycje z różnych szablonów ofert otrzymały różną liczbę odpowiedzi i akceptacji")
  return 'pending';
});

Then('system zwraca ranking pozycji z liczbą odpowiedzi, akceptacji i współczynnikiem akceptacji', async () => {
  // TODO: implement this step (from feature step: "system zwraca ranking pozycji z liczbą odpowiedzi, akceptacji i współczynnikiem akceptacji")
  return 'pending';
});

Given('szablony ofert różnią się odsetkiem napraw zakończonych akceptacją co najmniej jednej pozycji', async () => {
  // TODO: implement this step (from feature step: "szablony ofert różnią się odsetkiem napraw zakończonych akceptacją co najmniej jednej pozycji")
  return 'pending';
});

Then('system zwraca ranking szablonów uporządkowany malejąco według tego odsetka', async () => {
  // TODO: implement this step (from feature step: "system zwraca ranking szablonów uporządkowany malejąco według tego odsetka")
  return 'pending';
});

Given('w zadanym zakresie dat nie zarejestrowano żadnych zdarzeń funkcji Potwierdzenie wizyty', async () => {
  // TODO: implement this step (from feature step: "w zadanym zakresie dat nie zarejestrowano żadnych zdarzeń funkcji Potwierdzenie wizyty")
  return 'pending';
});

const assert = require('node:assert/strict');
const { Given, When, Then, world } = require('@cucumber/cucumber');

Given('klient otrzymał wiadomość SMS z unikalnym linkiem do widoku wiadomości', async () => {
  // TODO: implement this step (from feature step: "klient otrzymał wiadomość SMS z unikalnym linkiem do widoku wiadomości")
  return 'pending';
});

When('klient otwiera unikalny link z wiadomości SMS', async () => {
  // TODO: implement this step (from feature step: "klient otwiera unikalny link z wiadomości SMS")
  return 'pending';
});

Then('użytkownik widzi sekcję z danymi Klienta i Pojazdu na górze widoku', async () => {
  // TODO: implement this step (from feature step: "użytkownik widzi sekcję z danymi Klienta i Pojazdu na górze widoku")
  return 'pending';
});

Then('użytkownik widzi logotyp serwisu w widoku', async () => {
  // TODO: implement this step (from feature step: "użytkownik widzi logotyp serwisu w widoku")
  return 'pending';
});

Then('użytkownik widzi stopkę zgodną z szablonem na dole widoku', async () => {
  // TODO: implement this step (from feature step: "użytkownik widzi stopkę zgodną z szablonem na dole widoku")
  return 'pending';
});

Given('wiadomość Planera {string}', async (value) => {
  // TODO: implement this step (from feature step: "wiadomość Planera "<zawartosc>"")
  return 'pending';
});

Then('użytkownik widzi w nagłówku tekst {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik widzi w nagłówku tekst "<tekst_naglowka>"")
  return 'pending';
});

Given('wiadomość Planera zawiera wyłącznie pytania', async () => {
  // TODO: implement this step (from feature step: "wiadomość Planera zawiera wyłącznie pytania")
  return 'pending';
});

Given('użytkownik ma ustawiony język interfejsu {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik ma ustawiony język interfejsu "<jezyk>"")
  return 'pending';
});

Then('zakładka {string} jest widoczna i domyślnie aktywna', async (value) => {
  // TODO: implement this step (from feature step: "zakładka "Pytania" jest widoczna i domyślnie aktywna")
  return 'pending';
});

Then('użytkownik {string} zakładkę {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "użytkownik "<widocznosc_oferty>" zakładkę "Oferta"")
  return 'pending';
});

Given('klient otworzył widok wiadomości dla wizyty w dniu {string} o godzinie {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "klient otworzył widok wiadomości dla wizyty w dniu "12.08.2026" o godzinie "10:00"")
  return 'pending';
});

When('klient przechodzi do zakładki {string}', async (value) => {
  // TODO: implement this step (from feature step: "klient przechodzi do zakładki "Pytania"")
  return 'pending';
});

Then('użytkownik widzi pytanie {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik widzi pytanie "Czy potwierdzasz wizytę w dniu 12.08.2026 o godzinie 10:00?"")
  return 'pending';
});

Then('użytkownik widzi przyciski odpowiedzi {string}, {string} oraz {string}', async (value1, value2, value3) => {
  // TODO: implement this step (from feature step: "użytkownik widzi przyciski odpowiedzi "Potwierdzam", "Chcę zmienić termin" oraz "Rezygnuję z naprawy"")
  return 'pending';
});

Then('użytkownik widzi przyciski odpowiedzi {string} oraz {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "użytkownik widzi przyciski odpowiedzi "Tak" oraz "Nie"")
  return 'pending';
});

Given('wiadomość Planera zawiera pytania oraz ofertę dosprzedaży', async () => {
  // TODO: implement this step (from feature step: "wiadomość Planera zawiera pytania oraz ofertę dosprzedaży")
  return 'pending';
});

Then('użytkownik nie widzi pozycji ankiety dosprzedaży w zakładce {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik nie widzi pozycji ankiety dosprzedaży w zakładce "Pytania"")
  return 'pending';
});

Then('użytkownik nie widzi tytułów ani skrótów ankiety dosprzedaży w zakładce {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik nie widzi tytułów ani skrótów ankiety dosprzedaży w zakładce "Pytania"")
  return 'pending';
});

Given('klient otworzył widok wiadomości i zakładkę {string}', async (value) => {
  // TODO: implement this step (from feature step: "klient otworzył widok wiadomości i zakładkę "Pytania"")
  return 'pending';
});

When('klient wybiera odpowiedź {string} na pytanie o potwierdzenie wizyty', async (value) => {
  // TODO: implement this step (from feature step: "klient wybiera odpowiedź "<odpowiedz>" na pytanie o potwierdzenie wizyty")
  return 'pending';
});

Then('system zapisuje decyzję klienta jako {string} dla pytania o potwierdzenie wizyty', async (value) => {
  // TODO: implement this step (from feature step: "system zapisuje decyzję klienta jako "<odpowiedz>" dla pytania o potwierdzenie wizyty")
  return 'pending';
});

When('klient wybiera odpowiedź {string} na pytanie o oczekiwanie na naprawę', async (value) => {
  // TODO: implement this step (from feature step: "klient wybiera odpowiedź "<odpowiedz>" na pytanie o oczekiwanie na naprawę")
  return 'pending';
});

Then('system zapisuje decyzję klienta jako {string} dla pytania o oczekiwanie na naprawę', async (value) => {
  // TODO: implement this step (from feature step: "system zapisuje decyzję klienta jako "<odpowiedz>" dla pytania o oczekiwanie na naprawę")
  return 'pending';
});

Given('wiadomość Planera zawiera pozycję oferty dosprzedaży {string} w cenie {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "wiadomość Planera zawiera pozycję oferty dosprzedaży "Wymiana klocków hamulcowych" w cenie "350 zł"")
  return 'pending';
});

Then('użytkownik widzi opis pozycji {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik widzi opis pozycji "Wymiana klocków hamulcowych"")
  return 'pending';
});

Then('użytkownik widzi cenę pozycji {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik widzi cenę pozycji "350 zł"")
  return 'pending';
});

Then('użytkownik widzi przyciski decyzji {string} oraz {string} dla tej pozycji', async (value1, value2) => {
  // TODO: implement this step (from feature step: "użytkownik widzi przyciski decyzji "Zgoda" oraz "Odmowa" dla tej pozycji")
  return 'pending';
});

Given('wiadomość Planera zawiera pozycję oferty dosprzedaży z etykietą stanu technicznego {string}', async (value) => {
  // TODO: implement this step (from feature step: "wiadomość Planera zawiera pozycję oferty dosprzedaży z etykietą stanu technicznego "<etykieta>"")
  return 'pending';
});

Then('użytkownik nie widzi etykiety stanu technicznego {string} przy pozycji', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik nie widzi etykiety stanu technicznego "<etykieta>" przy pozycji")
  return 'pending';
});

When('klient wybiera decyzję {string} dla pozycji {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "klient wybiera decyzję "<decyzja>" dla pozycji "Wymiana klocków hamulcowych"")
  return 'pending';
});

Then('system zapisuje decyzję klienta jako {string} dla pozycji {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "system zapisuje decyzję klienta jako "<decyzja>" dla pozycji "Wymiana klocków hamulcowych"")
  return 'pending';
});

Then('użytkownik nie widzi sekcji {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik nie widzi sekcji "W razie pytań zapraszamy do kontaktu:"")
  return 'pending';
});

Then('użytkownik nie widzi przycisku {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik nie widzi przycisku "Wyślij prośbę o kontakt"")
  return 'pending';
});

Given('link z wiadomości SMS jest nieprawidłowy lub wygasł', async () => {
  // TODO: implement this step (from feature step: "link z wiadomości SMS jest nieprawidłowy lub wygasł")
  return 'pending';
});

When('klient otwiera ten link', async () => {
  // TODO: implement this step (from feature step: "klient otwiera ten link")
  return 'pending';
});

Then('system wyświetla komunikat o niedostępności widoku wiadomości', async () => {
  // TODO: implement this step (from feature step: "system wyświetla komunikat o niedostępności widoku wiadomości")
  return 'pending';
});

Then('system nie wyświetla danych Klienta ani Pojazdu', async () => {
  // TODO: implement this step (from feature step: "system nie wyświetla danych Klienta ani Pojazdu")
  return 'pending';
});

Given('klient przekazał już decyzje dla wszystkich pytań i pozycji oferty', async () => {
  // TODO: implement this step (from feature step: "klient przekazał już decyzje dla wszystkich pytań i pozycji oferty")
  return 'pending';
});

When('klient ponownie otwiera unikalny link z wiadomości SMS', async () => {
  // TODO: implement this step (from feature step: "klient ponownie otwiera unikalny link z wiadomości SMS")
  return 'pending';
});

Then('użytkownik widzi wcześniej przekazane decyzje jako tylko do odczytu', async () => {
  // TODO: implement this step (from feature step: "użytkownik widzi wcześniej przekazane decyzje jako tylko do odczytu")
  return 'pending';
});

Then('użytkownik nie może zmienić przekazanych decyzji', async () => {
  // TODO: implement this step (from feature step: "użytkownik nie może zmienić przekazanych decyzji")
  return 'pending';
});

Given('wystąpił błąd komunikacji z systemem podczas otwierania linku', async () => {
  // TODO: implement this step (from feature step: "wystąpił błąd komunikacji z systemem podczas otwierania linku")
  return 'pending';
});

Then('system wyświetla komunikat o błędzie wczytywania widoku wiadomości', async () => {
  // TODO: implement this step (from feature step: "system wyświetla komunikat o błędzie wczytywania widoku wiadomości")
  return 'pending';
});

Then('użytkownik nie widzi niekompletnych danych Klienta ani Pojazdu', async () => {
  // TODO: implement this step (from feature step: "użytkownik nie widzi niekompletnych danych Klienta ani Pojazdu")
  return 'pending';
});

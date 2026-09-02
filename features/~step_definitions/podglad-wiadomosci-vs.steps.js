const assert = require('node:assert/strict');
const { Given, When, Then, world } = require('@cucumber/cucumber');

Given('doradca serwisowy przegląda listę wiadomości w teczce naprawy', async () => {
  // TODO: implement this step (from feature step: "doradca serwisowy przegląda listę wiadomości w teczce naprawy")
  return 'pending';
});

Given('lista wiadomości zawiera wiadomość typu {string}', async (value) => {
  // TODO: implement this step (from feature step: "lista wiadomości zawiera wiadomość typu "Wiadomość VS"")
  return 'pending';
});

When('doradca serwisowy przegląda kolumnę {string} dla tej wiadomości', async (value) => {
  // TODO: implement this step (from feature step: "doradca serwisowy przegląda kolumnę "Operacje" dla tej wiadomości")
  return 'pending';
});

Then('użytkownik widzi ikonę linku w kolumnie {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik widzi ikonę linku w kolumnie "Operacje"")
  return 'pending';
});

Then('użytkownik nie widzi ikony linku w kolumnie {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik nie widzi ikony linku w kolumnie "Operacje"")
  return 'pending';
});

Given('doradca serwisowy nie posiada uprawnień do VS', async () => {
  // TODO: implement this step (from feature step: "doradca serwisowy nie posiada uprawnień do VS")
  return 'pending';
});

Then('użytkownik widzi aktywną ikonę linku w kolumnie {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik widzi aktywną ikonę linku w kolumnie "Operacje"")
  return 'pending';
});

Then('system nie weryfikuje uprawnień doradcy przed wyświetleniem ikony', async () => {
  // TODO: implement this step (from feature step: "system nie weryfikuje uprawnień doradcy przed wyświetleniem ikony")
  return 'pending';
});

When('doradca serwisowy klika ikonę linku w kolumnie {string}', async (value) => {
  // TODO: implement this step (from feature step: "doradca serwisowy klika ikonę linku w kolumnie "Operacje"")
  return 'pending';
});

Then('system otwiera wiadomość w panelu VS w nowym oknie przeglądarki', async () => {
  // TODO: implement this step (from feature step: "system otwiera wiadomość w panelu VS w nowym oknie przeglądarki")
  return 'pending';
});

Then('widok listy wiadomości w Planerze pozostaje otwarty i niezakłócony', async () => {
  // TODO: implement this step (from feature step: "widok listy wiadomości w Planerze pozostaje otwarty i niezakłócony")
  return 'pending';
});

Given('doradca serwisowy nie posiada uprawnień do przeglądania wiadomości w VS', async () => {
  // TODO: implement this step (from feature step: "doradca serwisowy nie posiada uprawnień do przeglądania wiadomości w VS")
  return 'pending';
});

Then('nowe okno wyświetla standardowy komunikat VS o braku dostępu', async () => {
  // TODO: implement this step (from feature step: "nowe okno wyświetla standardowy komunikat VS o braku dostępu")
  return 'pending';
});

Then('Planer nie wyświetla żadnego własnego komunikatu błędu', async () => {
  // TODO: implement this step (from feature step: "Planer nie wyświetla żadnego własnego komunikatu błędu")
  return 'pending';
});

Given('wiadomość typu {string} ma status wysyłki {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "wiadomość typu "Wiadomość VS" ma status wysyłki "<status_wysylki>"")
  return 'pending';
});

Then('użytkownik widzi wskaźnik statusu wysyłki {string} w tej samej komórce', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik widzi wskaźnik statusu wysyłki "<status_wysylki>" w tej samej komórce")
  return 'pending';
});

Then('użytkownik widzi ikonę linku obok wskaźnika statusu wysyłki', async () => {
  // TODO: implement this step (from feature step: "użytkownik widzi ikonę linku obok wskaźnika statusu wysyłki")
  return 'pending';
});

const assert = require('node:assert/strict');
const { Given, When, Then, world } = require('@cucumber/cucumber');

Given('doradca serwisowy otworzył listę wiadomości w teczce naprawy', async () => {
  // TODO: implement this step (from feature step: "doradca serwisowy otworzył listę wiadomości w teczce naprawy")
  return 'pending';
});

Given('lista wiadomości zawiera wiadomość typu {string}', async (value) => {
  // TODO: implement this step (from feature step: "lista wiadomości zawiera wiadomość typu "Wiadomość VS"")
  return 'pending';
});

Then('w kolumnie {string} dla tej wiadomości widoczna jest ikona linku', async (value) => {
  // TODO: implement this step (from feature step: "w kolumnie "Operacje" dla tej wiadomości widoczna jest ikona linku")
  return 'pending';
});

Then('w kolumnie {string} dla tej wiadomości ikona linku nie jest widoczna', async (value) => {
  // TODO: implement this step (from feature step: "w kolumnie "Operacje" dla tej wiadomości ikona linku nie jest widoczna")
  return 'pending';
});

Given('doradca {string} uprawnienia do przeglądania wiadomości w VS', async (value) => {
  // TODO: implement this step (from feature step: "doradca "<posiada_uprawnienia>" uprawnienia do przeglądania wiadomości w VS")
  return 'pending';
});

Then('ikona linku dla tej wiadomości jest widoczna', async () => {
  // TODO: implement this step (from feature step: "ikona linku dla tej wiadomości jest widoczna")
  return 'pending';
});

Then('ikona linku dla tej wiadomości jest klikalna', async () => {
  // TODO: implement this step (from feature step: "ikona linku dla tej wiadomości jest klikalna")
  return 'pending';
});

When('doradca klika ikonę linku dla tej wiadomości', async () => {
  // TODO: implement this step (from feature step: "doradca klika ikonę linku dla tej wiadomości")
  return 'pending';
});

Then('system otwiera wiadomość w panelu VS w nowym oknie przeglądarki', async () => {
  // TODO: implement this step (from feature step: "system otwiera wiadomość w panelu VS w nowym oknie przeglądarki")
  return 'pending';
});

Then('lista wiadomości w Planerze pozostaje otwarta i niezakłócona', async () => {
  // TODO: implement this step (from feature step: "lista wiadomości w Planerze pozostaje otwarta i niezakłócona")
  return 'pending';
});

Given('doradca nie posiada uprawnień do przeglądania wiadomości w VS', async () => {
  // TODO: implement this step (from feature step: "doradca nie posiada uprawnień do przeglądania wiadomości w VS")
  return 'pending';
});

Then('nowe okno przeglądarki wyświetla standardowy komunikat VS o braku dostępu', async () => {
  // TODO: implement this step (from feature step: "nowe okno przeglądarki wyświetla standardowy komunikat VS o braku dostępu")
  return 'pending';
});

Then('Planer nie wyświetla żadnego własnego komunikatu błędu ani ostrzeżenia', async () => {
  // TODO: implement this step (from feature step: "Planer nie wyświetla żadnego własnego komunikatu błędu ani ostrzeżenia")
  return 'pending';
});

Given('wiadomość typu {string} ma wskaźnik statusu wysyłki {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "wiadomość typu "Wiadomość VS" ma wskaźnik statusu wysyłki "<status_wysylki>"")
  return 'pending';
});

Then('wskaźnik statusu wysyłki {string} jest nadal widoczny dla tej wiadomości', async (value) => {
  // TODO: implement this step (from feature step: "wskaźnik statusu wysyłki "<status_wysylki>" jest nadal widoczny dla tej wiadomości")
  return 'pending';
});

Then('ikona linku jest widoczna obok tego wskaźnika w tej samej komórce', async () => {
  // TODO: implement this step (from feature step: "ikona linku jest widoczna obok tego wskaźnika w tej samej komórce")
  return 'pending';
});

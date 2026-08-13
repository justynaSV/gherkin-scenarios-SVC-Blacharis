const assert = require('node:assert/strict');
const { Given, When, Then, world } = require('@cucumber/cucumber');

Given('naprawa w Planerze ma status {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa w Planerze ma status "<status_naprawy>"")
  return 'pending';
});

When('Planer otrzymuje z VS odpowiedź klienta {string} na pytanie {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "Planer otrzymuje z VS odpowiedź klienta "Potwierdzam" na pytanie "Czy potwierdzasz wizytę?"")
  return 'pending';
});

Then('system aktualizuje status {string} na naprawie na wartość {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "system aktualizuje status "Potwierdzenie wizyty" na naprawie na wartość "Potwierdzona"")
  return 'pending';
});

Given('naprawa ma status {string} ustawiony na wartość {string} po wcześniejszej odpowiedzi', async (value1, value2) => {
  // TODO: implement this step (from feature step: "naprawa ma status "Potwierdzenie wizyty" ustawiony na wartość "Potwierdzona" po wcześniejszej odpowiedzi")
  return 'pending';
});

When('Planer otrzymuje z VS kolejną odpowiedź klienta {string} na pytanie {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "Planer otrzymuje z VS kolejną odpowiedź klienta "Rezygnuję z naprawy" na pytanie "Czy potwierdzasz wizytę?"")
  return 'pending';
});

Then('system nadpisuje status {string} na naprawie na wartość {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "system nadpisuje status "Potwierdzenie wizyty" na naprawie na wartość "Odwołana"")
  return 'pending';
});

Given('flaga {string} ma aktualnie wartość {string} po wcześniejszej odpowiedzi klienta', async (value1, value2) => {
  // TODO: implement this step (from feature step: "flaga "Klient czeka" ma aktualnie wartość "zaznaczona" po wcześniejszej odpowiedzi klienta")
  return 'pending';
});

Then('system nadpisuje flagę {string} na wartość {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "system nadpisuje flagę "Klient czeka" na wartość "niezaznaczona"")
  return 'pending';
});

Given('Planer otrzymał z VS odpowiedź klienta powodującą zmianę statusu {string}', async (value) => {
  // TODO: implement this step (from feature step: "Planer otrzymał z VS odpowiedź klienta powodującą zmianę statusu "Potwierdzenie wizyty"")
  return 'pending';
});

When('system zapisuje zmianę za pomocą standardowego mechanizmu aktualizacji naprawy', async () => {
  // TODO: implement this step (from feature step: "system zapisuje zmianę za pomocą standardowego mechanizmu aktualizacji naprawy")
  return 'pending';
});

Then('w Historii zmian pojawia się nowy wpis dotyczący pola {string}', async (value) => {
  // TODO: implement this step (from feature step: "w Historii zmian pojawia się nowy wpis dotyczący pola "Potwierdzenie wizyty"")
  return 'pending';
});

Given('Planer otrzymał z VS odpowiedź klienta powodującą zmianę flagi {string}', async (value) => {
  // TODO: implement this step (from feature step: "Planer otrzymał z VS odpowiedź klienta powodującą zmianę flagi "Klient czeka"")
  return 'pending';
});

Given('wartość flagi {string} jest już zgodna z odpowiedzią klienta na pytanie {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "wartość flagi "Klient czeka" jest już zgodna z odpowiedzią klienta na pytanie "Czy będziesz czekał na miejscu?"")
  return 'pending';
});

When('system przetwarza otrzymaną odpowiedź klienta', async () => {
  // TODO: implement this step (from feature step: "system przetwarza otrzymaną odpowiedź klienta")
  return 'pending';
});

Then('w Historii zmian nie pojawia się nowy wpis dotyczący pola {string}', async (value) => {
  // TODO: implement this step (from feature step: "w Historii zmian nie pojawia się nowy wpis dotyczący pola "Klient czeka"")
  return 'pending';
});

Given('naprawa została nowo utworzona i nie otrzymała jeszcze odpowiedzi klienta', async () => {
  // TODO: implement this step (from feature step: "naprawa została nowo utworzona i nie otrzymała jeszcze odpowiedzi klienta")
  return 'pending';
});

Then('status {string} na naprawie pozostaje ustawiony na wartość {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "status "Potwierdzenie wizyty" na naprawie pozostaje ustawiony na wartość "Do potwierdzenia"")
  return 'pending';
});

Then('system aktualizuje flagę {string} na wartość {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "system aktualizuje flagę "Klient czeka" na wartość "<flaga>"")
  return 'pending';
});

When('Planer otrzymuje z VS informację bez odpowiedzi na pytanie {string}', async (value) => {
  // TODO: implement this step (from feature step: "Planer otrzymuje z VS informację bez odpowiedzi na pytanie "Czy będziesz czekał na miejscu?"")
  return 'pending';
});

Then('flaga {string} pozostaje niezmieniona na wartości {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "flaga "Klient czeka" pozostaje niezmieniona na wartości "zaznaczona"")
  return 'pending';
});

Given('link do formularza odpowiedzi na pytania potwierdzenia wizyty jest wygasły lub został już wcześniej użyty', async () => {
  // TODO: implement this step (from feature step: "link do formularza odpowiedzi na pytania potwierdzenia wizyty jest wygasły lub został już wcześniej użyty")
  return 'pending';
});

When('klient próbuje otworzyć wygasły lub użyty link', async () => {
  // TODO: implement this step (from feature step: "klient próbuje otworzyć wygasły lub użyty link")
  return 'pending';
});

Then('VS wyświetla klientowi stronę formularza jako nieaktywną', async () => {
  // TODO: implement this step (from feature step: "VS wyświetla klientowi stronę formularza jako nieaktywną")
  return 'pending';
});

Then('system nie otrzymuje żadnego powiadomienia o odpowiedzi od VS', async () => {
  // TODO: implement this step (from feature step: "system nie otrzymuje żadnego powiadomienia o odpowiedzi od VS")
  return 'pending';
});

Then('Planer nie zmienia żadnych danych naprawy', async () => {
  // TODO: implement this step (from feature step: "Planer nie zmienia żadnych danych naprawy")
  return 'pending';
});

Given('klient otrzymał aktywny link do formularza potwierdzenia wizyty', async () => {
  // TODO: implement this step (from feature step: "klient otrzymał aktywny link do formularza potwierdzenia wizyty")
  return 'pending';
});

When('doradca anuluje naprawę w Service Plannerze', async () => {
  // TODO: implement this step (from feature step: "doradca anuluje naprawę w Service Plannerze")
  return 'pending';
});

Then('Public Client przechodzi w tryb tylko do odczytu', async () => {
  // TODO: implement this step (from feature step: "Public Client przechodzi w tryb tylko do odczytu")
  return 'pending';
});

Then('Public Client wyświetla u góry komunikat informujący, że wiadomość jest nieaktualna', async () => {
  // TODO: implement this step (from feature step: "Public Client wyświetla u góry komunikat informujący, że wiadomość jest nieaktualna")
  return 'pending';
});

When('doradca przeplanowuje naprawę w Service Plannerze', async () => {
  // TODO: implement this step (from feature step: "doradca przeplanowuje naprawę w Service Plannerze")
  return 'pending';
});

Given('Public Client znajduje się w trybie tylko do odczytu po anulowaniu naprawy', async () => {
  // TODO: implement this step (from feature step: "Public Client znajduje się w trybie tylko do odczytu po anulowaniu naprawy")
  return 'pending';
});

When('klient próbuje odpowiedzieć na pytania potwierdzenia wizyty', async () => {
  // TODO: implement this step (from feature step: "klient próbuje odpowiedzieć na pytania potwierdzenia wizyty")
  return 'pending';
});

Then('system nie zapisuje udzielonej odpowiedzi', async () => {
  // TODO: implement this step (from feature step: "system nie zapisuje udzielonej odpowiedzi")
  return 'pending';
});

Then('Public Client wyświetla przy pytaniach komunikat {string}', async (value) => {
  // TODO: implement this step (from feature step: "Public Client wyświetla przy pytaniach komunikat "Upłynął czas na udzielenie odpowiedzi"")
  return 'pending';
});

Given('Public Client znajduje się w trybie tylko do odczytu po przeplanowaniu naprawy', async () => {
  // TODO: implement this step (from feature step: "Public Client znajduje się w trybie tylko do odczytu po przeplanowaniu naprawy")
  return 'pending';
});

When('klient próbuje odpowiedzieć na ankietę lub ofertę dosprzedaży', async () => {
  // TODO: implement this step (from feature step: "klient próbuje odpowiedzieć na ankietę lub ofertę dosprzedaży")
  return 'pending';
});

Then('Public Client wyświetla przy ankiecie i ofercie komunikat {string}', async (value) => {
  // TODO: implement this step (from feature step: "Public Client wyświetla przy ankiecie i ofercie komunikat "Upłynął czas na udzielenie odpowiedzi"")
  return 'pending';
});

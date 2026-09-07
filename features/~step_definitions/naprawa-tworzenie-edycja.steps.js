const assert = require('node:assert/strict');
const { Given, When, Then, world } = require('@cucumber/cucumber');

Given('użytkownik pracuje w BOK powiązanym z warsztatem {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik pracuje w BOK powiązanym z warsztatem "Warsztat Śródmieście"")
  return 'pending';
});

Given('naprawa nie ma przypisanego blacharza', async () => {
  // TODO: implement this step (from feature step: "naprawa nie ma przypisanego blacharza")
  return 'pending';
});

When('użytkownik otwiera okno „Edycja naprawy"', async () => {
  // TODO: implement this step (from feature step: "użytkownik otwiera okno „Edycja naprawy"")
  return 'pending';
});

When('użytkownik zapisuje zmiany', async () => {
  // TODO: implement this step (from feature step: "użytkownik zapisuje zmiany")
  return 'pending';
});

Then('naprawa ma przypisanego blacharza {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa ma przypisanego blacharza "Jan Kowalski"")
  return 'pending';
});

Given('użytkownik edytuje naprawę prowadzoną w kontekście blacharskim', async () => {
  // TODO: implement this step (from feature step: "użytkownik edytuje naprawę prowadzoną w kontekście blacharskim")
  return 'pending';
});

Given('do naprawy przypisano wcześniej blacharza {string}', async (value) => {
  // TODO: implement this step (from feature step: "do naprawy przypisano wcześniej blacharza "Jan Kowalski"")
  return 'pending';
});

Then('naprawa nie ma już przypisanego blacharza {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa nie ma już przypisanego blacharza "Jan Kowalski"")
  return 'pending';
});

Given('użytkownik edytuje naprawę w kontekście {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik edytuje naprawę w kontekście "<kontekst>"")
  return 'pending';
});

Given('z tym kontekstem powiązany jest warsztat {string}', async (value) => {
  // TODO: implement this step (from feature step: "z tym kontekstem powiązany jest warsztat "Warsztat Śródmieście"")
  return 'pending';
});

Given('w warsztacie {string} pracują blacharze {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "w warsztacie "Warsztat Śródmieście" pracują blacharze "Jan Kowalski, Adam Nowak"")
  return 'pending';
});

Then('lista zawiera osoby {string}', async (value) => {
  // TODO: implement this step (from feature step: "lista zawiera osoby "Jan Kowalski, Adam Nowak"")
  return 'pending';
});

Given('użytkownik edytuje naprawę w kontekście BOK powiązanym z warsztatem {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik edytuje naprawę w kontekście BOK powiązanym z warsztatem "Warsztat Śródmieście"")
  return 'pending';
});

Given('w warsztacie {string} pracuje blacharz {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "w warsztacie "Warsztat Śródmieście" pracuje blacharz "Jan Kowalski"")
  return 'pending';
});

Given('w warsztacie {string} pracuje doradca {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "w warsztacie "Warsztat Śródmieście" pracuje doradca "Piotr Zieliński"")
  return 'pending';
});

Then('lista zawiera osobę {string}', async (value) => {
  // TODO: implement this step (from feature step: "lista zawiera osobę "Jan Kowalski"")
  return 'pending';
});

Then('lista nie zawiera osoby {string}', async (value) => {
  // TODO: implement this step (from feature step: "lista nie zawiera osoby "Piotr Zieliński"")
  return 'pending';
});

Given('w powiązanym warsztacie pracuje blacharz {string}', async (value) => {
  // TODO: implement this step (from feature step: "w powiązanym warsztacie pracuje blacharz "Jan Kowalski"")
  return 'pending';
});

Given('w innym warsztacie {string} pracuje blacharz {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "w innym warsztacie "Warsztat Mokotów" pracuje blacharz "Marek Wójcik"")
  return 'pending';
});

When('użytkownik otwiera pełną teczkę naprawy', async () => {
  // TODO: implement this step (from feature step: "użytkownik otwiera pełną teczkę naprawy")
  return 'pending';
});

Given('w BOK przypisano do naprawy blacharza {string} z warsztatu {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "w BOK przypisano do naprawy blacharza "Jan Kowalski" z warsztatu "Warsztat Śródmieście"")
  return 'pending';
});

When('naprawa zostaje przekazana do warsztatu {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa zostaje przekazana do warsztatu "Warsztat Mokotów"")
  return 'pending';
});

Given('naprawa ma przypisanego blacharza {string} z warsztatu {string}', async (value1, value2) => {
  // TODO: implement this step (from feature step: "naprawa ma przypisanego blacharza "Jan Kowalski" z warsztatu "Warsztat Śródmieście"")
  return 'pending';
});

Given('naprawa jest obsługiwana przez warsztat {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa jest obsługiwana przez warsztat "Warsztat Mokotów"")
  return 'pending';
});

When('użytkownik warsztatu {string} otwiera okno „Edycja naprawy"', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik warsztatu "Warsztat Mokotów" otwiera okno „Edycja naprawy"")
  return 'pending';
});

Given('naprawa ma przypisanego kosztorysanta {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa ma przypisanego kosztorysanta "Ewa Lewandowska"")
  return 'pending';
});

When('użytkownik otwiera kontekst naprawy', async () => {
  // TODO: implement this step (from feature step: "użytkownik otwiera kontekst naprawy")
  return 'pending';
});

When('użytkownik najeżdża wskaźnikiem myszy na pole „<pole>"', async () => {
  // TODO: implement this step (from feature step: "użytkownik najeżdża wskaźnikiem myszy na pole „<pole>"")
  return 'pending';
});

Then('pojawia się tooltip z tekstem „<pole>"', async () => {
  // TODO: implement this step (from feature step: "pojawia się tooltip z tekstem „<pole>"")
  return 'pending';
});

Then('pole „Kosztorysant odpowiedzialny" jest oznaczone ikoną doradcy', async () => {
  // TODO: implement this step (from feature step: "pole „Kosztorysant odpowiedzialny" jest oznaczone ikoną doradcy")
  return 'pending';
});

Given('użytkownik ma ustawiony język interfejsu {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik ma ustawiony język interfejsu "<jezyk>"")
  return 'pending';
});

Then('użytkownik widzi nazwę pola {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik widzi nazwę pola "<tlumaczenie>"")
  return 'pending';
});

When('użytkownik działu {string} otwiera kontekst naprawy', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik działu "<dzial>" otwiera kontekst naprawy")
  return 'pending';
});

When('użytkownik warsztatu {string} otwiera pełną teczkę naprawy', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik warsztatu "Warsztat Mokotów" otwiera pełną teczkę naprawy")
  return 'pending';
});

When('użytkownik wybiera w polu \'Przypisany blacharz\' osobę {string}', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik wybiera w polu \'Przypisany blacharz\' osobę "Jan Kowalski"")
  return 'pending';
});

Then('pole \'Przypisany blacharz\' jest widoczne w oknie edycji naprawy', async () => {
  // TODO: implement this step (from feature step: "pole \'Przypisany blacharz\' jest widoczne w oknie edycji naprawy")
  return 'pending';
});

Then('pole \'Przypisany blacharz\' pozwala wybrać jedną osobę z rozwijanej listy', async () => {
  // TODO: implement this step (from feature step: "pole \'Przypisany blacharz\' pozwala wybrać jedną osobę z rozwijanej listy")
  return 'pending';
});

When('użytkownik czyści pole \'Przypisany blacharz\'', async () => {
  // TODO: implement this step (from feature step: "użytkownik czyści pole \'Przypisany blacharz\'")
  return 'pending';
});

Then('pole \'Przypisany blacharz\' dla naprawy jest puste', async () => {
  // TODO: implement this step (from feature step: "pole \'Przypisany blacharz\' dla naprawy jest puste")
  return 'pending';
});

When('użytkownik rozwija pole \'Przypisany blacharz\'', async () => {
  // TODO: implement this step (from feature step: "użytkownik rozwija pole \'Przypisany blacharz\'")
  return 'pending';
});

Then('pole \'Przypisany blacharz\' nadal pokazuje {string}', async (value) => {
  // TODO: implement this step (from feature step: "pole \'Przypisany blacharz\' nadal pokazuje "Jan Kowalski"")
  return 'pending';
});

Then('rozwinięta lista \'Przypisany blacharz\' zawiera blacharzy warsztatu {string}', async (value) => {
  // TODO: implement this step (from feature step: "rozwinięta lista \'Przypisany blacharz\' zawiera blacharzy warsztatu "Warsztat Mokotów"")
  return 'pending';
});

Then('pole \'Przypisany blacharz\' jest puste', async () => {
  // TODO: implement this step (from feature step: "pole \'Przypisany blacharz\' jest puste")
  return 'pending';
});

When('użytkownik przechodzi do sekcji \'Naprawa\'', async () => {
  // TODO: implement this step (from feature step: "użytkownik przechodzi do sekcji \'Naprawa\'")
  return 'pending';
});

Then('w sekcji \'Naprawa\' widoczna jest nazwa blacharza {string}', async (value) => {
  // TODO: implement this step (from feature step: "w sekcji \'Naprawa\' widoczna jest nazwa blacharza "Jan Kowalski"")
  return 'pending';
});

Then('w sekcji \'Naprawa\' widoczna jest nazwa kosztorysanta {string}', async (value) => {
  // TODO: implement this step (from feature step: "w sekcji \'Naprawa\' widoczna jest nazwa kosztorysanta "Ewa Lewandowska"")
  return 'pending';
});

Then('pole blacharza w sekcji \'Naprawa\' jest puste', async () => {
  // TODO: implement this step (from feature step: "pole blacharza w sekcji \'Naprawa\' jest puste")
  return 'pending';
});

When('użytkownik przechodzi do sekcji \'Naprawa\' w menu \'Naprawa\'', async () => {
  // TODO: implement this step (from feature step: "użytkownik przechodzi do sekcji \'Naprawa\' w menu \'Naprawa\'")
  return 'pending';
});

Then('w sekcji \'Naprawa\' widoczne jest pole \'Przypisany blacharz\'', async () => {
  // TODO: implement this step (from feature step: "w sekcji \'Naprawa\' widoczne jest pole \'Przypisany blacharz\'")
  return 'pending';
});

Then('pole \'Przypisany blacharz\' pokazuje nazwę {string}', async (value) => {
  // TODO: implement this step (from feature step: "pole \'Przypisany blacharz\' pokazuje nazwę "Jan Kowalski"")
  return 'pending';
});

Given('użytkownik edytuje sekcję \'Naprawa\' w pełnej teczce naprawy', async () => {
  // TODO: implement this step (from feature step: "użytkownik edytuje sekcję \'Naprawa\' w pełnej teczce naprawy")
  return 'pending';
});

Then('pole \'Przypisany blacharz\' w sekcji \'Naprawa\' pokazuje nazwę {string}', async (value) => {
  // TODO: implement this step (from feature step: "pole \'Przypisany blacharz\' w sekcji \'Naprawa\' pokazuje nazwę "Adam Nowak"")
  return 'pending';
});

Then('pole \'Przypisany blacharz\' w sekcji \'Naprawa\' jest puste', async () => {
  // TODO: implement this step (from feature step: "pole \'Przypisany blacharz\' w sekcji \'Naprawa\' jest puste")
  return 'pending';
});

Given('użytkownik otwiera pełną teczkę naprawy w sekcji \'Naprawa\'', async () => {
  // TODO: implement this step (from feature step: "użytkownik otwiera pełną teczkę naprawy w sekcji \'Naprawa\'")
  return 'pending';
});

Then('pole \'Przypisany blacharz\' jest oznaczone ikoną klucza', async () => {
  // TODO: implement this step (from feature step: "pole \'Przypisany blacharz\' jest oznaczone ikoną klucza")
  return 'pending';
});

Given('pole \'Przypisany blacharz\' jest widoczne dla użytkownika', async () => {
  // TODO: implement this step (from feature step: "pole \'Przypisany blacharz\' jest widoczne dla użytkownika")
  return 'pending';
});

When('użytkownik wyświetla tekst etykiety pola \'Przypisany blacharz\'', async () => {
  // TODO: implement this step (from feature step: "użytkownik wyświetla tekst etykiety pola \'Przypisany blacharz\'")
  return 'pending';
});

When('użytkownik drukuje kartę pracy z sekcji \'Szkody\'', async () => {
  // TODO: implement this step (from feature step: "użytkownik drukuje kartę pracy z sekcji \'Szkody\'")
  return 'pending';
});

Then('wydruk karty pracy zawiera pole \'Przypisany BL\'', async () => {
  // TODO: implement this step (from feature step: "wydruk karty pracy zawiera pole \'Przypisany BL\'")
  return 'pending';
});

Then('pole \'Przypisany BL\' na wydruku pokazuje wartość {string}', async (value) => {
  // TODO: implement this step (from feature step: "pole \'Przypisany BL\' na wydruku pokazuje wartość "Jan Kowalski"")
  return 'pending';
});

Then('wydruk karty pracy nie zawiera pola \'Zaplanowany\'', async () => {
  // TODO: implement this step (from feature step: "wydruk karty pracy nie zawiera pola \'Zaplanowany\'")
  return 'pending';
});

Then('pole \'Przypisany BL\' na wydruku jest puste', async () => {
  // TODO: implement this step (from feature step: "pole \'Przypisany BL\' na wydruku jest puste")
  return 'pending';
});

Given('użytkownik wybrał w polu \'Przypisany blacharz\' osobę {string} podczas edycji naprawy', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik wybrał w polu \'Przypisany blacharz\' osobę "Adam Nowak" podczas edycji naprawy")
  return 'pending';
});

Given('naprawa ma w polu \'Rodzaj utylizacji części\' wybraną wartość {string}', async (value) => {
  // TODO: implement this step (from feature step: "naprawa ma w polu \'Rodzaj utylizacji części\' wybraną wartość "<rodzaj_utylizacji>"")
  return 'pending';
});

Then('wydruk karty pracy zawiera w sekcji \'Dodatkowe informacje\' pole \'Części\'', async () => {
  // TODO: implement this step (from feature step: "wydruk karty pracy zawiera w sekcji \'Dodatkowe informacje\' pole \'Części\'")
  return 'pending';
});

Then('pole \'Części\' na wydruku pokazuje wartość {string}', async (value) => {
  // TODO: implement this step (from feature step: "pole \'Części\' na wydruku pokazuje wartość "<rodzaj_utylizacji>"")
  return 'pending';
});

Given('naprawa ma puste pole \'Rodzaj utylizacji części\'', async () => {
  // TODO: implement this step (from feature step: "naprawa ma puste pole \'Rodzaj utylizacji części\'")
  return 'pending';
});

Then('pole \'Części\' na wydruku jest puste', async () => {
  // TODO: implement this step (from feature step: "pole \'Części\' na wydruku jest puste")
  return 'pending';
});

Given('użytkownik wybrał w polu \'Rodzaj utylizacji części\' wartość {string} podczas edycji szkody', async (value) => {
  // TODO: implement this step (from feature step: "użytkownik wybrał w polu \'Rodzaj utylizacji części\' wartość "zwrot do klienta" podczas edycji szkody")
  return 'pending';
});

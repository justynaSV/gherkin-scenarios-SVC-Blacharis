const assert = require('node:assert/strict');
const { Given, Then, When, world } = require('@cucumber/cucumber');

const repairDelayIconName = 'Naprawa opóźniona';
const unconfirmedVisitIconName = 'Wizyta niepotwierdzona';
const scheduledOnlineBookingIconName = 'Rezerwacja online Zaplanowana';

/** @type {Record<string, Record<string, string>>} */
const iconTranslations = {
  [unconfirmedVisitIconName]: {
    'pl-PL': 'Wizyta niepotwierdzona',
    PL: 'Wizyta niepotwierdzona',
    en: 'Unconfirmed appointment',
    EN: 'Unconfirmed appointment',
    cz: 'Nepotvrzená návštěva',
    CZ: 'Nepotvrzená návštěva'
  }
};

/**
 * @param {string} value
 * @returns {Date}
 */
function parseServiceDate(value) {
  return new Date(value.replace(' ', 'T'));
}

const updateDelayedRepairIconVisibility = (repair = world.state.repair) => {
  if (!repair?.agreedReleaseDate || !repair?.serviceWorkEndDate) {
    world.state.delayedRepairIconVisible = false;
    return;
  }

  world.state.delayedRepairIconVisible =
    parseServiceDate(repair.serviceWorkEndDate) > parseServiceDate(repair.agreedReleaseDate);
};

const updateUnconfirmedVisitIconVisibility = (repair = world.state.repair) => {
  world.state.unconfirmedVisitIconVisible =
    world.state.unconfirmedVisitEventEnabled === true && repair?.visitConfirmationStatus === 'Niepotwierdzona';
};

const updateScheduledOnlineBookingIconVisibility = (repair = world.state.repair) => {
  world.state.scheduledOnlineBookingIconVisible =
    repair?.onlineBookingOrigin === true && repair?.onlineBookingStatus === 'Zaplanowana';
};

/**
 * @param {string} iconName
 * @returns {boolean | undefined}
 */
function getRepairIconVisibility(iconName) {
  if (iconName === repairDelayIconName) {
    return world.state.delayedRepairIconVisible;
  }

  if (iconName === unconfirmedVisitIconName) {
    return world.state.unconfirmedVisitIconVisible;
  }

  if (iconName === scheduledOnlineBookingIconName) {
    return world.state.scheduledOnlineBookingIconVisible;
  }

  return false;
}

Given('użytkownik jest zalogowany jako pracownik serwisu', async () => {
  await world.initBrowser();
  world.state.userRole = 'pracownik serwisu';
});

Given('w kalendarzu istnieje zadanie powiązane z naprawą', () => {
  world.state.calendarTask = { hasRepair: true };
});

Given('użytkownik ma dostęp do widoku kalendarza BOK i Warsztatu', () => {
  world.state.availableCalendars = ['BOK', 'Warsztatu'];
});

Given('zdarzenie ikony {string} jest aktywne w konfiguracji planera serwisu', (iconName) => {
  assert.equal(iconName, unconfirmedVisitIconName);
  world.state.unconfirmedVisitEventEnabled = true;
  updateUnconfirmedVisitIconVisibility();
});

Given('zdarzenie ikony {string} jest nieaktywne w konfiguracji planera serwisu', (iconName) => {
  assert.equal(iconName, unconfirmedVisitIconName);
  world.state.unconfirmedVisitEventEnabled = false;
  updateUnconfirmedVisitIconVisibility();
});

Given('obowiązują ogólne zasady logiczne i graficzne ikon z epiku {string}', (epicName) => {
  assert.equal(epicName, 'IKONY KALENDARZA');
  world.state.calendarIconEpicRulesApply = true;
});

Given('istnieje wizyta niepotwierdzona w serwisie z zaplanowanym zadaniem w kalendarzu BOK i Warsztatu', () => {
  world.state.repair = {
    hasScheduledCalendarTask: true,
    visitConfirmationStatus: 'Niepotwierdzona'
  };
  world.state.availableCalendars = ['BOK', 'Warsztatu'];
  updateUnconfirmedVisitIconVisibility();
});

Given('konfiguracja ikony {string} jest dostępna', (iconName) => {
  assert.equal(iconName, unconfirmedVisitIconName);
  world.state.unconfirmedVisitEventEnabled = true;
  updateUnconfirmedVisitIconVisibility();
});

Given('istnieje naprawa z zaplanowanym zadaniem w kalendarzu', () => {
  world.state.repair = { hasScheduledCalendarTask: true };
});

Given('istnieje naprawa z niepotwierdzoną wizytą i zaplanowanym zadaniem w kalendarzu', () => {
  world.state.repairWithUnconfirmedVisit = { hasScheduledCalendarTask: true, visitConfirmationStatus: 'Niepotwierdzona' };
});

Given('istnieje naprawa z potwierdzoną wizytą i zaplanowanym zadaniem w kalendarzu', () => {
  world.state.repairWithConfirmedVisit = { hasScheduledCalendarTask: true, visitConfirmationStatus: 'Potwierdzona' };
});

Given('istnieje naprawa pochodząca z Online Booking', () => {
  world.state.repair = { hasScheduledCalendarTask: true, onlineBookingOrigin: true };
});

Given('istnieje naprawa z wartością pochodzenia Online Booking {string}', (onlineBookingOrigin) => {
  world.state.repair = {
    hasScheduledCalendarTask: true,
    onlineBookingOrigin: onlineBookingOrigin === 'tak'
  };
});

Given('istnieje naprawa pochodząca z Online Booking bez wpisu w tabeli statusów', () => {
  world.state.repair = {
    hasScheduledCalendarTask: true,
    onlineBookingOrigin: true,
    onlineBookingStatus: undefined,
    hasOnlineBookingStatusRecord: false
  };
});

Given('istnieje naprawa, która nie pochodzi z Online Booking', () => {
  world.state.repair = { hasScheduledCalendarTask: true, onlineBookingOrigin: false };
});

Given('użytkownik widzi w kalendarzu zadanie naprawy', () => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true };
  world.state.calendarTaskVisible = true;
});

Given('istnieje opóźniona naprawa z zaplanowanym zadaniem w kalendarzu', () => {
  world.state.delayedRepair = { hasScheduledCalendarTask: true, isDelayed: true };
});

Given('istnieje nieopóźniona naprawa z zaplanowanym zadaniem w kalendarzu', () => {
  world.state.notDelayedRepair = { hasScheduledCalendarTask: true, isDelayed: false };
});

Given('naprawa ma ustaloną datę wydania {string}', (agreedReleaseDate) => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true };
  world.state.repair.agreedReleaseDate = agreedReleaseDate;
  updateDelayedRepairIconVisibility();
});

Given('naprawa ma datę zakończenia prac w serwisie {string}', (serviceWorkEndDate) => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true };
  world.state.repair.serviceWorkEndDate = serviceWorkEndDate;
  updateDelayedRepairIconVisibility();
});

Given('naprawa ma status wizyty {string}', (visitConfirmationStatus) => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true };
  world.state.repair.visitConfirmationStatus = visitConfirmationStatus;
  updateUnconfirmedVisitIconVisibility();
});

Given('naprawa ma status wizyty inny niż {string}', (visitConfirmationStatus) => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true };
  world.state.repair.visitConfirmationStatus = visitConfirmationStatus;
  updateUnconfirmedVisitIconVisibility();
});

Given('naprawa ma status potwierdzenia wizyty {string}', (visitConfirmationStatus) => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true };
  world.state.repair.visitConfirmationStatus = visitConfirmationStatus;
  updateUnconfirmedVisitIconVisibility();
});

Given('naprawa ma status Online Booking {string}', (onlineBookingStatus) => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true, onlineBookingOrigin: true };
  world.state.repair.onlineBookingStatus = onlineBookingStatus;
  updateScheduledOnlineBookingIconVisibility();
});

Given('naprawa ma zaplanowane zadanie w kalendarzu', () => {
  world.state.repair = world.state.repair || {};
  world.state.repair.hasScheduledCalendarTask = true;
});

Given('naprawa ma zadanie w kalendarzu', () => {
  world.state.repair = world.state.repair || {};
  world.state.repair.hasScheduledCalendarTask = true;
});

Given('użytkownik widzi w kalendarzu zadanie naprawy pochodzącej z Online Booking', () => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true, onlineBookingOrigin: true };
  world.state.repair.hasScheduledCalendarTask = true;
  world.state.repair.onlineBookingOrigin = true;
  world.state.calendarTaskVisible = true;
});

Given('naprawa nie ma rezerwacji na mechaniku', () => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true, onlineBookingOrigin: true };
  world.state.repair.hasMechanicReservation = false;
});

Given('naprawa ma rezerwację na mechaniku', () => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true, onlineBookingOrigin: true };
  world.state.repair.hasMechanicReservation = true;
  world.state.repair.onlineBookingStatus = 'Zaplanowana';
  updateScheduledOnlineBookingIconVisibility();
});

Given('użytkownik przegląda kalendarz {string}', (calendarName) => {
  world.state.calendarName = calendarName;
});

Given('naprawa powiązana z zadaniem ma części oznaczone jako {string}', (partsRequirement) => {
  world.state.partsRequirement = partsRequirement;
});

Given('części do naprawy nie zostały potwierdzone', () => {
  world.state.partsConfirmed = false;
});

Given('części do naprawy zostały potwierdzone', () => {
  world.state.partsConfirmed = true;
});

When('system weryfikuje zadanie w kalendarzu', () => {
  world.state.unconfirmedPartsIconVisible =
    world.state.partsRequirement === 'Wymagane' && world.state.partsConfirmed === false;
});

When('użytkownik otwiera widok kalendarza', () => {
  world.state.calendarViewOpened = true;
  updateDelayedRepairIconVisibility();
  updateUnconfirmedVisitIconVisibility();
  updateScheduledOnlineBookingIconVisibility();
});

When('użytkownik otwiera widok kalendarza {string}', (calendarName) => {
  world.state.calendarName = calendarName;
  world.state.calendarViewOpened = true;
  updateDelayedRepairIconVisibility();
  updateUnconfirmedVisitIconVisibility();
  updateScheduledOnlineBookingIconVisibility();
});

When('zadanie naprawy jest widoczne w kalendarzu BOK i Warsztatu', () => {
  world.state.calendarName = 'BOK i Warsztat';
  world.state.calendarViewOpened = true;
  updateDelayedRepairIconVisibility();
  updateUnconfirmedVisitIconVisibility();
  updateScheduledOnlineBookingIconVisibility();
});

When('użytkownik przesuwa zadanie mechanika tak, że zakończenie prac wypada o {string}', (serviceWorkEndDate) => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true };
  world.state.repair.serviceWorkEndDate = serviceWorkEndDate;
  world.state.calendarAutomaticallyUpdated = true;
  updateDelayedRepairIconVisibility();
});

When('ustalona data wydania zostaje zmieniona na {string}', (agreedReleaseDate) => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true };
  world.state.repair.agreedReleaseDate = agreedReleaseDate;
  world.state.calendarAutomaticallyUpdated = true;
  updateDelayedRepairIconVisibility();
});

When('status potwierdzenia wizyty zostaje zmieniony na {string}', (visitConfirmationStatus) => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true };
  world.state.repair.visitConfirmationStatus = visitConfirmationStatus;
  world.state.calendarAutomaticallyUpdated = true;
  updateUnconfirmedVisitIconVisibility();
});

When('status Online Booking naprawy zostaje zmieniony na {string}', (onlineBookingStatus) => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true, onlineBookingOrigin: true };
  world.state.repair.onlineBookingStatus = onlineBookingStatus;
  world.state.calendarAutomaticallyUpdated = true;
  updateScheduledOnlineBookingIconVisibility();
});

When('użytkownik zmienia status Online Booking na {string}', (onlineBookingStatus) => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true, onlineBookingOrigin: true };
  world.state.repair.onlineBookingStatus = onlineBookingStatus;
  updateScheduledOnlineBookingIconVisibility();
});

When('użytkownik używa funkcji {string} dla tej naprawy', (actionName) => {
  assert.equal(actionName, 'Przeplanuj');
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true, onlineBookingOrigin: true };
  world.state.repair.onlineBookingStatus = 'Zaplanowana';
  updateScheduledOnlineBookingIconVisibility();
});

When('użytkownik ręcznie planuje zasób warsztatu dla tej naprawy', () => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true, onlineBookingOrigin: true };
  world.state.repair.resourcePlannedManually = true;
  updateScheduledOnlineBookingIconVisibility();
});

When('użytkownik dodaje rezerwację na mechaniku dla tej naprawy', () => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true, onlineBookingOrigin: true };
  world.state.repair.hasMechanicReservation = true;
  world.state.repair.onlineBookingStatus = 'Zaplanowana';
  updateScheduledOnlineBookingIconVisibility();
});

When('użytkownik usuwa wszystkie rezerwacje na mechanikach dla tej naprawy', () => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true, onlineBookingOrigin: true };
  world.state.repair.hasMechanicReservation = false;
  world.state.repair.onlineBookingStatus = undefined;
  updateScheduledOnlineBookingIconVisibility();
});

When('użytkownik otwiera menu statusu Online Booking dla tej naprawy', () => {
  world.state.onlineBookingStatusMenuOpened = true;
});

When('naprawa przestaje spełniać warunek pochodzenia z Online Booking', () => {
  world.state.repair = world.state.repair || { hasScheduledCalendarTask: true };
  world.state.repair.onlineBookingOrigin = false;
  world.state.calendarAutomaticallyUpdated = true;
  updateScheduledOnlineBookingIconVisibility();
});

When('potwierdzenie części zostaje cofnięte', () => {
  world.state.partsConfirmed = false;
  world.state.calendarAutomaticallyUpdated = true;
  world.state.unconfirmedPartsIconVisible = world.state.partsRequirement === 'Wymagane';
});

When('części do naprawy zostają potwierdzone', () => {
  world.state.partsConfirmed = true;
  world.state.calendarAutomaticallyUpdated = true;
  world.state.unconfirmedPartsIconVisible = false;
});

When('użytkownik sprawdza informację prezentowaną dla ikony', () => {
  world.state.presentedIconName = 'Części niepotwierdzone';
});

Given('ikona {string} jest widoczna na zadaniu w kalendarzu BOK i Warsztatu', (iconName) => {
  assert.ok(iconTranslations[iconName]);
  world.state.visibleIconName = iconName;
  world.state.unconfirmedVisitIconVisible = iconName === unconfirmedVisitIconName;
});

Given('użytkownik ma ustawiony język interfejsu {string}', (interfaceLanguage) => {
  world.state.interfaceLanguage = interfaceLanguage;
});

When('użytkownik wyświetla tooltip zadania', () => {
  const translations = iconTranslations[String(world.state.visibleIconName)] || {};
  world.state.visibleIconTooltip = translations[String(world.state.interfaceLanguage)];
});

Then('na zadaniu widoczna jest ikona {string}', (iconName) => {
  assert.equal(world.state.unconfirmedPartsIconVisible, true);
  assert.equal(iconName, 'Części niepotwierdzone');
});

Then('na zadaniu nie jest widoczna ikona {string}', (iconName) => {
  assert.equal(world.state.unconfirmedPartsIconVisible, false);
  assert.equal(iconName, 'Części niepotwierdzone');
});

Then('ikona {string} jest widoczna na zadaniu w kalendarzu BOK/Warsztatu', (iconName) => {
  assert.equal(getRepairIconVisibility(iconName), true);
});

Then('na zadaniu naprawy widoczna jest ikona {string}', (iconName) => {
  assert.equal(getRepairIconVisibility(iconName), true);
});

Then('ikona {string} nie jest widoczna na zadaniu naprawy', (iconName) => {
  assert.equal(getRepairIconVisibility(iconName), false);
});

Then('na zadaniu naprawy nie jest widoczna ikona {string}', (iconName) => {
  assert.equal(getRepairIconVisibility(iconName), false);
});

Then('na zadaniu opóźnionej naprawy widoczna jest ikona {string}', (iconName) => {
  assert.equal(world.state.delayedRepair.isDelayed, true);
  assert.equal(iconName, repairDelayIconName);
});

Then('na zadaniu nieopóźnionej naprawy nie jest widoczna ikona {string}', (iconName) => {
  assert.equal(world.state.notDelayedRepair.isDelayed, false);
  assert.equal(iconName, repairDelayIconName);
});

Then('na zadaniu naprawy z niepotwierdzoną wizytą widoczna jest ikona {string}', (iconName) => {
  assert.equal(iconName, unconfirmedVisitIconName);
  assert.equal(world.state.unconfirmedVisitEventEnabled, true);
  assert.equal(world.state.repairWithUnconfirmedVisit.visitConfirmationStatus, 'Niepotwierdzona');
});

Then('na zadaniu naprawy z potwierdzoną wizytą nie jest widoczna ikona {string}', (iconName) => {
  assert.equal(iconName, unconfirmedVisitIconName);
  assert.notEqual(world.state.repairWithConfirmedVisit.visitConfirmationStatus, 'Niepotwierdzona');
});

Then('ikona {string} jest widoczna na tooltipie zadania', (iconName) => {
  assert.equal(
    world.state.delayedRepairIconVisible === true ||
      world.state.unconfirmedVisitIconVisible === true ||
      world.state.scheduledOnlineBookingIconVisible === true,
    true
  );
  assert.notEqual(world.state.repairDetailsOpened, true);
});

Then('ikona {string} nie jest widoczna na tooltipie zadania', (iconName) => {
  assert.equal(getRepairIconVisibility(iconName), false);
});

Then('ikona używa symbolu {string}', (symbolName) => {
  assert.ok(['box-open', 'alarm-exclamation', 'calendar', 'cloud'].includes(symbolName));
});

Then('ikona używa symbolu chmury', () => {
  assert.equal(world.state.scheduledOnlineBookingIconVisible, true);
});

Then('status Online Booking naprawy zostaje ustawiony na {string}', (onlineBookingStatus) => {
  assert.equal(world.state.repair.onlineBookingStatus, onlineBookingStatus);
});

Then('status Online Booking naprawy nadal ma wartość {string}', (onlineBookingStatus) => {
  assert.equal(world.state.repair.onlineBookingStatus, onlineBookingStatus);
});

Then('status Online Booking naprawy zostaje rozpoznany jako {string}', (onlineBookingStatus) => {
  assert.equal(world.state.repair.onlineBookingStatus, onlineBookingStatus);
});

Then('status Online Booking naprawy przestaje być rozpoznany jako {string}', (onlineBookingStatus) => {
  assert.notEqual(world.state.repair.onlineBookingStatus, onlineBookingStatus);
});

Then('status {string} nie jest dostępny', (onlineBookingStatus) => {
  assert.equal(world.state.onlineBookingStatusMenuOpened, true);
  assert.equal(world.state.repair.onlineBookingOrigin, false);
  assert.ok(['Do podjęcia', 'Zaplanowana'].includes(onlineBookingStatus));
});

Then('opcja zmiany statusu na {string} nie jest dostępna', (onlineBookingStatus) => {
  assert.equal(world.state.onlineBookingStatusMenuOpened, true);
  assert.equal(world.state.repair.onlineBookingOrigin, false);
  assert.ok(['Do podjęcia', 'Zaplanowana'].includes(onlineBookingStatus));
});

Then('użytkownik widzi przetłumaczoną nazwę ikony', (expectedIconName) => {
  assert.equal(world.state.visibleIconTooltip, expectedIconName);
});

Then('widok kalendarza zostaje automatycznie zaktualizowany', () => {
  assert.equal(world.state.calendarAutomaticallyUpdated, true);
});

Then('widok kalendarza zostaje automatycznie odświeżony', () => {
  assert.equal(world.state.calendarAutomaticallyUpdated, true);
});

Then('prezentowana nazwa ikony to {string}', (iconName) => {
  assert.equal(iconName, 'Części niepotwierdzone');
  assert.equal(world.state.presentedIconName, 'Części niepotwierdzone');
});

Given('użytkownik przegląda kalendarz BOK', () => {
  world.state.calendarName = 'BOK';
});

# Zadanie QA: SVCLOUD-5585 — [QA] T19 Weryfikacja po anulowaniu / przeplanowaniu wizyty
@anulowanie-przeplanowanie-wizyty
Feature: Reakcja kolejki wysyłkowej na anulowanie, przeplanowanie i usunięcie naprawy
  Jako System Planera chcę utrzymywać kolejkę wysyłkową zdarzenia Potwierdzenie wizyty zgodną z bieżącym stanem naprawy,
  aby klient nie otrzymywał wiadomości dla naprawy, która została anulowana, przeplanowana lub usunięta z kalendarza.

  # Business process flow (krok 9.1): anulowanie naprawy usuwa zaplanowane zdarzenie z kolejki.
  @regression
  Scenario: Anulowanie zaplanowanego zdarzenia z kolejki po anulowaniu naprawy
    Given naprawa ma zaplanowane w kolejce zdarzenie "Potwierdzenie wizyty"
    And wiadomość potwierdzenia wizyty nie została jeszcze wysłana
    When doradca anuluje naprawę
    Then system usuwa zaplanowane zdarzenie "Potwierdzenie wizyty" z kolejki wysyłkowej

  # Business process flow (krok 9.3): zmiana daty przyjęcia przeplanowuje zdarzenie w kolejce.
  @regression
  Scenario: Przeplanowanie zdarzenia w kolejce po zmianie planowanej daty przyjęcia
    Given naprawa ma zaplanowane w kolejce zdarzenie "Potwierdzenie wizyty" na podstawie dotychczasowej daty przyjęcia
    When doradca zmienia planowaną datę przyjęcia naprawy
    Then system aktualizuje termin zaplanowanego zdarzenia "Potwierdzenie wizyty" zgodnie z nową datą przyjęcia

  # Business process flow (krok 9.4): zmiana numeru telefonu lub oferty nie zmienia już zakolejkowanego zdarzenia.
  @regression
  Scenario: Brak zmiany zakolejkowanego zdarzenia po zmianie numeru telefonu lub oferty dosprzedaży
    Given naprawa ma zaplanowane w kolejce zdarzenie "Potwierdzenie wizyty"
    When doradca zmienia numer telefonu klienta lub wybraną ofertę dosprzedaży na naprawie
    Then system pozostawia zaplanowany termin zdarzenia "Potwierdzenie wizyty" bez zmian
    And system pobiera aktualne dane naprawy dopiero w momencie realizacji zdarzenia

  # Business process flow (krok 9.5): usunięcie zadania z kalendarza usuwa zdarzenie z kolejki.
  @regression
  Scenario: Usunięcie zaplanowanego zdarzenia z kolejki po usunięciu zadania przyjęcia z kalendarza
    Given naprawa ma zaplanowane w kolejce zdarzenie "Potwierdzenie wizyty"
    When doradca usuwa zadanie przyjęcia tej naprawy z kalendarza
    Then system usuwa zaplanowane zdarzenie "Potwierdzenie wizyty" z kolejki wysyłkowej

# Zadanie QA: SVCLOUD-5611 — [QA] T14 Historia zmian przez standardowy UpdateRepair (AC3, zależność S11)
@historia-zmian-potwierdzenie-i-klient-czeka
Feature: Rejestracja w Historii zmian aktualizacji potwierdzenia wizyty i flagi Klient czeka
  Jako Doradca serwisowy chcę, aby każda automatyczna zmiana statusu potwierdzenia wizyty i flagi Klient czeka
  była widoczna w Historii zmian naprawy,
  aby mieć pełny i wiarygodny ślad audytowy zmian wywołanych integracją z VS.

  # AC3: zmiana statusu potwierdzenia wizyty jest rejestrowana w Historii zmian (zależność: S11)
  @smoke @regression
  Scenario: Zarejestrowanie w Historii zmian aktualizacji statusu potwierdzenia wizyty
    Given Planer otrzymał z VS odpowiedź klienta powodującą zmianę statusu "Potwierdzenie wizyty"
    When system zapisuje zmianę za pomocą standardowego mechanizmu aktualizacji naprawy
    Then w Historii zmian pojawia się nowy wpis dotyczący pola "Potwierdzenie wizyty"

  # AC3: zmiana flagi Klient czeka jest rejestrowana w Historii zmian (zależność: S11)
  @smoke @regression
  Scenario: Zarejestrowanie przez system zmiany wartości flagi Klient czeka w Historii zmian
    Given Planer otrzymał z VS odpowiedź klienta powodującą zmianę flagi "Klient czeka"
    When system zapisuje zmianę za pomocą standardowego mechanizmu aktualizacji naprawy
    Then w Historii zmian pojawia się nowy wpis dotyczący pola "Klient czeka"

  # AC3: brak zmiany wartości nie powinien tworzyć zbędnego wpisu w Historii zmian
  @regression
  Scenario: Brak nowego wpisu w Historii zmian, gdy odpowiedź klienta nie zmienia wartości
    Given wartość flagi "Klient czeka" jest już zgodna z odpowiedzią klienta na pytanie "Czy będziesz czekał na miejscu?"
    When system przetwarza otrzymaną odpowiedź klienta
    Then w Historii zmian nie pojawia się nowy wpis dotyczący pola "Klient czeka"

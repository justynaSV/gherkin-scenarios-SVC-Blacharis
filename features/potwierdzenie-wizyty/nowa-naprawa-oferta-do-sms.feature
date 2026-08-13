# Zadanie QA: SVCLOUD-5577 — [QA] T16 Testy e2e po „Nowa naprawa”: oferta → SAGA → SMS
@nowa-naprawa-oferta-do-sms
Feature: Przebieg od formularza Nowa naprawa z ofertą dosprzedaży do wysyłki SMS
  Jako Doradca serwisowy chcę, aby naprawa założona "z ręki" w formularzu Nowa naprawa z opcjonalną ofertą dosprzedaży
  automatycznie przeszła przez kolejkowanie, integrację z VS i wysyłkę SMS do klienta,
  aby proces potwierdzenia wizyty działał tak samo niezależnie od sposobu założenia naprawy.

  # B1, B2, B4, C1, C4: Pełny przebieg SAGA dla naprawy założonej w formularzu Nowa naprawa z wybraną ofertą.
  @smoke @regression
  Scenario: Wysyłka wiadomości dwuzakładkowej po założeniu naprawy w formularzu Nowa naprawa z wybraną ofertą
    Given naprawa założona w formularzu "Nowa naprawa" ma uzupełniony numer rejestracyjny i numer telefonu klienta
    And BOK przypisany do naprawy ma aktywny szablon wiadomości Planera dla zdarzenia "Potwierdzenie wizyty"
    And doradca wybrał szablon oferty dosprzedaży "Przegląd okresowy" w formularzu "Nowa naprawa"
    When naprawa zostaje zapisana z planowaną datą przyjęcia
    Then system dodaje zdarzenie "Potwierdzenie wizyty" do kolejki wysyłkowej
    When następuje wyzwolenie zaplanowanego zdarzenia
    Then VS zakłada nową naprawę i zwraca numer naprawy VS
    And VS generuje wiadomość zawierającą zakładkę z pytaniami potwierdzenia i zakładkę z ofertą dosprzedaży
    And klient otrzymuje wiadomość SMS z linkiem do widoku wiadomości

  # B1, B2, B4, C1, C4: Pełny przebieg SAGA dla naprawy założonej w formularzu Nowa naprawa bez wyboru oferty.
  @smoke @regression
  Scenario: Wysyłka wiadomości wyłącznie z pytaniami po założeniu naprawy w formularzu Nowa naprawa bez oferty
    Given naprawa założona w formularzu "Nowa naprawa" ma uzupełniony numer rejestracyjny i numer telefonu klienta
    And BOK przypisany do naprawy ma aktywny szablon wiadomości Planera dla zdarzenia "Potwierdzenie wizyty"
    And doradca pozostawił pole "Oferta dosprzedaży" z wartością "Bez oferty" w formularzu "Nowa naprawa"
    When naprawa zostaje zapisana z planowaną datą przyjęcia
    Then system dodaje zdarzenie "Potwierdzenie wizyty" do kolejki wysyłkowej
    When następuje wyzwolenie zaplanowanego zdarzenia
    Then VS zakłada nową naprawę i zwraca numer naprawy VS
    And VS generuje wiadomość zawierającą wyłącznie zakładkę z pytaniami potwierdzenia
    And klient otrzymuje wiadomość SMS z linkiem do widoku wiadomości

  # C1: Powiązanie numerem naprawy VS zapisywane jest niezależnie od sposobu założenia naprawy.
  @regression
  Scenario: Zapisanie powiązania z numerem naprawy VS dla naprawy założonej w formularzu Nowa naprawa
    Given naprawa została założona w formularzu "Nowa naprawa" z wewnętrznym numerem naprawy z Planera "PL-2002"
    And zdarzenie "Potwierdzenie wizyty" zostało wyzwolone dla tej naprawy
    When system przesyła dane naprawy do VS
    Then VS zakłada nową naprawę i zwraca numer naprawy VS
    And Planer zapisuje zwrócony numer naprawy VS jako powiązanie z naprawą "PL-2002"

  # Edge case: błąd integracji z VS przerywa przebieg SAGA również dla naprawy założonej w formularzu Nowa naprawa.
  @regression
  Scenario: Błąd integracji z VS podczas tworzenia naprawy założonej w formularzu Nowa naprawa
    Given zdarzenie "Potwierdzenie wizyty" zostało wyzwolone dla naprawy założonej w formularzu "Nowa naprawa"
    And VS jest w danym momencie niedostępny
    When system przesyła dane naprawy do VS
    Then Planer nie zapisuje powiązania z numerem naprawy VS
    And system nie wysyła wiadomości potwierdzenia wizyty do klienta

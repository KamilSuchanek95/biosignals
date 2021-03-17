Prosta aplikacja RoR do przechowywania i wizualizacji przebiegów czasowych biosygnałów. 

Mongodb + Amchart + Devise + Bootstrap.

![preview](/app/assets/images/preview.png)

Czego brakuje? - notatki
- opisy osi nie są uniwersalne. Jak to rozwiązać? Pominąć?
- wyświetlanie wartości na osi Y nie jest moim zdaniem odpowiednie, to znaczy: zadając "0.2" i mniejsze, oczekuję takiej samej prezentacji zamiast podwijania przecinka o 3 rzędy wielkości... byćmoże należy odpowiednio użyć właściwości "numberFormat", choć wątpię.
	(chodzi o to że zadając "0,1" otrzymuję wartości "1000" na osi rzędnych, to domyślne zachowanie jest niewygodne, jeśli zamierzam podpisać oś jednostką danych wprowadzanych mV zamiast mikroV).
- powinienem zaproponować sposób zaopatrywania bazy danych z zewnątrz, formularz tworzenia rekordów nie jest domyślnym źródłem danych aplikacji.
- obiekty rekordów powinny zostać zaopatrzone w timestamps aby móc wybierać i analizować, nie tylko poszczególne paczki-rekordy, a fragmenty z konkretnych (dostępnych) okresów. 
	Tutaj sprawa się komplikuje, co prawda wiadomobyłoby kiedy powstał rekord-paczka, czyli w przyliżeniu ostatnia amplituda sygnału, a czas poprzedzających można obliczyc na podstawie podanego okresu próbkowania (pole dt). Ostatecznie przywoływane fragmenty byłyby zawsze odrobinę większe niż stanowiłoby żądanie (przywołanie od czasu 3 do 5 zwróciłoby z bazy powiedzmy paczkę: [0 1 2 3] oraz paczkę [4 5 6 7]), w przeciwnym razie trzeba by wypytywać bazę o niektóre wartości z danego dokumentu Mongo - czy ma to sens? Albo ucinać nadmiary danych wyświetlanych - czemu skoro i tak już je pobraliśmy z bazy? Ewentualnie okrojenie można wykonać przed przetwarzaniem sygnału / pobraniem go co jest dobrym pomysłem na dalszy rozwój aplikacji.

	Więc typowy obieg pracy w narzędziu polegałby na:
	- zaopatrzeniu bazy w określone rekordy -> propozycja rozwiązania, które będzie dobrze współgrało z formatem danych w publicznych bazach sygnałów,
	- przeszukiwaniu, wyświetlaniu w obrębie aplikacji,
	- krojeniu i pobieraniu w celu dalszej analizy / albo wykonaniu jej na miejscu -> więc warto dodać model dla utworzonych fragmentów, aby nie przepadły.
- Należy również zaproponować odpowiednie role w serwisie, jak np: adm, użytkownik (jest), może obserwator -> osoba dostająca zezwolenie na wgląd i tworzenie fragmentów dla własnych celów. Aczkolwiek wystarczyłoby by każdy użytkownik dostał dodatkowe pole z listą albo "zaproszonych" albo "zaproszeń" i już.

Swoją drogą posługiwanie się Bulmą wydało mi się zręczniejsze, albo po prostu poświęciłem na to wtedy więcej czasu.

Things you may want to cover:

* Ruby version
ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux]

* Configuration
Nie użyłem niczego starego więc uruchomienie projektu nie stanowi wyzwania, w poszczególnych commitach umieściłem zastosowane polecenia. 
Warto więc użyć jednego z nich aby utworzyć plik yml dla mongoid - `to w zasadzie istotne, ponieważ nie zawarłem tego pliku w repozytorium.`

* Database creation
Użyłem darmowej subskrypcji na zdalny dostęp do bazy MongoDB, wystarczy założyć konto i postępować zgodnie z instrukcjami (sposób graficzny). Na koniec jednak warto załadować przykładowe dane (będzie taka opcja) aby w ogóle móc utworzyć bazę w danym klastrze, zręczniejszej opcji tam nie znalazłem z tego co pamiętam.


#Skrypt zmieniający domenę w adresach mailowych wszystkich użytkowników w Active Directory.
#W tym przykładzie ForEach traktowana jest jako oddzielna instrukcja.

Import-Module ActiveDirectory
#Import modułu Active directory.
#Jest niezbędny do uruchomienia komend Get-ADUser oraz Set-ADUser.

$ADusers = Get-ADUser -Filter *
#Tworzenie kolekcji $ADusers. Zawiera ona wszystkich użytkowników w AD.


#Pętla foreach dla kolekcji $ADusers. Każdy pojedyńczy obiekt oznaczony jako $ADuser.
foreach ($ADuser in $ADusers)
{
    $email = $ADuser.samaccountname + '@domena.pl'
    #Tworzenie zmiennej $email. 
    #Zmienna zawiera nazwę użytkownika wraz z dodanym przyrostkiem @domena.pl. 
    #np. dla użytkownika jan.kowalski będzie to jan.kowalski@domena.pl.

    Set-ADUser -Identity $ADuser.samaccountname -EmailAddress $email
    #Ustawienie wyżej utworzonej zmiennej jako adres mailowy.

}
#Zawartość pętli wykona się dla każdego użytkownika w kolekcji $ADusers.

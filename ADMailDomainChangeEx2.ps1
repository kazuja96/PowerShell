#Skrypt zmieniający domenę w adresach mailowych wszystkich użytkowników w Active Directory.
#W tym przykładzie użyję ForEach-Object.

Import-Module ActiveDirectory
#Import modułu Active directory.
#Jest niezbędny do uruchomienia komend Get-ADUser oraz Set-ADUser.

$ADusers = Get-ADUser -Filter *
#Tworzenie kolekcji $ADusers. Kolekcja zawiera wszystkich użytkowników w AD.

#Przesyłanie zawartości $ADusers do ForEach-Object za pomocą pipeline.
#W tym wypadku do identyfikacji pojedyńczego obiektu w kolekcji użyta jest zmienna $_ zamiast $ADuser.
$ADusers | ForEach-Object{

    $email = $_.samaccountname + '@domena.pl'
    #Tworzenie zmiennej $email. 
    #Zmienna zawiera nazwę użytkownika wraz z dodanym przyrostkiem @domena.pl. 
    #np. dla użytkownika jan.kowalski będzie to jan.kowalski@domena.pl.

    Set-ADUser -Identity $_.samaccountname -EmailAddress $email
    #Ustawienie wyżej utworzonej zmiennej jako adres mailowy.
    
}
#Zawartość pętli wykona się dla każdego użytkownika w kolekcji $ADusers.

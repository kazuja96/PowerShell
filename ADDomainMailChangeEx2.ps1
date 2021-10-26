#Skrypt zmieniający domenę w adresach mailowych wszystkich użytkowników w Active Directory.
#W tym przykładzie użyję ForEach-Object.

Import-Module ActiveDirectory

#Importuję moduł Active directory.
#Jest niezbędny do uruchomienia komend Get-ADUser oraz Set-ADUser.

$ADusers = Get-ADUser -Filter *
#Tworzę kolekcję ADusers. Zawiera ona wszystkich użytkowników w AD.

#Przesyłamy zawartość ADusers do ForEach-Object za pomocą pipeline.
#W tym wypadku do identyfikacji pojedyńczego obiektu w kolekcji użyjemy zmiennej $_ zamiast $ADuser
$ADusers | ForEach-Object{

    $email = $_.samaccountname + '@domena.pl'
    #Tworzę zmienną email. 
    #Zmienna zawiera nazwę użytkownika wraz z dodanym przyrostkiem @domena.pl. 
    #np. dla użytkownika jan.kowalski będzie to jan.kowalski@domena.pl

    Set-ADUser -Identity $_.samaccountname -EmailAddress $email
    #Ustawiam wyżej utworzoną zmienną jako adres mailowy.
    
}
#Zawartość pętli wykona się dla każdego użytkownika w kolekcji $ADusers.

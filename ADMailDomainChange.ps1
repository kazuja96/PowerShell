#Skrypt zmieniający domenę w adresach mailowych wszystkich użytkowników w Active Directory

Import-Module ActiveDirectory

#Importuję moduł Active directory.
#Jest niezbędny do uruchomienia komend Get-ADUser oraz Set-ADUser.#>

$ADusers = Get-ADUser -Filter *
#Tworzę kolekcję ADusers. Zawiera ona wszystkich użytkowników w AD.


#Rozpoczynam pętlę foreach dla kolekcji ADusers. Każdy pojedyńczy obiekt oznaczamy jako ADuser.
foreach ($ADuser in $ADusers)
{
    $email = $ADuser.samaccountname + '@domena.pl'
    #Tworzę zmienną email. 
    #Zmienna zawiera nazwę użytkownika wraz z dodanym przyrostkiem @domena.pl. 
    #np. dla użytkownika jan.kowalski będzie to jan.kowalski@domena.pl

    Set-ADUser -Identity $ADuser.samaccountname -EmailAddress $email
    #Ustawiam wyżej utworzoną zmienną jako adres mailowy.

}
#Zawartość pętli wykona się dla każdego użytkownika w kolekcji $ADusers.

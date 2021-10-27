#Skrypt importujący numery telefonów z pliku csv.

Import-Module ActiveDirectory
#Import modułu ActiveDirectory.
#Jest niezbędny do uruchomienia komendy Set-ADUser.


$NumbersList = Import-Csv -Path C:\temp\numbers.csv
#Import pliku numbers.csv, znajdujący się w lokalizacji C:\temp\numbers.csv do $NumbersList.

#Rozpoczęcie pętli foreach.
#Pętla wykonuje się dla każdego wiersza w pliku numbers.csv.
foreach ($Number in $NumbersList){

Set-ADUser -Identity $Number.samaccountname -MobilePhone $Number.telephonenumber
#Przypisanie użytkownikowi w AD numer telefonu z zaimportowanego pliku.

}

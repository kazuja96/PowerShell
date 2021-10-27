#Skrypt importujący numery telefonów z pliku csv.

Import-Module ActiveDirectory
#Importuję moduł Active directory.
#Jest niezbędny do uruchomienia komendy Set-ADUser.


$NumbersList = Import-Csv -Path C:\temp\numbers.csv
#Importuję plik numbers.csv, znajdujący się w lokalizacji C:\temp\numbers.csv do $NumbersList.

#Rozpoczynam pętle foreach.
#Pętla wykonuje się dla każdego wiersza w pliku numbers.csv.
foreach($Number in $NumbersList){

Set-ADUser -Identity $Number.samaccountname -MobilePhone $Number.telephonenumber
#Przypisuję użytkownikowi w AD numer telefonu z zaimportowanego pliku.

}

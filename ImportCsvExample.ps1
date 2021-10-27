Import-Module ActiveDirectory

#Importuję plik numbers.csv, znajdujący się w lokalizacji C:\temp\numbers.csv do $NumbersList.
$NumbersList = Import-Csv -Path C:\temp\numbers.csv

#Rozpoczynam pętle forach.
#Pętla wykonuje się dla każdego wiersza w pliku numbers.csv.
foreach($Number in $NumbersList){

#Przypisuję użytkownikowi w AD numer telefonu z zaimportowanego pliku.
Set-ADUser -Identity $Number.samaccountname -MobilePhone $Number.telephonenumber

}

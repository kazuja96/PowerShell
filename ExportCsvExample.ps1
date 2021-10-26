#Skrypt eksportujący listę procesów do pliku CSV.

Import-Module ActiveDirectory
#Importuję moduł Active directory.
#Jest niezbędny do uruchomienia komend Get-ADUser oraz Set-ADUser.

$results = Get-Process
#Tworzę zmienną results.
#Zmienna zawiera listę procesów.

$results | Export-Csv -Path C:\temp\process.csv
#Za pomocą pipeline | przekazuję zmienną results do komedy Export-Csv.
#Komenda Export-Csv zapisuje zmienną results w lokalizacji C:\temp\ jako plik process.csv

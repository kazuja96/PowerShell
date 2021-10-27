#Skrypt eksportujący listę procesów do pliku CSV.

$process = Get-Process
#Tworzenie zmiennej $process.
#Zmienna zawiera listę procesów.

$process | Export-Csv -Path C:\temp\process.csv
#Przekazanie $process za pomocą pipeline | do komedy Export-Csv.
#Komenda Export-Csv zapisuje zmienną $process w lokalizacji C:\temp\ jako plik process.csv

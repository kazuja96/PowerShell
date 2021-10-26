#Skrypt eksportujący listę procesów do pliku CSV.

$results = Get-Process
#Tworzę zmienną results.
#Zmienna zawiera listę procesów.

$results | Export-Csv -Path C:\temp\process.csv
#Za pomocą pipeline | przekazuję zmienną results do komedy Export-Csv.
#Komenda Export-Csv zapisuje zmienną results w lokalizacji C:\temp\ jako plik process.csv

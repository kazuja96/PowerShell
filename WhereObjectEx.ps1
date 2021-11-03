#Skrypt wyświetlający konta z departamentu "Test"

Import-Module ActiveDirectory
#Import modułu Active directory.

Get-ADUser -Filter 'Department -eq "Test"'
#Wybieranie kont za pomocą parametru -Filter

Get-ADUser -Properties Department -Filter * | Where-Object Department -eq 'Test'
#Wybieranie kont za pomocą Where-Object.
#W tym wypadku wynik polecenia Get-ADUser jest przesyłany do Where-Object za pomocą pipelne.

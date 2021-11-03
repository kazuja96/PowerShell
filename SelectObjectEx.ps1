#Skrypt wyświetlający nazwę konta oraz ostatnią datę logowania kont zalogowanych w ciągu ostatnich 30 dni.

Import-Module ActiveDirectory
#Import modułu Active directory.

$Date = (get-date).adddays(-30)
#Utworzenie zmiennej $Date.
#Zmienna zawiera datę 30 dni wstecz.

Get-ADUser -properties * -filter {(lastlogondate -ge $Date)} | Select-Object samaccountname,lastlogondate
#Wybranie kont, których lastlogondate jest późniejszy lub równy $Date.
#Dzięki Select-Object wynik zostanie wyświetlony w postaci:
#samaccountname lastlogondate
#konto1         01.01.2021 01:01:01
#konto2         02.01.2021 02:02:02
#...

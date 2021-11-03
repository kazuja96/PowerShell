#Skrypt wyświetlający zawartość folderu $path wraz z podfolderami

$path = 'C:\Users\support\desktop\*.*'
#W zmiennej path umieszczona jest lokalizacja, która będzie przeszukiwana


Get-ChildItem -Path $path -Recurse
#Dzięki parametrowi -Recurse, zawartość folderu $path jest przeszukiwana wraz z podfolderami

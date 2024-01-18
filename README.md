#BetterCollab
Die BetterCollab-Lösung der Joker IT automatisiert die Provisionierung und Archivierung, verwaltet den Lifecycle, setzt Standards und hilft den Benutzern sich einfacher zurechtzufinden. Durch die Implementierung von BetterCollab wird somit eine einheitliche Struktur sichergestellt. Begleit-Prozesse werden dann von der Erstellung bis zur Deaktivierung vom System gelenkt. Die automatisierte Provisionierung erhöht die Produktivität der Mitarbeiter und Kontrolle der unterschiedlichen Umgebungen über deren gesamte Verwendungsdauer.

#Architektur
Die Lösung besteht aus mehreren Komponenten:
##Azure Function Apps mit Powershell: 
Nutzt die GraphApi von M365 für die Erstellung von Groups, Teams und PNP Powershell für die Provisionierung von SharePoint.¨

###API App: 
Nimmt Requests entgegen, egal ob von einer Business-Applikation oder aus einem SharePoint-Formular.
###Mainbackend App: 
Zuständig für die Provisionierung der M365-Ressourcen.
###Grooming App: 
Zeitgesteuerte Funktionen, welche Änderungen tracken und zurück in die Lösung schreiben, damit immer alle Infos up to date sind.

#Implementierung
Als modularisierte Lösung ist BetterCollab schnell im Betrieb integriert und durch die Experten der Joker IT an Ihre individuellen Bedürfnisse angepasst. Die Lösung wird in DevOps gehostet und über Release-Pipelines direkt in die Azure-Ressourcen deployed.
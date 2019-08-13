# dyontvcast
Youtube Cast Skripte für DYON Smart 40 PRO 100,3 cm (40 Zoll) Fernseher (Full-HD, Triple Tuner, Smart TV, HbbTV)

Da arbeitet man am Rechner auf der Kommandozeile, sieht vielleicht einen Youtube-Link auf Twitter. Fernseher steht vielleicht sogar in Sichtweite.

Viele moderne Smart-TV haben DIAL implementiert aber weder in der Bedienungsanleitung dokumentiert, noch sind die Hersteller auskunftsfreudig. 

Hat eine Weile gedauert bis ich rausgefunden habe, wie es beim DYON Smart 40 PRO geht, aber es geht. Alle Chromecast-Apps gehen nicht, weil die alle fix 8008 als Port einprogrammiert haben. Der Dyon hat DIAL auf Port 56789

Im Prinzip müsste das Script auch mit anderen DIAL-fähigen Smart-TV funktionieren, eventuell ist der Port zu ändern. 

Die IP-Adresse seines Fernsehers kann man ja im Menü nachschauen. Statt dem zweiten Argument kann man sie ja auch fix eintragen, wenn sie sich im eigenen LAN/WLAN nicht ändert. 

Aufruf ist dann nur noch cast.sh YOUTUBEURL 

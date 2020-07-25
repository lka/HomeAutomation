Hallo, 

mit diesem Programm/Script k�nnen Sie einfach von einem bestimmten Ordner ein Backup erstellen, welches sp�ter auf einem FTP Server hochgeladen wird.

Installation:

- Laden Sie das Script herunter:

wget http://blog.thetutorial.de/wp-content/uploads/Backupscript.zip

(Oder laden Sie es auf Ihren Server per FTP oder SFTP)


- Entpacken Sie die Datei: 

unzip Backupscript.zip

(Wenn der Befehl 'unzip' dem System nicht bekannt ist, installieren Sie es mit: apt-get install unzip)

- �ffen Sie es die Datei:

nano backupscript.sh


- Passen Sie folgende Variable an:

server_ip='DEINE SERVER IP ODER DOMAIN'
server_user='DEIN FTP USER'
server_userpassword='DEIN FTP PASSWORT'
server_dir='WO SOLL DIE DATEI GESPERICHTER WERDEN (FTP SERVER PFAD)'

backup_name=backup_`date +%d-%m-%y_%H.%M.%S`
backup_format='.zip'
backup_folder='VON WELCHEM ORDNER SOLL EIN BACKUP ERSTELLT WERDEN'


(Ersetzen Sie hierf�r einfach zb 'DEINE SERVER IP ODER DOMAIN' mit Ihrer Server IP, auf der das Backup gespeichert werden soll, zb. '11.11.11.11' oder Ihrer Server Domain zb. TheTutorial.de) 


- Speichern Sie das angepasste Script mit "STRG + O" ab (in nano)


- Geben Sie Ihm die notwendigen Rechte:

chmod 777 backupscript.sh


- Starten Sie es:

./backupscript.sh



Tipp:
-----

Wenn das Script regelm��ig ausgef�hrt werden soll, dann verschieben Sie es in den geeigneten Cron oder:

# Verschieb das Script in den Ordner cron und wird T�GLICH ausgef�hrt
mv backupscript.sh /etc/cron.daily

# Verschieb das Script in den Ordner cron und wird ST�NDLICH ausgef�hrt
mv backupscript.sh /etc/cron.hourly

# Verschieb das Script in den Ordner cron und wird W�CHENDLICH ausgef�hrt
mv backupscript.sh /etc/cron.weekly

# Verschieb das Script in den Ordner cron und wird MONATLICH ausgef�hrt
mv backupscript.sh /etc/cron.monthly



Sollen Fragen aufkommen, so kommentieren Sie das YouTube Video/den Artikel auf TheTutorial.de oder schreiben uns eine E-mail an:

support@TheTutorial.de


Viel Spa� mit dem Script, 
Ihr TheTutorial.de

http://www.TheTutorial.de
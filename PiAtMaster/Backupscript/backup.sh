#!/bin/bash
# Lka, 11.06.2020
#
# kopieren der gepackten Datensicherung auf die Fritz Box und löschen veralteter Daten
#
server=fritz.box
user=$username
password=$pwd

backup_folder=$1
backup_dir=`basename $backup_folder`
backup_name=backup_`date +%y-%m-%d_%H.%M`
backup_format=.tar.gz
mountpoint=/tmp/ftpserver
rotate=14
exclude=

if [ ! -z "$2" ]; then
  exclude="--exclude=$2"
fi

# Einstellungen darstellen
function SHOW()
{
echo "Server:   $server"
echo "User:     $user"
echo "Password: ******"
echo "Backup:   $backup_folder"
echo "Remote:   $backup_dir"
echo "Rotate:   $rotate days"
}

# Dateien packen
function PACK()
{
cd $backup_folder
cd ..

echo tar ${exclude} -cf $backup_name$backup_format $backup_folder
tar ${exclude} -cf $backup_name$backup_format $backup_folder
echo "Groesse der Datei: $(du -h ${backup_name}${backup_format}  | awk 'END{ print $1 }')"
}

# Backup file kopieren
function COPY()
{
if [ ! -d $mountpoint/$backup_dir ]; then
  mkdir $mountpoint/$backup_dir
fi

cp -v $backup_name$backup_format $mountpoint/$backup_dir
rm -r $backup_name$backup_format
}

# FTP Verzeichnis mounten
function MOUNT()
{
if [ ! -d $mountpoint ]; then
  mkdir $mountpoint
fi

curlftpfs $user:$password@$server $mountpoint -o allow_other,disable_eprt
}

# FTP Verzeichnis aushängen
function UMOUNT()
{
fusermount -u $mountpoint
}

# alte Dateien löschen
function OLDDEL()
{
# Here we have the attempt at deleting, notice the "+"
find $mountpoint/$backup_dir -type f -name '*.tar.gz' -mtime +$rotate -delete
}

SHOW
PACK
MOUNT
COPY
OLDDEL
UMOUNT



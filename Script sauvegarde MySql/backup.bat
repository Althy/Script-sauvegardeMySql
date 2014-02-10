@echo off
rem auteur : Antunes Alan
rem tache : Sauvegarde des BDD GLPI, information_schéma et mysql

rem definit le format de date et d'heure
SET YYYYMMDD=%DATE:~6,4%-%DATE:~3,2%-%DATE:~2,0%
for /f "tokens=1,2,3,4,5,6 delim==:.-/, " %% A in ("%TIME%") do SET MYTIME=%%Ah%%B

echo Serveur : Nomserveur.domaine.lan > backupconf\mail.txt
echo Nom des bases : "GLPI, information_schéma" >> backup_conf\mail.txt
echo Nom utilisateur : "companie\administrateur" >> backup_conf\mail.txt
echo Date : %YYYYMMDD% >> backup_conf\mail.txt
echo Heure : %MYTIME% >> backup_conf\mail.txt

echo _____________________________________________________________________ >> backup_conf\mail.txt

echo Début de la tache de sauvegarde des bases de donnees mysql >> backup_conf\mail.txt

echo _____________________________________________________________________ >> backup_conf\mail.txt

echo sauvegarde de GLPI >> backup_conf\mail.txt

E:\Bases\mysql\bin\mysql5.0.45\bin\mysqldump -u username -p passwd glpi > "F:\Sauvegarde\Sauvegarde mysql\database\glpi.sql

echo _____________________________________________________________________ >> backup_conf\mail.txt

echo sauvegarde de information_schema >> backup_conf\mail.txt

E:\Bases\mysql\bin\mysql5.0.45\bin\mysqldump -u username -p passwd information_schema > "F:\Sauvegarde\Sauvegarde mysql\database\information_schema.sql

echo _____________________________________________________________________ >> backup_conf\mail.txt

echo sauvegarde de mysql >> backup_conf\mail.txt

E:\Bases\mysql\bin\mysql5.0.45\bin\mysqldump -u username -p passwd mysql > "F:\Sauvegarde\Sauvegarde mysql\database\mysql.sql

echo _____________________________________________________________________ >> backup_conf\mail.txt

echo . >> backup_conf\mail.txt
echo . >> backup_conf\mail.txt
echo Mail envoyé depuis servername par le script F:\Sauvegarde\Sauvegarde mysql\backup.bat >> backup_conf\mail.txt
echo . >> backup_conf\mail.txt
echo . >> backup_conf\mail.txt
echo **SSR** >> backup_conf\mail.txt
blat\blat.exe -of backup_conf\mail_SAVE_MYSQL.txt

echo . > backup_conf\mail.txt
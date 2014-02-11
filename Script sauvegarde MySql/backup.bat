@echo off
rem auteur : Antunes Alan
rem tache : Sauvegarde des BDD GLPI, information_sch�ma et mysql

rem definit le format de date et d'heure
SET YYYYMMDD=%DATE:~6,4%-%DATE:~3,2%-%DATE:~2,0%
rem Format de la date explice : annee-mois-jour
for /f "tokens=1,2,3,4,5,6 delim==:.-/, " %% A in ("%TIME%") do SET MYTIME=%%Ah%%B
rem Format de l'heure : heure h minutes

rem Affichage des informations a propos de la sauvegarde
echo Serveur : Nomserveur.domaine.lan > backupconf\mail.txt
rem la simple redirection écrase le mail du jour précédent
echo Nom des bases : "GLPI, information_schema" >> backup_conf\mail.txt
echo Nom utilisateur : "companie\administrateur" >> backup_conf\mail.txt
echo Date : %YYYYMMDD% >> backup_conf\mail.txt
echo Heure : %MYTIME% >> backup_conf\mail.txt

echo _____________________________________________________________________ >> backup_conf\mail.txt
rem les lignes echo servent a formater le mail pour plus de clarté

echo Debut de la tache de sauvegarde des bases de donnees mysql >> backup_conf\mail.txt

echo _____________________________________________________________________ >> backup_conf\mail.txt

echo sauvegarde de GLPI >> backup_conf\mail.txt

E:\Bases\mysql\bin\mysql5.0.45\bin\mysqldump -u username -p passwd glpi > "F:\Sauvegarde\Sauvegarde mysql\database\glpi.sql"
rem commande de sauvegarde de la base de données grace a l'appel de la fonction mysqldump
echo sauvegarde de GLPI effectuee
rem si la sauvegarde ne peux aboutir, le reste du mail ne sera pas affiché, le message est appres pour cette raison

echo _____________________________________________________________________ >> backup_conf\mail.txt

echo sauvegarde de information_schema >> backup_conf\mail.txt

E:\Bases\mysql\bin\mysql5.0.45\bin\mysqldump -u username -p passwd information_schema > "F:\Sauvegarde\Sauvegarde mysql\database\information_schema.sql"
rem commande de sauvegarde de la base de données grace a l'appel de la fonction mysqldump
echo sauvegarde de GLPI effectuee
rem si la sauvegarde ne peux aboutir, le reste du mail ne sera pas affiché, le message est appres pour cette raison

echo _____________________________________________________________________ >> backup_conf\mail.txt

echo sauvegarde de mysql >> backup_conf\mail.txt

E:\Bases\mysql\bin\mysql5.0.45\bin\mysqldump -u username -p passwd mysql > "F:\Sauvegarde\Sauvegarde mysql\database\mysql.sql"
rem commande de sauvegarde de la base de données grace a l'appel de la fonction mysqldump
echo sauvegarde de GLPI effectuee
rem si la sauvegarde ne peux aboutir, le reste du mail ne sera pas affiché, le message est appres pour cette raison

echo _____________________________________________________________________ >> backup_conf\mail.txt

echo . >> backup_conf\mail.txt
echo . >> backup_conf\mail.txt
echo Mail envoye depuis servername par le script F:\Sauvegarde\Sauvegarde mysql\backup.bat >> backup_conf\mail.txt
rem pour retrouver le script si il y a un probleme
echo . >> backup_conf\mail.txt
echo . >> backup_conf\mail.txt
echo **SSR** >> backup_conf\mail.txt
rem flag pour les regles metier de GLPI : assigne aux bon techniciens ce ticket
blat\blat.exe -of backup_conf\mail_SAVE_MYSQL.txt
rem appel de la conftion blat.exe
rem -of pour les flags de blat <output file>

echo . > backup_conf\mail.txt
rem on vide le mail a la fin de la sauvegarde par sécurite

$DATE=Get-Date

echo "Serveur : Myslq.srv.GSB.coop" > C:\Users\Administrateur\Documents\backup_conf\save.log
echo "Nom des bases : GLPI" >> C:\Users\Administrateur\Documents\backup_conf\save.log
echo "Nom utilisateur : GSB/administrateur" >> C:\Users\Administrateur\Documents\backup_conf\save.log
echo "$DATE" >> C:\Users\Administrateur\Documents\backup_conf\save.log

echo "______________________________________________________________"

echo "Debut de la tache de sauvegarde de bases de donnees"

echo "______________________________________________________________"

echo "sauvegarde de GLPI" >> C:\Users\Administrateur\Documents\backup_conf\save.log

C:\xampp\mysql\bin\mysqldump --opt --single-transaction --databases glpi -u root > C:\Users\Administrateur\Documents\Sauvegarde\glpi.sql

echo "sauvegarde effectuee" >> C:\Users\Administrateur\Documents\backup_conf\save.log

echo "______________________________________________________________"
write-host sauvegarde effectuée

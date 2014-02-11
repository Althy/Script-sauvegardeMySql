@echo off

rem auteur : Antunes Alan
rem tache : Sauvegarde des BDD GLPI, information_schema et mysql

SET FLD=database_manu
rem sert a supprimer le contenu du dossier
SET path=F:\Sauvegarde\Sauvegarde mysql\database_manu\
rem rend la commande plus oourte et permet, si le chemin change, de modifier plus facilement le script

rem definit le format de date et d'heure
SET YYYYMMDD=%DATE:~6,4%-%DATE:~3,2%-%DATE:~2,0%
for /f "tokens=1,2,3,4,5,6 delim==:.-/, " %% A in ("%TIME%") do SET MYTIME=%%Ah%%B
SET MYDATE=%YYYYMMDD%_%MYTIME%
rem stocke la date et l'heure dans une vairable pour rendre la commande plus courte

rem Avant de lancer la sauvegarde, voulez vous vider les dossier database_manu, ou garder son contenu ?
set/p val=supprimer [y/n]?:
rem comme le script s'execute dans l'invite de commande les commentaires sont visibles
if "%val%"=="y"(
del /S /Q "%FLD%\*.sql"
rem supprime le contenu du dossier pour gagner de la place sur le serveur
) else (
echo pensez a supprimer le contenu du dossier \database_manu\ plus tard
rem rappel au cas ou l'utilisateur ne supprime pas le contenu du dossier
)

echo Serveur : Nomserveur.domaine.lan
echo Nom des bases : "GLPI, information_schema"  
echo Nom utilisateur : "companie\administrateur"  
echo Date : %YYYYMMDD%  
echo Heure : %MYTIME%
rem tout cet affichage n'est pas tres utile pour ce script mais il permet de situer l'execution

echo _____________________________________________________________________  

echo Debut de la tache de sauvegarde des bases de donnees mysql  

echo _____________________________________________________________________  

echo sauvegarde de GLPI  

E:\Bases\mysql\bin\mysql5.0.45\bin\mysqldump -u username -p passwd glpi > "%FLD%\glpi_%MYDATE%.sql"
echo sauvegarde de GLPI effectuee
rem commande de sauvegarde de la base de données grace a l'appel de la fonction mysqldump
rem %FLD% pour le chemin et %MYDATE% pour afficher la date et l'heure

echo _____________________________________________________________________  

echo sauvegarde de information_schema  

E:\Bases\mysql\bin\mysql5.0.45\bin\mysqldump -u username -p passwd information_schema > "%FLD%\information_schema_%MYDATE%.sql"
echo sauvegarde de information_schema effectuee
rem commande de sauvegarde de la base de données grace a l'appel de la fonction mysqldump
rem %FLD% pour le chemin et %MYDATE% pour afficher la date et l'heure

echo _____________________________________________________________________  

echo sauvegarde de mysql  

E:\Bases\mysql\bin\mysql5.0.45\bin\mysqldump -u username -p passwd mysql > "%FLD%\mysql_%MYDATE%.sql"
echo sauvegarde de mysql effectuee
rem commande de sauvegarde de la base de données grace a l'appel de la fonction mysqldump
rem %FLD% pour le chemin et %MYDATE% pour afficher la date et l'heure

echo _____________________________________________________________________  


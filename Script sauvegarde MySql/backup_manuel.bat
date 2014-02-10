@echo off

rem auteur : Antunes Alan
rem tache : Sauvegarde des BDD GLPI, information_schéma et mysql


SET FLD=database_manu
SET path=F:\Sauvegarde\Sauvegarde mysql\database_manu\

rem definit le format de date et d'heure
SET YYYYMMDD=%DATE:~6,4%-%DATE:~3,2%-%DATE:~2,0%
for /f "tokens=1,2,3,4,5,6 delim==:.-/, " %% A in ("%TIME%") do SET MYTIME=%%Ah%%B
SET MYDATE=%YYYYMMDD%_%MYTIME%
rem Avant de lancer la sauvegarde, voulez vous vider les dossier database_manu, ou garder son contenu ?
set/p val=supprimer [y/n]?:

if "%val%"=="y"(
del /S /Q "%FLD%\*.sql"
) else (
echo pensez a supprimer le contenu du dossier \database_manu\ plus tard
)

echo Serveur : Nomserveur.domaine.lan > backupconf\mail.txt
echo Nom des bases : "GLPI, information_schéma"  
echo Nom utilisateur : "companie\administrateur"  
echo Date : %YYYYMMDD%  
echo Heure : %MYTIME%  

echo _____________________________________________________________________  

echo Début de la tache de sauvegarde des bases de donnees mysql  

echo _____________________________________________________________________  

echo sauvegarde de GLPI  

E:\Bases\mysql\bin\mysql5.0.45\bin\mysqldump -u username -p passwd glpi > "%FLD%\glpi_%MYDATE%.sql
echo sauvegarde de GLPI effectuee
echo _____________________________________________________________________  

echo sauvegarde de information_schema  

E:\Bases\mysql\bin\mysql5.0.45\bin\mysqldump -u username -p passwd information_schema > "%FLD%\information_schema_%MYDATE%.sql
echo sauvegarde de information_schema effectuee
echo _____________________________________________________________________  

echo sauvegarde de mysql  

E:\Bases\mysql\bin\mysql5.0.45\bin\mysqldump -u username -p passwd mysql > "%FLD%\mysql_%MYDATE%.sql
echo sauvegarde de mysql effectuee
echo _____________________________________________________________________  


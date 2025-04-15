# comment faire tourner le docker pour la base postgres

voici les commandes qu’il faut taper dans le terminal pour lancer le docker et avoir la base les_loups_db qui marche

faut d’abord aller dans le dossier docker sinon ca peut pas fonctionner

on tape :
cd docker (cette commande elle va lancer le docker et executer tous les fichiers sql automatiquement ) 



docker-compose up --build (Cette commande vas installer postgres (si c’est pas deja fait)



créer la base les_loups_db

executer tous les fichiers sql qui sont dans le dossier init

infos de connexion a la bdd
host : localhost

port : 5432

user : postgres

mot de passe : xxx

base : les_loups_db


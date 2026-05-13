@echo off
cd /d C:\xampp\htdocs\gestion_interventions
rd /s /q tmp\cache 2>nul
mkdir tmp\cache\persistent 2>nul
mkdir tmp\cache\models 2>nul
mkdir tmp\cache\views 2>nul
php bin\cake.php server -p 8765
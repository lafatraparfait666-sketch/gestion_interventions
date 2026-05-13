@echo off
title SIGIT - Serveur
echo ============================================
echo    SIGIT - Ministere du Numerique
echo    Demarrage du serveur...
echo ============================================
echo.
cd /d C:\xampp\htdocs\gestion_interventions

echo Demarrage MySQL...
net start mysql 2>nul
timeout /t 3 /nobreak >nul

echo Nettoyage cache...
rd /s /q tmp\cache 2>nul
mkdir tmp\cache\persistent 2>nul
mkdir tmp\cache\models 2>nul
mkdir tmp\cache\views 2>nul

echo Demarrage serveur PHP...
start /b php bin\cake.php server -p 8765

echo Attente serveur...
timeout /t 5 /nobreak >nul

echo Ouverture navigateur...
start "" "http://localhost:8765/login"

echo.
echo ============================================
echo    Serveur actif sur http://localhost:8765
echo    Ne fermez pas cette fenetre !
echo ============================================
php bin\cake.php server -p 8765
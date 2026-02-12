#!/bin/bash

# Script de inicialización del repositorio GitHub
# Sistema de Geolocalización - Microservicios

echo "======================================"
echo "Inicializando Repositorio GitHub"
echo "======================================"
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -f "README.md" ]; then
    echo "Error: README.md no encontrado. Asegúrate de estar en el directorio raíz del proyecto."
    exit 1
fi

# Paso 1: Inicializar Git
echo "Paso 1: Inicializando Git..."
git init
git add .
git commit -m "Initial commit: Sistema de geolocalización con microservicios"

# Paso 2: Crear rama main
echo "Paso 2: Configurando rama main..."
git branch -M main

# Paso 3: Conectar con repositorio remoto
echo "Paso 3: Conectando con GitHub..."
echo "Ingresa la URL de tu repositorio GitHub:"
echo "Ejemplo: https://github.com/tu-usuario/sistema-geolocalizacion-microservicios.git"
read -p "URL: " REPO_URL

git remote add origin "$REPO_URL"
git push -u origin main

# Paso 4: Crear rama develop
echo "Paso 4: Creando rama develop..."
git checkout -b develop
git push -u origin develop

# Paso 5: Crear ramas feature de ejemplo
echo "Paso 5: Creando ramas feature de ejemplo..."

# Feature: Autenticación JWT
git checkout -b feature/autenticacion-jwt develop
echo "# MS-Autenticacion - Feature JWT" > microservices/ms-autenticacion/FEATURE.md
git add microservices/ms-autenticacion/FEATURE.md
git commit -m "feat: add JWT authentication feature"
git push -u origin feature/autenticacion-jwt

# Feature: Mapeo en tiempo real
git checkout develop
git checkout -b feature/mapeo-tiempo-real
echo "# MS-Mapeo - Feature Real-Time" > microservices/ms-mapeo/FEATURE.md
git add microservices/ms-mapeo/FEATURE.md
git commit -m "feat: add real-time geolocation feature"
git push -u origin feature/mapeo-tiempo-real

# Feature: Gestión de horarios
git checkout develop
git checkout -b feature/gestion-horarios
mkdir -p microservices/ms-horarios
echo "# MS-Horarios - Feature Schedules" > microservices/ms-horarios/FEATURE.md
git add microservices/ms-horarios/FEATURE.md
git commit -m "feat: add schedule management feature"
git push -u origin feature/gestion-horarios

# Paso 6: Crear rama release
git checkout develop
git checkout -b release/v1.0.0
git push -u origin release/v1.0.0

# Volver a develop
git checkout develop

echo ""
echo "¡Repositorio inicializado exitosamente!"
echo ""
echo "======================================"
echo "Próximos pasos:"
echo "======================================"
echo "1. Ve a GitHub Settings → Branches"
echo "2. Configura Branch Protection para 'main' y 'develop'"
echo "3. Ve a Settings → Secrets and variables → Actions"
echo "4. Agrega los secrets: AWS_ACCESS_KEY_ID y AWS_SECRET_ACCESS_KEY"
echo ""
echo "Ramas creadas:"
echo "  • main (producción)"
echo "  • develop (desarrollo)"
echo "  • feature/autenticacion-jwt"
echo "  • feature/mapeo-tiempo-real"
echo "  • feature/gestion-horarios"
echo "  • release/v1.0.0"
echo ""
echo "Para ver todas las ramas: git branch -a"
echo "======================================"

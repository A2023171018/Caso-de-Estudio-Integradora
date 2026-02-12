# Guía de Instalación y Comandos

## 1. Configuración Inicial del Repositorio

### Crear el repositorio en GitHub
```bash
# En GitHub, crear nuevo repositorio: sistema-geolocalizacion-microservicios
# Luego en tu máquina local:

git init
git add .
git commit -m "Initial commit: Proyecto sistema de geolocalización"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/sistema-geolocalizacion-microservicios.git
git push -u origin main
```

### Crear rama develop
```bash
git checkout -b develop
git push -u origin develop
```

### Crear ramas feature de ejemplo
```bash
# Feature: Autenticación JWT
git checkout -b feature/autenticacion-jwt develop
echo "# MS-Autenticacion - Feature JWT" > microservices/ms-autenticacion/FEATURE.md
git add .
git commit -m "feat: add JWT authentication feature"
git push -u origin feature/autenticacion-jwt

# Feature: Mapeo en tiempo real
git checkout develop
git checkout -b feature/mapeo-tiempo-real
echo "# MS-Mapeo - Feature Real-Time" > microservices/ms-mapeo/FEATURE.md
git add .
git commit -m "feat: add real-time geolocation feature"
git push -u origin feature/mapeo-tiempo-real

# Feature: Gestión de horarios
git checkout develop
git checkout -b feature/gestion-horarios
echo "# MS-Horarios - Feature Schedules" > microservices/ms-horarios/FEATURE.md
git add .
git commit -m "feat: add schedule management feature"
git push -u origin feature/gestion-horarios
```

### Crear rama release
```bash
git checkout develop
git checkout -b release/v1.0.0
git push -u origin release/v1.0.0
```

## 2. Configurar Branch Protection en GitHub

### Pasos en la interfaz de GitHub:
1. Ir a Settings → Branches
2. Agregar regla para `main`:
   - Branch name pattern: `main`
   - ✅ Require pull request reviews before merging
   - ✅ Require status checks to pass before merging
   - ✅ Require branches to be up to date before merging

3. Agregar regla para `develop`:
   - Branch name pattern: `develop`
   - ✅ Require pull request reviews before merging

## 3. Configurar Secrets en GitHub

Settings → Secrets and variables → Actions → New repository secret

```
AWS_ACCESS_KEY_ID=<tu-access-key>
AWS_SECRET_ACCESS_KEY=<tu-secret-key>
```

## 4. Comandos útiles de Git

### Ver todas las ramas
```bash
git branch -a
```

### Cambiar entre ramas
```bash
git checkout main
git checkout develop
git checkout feature/nombre-feature
```

### Merge de feature a develop
```bash
git checkout develop
git merge feature/autenticacion-jwt
git push origin develop
```

### Crear Pull Request
```bash
# Desde GitHub UI:
# 1. Ir a "Pull requests" → "New pull request"
# 2. Base: develop ← Compare: feature/nombre-feature
# 3. Create pull request
```

## 5. Comandos de Kubernetes

### Aplicar configuraciones
```bash
kubectl apply -f kubernetes/deployments/
kubectl apply -f kubernetes/ingress/
```

### Ver estado de deployments
```bash
kubectl get deployments
kubectl get pods
kubectl get services
kubectl get ingress
```

### Ver logs
```bash
kubectl logs -f deployment/ms-autenticacion
kubectl logs -f deployment/ms-mapeo
```

### Rollback manual
```bash
kubectl rollout undo deployment/ms-autenticacion
kubectl rollout status deployment/ms-autenticacion
```

## 6. Comandos de Docker

### Build local
```bash
cd microservices/ms-autenticacion
docker build -t ms-autenticacion:dev .
docker run -p 8000:8000 ms-autenticacion:dev
```

### Ver imágenes y contenedores
```bash
docker images
docker ps
docker ps -a
```

## 7. Comandos AWS ECR

### Login a ECR
```bash
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin <AWS_ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com
```

### Crear repositorios
```bash
aws ecr create-repository --repository-name ms-autenticacion
aws ecr create-repository --repository-name ms-mapeo
aws ecr create-repository --repository-name ms-horarios
```

## 8. Testing local

### Python tests
```bash
cd microservices/ms-autenticacion
pip install -r requirements.txt
pytest tests/
```

## 9. Capturas necesarias para el profesor

1. **Vista de ramas**: `git branch -a` o GitHub UI
2. **Network graph**: GitHub → Insights → Network
3. **Branch protection**: Settings → Branches
4. **Pull Request**: Crear PR de feature → develop
5. **GitHub Actions**: Ver workflow ejecutándose

## 10. Flujo de trabajo típico

```bash
# 1. Crear nueva feature
git checkout develop
git pull origin develop
git checkout -b feature/nueva-funcionalidad

# 2. Hacer cambios y commits
git add .
git commit -m "feat: descripción del cambio"

# 3. Push a GitHub
git push -u origin feature/nueva-funcionalidad

# 4. Crear Pull Request en GitHub
# develop ← feature/nueva-funcionalidad

# 5. Después de aprobación, merge
# El CI/CD automáticamente desplegará a Testing

# 6. Para producción
git checkout main
git merge develop
git push origin main
# El CI/CD automáticamente desplegará a Producción
```

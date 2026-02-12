# Repositorio GitHub - Estrategia de Ramificación GitFlow

## 📌 Enlace del Repositorio

**URL:** `https://github.com/TU-USUARIO/sistema-geolocalizacion-microservicios`

---

## 🌿 Estructura de Ramas Implementada (GitFlow)

### Ramas Principales
- **`main`** → Código en producción (protegida)
- **`develop`** → Integración de desarrollo (protegida)

### Ramas de Soporte
- **`feature/<nombre>`** → Nuevas funcionalidades
  - `feature/autenticacion-jwt`
  - `feature/mapeo-tiempo-real`
  - `feature/gestion-horarios`
  
- **`release/<version>`** → Preparación de versiones
  - `release/v1.0.0`
  
- **`hotfix/<nombre>`** → Correcciones urgentes en producción

---

## 🔄 Flujo de Trabajo

```
feature/* → develop → release/* → main
                                   ↑
hotfix/* ──────────────────────────┘
```

**Proceso:**
1. Desarrollo en `feature/nueva-funcionalidad`
2. Pull Request → `develop`
3. CI/CD automático → Deploy a Testing
4. Release → `release/v1.0.0`
5. Merge a `main` → Deploy a Producción

---

## 🔒 Protección de Ramas

### Configuración en GitHub (Settings → Branches)

**Rama `main`:**
- ✅ Require pull request reviews before merging
- ✅ Require status checks to pass before merging
- ✅ Require branches to be up to date before merging

**Rama `develop`:**
- ✅ Require pull request reviews before merging

---

## 📸 Evidencias

### 1. Vista de Ramas
Captura de pantalla mostrando todas las ramas en GitHub:
- main
- develop
- feature/autenticacion-jwt
- feature/mapeo-tiempo-real
- feature/gestion-horarios
- release/v1.0.0

### 2. Network Graph
Captura de GitHub → Insights → Network mostrando el flujo GitFlow

### 3. Branch Protection Rules
Captura de Settings → Branches → Branch protection rules para `main` y `develop`

### 4. Pull Request Example
Captura de un Pull Request de `feature/autenticacion-jwt` → `develop`

### 5. GitHub Actions Workflow
Captura de Actions mostrando el pipeline CI/CD ejecutándose

---

## 🚀 Comandos de Inicialización

```bash
# Clonar el repositorio
git clone https://github.com/TU-USUARIO/sistema-geolocalizacion-microservicios.git
cd sistema-geolocalizacion-microservicios

# Ver todas las ramas
git branch -a

# Cambiar a develop
git checkout develop

# Crear nueva feature
git checkout -b feature/mi-nueva-funcionalidad
```

---

## 📂 Estructura del Proyecto

```
sistema-geolocalizacion-microservicios/
├── .github/
│   └── workflows/
│       ├── ci-cd-testing.yml
│       └── ci-cd-production.yml
├── microservices/
│   ├── ms-autenticacion/
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   ├── ms-mapeo/
│   └── ms-horarios/
├── kubernetes/
│   ├── deployments/
│   │   ├── ms-autenticacion-deployment.yaml
│   │   └── ms-mapeo-deployment.yaml
│   └── ingress/
│       └── ingress.yaml
├── docs/
│   └── INSTALLATION.md
├── .gitignore
└── README.md
```

---

## ✅ Checklist de Configuración

- [ ] Repositorio creado en GitHub
- [ ] Todas las ramas creadas (main, develop, features, release)
- [ ] Branch protection configurado
- [ ] GitHub Actions secrets agregados (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY)
- [ ] README.md completo
- [ ] Workflows CI/CD configurados
- [ ] Kubernetes manifests listos

---

## 📖 Documentación Adicional

- **README.md**: Documentación principal del proyecto
- **docs/INSTALLATION.md**: Guía de instalación y comandos
- **init-repo.sh**: Script automático de inicialización

---

## 🎯 Triggers del Pipeline CI/CD

| Rama | Acción | Pipeline | Destino |
|------|--------|----------|---------|
| `feature/*` | Push | Solo CI | - |
| `develop` | Merge | CI/CD completo | Testing |
| `main` | Merge | CI/CD completo | Production |
| `hotfix/*` | Push | CI/CD completo | Production |

---

**Fecha de creación:** $(date)
**Estrategia:** GitFlow
**Despliegue:** Rolling Deployment en AWS EKS

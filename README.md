Sistema de Geolocalización - Microservicios
Sistema de geolocalización en tiempo real basado en microservicios, desplegado en Kubernetes (EKS) con arquitectura escalable y alta disponibilidad.
Arquitectura
Microservicios

MS-Autenticación (5 réplicas)

Gestión de Usuarios
Gestión de Eventos
Autenticación JWT
Generación de Reportes


MS-Mapeo (5 réplicas)

Gestión de Rutas
Geolocalización en Tiempo Real
Backend de Mapeo
Notificaciones
Sistema de Búsqueda


MS-Servicio de Horarios

Gestión de Horarios
Integración con Calendario



Infraestructura

Kubernetes Cluster (EKS): 3-4 Nodos
Load Balancer: NGINX Ingress Controller
Message Broker: RabbitMQ
Cache: Redis
Base de Datos: PostgreSQL 15
Container Registry: Amazon ECR

Clientes

Aplicación Móvil: Python + Flutter
Aplicación Web Admin: React.js + PWA

Estrategia de Despliegue
Rolling Deployment
Actualizaciones graduales sin downtime, aprovechando las 5 réplicas de cada microservicio crítico.
Ventajas:

Cero downtime para usuarios
Rollback automático si falla
Bajo costo de infraestructura
Soporte nativo en Kubernetes

Estrategia de Ramificación (GitFlow)
Ramas Principales

main - Código en producción
develop - Integración de desarrollo

Ramas de Soporte

feature/<nombre> - Nuevas funcionalidades
release/<version> - Preparación de releases
hotfix/<nombre> - Correcciones urgentes

Flujo de Trabajo
feature/* → develop → release/* → main
                                   ↑
hotfix/* ──────────────────────────┘
Pipeline CI/CD
Triggers

Push a feature/*: Solo CI (Build + Test)
Merge a develop: CI/CD completo → Deploy a Testing
Merge a main: CI/CD completo → Deploy a Producción

Etapas del Pipeline

BUILD

Checkout del código
Build de imágenes Docker
Linting
Tests unitarios


TEST

Tests de integración
Security scan


PUSH

Tag de imagen (SHA + version)
Push a Amazon ECR


DEPLOY

Rolling Deployment en EKS
Health checks (NGINX)
Validación de 5 réplicas
Auto-rollback si falla



Continuidad de Negocio
Backup Multi-Region

PostgreSQL: Réplica en región secundaria con Failover automático
Cluster EKS: Réplica en región diferente (Multi-AZ)
DNS Failover: Route 53 con health checks
Backups: Dumps diarios en S3 con retención de 30 días

Métricas

RTO (Recovery Time Objective): 5 minutos
RPO (Recovery Point Objective): 24 horas

Estructura del Proyecto
.
├── microservices/
│   ├── ms-autenticacion/
│   │   ├── src/
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   ├── ms-mapeo/
│   │   ├── src/
│   │   ├── Dockerfile
│   │   └── requirements.txt
│   └── ms-horarios/
│       ├── src/
│       ├── Dockerfile
│       └── requirements.txt
├── kubernetes/
│   ├── deployments/
│   ├── services/
│   ├── ingress/
│   └── configmaps/
├── clients/
│   ├── mobile-app/
│   └── web-admin/
├── .github/
│   └── workflows/
│       ├── ci-cd-testing.yml
│       └── ci-cd-production.yml
└── docs/
    ├── arquitectura.pdf
    └── pipeline-diagram.html
🚦 Getting Started
Prerrequisitos

Docker
Kubernetes CLI (kubectl)
AWS CLI
Git

Instalación Local
bash# Clonar el repositorio
git clone https://github.com/tu-usuario/sistema-geolocalizacion-microservicios.git
cd sistema-geolocalizacion-microservicios

# Instalar dependencias de cada microservicio
cd microservices/ms-autenticacion
pip install -r requirements.txt

# Construir imágenes Docker
docker build -t ms-autenticacion:latest .
Deploy en Kubernetes
bash# Aplicar configuraciones
kubectl apply -f kubernetes/deployments/
kubectl apply -f kubernetes/services/
kubectl apply -f kubernetes/ingress/

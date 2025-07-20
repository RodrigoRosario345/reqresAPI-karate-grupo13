# ReqRes API Karate Test Automation - Grupo 13

Este proyecto contiene la automatización de pruebas para la API pública [ReqRes](https://reqres.in) utilizando el framework [Karate](https://github.com/karatelabs/karate). Desarrollado por el **Grupo 13** como parte del módulo 4 del "DIPLOMADO EN TESTING FUNCIONAL DE SOFTWARE" impartido por la Universidad Mayor de San Francisco Xavier de Chuquisaca.

---

# 🚀 Estructura Completa del Proyecto Karate - ReqRes API

## 📁 Organización del Proyecto

```
reqresAPI-karate-grupo13/
├── src/
│   └── test/
│       └── java/
│           └── apitests/
│               ├── authentication/          # 🔐 Módulo de Autenticación
│               │   ├── auth-tests.feature      # Tests principales de login/register
│               │   └── csv-driven-auth.feature # Tests con datos CSV
│               ├── users/                   # 👥 Módulo de Usuarios
│               │   └── users-test.feature      # Tests CRUD completos
│               ├── resources/               # 📦 Módulo de Recursos
│               │   ├── DELETE_Resources_ValidID.feature
│               │   ├── POST_Resource_data.feature
│               │   └── PUT_Resources_Update_ValidID.feature
│               ├── helpers/                 # 🛠️ Features Auxiliares
│               │   ├── auth-helper.feature     # Operaciones de autenticación
│               │   ├── auth-validator.feature  # Validaciones de autenticación
│               │   ├── config-helper.feature   # Configuración centralizada
│               │   └── data-helper.feature     # Manejo de datos y CSV
│               ├── utils/                   # 🔧 Utilidades JavaScript
│               │   ├── dataGenerator.js        # Generación de datos aleatorios
│               │   ├── generateRandomID.js     # IDs aleatorios
│               │   ├── generateRandomColorName.js # Colores aleatorios
│               │   └── generateRandomHexaName.js  # Códigos hexadecimales
│               ├── data/                    # 📊 Archivos de Datos
│               │   ├── recurso.csv             # Datos de recursos
│               │   └── users.csv               # Datos de usuarios
│               ├── config/                  # ⚙️ Configuración
│               │   ├── karate-config.js        # Configuración global
│               │   └── logback-test.xml        # Configuración de logs
│               └── APITest.java             # 🏃‍♂️ Runner principal
│
├── target/                                  # 📈 Reportes y resultados
├── pom.xml                                  # 🔗 Dependencias Maven
├── .gitignore                              # 🚫 Archivos ignorados
└── README.md                               # 📖 Documentación

```

---

## 🔧 Requisitos Previos

- Java 11+
- Maven 3.8.1+
- Git (opcional para clonar el repo)

---

## 🚀 Instalación y ejecución

### 1. Clonar el repositorio

```bash
git clone https://github.com/RodrigoRosario345/TestAutomation-ReqResAPI-Grupo13.git
cd TestAutomation-ReqResAPI-Grupo13
```

### 2. Ejecutar pruebas con Maven

```bash
mvn test
```

---

## 🧪 Organización de Pruebas

Los archivos `.feature` están organizados por **recurso** de la API:

- **authentication/** → login, registro, logout
- **users/** → operaciones CRUD completas
- **resources/** → lectura, actualización y eliminación

Cada archivo `.feature` contiene múltiples `Scenario` con descripciones claras y realistas que permiten validar respuestas HTTP, estructura de datos, códigos de estado, etc.

---

## 🛠️ Herramientas y dependencias

- **Karate** v1.4.0
- **JUnit 5** (con `karate-junit5`)
- **Cucumber Reporting** v5.7.2
- **Java 11**
- **Maven** para gestión del ciclo de vida

---

## 💡 Buenas Prácticas Aplicadas

- 🎯 Separación por dominio: Cada módulo tiene su carpeta (authentication/, users/, resources/)
- 🔄 Reutilización máxima: Helpers centralizados evitan duplicar código
- 📊 Datos externos: CSV para casos de prueba dinámicos y realistas
- ⚙️ Configuración centralizada: karate-config.js 
- 🏷️ Tags organizados: @auth, @crud, @positive para ejecución selectiva
- 📝 Scenarios descriptivos: Nombres claros como POST_Login_ValidCredentials_Success200

---

## 👥 Autores

**Grupo 13**  
- Rosario Cruz Rodrigo
- Caihuara Santos Banessa
- Pari Colodro Mauricio
- Flores Vargas Fausta S

---


# ReqRes API Karate Test Automation - Grupo 13

Este proyecto contiene la automatización de pruebas para la API pública [ReqRes](https://reqres.in) utilizando el framework [Karate](https://github.com/karatelabs/karate). Desarrollado por el **Grupo 13** como parte del módulo 4 del "DIPLOMADO EN TESTING FUNCIONAL DE SOFTWARE" impartido por la Universidad Mayor de San Francisco Xavier de Chuquisaca.

---

## ✅ Estructura del Proyecto

```
reqresAPI-karate-grupo13/
├── src/
│   └── test/
│       └── java/
│           └── apitests/
│               ├── authentication/
│               │   ├── Login.feature
│               │   ├── Register.feature
│               │   └── Logout.feature
│               ├── users/
│               │   ├── GetUsers.feature
│               │   ├── CreateUser.feature
│               │   ├── UpdateUser.feature
│               │   └── DeleteUser.feature
│               ├── resources/
│               │   ├── GetResource.feature
│               │   ├── DeleteResource.feature
│               │   └── UpdateResource.feature
│               └── APITest.java
│
├── utils/
│   ├── karate-config.js
│   └── logback-test.xml
├── data/
│   └── users.csv
├── pom.xml
└── README.md
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

## 💡 Buenas prácticas aplicadas

- Descripción detallada de escenarios (`Scenario:`).
- Agrupación lógica por módulos/recurso.
- Uso de `Background:` para configurar base URL.
- Datos de prueba reutilizables (`users.csv`).
- Centralización de configuración (`karate-config.js`).

---

## 👥 Autores

**Grupo 13**  
- Rosario Cruz Rodrigo
- Caihuara Santos Banessa
- Pari Colodro Mauricio
- Flores Vargas Fausta S

---


# 🧪 Lab Personal: Despliegue de infraestructura con Terraform y GitHub Actions

[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)

## 🎯 Objetivos
La idea es hacer un workflow minimalista, seguro y funcional, que cubra las mejores prácticas: `terraform plan` automático en cada `push` y `terraform apply` manual via `workflow_dispatch`. Empezamos con `backend local`, luego podemos migrar a remoto como mejora.

---

## ⚙ Tecnolgías usadas
- Git Hub Actions
- Terraform
- act

---

## ⚙ Este MVP del workflow de GitHub Actions incluye solo lo esencial
- Trigger:
    - `workflow_dispatch`: - Solo ejecución manual
    - No se ejecuta con push, pull request ni nada automático
- Pasos básicos:
    - **Checkout** - Descargar código
    - **Setup Terraform** - Instala Terraform 1.6.0
    - **Init** - Inicializa Terraform
    - **Validate** - Valida la sintaxis
    - **Plan** - Genera el plan de ejecución
    - **Show Results** - Mensaje simple de confirmación

---

## 🛠 Bloques de construcción (building blocks - the basic things that are put together to make something exist)


---

## 🚀 Demostración y Prueba del laboratorio (El MVP Funcional)
1. Iniciar Docker Desktop en macOS:
    ```bash
    open -a Docker
    ```
2. Ejecutar el workflow
    ```bash
    act workflow_dispatch
    ```
3. 



---

## 🔗 Referencias
- []( )

---

### 📝 Licencia

Este repositorio está disponible bajo la licencia MIT.
Puedes usar, modificar y compartir libremente el contenido, incluso con fines comerciales.
Consulta el archivo [`LICENSE`](./LICENSE) para más detalles.

---
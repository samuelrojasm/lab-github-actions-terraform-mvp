# 🧪 Lab Personal: MPV de despliegue de infraestructura con Terraform + GitHub Actions

[![Terraform](https://img.shields.io/badge/IaC-Terraform-623CE4?logo=terraform&logoColor=white)](#)
[![HCL](https://img.shields.io/badge/Language-HCL-blueviolet)](#)
[![Conventional Commits](https://img.shields.io/badge/Conventional%20Commits-1.0.0-%23FE5196?logo=conventionalcommits&logoColor=white)](https://conventionalcommits.org)

> [!NOTE]
> Implementación básica para automatizar despliegues de infraestructura usando Terraform y GitHub Actions, con testing local mediante Act.

## 🎯 Objetivos del MPV
- Validación automática de código Terraform
- Ejecución de planes de despliegue
- Testing local con Act
- Workflow manual para experimentación

---

## ⚙ Tecnolgías usadas
- Terraform 1.13.0
- Git Hub Actions
- Docker + Act (testing local)

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
1. Archivos de Terraform
    - main.tf
    - terraform.tf
    - variables.tf
    - outputs.tf
2. Github Actions workflow de Terraform
    - terraform.yml
3. Docker Desktop para macOs
4. Open Source tool
    - act (ejecución local de workflow)

---

## 🚀 Demostración y Prueba del laboratorio (El MVP Funcional)
1. Iniciar Docker Desktop en macOS:
    ```bash
    open -a Docker
    ```
2. Selección de imagen
- Cuando se ejecuta por primera vez, `act` solicita la selección de la imagen Docker que va a ser usada por default.
- La recomendación es usar al menos la imagen **Medium**
    ```bash
    act workflow_dispatch
    ```
    <p align="center">
        <img src="imagenes/act-select-image.png" alt="act-select-image" width="80%">
    </p>
3. Verificar si act detecta el workflow
- Ver jobs específicos de workflow_dispatch
    ```bash
    # Ver jobs específicos de workflow_dispatch (si existieran)
    act workflow_dispatch -l
    ```
    <p align="center">
        <img src="imagenes/lista-jobs.png" alt="lista-jobs" width="80%">
    </p>

4. Ejecución dry-run (simulada)
    ```bash
    act workflow_dispatch -n
    ```
    <p align="center">
        <img src="imagenes/dry-run.png" alt="dry-run" width="80%">
    </p>

> [!NOTE]  
> **Con -n muestra SOLO lo que haría:**<br>
> ✓ Qué jobs ejecutaría<br>
> ✓ Qué pasos correría<br>
> ✓ Qué imágenes Docker usaría<br>
> ✗ NO ejecuta nada realmente

5. Ejecutar el workflow
    ```bash
    act workflow_dispatch -v
    ```
    <p align="center">
        <img src="imagenes/act-exec.png" alt="act-exec" width="80%">
    </p>

---

## 🔗 Referencias
- [Guia de uso de "act" en Git Hub Actions](https://github.com/samuelrojasm/lab-github-actions-terraform-mvp/blob/main/learning/cheatsheets/guia-github-actions-act.md)
- [Diario de aprendizaje del lab: Github Actions + Terraform + act](https://github.com/samuelrojasm/lab-github-actions-terraform-mvp/tree/main/learning)

---

### 📝 Licencia

Este repositorio está disponible bajo la licencia MIT.
Puedes usar, modificar y compartir libremente el contenido, incluso con fines comerciales.
Consulta el archivo [`LICENSE`](./LICENSE) para más detalles.

---

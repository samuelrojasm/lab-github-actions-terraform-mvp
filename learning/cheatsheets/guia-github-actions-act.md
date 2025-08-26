# 🧪 Guia de uso de "act" en Git Hub Actions

## ⚙️ ¿Qué es act?
- Es una herramienta de línea de comandos que simula los runners de **GitHub Actions** localmente usando Docker.
- Permite ejecutar workflows completos o **jobs** específicos sin necesidad de hacer push al repositorio remoto.
- Soporta eventos simulados: `push`, `pull_request`, `workflow_dispatch`, etc.

## ⚙️ Instalar
1. Instalar en macOS:
    ```bash
    # Instalar act (en MacOS con Homebrew)
    brew install act
    act --version
    ```

    ```bash
    # Verifica la versión de act
    act --version
    ```

## ⚙️ Comandos
-  Iniciar Docker Desktop en macOS:
    ```bash
    open -a Docker
    ```

- Comandos de uo de `act`
    ```bash
    # Ejecutar el workflow por defecto (evento push)
    act
    ```

    ```bash
    # Ejecutar un workflow específico por evento
    act pull_request
    ```

    ```bash
   # Pasar secrets locales como variables de Terraform
   act -s TF_VAR_region=us-east-1 -s AWS_ACCESS_KEY_ID=xxx -s AWS_SECRET_ACCESS_KEY=xxx
    ```

    ```bash
    # Ejecuta solo el job 'terraform'
    act -j terraform
    ```

---




---


---

## 🔗 Referencias
- []()

---
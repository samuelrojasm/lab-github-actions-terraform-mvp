# 🧪 Guia de uso de "act" en Git Hub Actions

## ⚙️ ¿Qué es act?
- Es una herramienta de código abierto escrita en Go.
- Simula la ejecución de **GitHub Actions** en tu computadora.
- Usa **Docker** como backend → cada `job` se ejecuta en un contenedor que imita a un runner de GitHub (`ubuntu-latest`, `macos-latest`, etc., aunque macOS y Windows son más limitados).
- Así puedes probar tus **workflows** localmente, rápido y sin gastar minutos de Actions.
- Es una herramienta de línea de comandos que simula los runners de **GitHub Actions** localmente usando Docker.
- Permite ejecutar workflows completos o **jobs** específicos sin necesidad de hacer push al repositorio remoto.
- Soporta eventos simulados: `push`, `pull_request`, `workflow_dispatch`, etc.

---

## ⚙️ ¿Cómo funciona internamente?
1. Lee tu archivo `.github/workflows/*.yml`.
2. Crea un contenedor Docker que imita al runner (`ubuntu-latest`, por defecto).
3. Descarga e interpreta las acciones (`uses: actions/checkout@v4`, etc.).
4. Ejecuta los steps (ya sean `run:` o `uses:`) dentro del contenedor.
5. Te muestra los logs igual que GitHub Actions.

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
    # Ejecutar un workflow específico por evento (simular un evento)
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

## ⚙️ Elección de imagen (runner Docker)
- Por defecto, `act` usa una imagen base pequeña (`nektos/act-environments-ubuntu:18.04`)
- Si necesitas algo más parecido a `ubuntu-latest` de GitHub, puedes elegir otra imagen:
    ```bash
    act -P ubuntu-latest=nektos/act-environments-ubuntu:22.04
    ```
---

## ⚙️ Variables y secretos
- Secrets: se leen de un archivo `.secrets` en tu repo.
- `act` los inyecta igual que GitHub.

---

## ⚙️ Limitaciones
- No soporta bien `macos-latest` ni `windows-latest` (solo Linux).
- Algunas acciones que dependen de servicios de GitHub (ej. `github.event`) requieren que les des datos de prueba (-e event.json).
- Puede ser más lento la primera vez (descarga imágenes Docker).

---

## ⚙️ Ejemplo
- Supongamos que tienes `.github/workflows/ci.yml`:
    ```yaml
    name: CI
    on: [push]
    jobs:
        build:
            runs-on: ubuntu-latest
            steps:
                - uses: actions/checkout@v4
                - run: echo "Hola desde GitHub Actions en act"
    ```
- Lo corres localmente con:
    ```bash
    act push
    ```
- Salida al ejecuarlo
    > [CI/build] 🚀  Start image=nektos/act-environments-ubuntu:22.04<br>
    > [CI/build]   ✅  Success - actions/checkout@v4<br>
    > [CI/build]   ✅  Run echo "Hola desde GitHub Actions en act"<br>
    > Hola desde GitHub Actions en act

---

## 🔗 Referencias
- []()

---
# 🧪 Guia de uso de "act" en Git Hub Actions

## ⚙️ Comandos
- Comandos de uo de `act`
    ```bash
    # Instalar act (en MacOS con Homebrew)
    brew install act
    ```

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
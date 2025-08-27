# 🧪 Diario de aprendizaje del lab: Github Actions + Terraform + act

## Índide de Semanas
- [Week 01](#week-01)

---

## 🔥 Week 01 <a name="week-01"></a>

### Índice Week 01
- [Ejecutar workflows localmente con "act"](#local-act)
- [Beneficios de usar act con Terraform](#act-terraform)
- [Archivo terraform.tfstate en act](#act-tfstate)
- [Docker container actions](#docker-container-action)

---

### ⚡ Ejecutar workflows localmente con `act` <a name="local-act"></a>
- El `act` es una herramienta de línea de comandos que te permite ejecutar **GitHub Actions** de forma local, simulando el comportamiento de los **runners de GitHub** sin necesidad de hacer `push` a un repo remoto. 
- Es especialmente útil para probar workflows antes de subirlos, ahorrar tiempo y depurar errores rápidamente.
- Algunos puntos clave:
    - `act` interpreta tu `.github/workflows/*.yml` y ejecuta los jobs localmente.
    - Puede usar **Docker containers** para simular los runners de GitHub.
    - Soporta eventos simulados, como `push`, `pull_request`, `workflow_dispatch`, etc.
    - Permite pasar secrets y variables como si fueran del entorno real de GitHub Actions.

> [!NOTE]
> Internamente, `act` crea contenedores **Docker** que simulan<br>
> los **GitHub runners**, por lo que necesitas tener Docker instalado.

#### 🔗 Referencias workflows localmente con `act`
- [act to run the actions locally](https://github.com/nektos/act)

---

### ⚡ Beneficios de usar act con Terraform <a name="act-terraform"></a>
Permite probar workflows de **GitHub Actions** localmente, ahorrando tiempo, depurando errores antes del push y evitando cambios de infraestructura fallidos en producción.
- **Ahorro de tiempo:** Permite ejecutar workflows localmente sin esperar a los runners en GitHub.
- **Reducción de errores en producción**: Detecta problemas de sintaxis, dependencias o configuración antes de aplicar cambios reales.
- **Iteración rápida**: Cambias el workflow, lo pruebas y corriges errores en minutos.
- **Simulación de entornos reales**: Usa contenedores Docker que replican los runners de GitHub Actions, incluyendo versiones específicas de Terraform, AWS CLI, etc.
- **Debugging avanzado**: Permite correr jobs o pasos específicos para analizar fallos y revisar outputs antes de aplicar.
- **Prueba de secrets y variables locales**: Puedes pasar variables de Terraform o credenciales temporales sin afectar los entornos remotos.

> [!NOTE]
> **Problemas que ayuda a superar**<br>
> - Errores de workflow detectados tarde (solo al hacer push)
> - Cambios de infraestructura que rompen entornos de prueba o producción
> - Largas esperas de ejecución de GitHub Actions para cada cambio menor
> - Dificultad para depurar errores de configuración de Terraform en el CI/CD

> [!TIP]
> - Lo más común es usar `act` para probar hasta el `terraform plan` y reservar el `apply` para el pipeline en GitHub Actions (con approvals).
> - En tu repo: deja `terraform plan` siempre.
> - Haz que `terraform apply` solo ocurra bajo condiciones seguras (manual approval o rama `main`).
> - Localmente con `act`: puedes probar que el workflow funciona (hasta el `plan`).

---

### ⚡ act y terraform.tfstate <a name="act-tfstate"></a>
#### ¿Cómo maneja `act` los contenedores?
- `act` lanza contenedores efímeros de Docker que simulan a los runners de GitHub Actions.
- Cada ejecución de act (`act` o `act -j terraform`) levanta un contenedor nuevo desde cero.
- Al terminar, ese contenedor se destruye → cualquier archivo generado dentro del contenedor se pierde.
#### ¿Qué pasa con el `terraform.tfstate`?
- Si usas **backend local** (por defecto):
    - El `terraform.tfstate` se guarda dentro del contenedor.
    - Como el contenedor se destruye al finalizar, ese state se pierde en cada ejecución de act.
    - Resultado: Terraform siempre cree que es el primer init/plan.
- Si usas **backend remoto** (recomendado):
    - Ejemplo: S3 + DynamoDB en AWS, GCS en GCP, Azure Storage.
    - El state se guarda en la nube, fuera del contenedor.
    - Da igual si corres en GitHub Actions o con `act`: el state es persistente.
- Si quieres mantener state local entre ejecuciones de `act`:
    - Puedes **montar un volumen de Docker** desde tu host al contenedor de `act` para que guarde `terraform.tfstate` fuera del contenedor.
    - Ejemplo:
        ```bash
        # monta tu repo local en el contenedor, por lo que terraform.tfstate se queda en tu máquina.
        act -b --bind
        ```
#### Resumen
- Cada `act` levanta un contenedor nuevo (efímero).
- Con **backend local** → pierdes el `state` con cada ejecución.
- Con **backend remoto** → el `state` se mantiene (mejor práctica en IaC).
- **Alternativa**: montar un volumen local con `act` para que el state quede persistente en tu máquina.

> [!NOTE]
> **Lo típico en un proyecto serio es:**<br>
> - Usar `plan` con `act` para validar que el workflow corre bien.
> - Usar backend remoto para el `state`, y dejar el `apply` solo en GitHub Actions (con approval).

---

### ⚡ Docker container actions <a name="docker-container-action"></a>
- **Qué son:** Son un tipo de acción personalizada que empaquetas dentro de una imagen Docker.
- **Características:** 
    - El código de la acción se ejecuta dentro del contenedor que definas en un Dockerfile.
    - Esto te permite controlar totalmente el entorno de ejecución: dependencias, librerías, sistema base, etc.
    - Son útiles cuando quieres que tu acción sea portátil y reproducible en cualquier runner (hosted o self-hosted).
- Ejemplo de definición de acción:
    ```yaml
    # action.yml
    name: "Mi acción en Docker"
    runs:
        using: "docker"
        image: "Dockerfile"
    ```
- Dockerfile
    ```dockerfile
    FROM node:20-alpine
    COPY entrypoint.sh /entrypoint.sh
    ENTRYPOINT ["/entrypoint.sh"]
    ```
- 
> [!NOTE]
> - **Docker container action**: Es una acción específica dentro del workflow, empaquetada como imagen Docker, que puede correr dentro de un runner (hosted o self-hosted).
> - **Docker container action** es una unidad de trabajo en contenedor que el runner ejecuta.
> - Es solo un step dentro de un job.
> - Ese step en particular corre dentro del contenedor que definiste (por ejemplo con un Dockerfile).
> - No tiene control del workflow completo, solo de lo que sucede en ese paso.

---

#### 🔗 Referencias
- [file Function](https://developer.hashicorp.com/terraform/language/functions/file)

---
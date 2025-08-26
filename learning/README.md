# 🧪 Diario de aprendizaje del lab: AWS Lambda + Terraform

## Índide de Semanas
- [Week 01](#week-01)

---

## 🔥 Week 01 <a name="week-01"></a>

### Índice Week 01
- [Ejecutar workflows localmente con "act"](#local-act)
- [Beneficios de usar act con Terraform](#act-terraform)
- [](#)

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
> Lo más común es usar `act` para probar hasta el `terraform plan` y reservar el `apply` para el pipeline en GitHub Actions (con approvals).

#### 🔗 Referencias
- [file Function](https://developer.hashicorp.com/terraform/language/functions/file)

---
# 🧪 Diario de aprendizaje del lab: AWS Lambda + Terraform

## Índide de Semanas
- [Week 01](#week-01)

---

## 🔥 Week 01 <a name="week-01"></a>

### Índice Week 01
- [¿Qué pasa si solo modifico el archivo .tftpl y ejecuto terraform apply?](#modificar-tftpl)
- [Si el JSON de tu política no necesita reemplazo de variables](#json-sin-reemplazo)
- [Diferencia en Terraform entre usar un ARN de política administrada por AWS y crear tu propia política JSON](#diferencia-arn-vs-propia)

---

### ⚡ ¿Qué pasa si solo modifico el archivo .tftpl y ejecuto terraform apply? <a name="modificar-tftpl"></a>
- Cuando trabajas con `templatefile() + .tftpl`, Terraform genera el JSON en tiempo de ejecución antes de aplicar cambios.

#### 🔗 Referencias templatefile()
- [templatefile Function](https://developer.hashicorp.com/terraform/language/functions/templatefile)

---

### ⚡ Si el JSON de tu política no necesita reemplazo de variables <a name="json-sin-reemplazo"></a>
- Lo más simple y correcto es usar file().

#### 🔗 Referencias file()
- [file Function](https://developer.hashicorp.com/terraform/language/functions/file)

---
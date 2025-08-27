# Recurso con configuraciones
resource "local_file" "example" {
  content              = var.output_content
  filename             = "${path.module}/${var.output_filename}"
  file_permission      = var.file_permissions
  directory_permission = "0755"

  # Lifecycle para evitar recrear el archivo innecesariamente
  # Garantiza disponibilidad continua del recurso durante actualizaciones.
  lifecycle {
    create_before_destroy = true
  }
}
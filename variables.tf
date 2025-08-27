# Variables para hacer el código más flexible
variable "output_content" {
  type        = string
  description = "Contenido del archivo de salida"
  default     = "Hola desde Terraform y GitHub Actions 🚀"
}

variable "output_filename" {
  type        = string
  description = "Nombre del archivo de salida"
  default     = "output.txt"
}

variable "file_permissions" {
  type        = string
  description = "Permisos del archivo"
  default     = "0644"
}
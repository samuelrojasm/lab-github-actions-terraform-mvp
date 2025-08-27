# Output para mostrar información útil
output "file_path" {
  description = "Ruta completa del archivo creado"
  value       = local_file.example.filename
}

output "file_content" {
  description = "Contenido del archivo"
  value       = local_file.example.content
  sensitive   = false
}

output "file_md5" {
  description = "Hash MD5 del archivo"
  value       = local_file.example.content_md5
}
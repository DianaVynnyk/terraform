output "my_securitygroup_id" {
  value = aws_security_group.my_server.id
}

output "rds_db_name" {
  description = "RDS The database name"
  value       = aws_db_instance.db.name
  sensitive   = true
}

output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.db.address
  sensitive   = true
}

output "rds_username" {
  description = "RDS instance root username"
  value       = aws_db_instance.db.username
  sensitive   = true
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.db.port
  sensitive   = true
}

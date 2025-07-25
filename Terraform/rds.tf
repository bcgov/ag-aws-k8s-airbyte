resource "aws_db_subnet_group" "subgroup" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name        = "${var.environment}-db-subnet-group"
    Environment = var.environment
  }
}

resource "aws_db_instance" "this" {
  identifier              = var.db_name
  engine                  = "postgres"
  engine_version          = var.db_engine_version
  instance_class          = var.db_instance_class
  allocated_storage       = var.db_allocated_storage
  storage_type            = "gp2"
  storage_encrypted       = true

  db_name                    = var.db_name
  username                = var.db_username
  password                = var.db_password

  db_subnet_group_name    = aws_db_subnet_group.subgroup.name
  vpc_security_group_ids  = [ aws_db_subnet_group.subgroup.id]


  multi_az                = false
  publicly_accessible     = false
  skip_final_snapshot     = true

  tags = {
    Name        = "${var.environment}-airbyte-db"
    Environment = var.environment
  }

  depends_on = [
    aws_db_subnet_group.subgroup
  ]
}

//–– OUTPUT ––
output "db_address" {
  description = "JDBC endpoint for the Airbyte Postgres instance"
  value       = aws_db_instance.this.address
}
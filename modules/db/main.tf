resource "aws_default_vpc" "default" {}

resource "aws_db_instance" "db" {

  identifier           = "db"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "administrator"
  password             = "123456AaBb"
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = [aws_security_group.my_server.id]
  skip_final_snapshot  = true
  apply_immediately    = true
}

resource "aws_security_group" "my_server" {
  name   = "My Security Group"
  vpc_id = aws_default_vpc.default.id

  dynamic "ingress" {
    for_each = var.allow_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


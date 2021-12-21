### Creating Security Group for ASG EC2-instances
resource "aws_security_group" "Webserver-sg" {
  name        = "Webserver-securitygroup"
  description = "Allow SSH to ASG EC2-instances"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "Webserver-sg"
  }
}

### Creating Security Group for DB EC2-instances
resource "aws_security_group" "MySQLDB-sg" {
  name        = "MySQLDB-securitygroup"
  description = "Allow SSH to DB EC2-instances"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MySQLDB-sg"
  }
}

### Creating Security Group for ELB
resource "aws_security_group" "ELB-sg" {
  name        = "ELB-sg"
  description = "Allow HTTP traffic to instances through Elastic Load Balancer"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ELB-sg"
  }
}


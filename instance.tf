resource "aws_instance" "MySQL" {
  ami           = lookup(var.ami_id, var.region)
  instance_type = var.instance_type

# Public Subnet assign to instance
  subnet_id    =  "${var.Privatesubnet}" 

# Security group assign to instance
 security_groups = [aws_security_group.MySQLDB-sg.id]

# key name
  key_name = var.key_name

  tags = {
    Name = "MySQL-linux-vm"
  }
}


variable "region" {
  type    = string
  default = "ap-south-1"
}

variable "ami_id" {
  type = map
  default = {
    us-east-1    = "ami-035b3c7efe6d061d5"
    ap-south-1   = "ami-00782a7608c7fc226"
    eu-central-1 = "ami-9787h5h6nsn75gd33"
  }
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "key_name" {
  type    = string
  default = "M-LAB-KYP"
}


variable "vpc_id" {
  description = "VPC ID for AWS resources."
  default = "vpc-098ac393ac8ebb81e"
}

variable "availability_zone_id" {
  description = "AZ used to create EC2 instances."
  default = "ap-south-1a"
}



variable "Publicsubnet" {
  description = "Subnet for webserver cluster EC2 instances."
  default = "subnet-0eca7e4c8e138bdc4"
}

variable "Privatesubnet" {
  description = "Subnet for MySQL EC2 instances."
   default = "subnet-0373d340248be550b"
}




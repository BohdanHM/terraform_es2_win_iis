variable "aws_region" {
  default = "eu-west-2"
}

variable "vpc_cidr" {
  default = "10.20.0.0/16"
}

variable "subnets_cidr" {
  type    = list(string)
  default = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "azs" {
  type    = list(string)
  default = ["eu-west-2a", "eu-west-2b"]
}

variable "webservers_ami" {
  default = "ami-019b399cca02b2cd3"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_admin" {
  default = "Admin2"
}
variable "instance_password" {
  default = "M2ygGj67HFSD22pa88"
}
variable "my_ip_address" {
  default = "3.8.185.103"
}

# variable "INSTANCE_USERNAME" {
#   default = "Admin2"
# }
#
# variable "INSTANCE_PASSWORD" {
#   default = "&F2i%Zl7E(SnB7XH(%wKn7t)$k(Whos7"
# }

# variable "admin_pass" {
#   default = "&F2i%Zl7E(SnB7XH(%wKn7t)$k(Whos7"
# }

variable "PATH_TO_PUBLIC_KEY" {
  #default = "../../secrets/win19.pem"
  default = "./win2019.pub"
  #default = "my-key-pair.pem"
}

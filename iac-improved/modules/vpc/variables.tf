variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "tags" {
  default = {
    Name = "tf-module-demo"
  }
}

variable "subnet_count" {
  default = 2
}
variable "pub_cidrs" {
  default = ["10.0.0.0/24","10.0.1.0/24"]
}
variable "pri_cidrs" {
  default = ["10.0.2.0/24","10.0.3.0/24"]
}
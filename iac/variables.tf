variable "vpc_cidr" {
  type = string
  default = "172.25.0.0/20"
}
variable "pub_sub_cidrs" {
  type = set(string)
  default = ["172.25.0.0/21","172.25.8.0/21"]
}

variable "my_var" {
  default = data.aws_availability_zones.azs.names
}
provider "aws" {
  region = "us-east-1"
}
module "myvpc" {
  source = "./modules/vpc"
}

module "myweb" {
  source = "./modules/ec2"
  instance_type = "t3.micro"
  subnet_id = module.myvpc.pub_sub_ids[0]
}
module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  ext_ip = "0.0.0.0/0"
  public_cidr = "10.0.1.0/24"
}

module "ec2" {
  source = "./modules/ec2"
  instance_type = "t3.micro"
  ami = "ami-07ff62358b87c7116"
  sg = module.vpc.sg
  subnet_id = module.vpc.subnet_id
}
module "networking-tf-course" {
  source  = "app.terraform.io/dal3ks/networking-module/aws"
  version = "0.1.1"
  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "terraform-cloud"
  }
  subnet_config = {
    subnet1 = {
      cidr_block = "10.0.0.0/24"
      az         = "eu-west-2c"
    }
  }
}

moved {
    from = aws_vpc.tf_cloud
    to = module.networking-tf-course.aws_vpc.this
}

moved {
  from = aws_subnet.tf_cloud
  to = module.networking-tf-course.aws_subnet.this["subnet1"]
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnets" "private_subnets" {
  filter {
    name   = "tag:Name"
    values = ["soat-tech-challenge-subnet-private*"]
  }
}


# data "tfe_outputs" "network" {
#   organization = "soat-tech-challenge"
#   workspace    = "network-staging"
# }

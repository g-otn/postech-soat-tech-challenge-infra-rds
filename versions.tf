terraform {
  required_version = ">= 0.12.26"

  cloud {
    organization = "soat-tech-challenge"

    workspaces {
      name = "database-staging"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.67.0"
    }

    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.49.2"
    }
  }
}



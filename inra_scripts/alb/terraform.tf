terraform {
  backend "s3" {
    bucket         = "vf-cm-dev-emea-terraform-state-bucket"
    key            = "terraform_infra_indigo_code/alb-cm-dev-ndoms-terraform.tfstate"
    region         = "eu-west-1"
  }
}
provider "aws" {
    region = "eu-west-1"
    profile = "default"
    shared_credentials_file = "~/.aws/credentials"
  }



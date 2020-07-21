terraform {
  backend "s3" {
    bucket         = "vf-cm-dev-emea-terraform-state-bucket"
    key            = "terraform_infra_indigo_code/rds-cm-dev-ndoms-terraform.tfstate"
    region         = "eu-west-1"
  }
}
provider "aws" {
    region = "eu-west-1"
    profile = "018795316058_ps_dev_engg_emea_indigo"
    shared_credentials_file = "~/.aws/credentials"
}



terraform {
  backend "local" {
  }
  #backend "s3" {
   # bucket         = "vf-cm-dev-ndoms-emea-state-bucket"
    #key            = "test-ecs-core-terraform.tfstate"
    #region         = "eu-west-1"
  #}
}
provider "aws" {
    region = "eu-west-1"
    profile = "default"
    shared_credentials_file = "~/.aws/credentials"
  }



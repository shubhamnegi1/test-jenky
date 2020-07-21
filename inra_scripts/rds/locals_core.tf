#data "terraform_remote_state" "main" {
#  backend = "s3"

#  config = {
#    bucket         = format("vf-%s-%s-test-bucket", var.account_environment, var.vf_region)
#    key            = "core-terraform.tfstate"
#    region         = var.region
#  }
#}

#locals {
#  vpc_main_id      = "${data.terraform_remote_state.main.outputs.vpc_main_id}"
#  vpc_subnet_ids   = "${data.terraform_remote_state.main.outputs.vpc_subnet_ids}"
#  vpc_cidr_block   = "${data.terraform_remote_state.main.outputs.vpc_cidr_block}"
#}


data "terraform_remote_state" "core" {
  backend = "s3"

  config = {
    bucket         = "vf-cm-dev-emea-terraform-state-bucket"
    key            = "terraform_infra_indigo_code/core-cm-dev-ndoms-terraform.tfstate"
    region         = var.region
  }
}

data "terraform_remote_state" "alb" {
  backend = "s3"

  config = {
    bucket         = "vf-cm-dev-emea-terraform-state-bucket"
    key            = "terraform_infra_indigo_code/alb-cm-dev-ndoms-terraform.tfstate"
    region         = var.region
 }
}


locals {
  salesorder_tg_arn = "${data.terraform_remote_state.alb.outputs.salesorder_tg_arn}"
  fg_cluster_id    = "${data.terraform_remote_state.core.outputs.fg_cluster_id}"
}

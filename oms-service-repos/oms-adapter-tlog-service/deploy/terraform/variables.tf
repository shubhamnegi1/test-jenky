#Backend Config Variables
variable "bucket" {}
variable "key" {}
variable "region" {}

#Set from Jenkinsfile
variable "vf_region" {}
variable "account_environment" {}

#Service Specific Variables
variable "task_family_name" {}
variable "replicas" {
    default = 1
}
variable image_name {}
variable port {}

#Service Specific Environment Variables

variable vpc_id {}
variable subnet_ids {}
variable vpc_cidr_blocks {}

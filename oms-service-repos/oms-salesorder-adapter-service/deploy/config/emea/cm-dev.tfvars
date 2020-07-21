# Input variable values for backend state configuration.
bucket = "vf-cm-dev-emea-terraform-state-bucket"
key = "terraform_infra_indigo_code/ecs/oms-salesorder-adapter-service-terraform.tfstate"
region = "eu-west-1"


#Service Specific Environment Variables(No changes should be made to below variable values)

# Other Service specific config(to be reconfigured for every service)
task_family_name = "oms-salesorder-adapter"
port = "9090"

#Networking Variables
subnet_ids = ["subnet-063d02969858b6ee3","subnet-0cb26c3d6b09cbe44"]
vpc_id = "vpc-045d7f140caa2ea88"
vpc_cidr_blocks = ["172.23.130.0/24"]

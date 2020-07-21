# Input variable values for backend state configuration.
bucket = "vf-cm-dev-emea-terraform-state-bucket"
key = "terraform_infra_indigo_code/ecs/oms-inventory-service-terraform.tfstate"
region = "eu-west-1"

#Service Specific Environment Variables(No changes should be made to below variable values)
eventuatelocal_kafka_bootstrap_servers = "b-1.vf-cm-dev-ndoms-emea-k.xb76s3.c2.kafka.eu-west-1.amazonaws.com:9092"
eventuatelocal_zookeeper_connection_string = "z-2.vf-cm-dev-ndoms-emea-k.xb76s3.c2.kafka.eu-west-1.amazonaws.com:2181"
spring_datasource_url = "jdbc:mysql://vf-cm-dev-ndoms-emea-rds-instance.cvezycky7sah.eu-west-1.rds.amazonaws.com:3306/inventory?autoReconnect=true&useSSL=false&createDatabaseIfNotExist=true"
spring_datasource_username = "root"

# Other Service specific config(to be reconfigured for every service)
task_family_name = "oms-inventory"
port = "8080"

#Networking
subnet_ids = ["subnet-063d02969858b6ee3","subnet-0cb26c3d6b09cbe44"]
vpc_id = "vpc-045d7f140caa2ea88"
vpc_cidr_blocks = ["172.23.130.0/24"]







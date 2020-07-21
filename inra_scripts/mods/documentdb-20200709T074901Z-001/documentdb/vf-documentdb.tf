data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_db_subnet_group" "default" {
  name       = format("vf-%s-%s-docdb-subnet-group", var.account_environment, var.vf_region)
  subnet_ids = var.subnet_ids
}

resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = format("vf-%s-%s-docdb-instance", var.account_environment, var.vf_region)
  engine                  = "docdb"
  master_username         = "root"
  master_password         = "masterpassword"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
  availability_zones      = [data.aws_availability_zones.available.names[0],data.aws_availability_zones.available.names[1]]
  db_subnet_group_name    = aws_db_subnet_group.default.name 
}





resource "aws_kms_key" "vf-kms" {
  description = "Customer master key in KMS"
}

resource "aws_cloudwatch_log_group" "vf-kafka-lg" {
  name = "msk_broker_logs"
}

resource "aws_msk_cluster" "vf_msk_cluster" {
  cluster_name           = format("vf-%s-%s-kafka-cluster", var.account_environment, var.vf_region)
  kafka_version          = "2.2.1"
  number_of_broker_nodes = 2

  broker_node_group_info {
    instance_type   = "kafka.t3.small"
    ebs_volume_size = 2
    client_subnets = var.subnet_ids
    security_groups = ["${aws_security_group.vf-kafka-sg.id}"]
  }

  encryption_info {
    encryption_in_transit {
      client_broker = "PLAINTEXT"
    }
    encryption_at_rest_kms_key_arn = "${aws_kms_key.vf-kms.arn}"
  }

  logging_info {
    broker_logs {
      cloudwatch_logs {
        enabled   = true
        log_group = "${aws_cloudwatch_log_group.vf-kafka-lg.name}"
      }
    }
  }
  configuration_info {
    arn = "${aws_msk_configuration.vf-msk-config.arn}"
    revision = "${aws_msk_configuration.vf-msk-config.latest_revision}"
  }
}

output "zookeeper_connect_string" {
  value = "${aws_msk_cluster.vf_msk_cluster.zookeeper_connect_string}"
}

output "bootstrap_brokers" {
  description = "Plaintext connection host:port pairs"
  value       = "${aws_msk_cluster.vf_msk_cluster.bootstrap_brokers}"
}

output "bootstrap_brokers_tls" {
  description = "TLS connection host:port pairs"
  value       = "${aws_msk_cluster.vf_msk_cluster.bootstrap_brokers_tls}"
}

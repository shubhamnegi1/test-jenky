resource "aws_msk_configuration" "vf-msk-config" {
  kafka_versions = ["2.2.1"]
  name           = format("vf-%s-%s-kafka-configuration", var.account_environment, var.vf_region)

  server_properties = <<PROPERTIES
auto.create.topics.enable=true
default.replication.factor=2
min.insync.replicas=2
num.io.threads=8
num.network.threads=5
num.partitions=1
num.replica.fetchers=2
socket.request.max.bytes=104857600
unclean.leader.election.enable=true
PROPERTIES
}
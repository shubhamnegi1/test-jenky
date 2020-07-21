#output "vpc_main_id" {
#  value = "${aws_vpc.main.id}"
#}

#output "vpc_cidr_block" {
#  value = "${aws_vpc.main.cidr_block}"
#}

#output "vpc_subnet_ids" {
#  value = "${aws_subnet.vfnet_pub.*.id}"
#}

output "fg_cluster_id" {
  value = "${aws_ecs_cluster.fg-cluster.id}"
}

# Fargate Cluster
resource "aws_ecs_cluster" "fg-cluster" {
  name = format("vf-%s-%s-fargate-cluster", var.account_environment, var.vf_region)
}

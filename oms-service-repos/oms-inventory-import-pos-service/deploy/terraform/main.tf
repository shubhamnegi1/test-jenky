# CloudWatch Log Group Definition
resource "aws_cloudwatch_log_group" "main" {
  name = format("/ecs/%s/%s/%s", var.vf_region,var.account_environment,var.task_family_name)
}

#Defining template file
data "template_file" "task_def" {
  template = "${file("task-definitions/service.json")}"
  vars = {
    image_name = "${var.image_name}"
    task_family_name = "${var.task_family_name}"
    port = "${var.port}"
    region = "${var.region}"
    log_group = aws_cloudwatch_log_group.main.name
  }
}
#ECS Task Definition
resource "aws_ecs_task_definition" "vf_task_def" {
  family                   = format("vf-%s-%s-%s", var.task_family_name,var.vf_region,var.account_environment)
  container_definitions    = "${data.template_file.task_def.rendered}"
  execution_role_arn       = "arn:aws:iam::018795316058:role/ecsTaskExecutionRole"
  task_role_arn            = "arn:aws:iam::018795316058:role/ecsTaskExecutionRole"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 512
  memory                   = 2048
  network_mode             = "awsvpc"
}

resource "aws_ecs_service" "service" {
  name            = format("vf-%s-%s-%s-service", var.account_environment, var.vf_region, var.task_family_name)
  cluster         = "${local.fg_cluster_id}"
  task_definition = aws_ecs_task_definition.vf_task_def.arn
  desired_count   = var.replicas
  launch_type     = "FARGATE" 
  force_new_deployment = true
  network_configuration {
    security_groups = ["${aws_security_group.vf-service-sg.id}"]
    subnets         = var.subnet_ids
    assign_public_ip = false
  }
}

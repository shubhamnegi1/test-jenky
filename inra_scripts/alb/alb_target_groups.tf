resource "aws_lb_target_group" "notification" {
  name     = format("vf-%s-%s-notif-tg", var.account_environment, var.vf_region)
  port     = 8086
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = var.vpc_id
  
health_check {
   path = "/actuator/health"
   matcher = "404"
   }
}

resource "aws_lb_target_group" "salesorder" {
  name     = format("vf-%s-%s-sales-tg", var.account_environment, var.vf_region)
  port     = 8081
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = var.vpc_id

health_check {
   path = "/api/v1/source"
   matcher = "200,204"
   }
}

resource "aws_lb_target_group" "salesorder-adp" {
  name     = format("vf-%s-%s-salesadp-tg", var.account_environment, var.vf_region)
  port     = 9090
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = var.vpc_id

health_check {
   path = "/actuator/health"
   matcher = "404"
   }
}
resource "aws_lb_target_group" "inventory" {
  name     = format("vf-%s-%s-inventory", var.account_environment, var.vf_region)
  port     = 8080
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = var.vpc_id

health_check {
   path = "/api/v1/inventory/countries"
   matcher = "200"
   }
}

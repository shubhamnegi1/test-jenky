data "aws_elb_service_account" "main" {}

resource "aws_s3_bucket" "alb_logs" {
  bucket = format("vf-%s-%s-alb-logs-bucket", var.account_environment, var.vf_region)
  acl    = "private"
  region = "${var.region}"
  versioning {
    enabled = true
  }
}

data "template_file" "lb-logs-bucket-policy" {
  template = "${file("${path.module}/files/lb-logs-bucket-policy.tpl.json")}"

  vars = {
    account_environment      = "${var.account_environment}"
    vf_region                = "${var.vf_region}"
    elb_service_account      = "${data.aws_elb_service_account.main.arn}"
  }
}

resource "aws_s3_bucket_policy" "vf-terraform" {
  bucket = "${aws_s3_bucket.alb_logs.id}"
  policy = "${data.template_file.lb-logs-bucket-policy.rendered}"
}


resource "aws_lb" "main" {
  name               = format("vf-%s-%s-alb", var.account_environment, var.vf_region)
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.alb_sg.id}"]
  subnets            = var.subnet_ids

  enable_deletion_protection = false

  access_logs {
    bucket  = "${aws_s3_bucket.alb_logs.bucket}"
    prefix  = "vf"
    enabled = true
  }
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = "${aws_lb.main.arn}"
  port              = "80"
  protocol          = "HTTP"
  #ssl_policy        = "ELBSecurityPolicy-2016-08"
  #certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}
#Notification Service Rules
resource "aws_lb_listener_rule" "notification1" {
  listener_arn = "${aws_lb_listener.main.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.notification.arn}"
  }

  condition {
    path_pattern {
      values = ["/api/v1/notification/*"]
    }
  }
}

resource "aws_lb_listener_rule" "notification2" {
  listener_arn = "${aws_lb_listener.main.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.notification.arn}"
  }

  condition {
    path_pattern {
      values = ["/api/v1/notification"]
    }
  }
}

#Salesorder Service Rules
resource "aws_lb_listener_rule" "salesorder1" {
  listener_arn = "${aws_lb_listener.main.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.salesorder.arn}"
  }

  condition {
    path_pattern {
      values = ["/api/v1/channel/*"]
    }
  }
}

resource "aws_lb_listener_rule" "salesorder2" {
  listener_arn = "${aws_lb_listener.main.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.salesorder.arn}"
  }

  condition {
    path_pattern {
      values = ["/api/v1/channel"]
    }
  }
}

resource "aws_lb_listener_rule" "salesorder3" {
  listener_arn = "${aws_lb_listener.main.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.salesorder.arn}"
  }

  condition {
    path_pattern {
      values = ["/api/v1/source"]
    }
  }
}

resource "aws_lb_listener_rule" "salesorder4" {
  listener_arn = "${aws_lb_listener.main.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.salesorder.arn}"
  }

  condition {
    path_pattern {
      values = ["/api/v1/source/*"]
    }
  }
}

resource "aws_lb_listener_rule" "salesorder5" {
  listener_arn = "${aws_lb_listener.main.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.salesorder.arn}"
  }

  condition {
    path_pattern {
      values = ["/api/v1/config/*"]
    }
  }
}

resource "aws_lb_listener_rule" "salesorder6" {
  listener_arn = "${aws_lb_listener.main.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.salesorder.arn}"
  }

  condition {
    path_pattern {
      values = ["/api/v1/config"]
    }
  }
}


resource "aws_lb_listener_rule" "salesorder7" {
  listener_arn = "${aws_lb_listener.main.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.salesorder.arn}"
  }

  condition {
    path_pattern {
      values = ["/api/v1/user-management/*"]
    }
  }
}

resource "aws_lb_listener_rule" "salesorder8" {
  listener_arn = "${aws_lb_listener.main.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.salesorder.arn}"
  }

  condition {
    path_pattern {
      values = ["/api/v1/user-management"]
    }
  }
}

resource "aws_lb_listener_rule" "salesorder9" {
  listener_arn = "${aws_lb_listener.main.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.salesorder.arn}"
  }

  condition {
    path_pattern {
      values = ["/api/v1/sales-order/*"]
    }
  }
}

resource "aws_lb_listener_rule" "salesorder10" {
  listener_arn = "${aws_lb_listener.main.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.salesorder.arn}"
  }

  condition {
    path_pattern {
      values = ["/api/v1/sales-order"]
    }
  }
}

resource "aws_lb_listener_rule" "salesorderadp1" {
  listener_arn = "${aws_lb_listener.main.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.salesorder-adp.arn}"
  }

  condition {
    path_pattern {
      values = ["/adp/*"]
    }
  }
}
resource "aws_lb_listener_rule" "inventory" {
  listener_arn = "${aws_lb_listener.main.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.inventory.arn}"
  }

  condition {
    path_pattern {
      values = ["/api/v1/inventory"]
    }
  }
}
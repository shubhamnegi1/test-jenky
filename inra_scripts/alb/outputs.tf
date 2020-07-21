output "notification_tg_arn" {
  value = "${aws_lb_target_group.notification.arn}"
}

output "salesorder_tg_arn" {
  value = "${aws_lb_target_group.salesorder.arn}"
}

output "salesorderadp_tg_arn" {
  value = "${aws_lb_target_group.salesorder-adp.arn}"
}

output "inventory_tg_arn"{

value = "${aws_lb_target_group.inventory.arn}"
}

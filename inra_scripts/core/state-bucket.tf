#resource "aws_s3_bucket" "vf-terraform" {
#  bucket = format("vf-%s-%s-state-bucket", var.account_environment, var.vf_region)
#  acl    = "private"
#  region = "${var.region}"

#  versioning {
#    enabled = true
#  }
#}

#data "template_file" "state-bucket-policy" {
#  template = "${file("${path.module}/files/state-bucket-policy.tpl.json")}"

#  vars = {
#    account_environment      = "${var.account_environment}"
#    vf_region                = "${var.vf_region}"
#  }
#}

#resource "aws_s3_bucket_policy" "vf-terraform" {
#  bucket = "${aws_s3_bucket.vf-terraform.id}"
#  policy = "${data.template_file.state-bucket-policy.rendered}"
#}

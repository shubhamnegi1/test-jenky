#resource "aws_vpc" "main" {
#  cidr_block                       = "${var.vf_vpc_cidr_block}"
#  enable_dns_support               = true
#  enable_dns_hostnames             = true
#  assign_generated_ipv6_cidr_block = false
#}

#resource "aws_internet_gateway" "main_gw" {
#  vpc_id = "${aws_vpc.main.id}"
#}

#resource "aws_route_table" "main" {
#  vpc_id = "${aws_vpc.main.id}"

#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = "${aws_internet_gateway.main_gw.id}"
#  }
#}

#resource "aws_main_route_table_association" "main" {
#  vpc_id         = "${aws_vpc.main.id}"
#  route_table_id = "${aws_route_table.main.id}"
#}

#resource "aws_subnet" "vfnet_pub" {
#  count                   = "${length(split(",", var.vf_subnet_cidr))}"
#  vpc_id                  = "${aws_vpc.main.id}"
#  cidr_block              = "${element(split(",", var.vf_subnet_cidr), count.index)}"
#  map_public_ip_on_launch = true
#  availability_zone       = "${element(split(",", var.availability_zones), count.index)}"
#}

#resource "aws_route_table_association" "main" {
#  count          = "${length(split(",", var.vf_subnet_cidr))}"
#  subnet_id      = "${element(aws_subnet.vfnet_pub.*.id, count.index)}"
#  route_table_id = "${aws_route_table.main.id}"
#}


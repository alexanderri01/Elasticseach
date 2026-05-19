resource "aws_vpc" "elastic_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Elastic-Monitoring-VPC"
  }
}

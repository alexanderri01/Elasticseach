resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.elastic_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-elastic"
  }
}

resource "aws_subnet" "private_logstash" {
  vpc_id     = aws_vpc.elastic_vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "private-logstash"
  }
}

resource "aws_subnet" "private_agents" {
  vpc_id     = aws_vpc.elastic_vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "private-agents"
  }
}

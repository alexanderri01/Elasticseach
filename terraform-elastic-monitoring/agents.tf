resource "aws_security_group" "agents_sg" {

  vpc_id = aws_vpc.elastic_vpc.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
}

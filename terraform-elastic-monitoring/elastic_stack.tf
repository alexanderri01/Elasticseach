resource "aws_instance" "elastic" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public.id

  vpc_security_group_ids = [aws_security_group.elastic_sg.id]

  key_name = var.key_name

  user_data = file("userdata/elastic.sh")

  tags = {
    Name = "Elastic-Kibana"
  }
}

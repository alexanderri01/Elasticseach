resource "aws_instance" "logstash" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_logstash.id

  vpc_security_group_ids = [aws_security_group.logstash_sg.id]

  key_name = var.key_name

  user_data = file("userdata/logstash.sh")

  tags = {
    Name = "Logstash"
  }
}

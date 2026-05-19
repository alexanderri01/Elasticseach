resource "aws_instance" "agents" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.private_agents.id

  vpc_security_group_ids = [aws_security_group.agents_sg.id]

  key_name = var.key_name

  user_data = file("userdata/agent.sh")

  tags = {
    Name = "Elastic-Agents"
  }
}
